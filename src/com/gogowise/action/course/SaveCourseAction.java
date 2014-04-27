package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.course.CourseService;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.dao.CourseInviteStudentDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.course.enity.CourseInviteStudent;
import com.gogowise.rep.course.vo.CourseSpecification;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({@Result(name = "json", type = "json")})
public class SaveCourseAction extends BasicAction {
    private Course course;
    private CourseClass courseClass;
    private BaseUserDao baseUserDao;
    private OrganizationDao organizationDao;
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
    private CourseService courseService;
    private List<Integer> teacherIds;


    @Action(value = "ajaxSaveCourse")
    public String ajaxSaveCourse() {

        // Save course
        CourseSpecification specification = CourseSpecification.create(course, this.getSessionUserId(), this.getCourseType(), this.getTeacherIds());
        courseService.saveCourse(specification);

        course = courseService.findById(course.getId());

        course.setStudentAgeType(this.getCourse().getStudentAgeType());
        course.setIsPublic( this.getCourse().getIsPublic() );
        courseDao.persist(course);

        // copy jpg
        if (StringUtils.isNotBlank(course.getLogoUrl()) && !StringUtils.startsWithIgnoreCase(course.getLogoUrl(), "upload/")) {
            //Utils.notReplaceFileFromTmp(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId(), course.getLogoUrl());
            String courseDir = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_COURSE_PATH);
            courseDir = courseDir + File.separator + course.getId();

            File temp = new File(courseDir);
            if (!temp.exists()) temp.mkdirs();

            Utils.notReplaceFileFromTmpModified(temp.getAbsolutePath(), course.getLogoUrl());
            course.setLogoUrl(Constants.UPLOAD_COURSE_PATH + "/" + course.getId() + "/" + course.getLogoUrl());
        }

        //change teacher
        if(teacherIds != null && teacherIds.size()>0){
            if(course.getTeachers()!=null){
                course.getTeachers().clear();
            }
            for (Integer tId : teacherIds) {
                BaseUser teacher = baseUserDao.findById(tId);
                if (teacher != null) {
                    course.addTeacher(teacher);
                }
            }
        }


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


    @Action(value = "selfSaveClass", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".classesList")})
    public String selfSaveClass() {
        course = courseDao.findById(this.getCourse().getId());
        classDao.saveClass(courseClass, course, durations.get(0));
        courseClasses = classDao.findByCourseId(course.getId());
        return SUCCESS;
    }

    @Action(value = "autoSaveClasses", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".classesList")})
    public String autoSaveClasses() {
        course = courseDao.findById(this.getCourse().getId());
        classDao.autoClassSystemSave(startTimes, durations, classDate, repeatTimes, course);
        courseClasses = classDao.findByCourseId(course.getId());
        for (int i = 0; i < courseClasses.size(); i++) {
            int j = i + 1;
            courseClasses.get(i).setName(this.getText("lable.class.no1") + j + this.getText("lable.class.no2"));
            classDao.persistAbstract(courseClasses.get(i));
        }

        course.setTotalHours(course.getTotalHours() + startTimes.size() * classDate.size() * repeatTimes);
        courseDao.persistAbstract(course);
        return SUCCESS;
    }

    @Action(value = "updateCourseTeachingNum")
    public void updateCourseTeachingNum() {
        Course _course = courseDao.findById(this.getCourse().getId());
        _course.setTeachingNum(this.getCourse().getTeachingNum());
        courseDao.persistAbstract(_course);
    }

    @Action(value = "ajaxUpdateCourse")
    public void ajaxUpdateCourse() {
        Course _course = courseDao.findById(this.getCourse().getId());
        _course.setName(Utils.getEmptyString(course.getName()));
        _course.setDescription(Utils.getEmptyString(course.getDescription()));
        _course.setStudentType(Utils.getEmptyString(course.getStudentType()));
        _course.setCourseTeachingBook(Utils.getEmptyString(course.getCourseTeachingBook()));
        _course.setCourseType(course.getCourseType());
        _course.setCharges(course.getCharges());
        _course.setStudentAgeType(this.getCourse().getStudentAgeType());

        if (StringUtils.isNotBlank(course.getLogoUrl()) && !StringUtils.startsWithIgnoreCase(course.getLogoUrl(), "/upload/course")) {
            String courseDir = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_COURSE_PATH);
            courseDir = courseDir + File.separator + course.getId();

            File temp = new File(courseDir);
            if (!temp.exists()) temp.mkdirs();

            Utils.notReplaceFileFromTmpModified(temp.getAbsolutePath(), course.getLogoUrl());
            _course.setLogoUrl(Constants.UPLOAD_COURSE_PATH + "/" + course.getId() + "/" + course.getLogoUrl());

            //Utils.notReplaceFileFromTmp(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId(), course.getLogoUrl());
            //_course.setLogoUrl(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId()+"/"+course.getLogoUrl());
        }
        if (StringUtils.isBlank(course.getLogoUrl())) _course.setLogoUrl(Constants.DEFAULT_COURSE_IMAGE);

        //change teachers
        if (teacherIds != null && teacherIds.size() > 0) {

            if (_course.getTeachers() != null) {
                _course.getTeachers().clear();
            }

            for (Integer teacherId : teacherIds) {
                BaseUser teacher = baseUserDao.findById(teacherId);
                if (teacher != null) {
                    _course.addTeacher(teacher);
                }
            }
        }

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
    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
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
        for (String email : emails) {
            if (email != "") realEmails.add(email);
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

    public List<Integer> getTeacherIds() {
        return teacherIds;
    }

    public void setTeacherIds(List<Integer> teacherIds) {
        this.teacherIds = teacherIds;
    }

    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }
}
