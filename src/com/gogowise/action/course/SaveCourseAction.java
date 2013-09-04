package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.course.ClassDao;
import com.gogowise.dao.course.CourseDao;
import com.gogowise.dao.course.CourseInviteStudentDao;
import com.gogowise.dao.org.ChangeResponserHistoryDao;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.domain.BaseUser;
import com.gogowise.domain.Course;
import com.gogowise.domain.CourseClass;
import com.gogowise.domain.CourseInviteStudent;
import com.gogowise.utils.Constants;
import com.gogowise.utils.Utils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({ @Result(name = "json", type = "json")})
public class SaveCourseAction extends BasicAction{
    private Course course;
    private CourseClass courseClass;
    private BaseUserDao baseUserDao;
    private ChangeResponserHistoryDao.OrganizationDao organizationDao;
    private ClassDao classDao;
    private CourseDao courseDao;
    private CourseInviteStudentDao courseInviteStudentDao;

    private List<CourseClass> courseClasses = new ArrayList<CourseClass>();
    private List<Integer> durations = new ArrayList<Integer>();    //持续时间
    private Integer courseType = 0;
    private Integer course_id;

    private List<String> emails = new ArrayList<String>();
    private List<CourseInviteStudent> courseInviteStudents = new ArrayList<CourseInviteStudent>();
    private List<Calendar> startTimes = new ArrayList<Calendar>();
    private List<Integer> classDate = new ArrayList<Integer>();     //周几
    private Integer repeatTimes;                                   //重复次数


    @Action(value = "ajaxSaveCourse")
    public String ajaxSaveCourse(){
        BaseUser personalTeacher = baseUserDao.findById(this.getSessionUserId());
        if (this.getCourse().getId() == null) {     //if the course.id == null than deal with the org and course's teacher
             if (Constants.COURSE_TYPE_ORG.equals(this.getCourseType())) {
                  this.getCourse().setOrganization(organizationDao.findByResId(this.getSessionUserId()));
             } else if (Constants.COURSE_TYPE_VORG.equals(this.getCourseType())) {
                  this.getCourse().setOrganization(organizationDao.findOrganizationByOrganizationName(Constants.ZHI_YUAN_SCHOOL_NAME));
             } else {
                  course.setPersonalTeacher(personalTeacher);
                  course.setTeacher(personalTeacher);
             }
            this.getCourse().setConsumptionType(true);
           // this.getCourse().setTeachingNum(this.getIdentity());
            courseDao.persistAbstract(course);
        }else {
            Course curr = courseDao.findById(this.getCourse().getId());
            if(curr.getOrganization()!=null) course.setOrganization(curr.getOrganization());
            if(curr.getPersonalTeacher() != null) course.setPersonalTeacher(curr.getPersonalTeacher());
            if(curr.getTeacher() != null) course.setTeacher(curr.getTeacher());
            course.setClasses(curr.getClasses());
//            if(this.getIdentity()!=null){
//                 course.setTeachingNum(this.getIdentity());
//            }else {
//                course.setTeachingNum(curr.getTeachingNum());
//            }
        }

        if(StringUtils.isNotBlank(course.getLogoUrl()) && !StringUtils.startsWithIgnoreCase(course.getLogoUrl(),"upload/")){
             Utils.notReplaceFileFromTmp(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId(), course.getLogoUrl());
             course.setLogoUrl(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId()+"/"+course.getLogoUrl());
        }
        if(StringUtils.isBlank(course.getLogoUrl())) course.setLogoUrl(Constants.DEFAULT_COURSE_IMAGE);

        if (course.getFromCourse() == null)course.setFromCourse(course);   // mark the course where from. Default is current.
        courseDao.persistAbstract(course);

        courseInviteStudents = courseInviteStudentDao.findByCourseId(this.getCourse().getId());   //this step is used to delete the students if it was saved before
        if (courseInviteStudents.size() != 0) {
            for (int i = 0; i < courseInviteStudents.size(); i++) {
                courseInviteStudentDao.delete(courseInviteStudents.get(i));
            }
        }

        for (String email : emails) {
            if (StringUtils.isNotBlank(email)) {
                CourseInviteStudent curr = courseInviteStudentDao.findByCourseAndEmail(this.getCourse().getId(), email);
                if (curr == null) {
                    CourseInviteStudent courseInviteStudent = new CourseInviteStudent();
                    courseInviteStudent.setCourse(this.getCourse());
                    courseInviteStudent.setInvitedStudentEmail(email);
                    courseInviteStudentDao.persistAbstract(courseInviteStudent);
                }
            }
        }

        this.setCourse_id(course.getId());
        return "json";
    }


    @Action(value = "selfSaveClass",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".classesList")})
    public String selfSaveClass(){
        course = courseDao.findById(this.getCourse().getId());
        classDao.saveClass(courseClass, course, durations.get(0));
        courseClasses = classDao.findByCourseId(course.getId());
        return SUCCESS;
    }

    @Action(value = "autoSaveClasses",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".classesList")})
    public String autoSaveClasses(){
        course = courseDao.findById(this.getCourse().getId());
        classDao.autoClassSystemSave(startTimes, durations, classDate, repeatTimes, course);
        courseClasses = classDao.findByCourseId(course.getId());

        course.setTotalHours(course.getTotalHours()+startTimes.size()*classDate.size()*repeatTimes);
        courseDao.persistAbstract(course);
        return SUCCESS;
    }

    @Action(value = "updateCourseTeachingNum")
    public void updateCourseTeachingNum(){
        Course _course = courseDao.findById(this.getCourse().getId());
        _course.setTeachingNum(this.getCourse().getTeachingNum());
        courseDao.persistAbstract(_course);
    }

    @Action(value = "ajaxUpdateCourse")
    public void ajaxUpdateCourse(){
        Course _course = courseDao.findById(this.getCourse().getId());
        _course.setName(getEmptyString(course.getName()));
        _course.setDescription(getEmptyString(course.getDescription()));
        _course.setStudentType(getEmptyString(course.getStudentType()));
        _course.setCourseTeachingBook(getEmptyString(course.getCourseTeachingBook()));
        _course.setCourseType(course.getCourseType());
        _course.setCharges(course.getCharges());

        if(StringUtils.isNotBlank(course.getLogoUrl()) && !StringUtils.startsWithIgnoreCase(course.getLogoUrl(),"upload/")){
             Utils.notReplaceFileFromTmp(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId(), course.getLogoUrl());
             _course.setLogoUrl(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId()+"/"+course.getLogoUrl());
        }
        if(StringUtils.isBlank(course.getLogoUrl())) _course.setLogoUrl(Constants.DEFAULT_COURSE_IMAGE);

        courseDao.persistAbstract(_course);

    }



    @JSON(serialize = false)
    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    @JSON(serialize = false)
    public CourseClass getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(CourseClass courseClass) {
        this.courseClass = courseClass;
    }

    @JSON(serialize = false)
    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
    @JSON(serialize = false)
    public ChangeResponserHistoryDao.OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(ChangeResponserHistoryDao.OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }
    @JSON(serialize = false)
    public ClassDao getClassDao() {
        return classDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }

    @JSON(serialize = false)
    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }
    @JSON(serialize = false)
    public List<CourseClass> getCourseClasses() {
        return courseClasses;
    }

    public void setCourseClasses(List<CourseClass> courseClasses) {
        this.courseClasses = courseClasses;
    }

    @JSON(serialize = false)
    public Integer getCourseType() {
        return courseType;
    }

    public void setCourseType(Integer courseType) {
        this.courseType = courseType;
    }
    @JSON(serialize = false)
    public List<Integer> getDurations() {
        return durations;
    }

    public void setDurations(List<Integer> durations) {
        this.durations = durations;
    }
    @JSON(serialize = false)
    public List<Calendar> getStartTimes() {
        return startTimes;
    }

    public void setStartTimes(List<Calendar> startTimes) {
        this.startTimes = startTimes;
    }
    @JSON(serialize = false)
    public List<Integer> getClassDate() {
        return classDate;
    }

    public void setClassDate(List<Integer> classDate) {
        this.classDate = classDate;
    }
    @JSON(serialize = false)
    public Integer getRepeatTimes() {
        return repeatTimes;
    }

    public void setRepeatTimes(Integer repeatTimes) {
        this.repeatTimes = repeatTimes;
    }
    @JSON(serialize = false)
    public CourseInviteStudentDao getCourseInviteStudentDao() {
        return courseInviteStudentDao;
    }

    public void setCourseInviteStudentDao(CourseInviteStudentDao courseInviteStudentDao) {
        this.courseInviteStudentDao = courseInviteStudentDao;
    }
    @JSON(serialize = false)
    public List<CourseInviteStudent> getCourseInviteStudents() {
        return courseInviteStudents;
    }

    public void setCourseInviteStudents(List<CourseInviteStudent> courseInviteStudents) {
        this.courseInviteStudents = courseInviteStudents;
    }
    @JSON(serialize = false)
    public List<String> getEmails() {
        List<String> realEmails = new ArrayList<String>();
        for(String email : emails){
            if(email != "") realEmails.add(email);
        }
        return realEmails;
    }

    public void setEmails(List<String> emails) {
        this.emails = emails;
    }

    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
    }
}
