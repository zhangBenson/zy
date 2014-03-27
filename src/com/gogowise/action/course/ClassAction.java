package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.ClassSession;
import com.gogowise.action.valueobject.OpenClassSession;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.*;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.course.enity.*;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.common.utils.Constants;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.CompactWriter;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
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
    public static final Integer TEACHING_NUM_1 = 1;
    private ClassRoomDao classRoomDao;
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
    private List<CourseClass> classes = new ArrayList<CourseClass>();
    private List<ClassRoom> classRooms = new ArrayList<ClassRoom>();

    private List<Calendar> startTimes = new ArrayList<Calendar>();
    private String inviteFriendHref;
    private List<Integer> durations = new ArrayList<Integer>();    //持续时间
    private List<Integer> classDate = new ArrayList<Integer>();     //周几
    private Integer repeatTimes;                                   //重复次数
    private Integer operaType;
    private Integer roleType;                  //进入虚拟教室的人的身份，1为老师，2为学生
    private String teacherEmail;
    private Integer courseType = 0;
    private Integer classType = 0;
    private Integer originalId;//用于母版开课时记录原始课程的ID
    private Boolean teacherChange;


    @Action(value = "editClassInfo")
    public void editClassInfo(){
       classDao.editClass(this.getCourseClass());
    }
    @Action(value = "saveClass", results = {@Result(name = SUCCESS, type = "tiles", location = ".initStep3"),
            @Result(name = "repeat",type = Constants.RESULT_NAME_TILES,location = ".repeatClassInfo"),
            @Result(name = "maintenance",type = Constants.RESULT_NAME_TILES,location = ".courseInfoModified"),
            @Result(name = INPUT, type = "tiles", location = ".saveClass")})
    public String saveClass() {
        course = courseDao.findById(this.getCourse().getId());
        classDao.saveClass(courseClass, course, durations.get(0));
        course = courseDao.findById(this.getCourse().getId());
        classes = classDao.findByCourseId(course.getId());
        for (int i = 0; i < classes.size(); i++) {
            int j = i + 1;
            classes.get(i).setName(this.getText("lable.class.no1") + j + this.getText("lable.class.no2"));
            classDao.persistAbstract(classes.get(i));
        }
        course.setClasses(classes);
        course.setTotalHours(course.getTotalHours()+1);
        courseDao.persistAbstract(course);
        classCount = classes.size() + 1;
        this.setOperaType(Constants.OPERA_TYPE_FOR_COURSE_CREATION);
        if(classType.equals(Constants.CLASS_TYPE_OF_REPEAT)){
            return "repeat";
        }else if(classType.equals(Constants.CLASS_TYPE_OF_MAINTENANCE)){
            return "maintenance";
        }
        return SUCCESS;
    }


    @Action(value = "autoSaveClass", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initStep3"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".initStep3")})
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
        course.setTotalHours(course.getTotalHours()+startTimes.size()*classDate.size()*repeatTimes);
        courseDao.persistAbstract(course);
        classCount = course.getClasses().size() + 1;
        this.setOperaType(Constants.OPERA_TYPE_FOR_COURSE_CREATION);
        return SUCCESS;
    }

     @Action(value = "classesInfoModify", results = {@Result(name = SUCCESS, type = "tiles", location = ".courseInfoModified"),
            @Result(name = INPUT, type = "tiles", location = ".courseInfoModified")})
    public String classesInfoModify() {
        course = courseDao.findById(this.getCourse().getId());
        classDao.saveClass(courseClass, course, durations.get(0));
        course = courseDao.findById(this.getCourse().getId());
        classes = classDao.findByCourseId(course.getId());
        for (int i = 0; i < classes.size(); i++) {
            int j = i + 1;
            classes.get(i).setName(this.getText("lable.class.no1") + j + this.getText("lable.class.no2"));
            classDao.persistAbstract(classes.get(i));
        }
        course.setClasses(classes);
        course.setTotalHours(course.getTotalHours()+1);
        courseDao.persistAbstract(course);
        classCount = classes.size() + 1;
        this.setOperaType(Constants.OPERA_TYPE_FOR_COURSE_MODIFY);
        return SUCCESS;
    }

    @Action(value = "goback2saveClass",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".initStep3"),
                                                     @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".initStep3")})
    public String  goBack2SaveClass(){
        course = courseDao.findById(this.getCourse().getId());
        for (int i = 0; i < course.getClasses().size(); i++) {
            int j = i + 1;
            course.getClasses().get(i).setName(this.getText("lable.class.no1") + j + this.getText("lable.class.no2"));
            classDao.persistAbstract(course.getClasses().get(i));
        }
        classCount = course.getClasses().size() + 1;
        this.setOperaType(Constants.OPERA_TYPE_FOR_COURSE_CREATION);
        return SUCCESS;
    }
    @Action(value = "goback2repeatClass",results = {@Result(name =SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".repeatClassInfo")})
    public String  goback2repeatClass(){
        course = courseDao.findById(this.getCourse().getId());
        this.setClassCount(course.getClasses().size()+1);
        return SUCCESS;
    }

    @Action(value = "goback2classesModify",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".modifyCourseStep3"),
                                                         @Result(name = "repeat",type = Constants.RESULT_NAME_TILES,location = ".repeatClassInfo"),
                                                         @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".courseInfoModified")})
    public String  goback2classesModify(){
        course = courseDao.findById(this.getCourse().getId());
        classCount = course.getClasses().size() + 1;
        this.setOperaType(Constants.OPERA_TYPE_FOR_COURSE_MODIFY);
        if(classType.equals(Constants.CLASS_TYPE_OF_REPEAT)){
            return "repeat";
        }
        return SUCCESS;
    }

     @Action(value = "presentation",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".presentation"),
                                                @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".presentation")})
    public String resultPresent(){
        course = courseDao.findById(this.getCourse().getId());
        classes = classDao.findByCourseId(course.getId());
        for (int i = 0; i < classes.size(); i++) {
            int j = i + 1;
            classes.get(i).setName(this.getText("lable.class.no1") + j + this.getText("lable.class.no2"));
            classDao.persistAbstract(classes.get(i));
        }
        course.setClasses(classes);
        courseDao.persistAbstract(course);
        courseInviteStudents=courseInviteStudentDao.findByCourseId(this.getCourse().getId());
        return SUCCESS;
    }

       @Action(value = "presentation4Modify",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".modifyCourseStep4"),
                                                @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".modifyCourseStep4")})
    public String resultPresent4Modify(){
        course = courseDao.findById(this.getCourse().getId());
        classes = classDao.findByCourseId(course.getId());
        for (int i = 0; i < classes.size(); i++) {
            int j = i + 1;
            classes.get(i).setName(this.getText("lable.class.no1") + j + this.getText("lable.class.no2"));
            classDao.persistAbstract(classes.get(i));
        }
        course.setClasses(classes);
        courseDao.persistAbstract(course);
        courseInviteStudents=courseInviteStudentDao.findByCourseId(this.getCourse().getId());
        return SUCCESS;
    }


     @Action(value = "modifyPresentation",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".personalModiPre"),
                                                @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".personalModiPre")})
    public String modifyPresentation(){
        course = courseDao.findById(this.getCourse().getId());
        courseInviteStudents=courseInviteStudentDao.findByCourseId(this.getCourse().getId());
        return SUCCESS;
    }
     @Action(value = "repeatPresentation",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".repeatPresentation")})
     public String repeatPresentation(){
        course = courseDao.findById(this.getCourse().getId());
        courseInviteStudents=courseInviteStudentDao.findByCourseId(this.getCourse().getId());
        return SUCCESS;
    }


    private Boolean isTimeConflict(Calendar cal1, Integer duration1, Calendar cal2, Integer duration2) {
        if ((cal1.get(Calendar.HOUR_OF_DAY) * 24 + cal1.get(Calendar.MINUTE)) <= (cal2.get(Calendar.HOUR_OF_DAY) * 24 + cal2.get(Calendar.MINUTE)) &&
                (cal2.get(Calendar.HOUR_OF_DAY) * 24 + cal2.get(Calendar.MINUTE)) < (cal1.get(Calendar.HOUR_OF_DAY) * 24 + cal1.get(Calendar.MINUTE) + duration1)) {
            return true;
        }
        if ((cal2.get(Calendar.HOUR_OF_DAY) * 24 + cal2.get(Calendar.MINUTE)) <= (cal1.get(Calendar.HOUR_OF_DAY) * 24 + cal1.get(Calendar.MINUTE)) &&
                (cal1.get(Calendar.HOUR_OF_DAY) * 24 + cal1.get(Calendar.MINUTE)) < (cal2.get(Calendar.HOUR_OF_DAY) * 24 + cal2.get(Calendar.MINUTE) + duration2)) {
            return true;
        }
        return false;
    }

    @Action(value = "openClassSession", results = {@Result(name = SUCCESS, type = "tiles", location = ".openClassSession")})
    public String openClassSession() {
        if (this.getCourseClass().getId() != null) {
            courseClass = classDao.findById(this.getCourseClass().getId());
            inviteFriendHref = getBasePath()+"/courseOnlineAudit.html?courseClass.id="+courseClass.getId()+"&courseOnline=true";
        }

            ClassSession classSession = new ClassSession();
            initPersonalSession(classSession);
            XStream xstream = new XStream();
            xstream.alias("Session", ClassSession.class);
            OutputStream output = new ByteArrayOutputStream();
            xstream.marshal(classSession, new CompactWriter(new OutputStreamWriter(output)));
            this.setInitSeesionString(output.toString());
            Integer type = getType();
            initPersonalFlashPath(type);
            if(this.flashPatch.equals("flash/Teacher_1_to_1.swf")){
                courseClass.setTeacherEntered(true);
                this.setRoleType(1);
            }else {
               this.setRoleType(2);
            }
            classDao.persistAbstract(courseClass);
            return SUCCESS;

    }
    @Action(value = "updateRecord")
    public String updateRecord(){
        if(this.getCourseClass()!=null){
        courseClass = classDao.findById(this.getCourseClass().getId());
        courseClass.setRecord(true);
        classDao.persistAbstract(courseClass);
        }
        return NONE;
    }

    @Action(value = "closeBrowser",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}),
                                                @Result(name = "supervision",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "courseSupervise"})})
    public String closeBrowser(){
        if(this.getRoleType() != null && this.getRoleType().equals(3)){
          return "supervision";
        }
        return SUCCESS;
    }

    private void initSession(OpenClassSession openClassSession) {
        openClassSession.initWithSession(this.getCourseClass());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        openClassSession.setUserID(user.getId());
        openClassSession.setUserName(user.getNickName());
        openClassSession.setType(getType());

    }

    private void initPersonalSession(ClassSession classSession) {
        classSession.initWithSession(this.getCourseClass());
        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        classSession.setUserID(user.getId());
        classSession.setUserName(user.getNickName());
        if (seniorClassRoomDao.findClassRoomByCourseId(courseClass.getCourse().getId()).size() != 0) {
                    classSession.setStudentID(seniorClassRoomDao.findClassRoomByCourseId(courseClass.getCourse().getId()).get(0).getStudent().getId());
                    classSession.setStudentName(seniorClassRoomDao.findClassRoomByCourseId(courseClass.getCourse().getId()).get(0).getStudent().getNickName());
        }
        classSession.setType(4);
    }

    private Integer getType() {
        Integer masterId = this.getCourseClass().getCourse().getTeacher()==null? 0:this.getCourseClass().getCourse().getTeacher().getId();
        if (this.getSessionUserId().equals(masterId)) {
            return Constants.MASTER_TYPE;
        }
        SeniorClassRoom seniorClassRoom = seniorClassRoomDao.findClassRoomByCourseAndStudent(this.getCourseClass().getCourse().getId(), this.getSessionUserId());
        if (seniorClassRoom != null) {
            return Constants.STUDENT_TYPE;
        } else {
            return Constants.ANONYMOUS_TYPE;
        }
    }

    private void initFlashPath(Integer type) {
        if (type.equals(Constants.MASTER_TYPE)) this.flashPatch = "flash/Teacher_Openclass.swf";
        else if (type.equals(Constants.ANONYMOUS_TYPE)) this.flashPatch = "flash/Student_Openclass.swf";
        else this.flashPatch = "flash/Student_Openclass.swf";
    }

    private void initPersonalFlashPath(Integer type) {
        if (type .equals(Constants.MASTER_TYPE)) this.flashPatch = "flash/Teacher_1_to_1.swf";
        else this.flashPatch = "flash/Student_1_to_1.swf";
    }


    @Action(value = "deleteClasses")
    public void deleteClasses(){
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



    @Action(value = "deleteClass", results = {@Result(name = SUCCESS, type = "tiles", location = ".saveClass"),
                                               @Result(name = "repeat",type = Constants.RESULT_NAME_TILES,location = ".repeatClasses"),
                                               @Result(name = "maintenance",type = Constants.RESULT_NAME_TILES,location = ".courseInfoModified")})
    public String deleteClass() {
        courseClass = classDao.findById(this.getCourseClass().getId());
        course = courseClass.getCourse();
        classDao.delete(courseClass);
        classes = classDao.findByCourseId(course.getId());
        for (int i = 0; i < classes.size(); i++) {
            int j = i + 1;
            classes.get(i).setName(this.getText("lable.class.no1") + j + this.getText("lable.class.no2"));
            classDao.persistAbstract(classes.get(i));
        }
        course.setClasses(classes);
        course.setTotalHours(course.getTotalHours()-1);
        courseDao.persistAbstract(course);
        classCount = classes.size() + 1;
        if(classType.equals(Constants.CLASS_TYPE_OF_REPEAT)){
            return "repeat";
        }else if(classType.equals(Constants.CLASS_TYPE_OF_MAINTENANCE)){
            return "maintenance";
        }
        return SUCCESS;
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

    public ClassRoomDao getClassRoomDao() {
        return classRoomDao;
    }

    public void setClassRoomDao(ClassRoomDao classRoomDao) {
        this.classRoomDao = classRoomDao;
    }

    public List<ClassRoom> getClassRooms() {
        return classRooms;
    }

    public void setClassRooms(List<ClassRoom> classRooms) {
        this.classRooms = classRooms;
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
}
