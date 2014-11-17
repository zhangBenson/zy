package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.dao.CourseInviteStudentDao;
import com.gogowise.rep.course.dao.SeniorClassRoomDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.course.enity.CourseInviteStudent;
import com.gogowise.rep.user.dao.BaseUserDao;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-23
 * Time: 下午3:05
 * To change this template use File | Settings | File Templates.
 */

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class ClassAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = 2466562905933168403L;
    private BaseUserDao baseUserDao;
    private ClassDao classDao;
    private CourseDao courseDao;
    private SeniorClassRoomDao seniorClassRoomDao;
    private CourseInviteStudentDao courseInviteStudentDao;
    private List<CourseInviteStudent> courseInviteStudents;
    private String initSeesionString;
    private String flashPatch;
    private CourseClass courseClass;
    private Course course;
    private Integer classCount;
    private Pagination page;
    private List<CourseClass> classes = new ArrayList<>();

    private List<Calendar> startTimes = new ArrayList<>();
    private String inviteFriendHref;
    private List<Integer> durations = new ArrayList<>();    //持续时间
    private List<Integer> classDate = new ArrayList<>();     //周几
    private Integer repeatTimes;                                   //重复次数
    private Integer operaType;
    private Integer roleType;                  //进入虚拟教室的人的身份，1为老师，2为学生
    private String teacherEmail;
    private Integer courseType = 0;
    private Integer classType = 0;
    private Integer originalId;//用于母版开课时记录原始课程的ID
    private Boolean teacherChange;
    private Integer classId;
    private String gameId;


    @Action(value = "editClassInfo")
    public void editClassInfo() {
        classDao.editClass(this.getCourseClass());
    }


    @Action(value = "autoSaveClass", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initStep3")})
    public String autoSaveClass() {
        course = courseDao.findById(this.getCourse().getId());

        classDao.autoClassSystemSave(startTimes, durations, classDate, repeatTimes, course);
        course = courseDao.findById(this.getCourse().getId());
        classes = classDao.findByCourseId(course.getId());
        for (int i = 0; i < classes.size(); i++) {
            int j = i + 1;
            classes.get(i).setName(this.getText("lable.class.no1") + j + this.getText("lable.class.no2"));
            classDao.persistAbstract(classes.get(i));
        }
        course.setClasses(classes);
        courseDao.persistAbstract(course);
        classCount = course.getClasses().size() + 1;
        this.setOperaType(Constants.OPERA_TYPE_FOR_COURSE_CREATION);
        return SUCCESS;
    }


    @Action(value = "closeBrowser", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"})})
    public String closeBrowser() {
        return SUCCESS;
    }



    @Action(value = "deleteClasses")
    public void deleteClasses() {
        courseClass = classDao.findById(this.getCourseClass().getId());
        course = courseClass.getCourse();
        //classDao.delete(courseClass);
        courseClass.setIsDeleted(true);
        classDao.persist(courseClass);

        classes = classDao.findByCourseId(course.getId());
        for (int i = 0; i < classes.size(); i++) {
            int j = i + 1;
            classes.get(i).setName(this.getText("lable.class.no1") + j + this.getText("lable.class.no2"));
            classDao.persistAbstract(classes.get(i));
        }
    }




    @Action(value = "saveGroupingGame")
    public String saveGroupingGame() {
        courseClass = classDao.findById(classId);
        courseClass.setGameId(this.getGameId());
        classDao.persist(courseClass);
        return NONE;
    }


    //===============getter and setter==============


    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public SeniorClassRoomDao getSeniorClassRoomDao() {
        return seniorClassRoomDao;
    }

    public void setSeniorClassRoomDao(SeniorClassRoomDao seniorClassRoomDao) {
        this.seniorClassRoomDao = seniorClassRoomDao;
    }

    public ClassDao getClassDao() {
        return classDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }

    public String getInitSeesionString() {
        return initSeesionString;
    }

    public void setInitSeesionString(String initSeesionString) {
        this.initSeesionString = initSeesionString;
    }

    public String getFlashPatch() {
        return flashPatch;
    }

    public void setFlashPatch(String flashPatch) {
        this.flashPatch = flashPatch;
    }

    public CourseClass getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(CourseClass courseClass) {
        this.courseClass = courseClass;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public Integer getClassCount() {
        return classCount;
    }

    public void setClassCount(Integer classCount) {
        this.classCount = classCount;
    }

    public Pagination getPage() {
        return page;
    }

    public void setPage(Pagination page) {
        this.page = page;
    }

    public List<CourseClass> getClasses() {
        return classes;
    }

    public void setClasses(List<CourseClass> classes) {
        this.classes = classes;
    }


    public List<Calendar> getStartTimes() {
        return startTimes;
    }

    public void setStartTimes(List<Calendar> startTimes) {
        this.startTimes = startTimes;
    }

    public List<Integer> getDurations() {
        return durations;
    }

    public void setDurations(List<Integer> durations) {
        this.durations = durations;
    }

    public Integer getRepeatTimes() {
        return repeatTimes;
    }

    public void setRepeatTimes(Integer repeatTimes) {
        this.repeatTimes = repeatTimes;
    }

    public List<Integer> getClassDate() {
        return classDate;
    }

    public void setClassDate(List<Integer> classDate) {
        this.classDate = classDate;
    }

    public Integer getOperaType() {
        return operaType;
    }

    public void setOperaType(Integer operaType) {
        this.operaType = operaType;
    }

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

    public CourseInviteStudentDao getCourseInviteStudentDao() {
        return courseInviteStudentDao;
    }

    public void setCourseInviteStudentDao(CourseInviteStudentDao courseInviteStudentDao) {
        this.courseInviteStudentDao = courseInviteStudentDao;
    }

    public List<CourseInviteStudent> getCourseInviteStudents() {
        return courseInviteStudents;
    }

    public void setCourseInviteStudents(List<CourseInviteStudent> courseInviteStudents) {
        this.courseInviteStudents = courseInviteStudents;
    }

    public String getTeacherEmail() {
        return teacherEmail;
    }

    public void setTeacherEmail(String teacherEmail) {
        this.teacherEmail = teacherEmail;
    }

    public Integer getCourseType() {
        return courseType;
    }

    public void setCourseType(Integer courseType) {
        this.courseType = courseType;
    }

    public Integer getClassType() {
        return classType;
    }

    public void setClassType(Integer classType) {
        this.classType = classType;
    }

    public Integer getOriginalId() {
        return originalId;
    }

    public void setOriginalId(Integer originalId) {
        this.originalId = originalId;
    }

    public String getInviteFriendHref() {
        return inviteFriendHref;
    }

    public void setInviteFriendHref(String inviteFriendHref) {
        this.inviteFriendHref = inviteFriendHref;
    }

    public Boolean getTeacherChange() {
        return teacherChange;
    }

    public void setTeacherChange(Boolean teacherChange) {
        this.teacherChange = teacherChange;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }
}
