package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.*;
import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.CourseService;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.dao.CourseInviteStudentDao;
import com.gogowise.rep.course.dao.SeniorClassRoomDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.course.enity.CourseInviteStudent;
import com.gogowise.rep.course.enity.SeniorClassRoom;
import com.gogowise.rep.course.vo.CourseSpecification;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.system.enity.Matter;
import com.gogowise.rep.tag.dao.TagDao;
import com.gogowise.rep.tag.enity.Tag;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({@Result(name = "json", type = "json")})
public class SaveCourseAction extends BasicAction {
    private DateFormat dateFormat = new SimpleDateFormat(this.getText("dateformat.forclass"));

    private Course course;
    private CourseClass classInfo;
    private BaseUserDao baseUserDao;
    private OrganizationDao organizationDao;
    private ClassDao classDao;
    private CourseDao courseDao;

    private List<CourseClass> classes = new ArrayList<CourseClass>();
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
    private Boolean accept = false;

    @Autowired
    private TagDao tagDao;
    private List<String> tags;  //用户输入的tag
    private List<Tag> existTags; //数据库中已有的tag
    @Autowired
    private CourseInviteStudentDao courseInviteStudentDao;
    @Autowired
    private ModelDao matterDao;
    private Boolean isTeacher = false;
    private BaseUser user;
    @Autowired
    private SeniorClassRoomDao seniorClassRoomDao;

    @Action(value = "listTags")
    public String listTags() {
        existTags = tagDao.findAll();
        return RESULT_JSON;
    }

    @Action(value = "ajaxSaveCourse")
    public String ajaxSaveCourse() {

        // Save course
        CourseSpecification specification = CourseSpecification.create(course, this.getSessionUserId(), this.getCourseType(), this.getTeacherIds());
        courseService.saveCourse(specification);

        course = courseService.findById(course.getId());

        course.setStudentAgeType(this.getCourse().getStudentAgeType());
        course.setIsPublic(this.getCourse().getIsPublic());
        //courseDao.persist(course);
        course.setCameraManConfirmed(true);
        course.setTeacherConfirmed(true);
        course.setMasterConfirmed(true);

        //TODO 设置course的标签Tag
        for (String tagName : tags) {
            Tag temp = tagDao.findByName(tagName);
            if (temp == null) {
                Tag newTag = new Tag(tagName);
                tagDao.persistAbstract(newTag);
                course.getTags().add(newTag);
            } else {
                if (!course.getTags().contains(temp)) course.getTags().add(temp);
            }
        }
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
        if (teacherIds != null && teacherIds.size() > 0) {
            if (course.getTeachers() != null) {
                course.getTeachers().clear();
            }
            for (Integer tId : teacherIds) {
                BaseUser teacher = baseUserDao.findById(tId);
                if (teacher != null) {
                    course.addTeacher(teacher);
                }
            }
        }

        for (String email : emails) {
            if (StringUtils.isNotBlank(email)) {
                courseService.saveInvitation(email, this.getCourse().getId());
            }
        }
        this.setCourse_id(course.getId());
        courseDao.persist(course);
        return "json";
    }


    @Action(value = "selfSaveClass", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".classesList")})
    public String selfSaveClass() {
        course = courseDao.findById(this.getCourse().getId());
        classDao.saveClass(classInfo, course, durations.get(0));

        classes = classDao.findByCourseId(course.getId());

        for (int i = 0; i < classes.size(); i++) {
            CourseClass curClass = classes.get(i);
            if (curClass.getName() == null || curClass.getName().length() == 0) {
                curClass.setName(this.getText("lable.class.no1") + (i + 1) + this.getText("lable.class.no2"));
                classDao.persistAbstract(curClass);
            }
        }
        return SUCCESS;
    }

    @Action(value = "autoSaveClasses", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".classesList")})
    public String autoSaveClasses() {
        course = courseDao.findById(this.getCourse().getId());
        classDao.autoClassSystemSave(startTimes, durations, classDate, repeatTimes, course);
        classes = classDao.findByCourseId(course.getId());
        for (int i = 0; i < classes.size(); i++) {
            int j = i + 1;
            classes.get(i).setName(this.getText("lable.class.no1") + j + this.getText("lable.class.no2"));
            classDao.persistAbstract(classes.get(i));
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

        _course.getTags().clear();
        for (String tagName : tags) {
            Tag temp = tagDao.findByName(tagName);
            if (temp == null) {
                Tag newTag = new Tag(tagName);
                tagDao.persistAbstract(newTag);
                _course.getTags().add(newTag);
            } else {
                if (!_course.getTags().contains(temp)) _course.getTags().add(temp);
            }
        }

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

        for (String email : emails) {
            if (StringUtils.isNotBlank(email)) {
                courseService.saveInvitation(email, this.getCourse().getId());
                this.sendNoticeToStudent(courseInviteStudentDao.findByCourseAndEmail(this.getCourse().getId(), email));
            }
        }
        courseDao.persistAbstract(_course);

    }


    @Action(value = "emailHandleForCourseCreation", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}), @Result(name = "inviteReject", type = Constants.RESULT_NAME_TILES, location = ".emailHandleReject"), @Result(name = NONE, type = Constants.RESULT_NAME_TILES, location = ".notExist")})
    public String emailHandleForCourseCreation() throws Exception {

        if (this.getCourse().getId() != null && this.getUser().getEmail() != null) {
            course = courseDao.findById(this.getCourse().getId());
            user = baseUserDao.findByEmail(this.getUser().getEmail());
            if (accept.equals(true) && this.getTeacher().equals(false)) { // students' email accept handle
                CourseInviteStudent courseInviteStudent = courseInviteStudentDao.findByCourseAndEmail(this.getCourse().getId(), this.getUser().getEmail());
                if (courseInviteStudent != null) {
                    confirmInvitation(this.getUser().getEmail(), this.getCourse().getId());
                    return SUCCESS;
                } else {
                    return NONE;
                }
            } else if (accept.equals(true) && this.getTeacher().equals(true)) { // teacher's email accept handle
                course.setTeacher(user);
                courseDao.persistAbstract(course);
                return SUCCESS;
            } else { //email reject handle
                return "inviteReject";
            }
        }
        return SUCCESS;
    }


    @Action(value = "courseInviteIdentityConfirm", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"})})
    public String courseInviteIdentityConfirm() throws Exception {

        user.setLockedOut(false);
        user.setPassword(MD5.endCode(user.getPassword()));
        user.setRegDate(Calendar.getInstance());
        baseUserDao.persistAbstract(user);
        setUserToSession(user);
        course = courseDao.findById(this.getCourse().getId());
        SeniorClassRoom seniorClassRoom = new SeniorClassRoom();
        seniorClassRoom.setCourse(course);
        seniorClassRoom.setStudent(user);
        seniorClassRoomDao.persistAbstract(seniorClassRoom);
        String filePath = "d:/contract/" + course.getName() + ".pdf";
        String tile = "预定课程协议";
        String content = "内容见附件";
        PdfUtil.createCourseContract(filePath, courseDao.findById(course.getId()), user);
        EmailUtil.sendMail(user.getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
        EmailUtil.sendMail(course.getTeacher().getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
        EmailUtil.sendMail(Constants.COURSE_CONFIRM_EMAIL, tile, content, new String[]{"contract.pdf"}, new String[]{filePath});

        //=============================给老师的邮件反馈===========================================
        DateFormat dateFormat = new SimpleDateFormat(this.getText("dateformat.email"));
        EmailUtil.sendMail(course.getTeacher().getEmail(), this.getText("course.invite.student.email.content.you.friend") + user.getNickName() + this.getText("course.invite.student.and.accept"), Constants.CSS + this.getText("course.invite.student.to.teacher.feedback", new String[]{user.getNickName(), course.getName(), dateFormat.format(course.getStartDate().getTime()), course.getTeacher().getEmail(), course.getTeacher().getEmail()}), "text/html;charset=utf-8");
        return SUCCESS;
    }

    private void confirmInvitation(String email, Integer courseId) throws Exception {
        courseService.saveInvitation(email, courseId);
        sendEmailAfterConfirm();
    }

    private void sendEmailAfterConfirm() throws Exception {
//        String filePath = "d:/contract/" + course.getName() + ".pdf";
        String filePath = Constants.DOWNLOAD_CONTRACT + course.getId() + "/" + course.getName() + ".pdf";
        String tile = this.getText("course.pdf.title", new String[]{user.getNickName(), course.getName()});
        String content = this.getText("course.pdf.content");
        PdfUtil.createCourseContract(filePath, courseDao.findById(course.getId()), user);
        EmailUtil.sendMail(user.getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
        if (course.getOrganization() != null) {
            EmailUtil.sendMail(course.getOrganization().getResponsiblePerson().getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
        } else {
            EmailUtil.sendMail(course.getTeacher().getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
        }
        EmailUtil.sendMail(Constants.COURSE_CONFIRM_EMAIL, tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
    }

    @Action(value = "courseGet2public", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}), @Result(name = "orgSUCCESS", type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myForcastClass", "course.id", "${course.id}"})})
    public String go2public() {

        course = courseDao.findById(this.getCourse().getId());
        this.getCourse().setMasterConfirmed(true);
        this.getCourse().setTeacherConfirmed(true);
        this.getCourse().setCameraManConfirmed(true);
        this.getCourse().setTotalHours(this.getCourse().getClasses().size());
        this.getCourse().setPublicationTime(Utils.getCurrentCalender());
        courseDao.persistAbstract(course);

        courseInviteStudents = courseInviteStudentDao.findByCourseId(this.getCourse().getId());
        Calendar courseStartTime = Calendar.getInstance();
        courseStartTime.setTime(course.getStartDate().getTime());


        String classesInfo = getClassInfoString(course);
        if (course.getOrganization() != null) {
            String serialNo = this.getSessionNickName() + (new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime()));
            Matter matter = new Matter(Calendar.getInstance(), serialNo, Matter.MATTER_COURSE_TEACHER, baseUserDao.findByEmail(this.getSessionUserEmail()), null, course.getTeacherEmail(), course, false);
            matterDao.persistAbstract(matter);

            //=====================================  课程发布时，组织发送邮件给老师   =====================

            String tile = this.getText("org.invite.teacher.email.title", new String[]{course.getOrganization().getSchoolName()});

            String acceptArrange = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=true&teacher=true&user.email=" + course.getTeacherEmail();
            String rejectArrange = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=false&teacher=true&user.email=" + course.getTeacherEmail();
            String[] args = {course.getTeacherEmail(), course.getOrganization().getSchoolName(), course.getName(), course.getDescription(), dateFormat.format(Utils.changeBaseOnTimeZone4Action(courseStartTime).getTime()), course.getTotalHours().toString(), classesInfo.toString(), acceptArrange, rejectArrange, acceptArrange, rejectArrange, this.getCourse().getTeacherEmail()};
            EmailUtil.sendMail(course.getTeacherEmail(), tile, Constants.INVITATION_EMAIL_CSS + this.getText("org.invite.teacher.email.content", args), "text/html;charset=utf-8");

            //=====================================  课程发布时，组织发送邮件给学生   =====================

            for (CourseInviteStudent courseInviteStudent : courseInviteStudents) {
                sendNoticeToStudent(courseInviteStudent);
            }

        } else {

            String css = "<style type=\"text/css\">\n" + "#container {width: 100%;float: left;padding: 0px;margin: 0px 100px;background: #FFF;}\n" + "#logo {height: 60px;width: 100%;padding-bottom: 5px;border-bottom: 1px solid #999;float: left;}\n" + "#sayhello {font-weight: lighter;}\n" + "#content {float: left;width: 100%;border-bottom: 1px solid #999;font-weight: lighter;}\n" + "#footer {float: left;width: 100%;}\n" + ".wordtype{color:#cc6600;}\n" + "</style>";
            for (CourseInviteStudent courseInviteStudent : courseInviteStudents) {
                String hrefAccept = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=true&teacher=false&user.email=" + courseInviteStudent.getInvitedStudentEmail();
                String hrefReject = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=false&teacher=false&user.email=" + courseInviteStudent.getInvitedStudentEmail();
                EmailUtil.sendMail(courseInviteStudent.getInvitedStudentEmail(), this.getText("course.invite.student.email.content.you.friend") + " " + course.getTeacher().getNickName() + " " + this.getText("course.invite.student.email.content.invite") + " " + course.getName() + " " + this.getText("course.invite.student.email.content.course"), css + this.getText("course.invite.student.email.content", new String[]{course.getTeacher().getNickName(), course.getTeacher().getEmail(), course.getName(), course.getDescription(), dateFormat.format(Utils.changeBaseOnTimeZone4Action(courseStartTime).getTime()), course.getTotalHours().toString(), hrefAccept, hrefReject, hrefAccept, hrefReject, courseInviteStudent.getInvitedStudentEmail()}), "text/html;charset=utf-8");
                Matter matter = new Matter(Calendar.getInstance(), null, Matter.MATTER_COURSE_STUDENT_NO_ORG, baseUserDao.findByEmail(this.getSessionUserEmail()), null, courseInviteStudent.getInvitedStudentEmail(), course, false);
                matterDao.persistAbstract(matter);
            }
        }

        if (course.getOrganization() != null) {
            return "orgSUCCESS";
        }
        return SUCCESS;
    }

    private String getClassInfoString(Course courseInfo) {
        StringBuilder classesInfo = new StringBuilder();
        for (CourseClass cc : courseInfo.getClasses()) {
            Calendar classStartTime = Calendar.getInstance();
            classStartTime.setTime(cc.getDate().getTime());
            classesInfo = classesInfo.append("<tr><td>").append(cc.getName()).append("</td><td>").append(Utils.getEmptyString(cc.getNickName())).append("</td><td>").append(dateFormat.format(Utils.changeBaseOnTimeZone4Action(classStartTime).getTime())).append("</td><td>").append(cc.getDuration()).append("</td><td>").append(this.getText("label.day.of.week." + classStartTime.get(Calendar.DAY_OF_WEEK))).append("</td></tr>");
        }
        return classesInfo.toString();
    }

    private void sendNoticeToStudent(CourseInviteStudent courseInviteStudent) {
        Course courseInfo = courseInviteStudent.getCourse();
        String serialNo = this.getSessionNickName() + (new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime()));
        String tile2 = this.getText("org.invite.student.email.title", new String[]{courseInfo.getName()});
        String acceptArrange2student = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + courseInfo.getId() + "&accept=true&teacher=false&user.email=" + courseInviteStudent.getInvitedStudentEmail();
        String rejectArrange2student = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + courseInfo.getId() + "&accept=false&teacher=false&user.email=" + courseInviteStudent.getInvitedStudentEmail();
        String[] args2student = {courseInviteStudent.getInvitedStudentEmail(), courseInfo.getOrganization().getSchoolName(), courseInfo.getName(), courseInfo.getDescription(), dateFormat.format(courseInfo.getStartDate().getTime()), courseInfo.getTotalHours().toString(), getClassInfoString(courseInfo), acceptArrange2student, rejectArrange2student, acceptArrange2student, rejectArrange2student, courseInviteStudent.getInvitedStudentEmail()};
        EmailUtil.sendMail(courseInviteStudent.getInvitedStudentEmail(), tile2, Constants.INVITATION_EMAIL_CSS + this.getText("org.invite.student.email.content", args2student), "text/html;charset=utf-8");
        Matter matter = new Matter(Calendar.getInstance(), serialNo, Matter.MATTER_COURSE_STUDENT, baseUserDao.findByEmail(this.getSessionUserEmail()), null, courseInviteStudent.getInvitedStudentEmail(), courseInfo, false);
        matterDao.persistAbstract(matter);
    }

    @JSON(serialize = false)
    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    @JSON(serialize = false)
    public CourseClass getClassInfo() {

        return classInfo;
    }

    public void setClassInfo(CourseClass classInfo) {

        this.classInfo = classInfo;
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
    public List<CourseClass> getClasses() {

        return classes;
    }

    public void setClasses(List<CourseClass> classes) {

        this.classes = classes;
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

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public List<Tag> getExistTags() {
        return existTags;
    }

    public void setExistTags(List<Tag> existTags) {
        this.existTags = existTags;
    }

    public Boolean getTeacher() {

        return isTeacher;
    }

    public void setTeacher(Boolean teacher) {

        isTeacher = teacher;
    }

    public Boolean getAccept() {

        return accept;
    }

    public void setAccept(Boolean accept) {

        this.accept = accept;
    }

    @JSON(serialize = false)
    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }
}
