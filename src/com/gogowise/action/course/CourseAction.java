package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.*;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.CourseService;
import com.gogowise.rep.course.dao.*;
import com.gogowise.rep.course.enity.*;
import com.gogowise.rep.course.vo.CourseSpecification;
import com.gogowise.rep.live.MatterDao;
import com.gogowise.rep.live.UserFansDao;
import com.gogowise.rep.live.enity.Matter;
import com.gogowise.rep.live.enity.UserFans;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.system.dao.GoGoWiseAnnounceDao;
import com.gogowise.rep.system.enity.GoGoWiseAnnounce;
import com.gogowise.rep.user.UserService;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.vo.ResultData;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CourseAction extends BasicAction {

    private static final long serialVersionUID = 8355282912239794888L;

    private SeniorClassRoomDao seniorClassRoomDao;
    private ClassRoomDao classRoomDao;
    private BaseUserDao baseUserDao;
    private CourseDao courseDao;
    private OrganizationDao organizationDao;
    private CourseCommentDao courseCommentDao;
    private CourseResourceDao courseResourceDao;
    private CourseQuestionDao courseQuestionDao;
    private CourseInviteStudentDao courseInviteStudentDao;
    private CourseReservationDao courseReservationDao;
    private ClassDao classDao;
    private CourseClass courseClass;
    private CourseReservation courseReservation;
    private List<CourseInviteStudent> courseInviteStudents = new ArrayList<CourseInviteStudent>();
    private List<String> emails = new ArrayList<String>();
    private String email;
    private List<CourseQuestion> courseQuestions = new ArrayList<CourseQuestion>();
    private List<CourseResource> courseResources = new ArrayList<CourseResource>();
    private File upload;
    private String uploadFileName;
    private Course course;
    private Course repeatCourse;
    private Integer identity;
    private String role;
    private List<CourseComment> courseComments = new ArrayList<CourseComment>();
    private List<Course> courses = new ArrayList<Course>();
    private List<Course> coursesOnline = new ArrayList<Course>();
    private List<Course> courses2teacher = new ArrayList<Course>();//老师还教过的课程
    private List<Course> hotCourses = new ArrayList<Course>();  //热门课程
    private List<Course> userConcernCourses = new ArrayList<Course>();  //用户还关心的课程
    private List<Course> courseRelateCourses = new ArrayList<Course>();  //与该课程相关的课程
    private List<Course> coursesInTypes = new ArrayList<Course>();
    private List<Course> coursesForAds = new ArrayList<Course>();
    private List<SeniorClassRoom> seniorClassRooms = new ArrayList<SeniorClassRoom>();
    private Map<Integer, String> orgs = new HashMap<Integer, String>();
    private Pagination pagination = new Pagination();
    private BaseUser user;
    private CourseRecommendDao courseRecommendDao;
    private CourseRecommend courseRecommend;
    private String comments;
    private Integer classCount;
    private String inviteMessage;
    private String searchValue;
    private String searchType = "1";
    private Integer operaType;
    private Integer courseType = 0;
    private String teacherEmail = null;
    private Integer originalId;//用于母版开课时记录原始课程的ID
    private Calendar startTime;
    private Boolean isTeacher = false;
    private Boolean accept = false;
    private DateFormat dateFormat = new SimpleDateFormat(this.getText("dateformat.email"));
    private Boolean teacherChange = false;
    private Integer commentsNum;
    private Boolean commentsNumOverflow = false;
    private MatterDao matterDao;
    private UserFansDao userFansDao;
    private List<BaseUser> hottestTeacher;
    private CourseNewEventDao courseNewEventDao;
    private List<CourseNewEvent> courseNewEvents;
    private CourseNewEvent courseNewEvent;
    private List<Organization> organizations = new ArrayList<>();
    private GoGoWiseAnnounceDao goGoWiseAnnounceDao;
    private List<GoGoWiseAnnounce> goGoWiseAnnounces = new ArrayList<>();
    private Set<BaseUser> teachers = new HashSet<>();
    private CourseService courseService;
    private List<Integer> teacherIds;

    private Integer coursePageShowType; // 0: A-D, 1: E-H, 2: I-L, 3: M-P, 4:Q-T, 5: U-Z, 6: Other 7: Show all
    private List<Course> centerCourses;

    private BaseUserRoleTypeDao baseUserRoleTypeDao;
    @Autowired
    private UserService userService;

//    @Action(value = "search",
//            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".listClass")}
//    )
//    public String search() {
//        if ("1".equalsIgnoreCase(this.getSearchType())) {
//            courses = courseDao.searchCourseByName(pagination, this.getSearchValue());
//        }
//        return SUCCESS;
//    }

    @Action(value = "courseCompetition", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseCompetition")})
    public String courseCompetition() {
        return SUCCESS;
    }

    @Action(value = "courseCenter", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseCenter")})
    public String courseCenter() {
        List<Course> allCourses = courseDao.findlatestCourses(null);

        Map<Character, List<Course>> mapCourses = new HashMap<Character, List<Course>>();
        for (Course cs : allCourses) {
            if (cs.getName() == null || cs.getName().equals(""))
                continue;
            char c = Character.toUpperCase(cs.getName().trim().charAt(0));
            if (c >= 'A' && c <= 'Z') {
                if (mapCourses.containsKey(c)) {
                    List<Course> tmp = mapCourses.get(c);
                    tmp.add(cs);
                    mapCourses.put(c, tmp);
                } else {
                    List<Course> tmpList = new ArrayList<Course>();
                    tmpList.add(cs);
                    mapCourses.put(c, tmpList);
                }
            } else {
                c = '#';  // others
                if (mapCourses.containsKey(c)) {
                    List<Course> tmpList = mapCourses.get(c);
                    tmpList.add(cs);
                    mapCourses.put(c, tmpList);
                } else {
                    List<Course> tmpList = new ArrayList<Course>();
                    tmpList.add(cs);
                    mapCourses.put(c, tmpList);
                }
            }
        }

        if (this.getCoursePageShowType() != null) {
            String range = "";
            switch (this.getCoursePageShowType()) {
                case 0: // A-D
                    range = "ABCD";
                    break;
                case 1: // E-H
                    range = "EFGH";
                    break;
                case 2: // I-L
                    range = "IJKL";
                    break;
                case 3: // M-P
                    range = "MNOP";
                    break;
                case 4: // Q-T
                    range = "QRST";
                    break;
                case 5: //U-Z
                    range = "UVWXYZ";
                    break;
                case 6: // Other
                    range = "#";
                    break;
                default: // show all
                    range = "";
                    break;
            }
            if (!range.equals("")) {
                if (this.centerCourses == null)
                    this.centerCourses = new ArrayList<>();
                else
                    this.centerCourses.clear();
                for (char c : range.toCharArray()) {
                    if (mapCourses.containsKey(c)) {
                        this.centerCourses.addAll(mapCourses.get(c));
                    }
                }
            } else {
                this.centerCourses = allCourses;
            }
        } else { // first time in courseCenter page
            if (this.centerCourses == null)
                this.centerCourses = new ArrayList<>();
            else
                this.centerCourses.clear();
            String range = "ABCDEFGHIJKLMNOPQRSTUVWXYZ#";
            for (char c : range.toCharArray()) {
                if (mapCourses.containsKey(c)) {
                    this.centerCourses.addAll(mapCourses.get(c));
                }
            }
        }
        return SUCCESS;
    }

    @Action(value = "courseSquare", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseSquare")})
    public String courseSquare() {
        coursesOnline = courseDao.findCourseOnline(new Pagination(3));
        coursesInTypes = courseDao.findLatest4Course(new Pagination(20));
        courses = courseDao.findCourseOfForcastClass(new Pagination(8));       //最新课程
        hotCourses = courseDao.findHotCourses(new Pagination(8));    //最热课程
        hottestTeacher = baseUserDao.findHottestTeacher(new Pagination(9));
        organizations = organizationDao.findLatestOrgs(new Pagination(4));
        coursesForAds = courseDao.findLatest4Course(new Pagination(3));
        goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(new Pagination(13));
        courseNewEvents = courseNewEventDao.findLatestTenEvents(new Pagination(13));  //课程新鲜事
        return SUCCESS;
    }

    @Action(value = "courseHotList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseHotList")})
    public String showHotCourses() {
        pagination.setPageSize(5);
        hotCourses = courseDao.findHotCourses(pagination);    //最热课程
        hottestTeacher = baseUserDao.findHottestTeacher(new Pagination(3));
        courses = courseDao.findLatest4Course(new Pagination(4));       //最新课程
        return SUCCESS;
    }

    @Action(value = "courseNewList", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseNewList")})
    public String showNewCourseList() {
        pagination.setPageSize(5);
        hotCourses = courseDao.findlatestCourses(pagination);  //最新课程
        //hotCourses = courseDao.findHotCourses(pagination);    //最热课程
        hottestTeacher = baseUserDao.findHottestTeacher(new Pagination(3));
        courses = courseDao.findLatest4Course(new Pagination(4));       //最新课程

//
//        coursesOnline = courseDao.findCourseOnline(new Pagination(3));
//        coursesInTypes = courseDao.findCoursesInTypes(Constants.DEFAULT_COURSE_TYPE_OF_LANGUAGE, new Pagination(20));
//
//
//        organizations = organizationDao.findLatestOrgs(new Pagination(4));
//        coursesForAds = courseDao.findLatest4Course(new Pagination(3));
//        goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(new Pagination(10));
//        courseNewEvents = courseNewEventDao.findLatestTenEvents(new Pagination(10));  //课程新鲜事
        return SUCCESS;
    }

    @Action(value = "loadCoursesDivideByType", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".coursesInTypes")})
    public String loadCoursesDivideByType() {
        if (this.getCourse().getCourseType() != 0) {
            coursesInTypes = courseDao.findCoursesInTypes(this.getCourse().getCourseType(), new Pagination(20));
        } else {
            coursesInTypes = courseDao.findLatest4Course(new Pagination(20));
        }
        return SUCCESS;
    }


    @Action(value = "step1", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".step1")})
    public String step1() {
        return SUCCESS;
    }

    @Action(value = "step2", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".step2")})
    public String step2() {
        return SUCCESS;
    }

    @Action(value = "step3", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".step3")})
    public String step3() {
        return SUCCESS;
    }

    @Action(value = "step4", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".step4")})
    public String step4() {
        return SUCCESS;
    }

    @Action(value = "createCourse", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initStep1"),
            @Result(name = "failed", type = Constants.RESULT_NAME_TILES, location = ".identityConfirmation")})
    public String initCourse() {
        if (getSessionUserId() == null) {
            return "failed";
        }
        this.setOperaType(Constants.OPERA_TYPE_FOR_COURSE_CREATION);
        return SUCCESS;
    }

    @Action(value = "setClassRecord", results = {@Result(name = SUCCESS, type ="json")})
    public String setRecordStatus() {
        ResultData<String> rd = new ResultData<>();
        ActionContext.getContext().getValueStack().push(rd);
        try{
            CourseClass _courseClass = classDao.findById(courseClass.getId());
            _courseClass.setRecord(true);
            classDao.persistAbstract(_courseClass);
            rd.setResult(200);
        }catch (Exception e){
            logger.error("Set class record failure",e);
            rd.setResult(500);
        }
        return SUCCESS;
    }


    @Action(value = "createCourseClause", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".createCourseClause")})
    public String createCourseClause() {
        return SUCCESS;
    }

    @Action(value = "courseRepeat", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseRepeat")})
    public String courseRepeat() {
        courses = courseDao.findMyCourseOFAgePart(pagination, this.getSessionUserId());
        if (courses.size() > 0) {
            for (Course c : courses) {
                orgs.put(c.getId(), c.getName());
            }
        }
        if (this.getCourse() != null && this.getCourse().getId() != null) {
            course = courseDao.findById(this.getCourse().getId());
        } else {
            course = courses.get(0);
        }
        return SUCCESS;
    }


    @Action(value = "initSaveCourse", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initStep2")})
    public String initSaveCourse() {
        if (this.getCourse().getId() != null) {
            course = courseDao.findById(this.getCourse().getId());
            courseInviteStudents = courseInviteStudentDao.findByCourseId(this.getCourse().getId());
        }
        if (Constants.COURSE_TYPE_ORG.equals(this.getCourseType())) {
            Organization orgTmp = organizationDao.findMyOrg(this.getSessionUserId());
            if (orgTmp != null) orgs.put(orgTmp.getId(), orgTmp.getSchoolName());
            teachers = courseService.findAllTeachersByOrgCreator(this.getSessionUserId());
        }
        return SUCCESS;
    }

    @Action(value = "saveCourse", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initStep3"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".initStep2")})

    public String saveCourse() {
        if (this.getIdentity() != null) {
            course.setTeachingNum(this.getIdentity());
        }


        // Save course
        CourseSpecification specification = CourseSpecification.create(course, this.getSessionUserId(), this.getCourseType(), this.getTeacherIds());
        courseService.saveCourse(specification);

        course = courseService.findById(course.getId());


//        // copy jpg
//        if(StringUtils.isNotBlank(course.getLogoUrl()) && !StringUtils.startsWithIgnoreCase(course.getLogoUrl(),"upload/")){
//            Utils.notReplaceFileFromTmp(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId(), course.getLogoUrl());
//        }

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


        if (course.getClasses() == null) {
            this.setClassCount(1);
        } else {
            this.setClassCount(course.getClasses().size() + 1);
        }

        // Courser invitation;
        courseInviteStudents = courseInviteStudentDao.findByCourseId(this.getCourse().getId());
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

        if (course.getClasses() == null) {
            this.setClassCount(1);
        } else {
            this.setClassCount(course.getClasses().size() + 1);
        }

        return SUCCESS;
    }

    public void validateSaveCourse() {
        if (Constants.COURSE_TYPE_ORG.equals(this.getCourseType())) {
            teachers = courseService.findAllTeachersByOrgCreator(this.getSessionUserId());
        }

    }

    @Action(value = "initCourseInfoModify", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initMaintenanceInfo")})
    public String initCourseInfoModify() {
        course = courseDao.findById(this.getCourse().getId());
        this.setTeacherEmail(course.getTeacherEmail());
        this.setClassCount(course.getClasses().size() + 1);
        if (course.getOrganization() != null) {
            this.setCourseType(1);
        } else {
            this.setCourseType(0);
        }
        return SUCCESS;
    }


    @Action(value = "initRepeatCourseInfo", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".repeatCourseInfo")})
    public String initRepeatCourseInfo() {
        course = courseDao.findById(this.getCourse().getId());
        courseInviteStudents = courseInviteStudentDao.findByCourseId(this.getCourse().getId());
        courses = courseDao.findMyCourseOFAgePart(pagination, this.getSessionUserId());
        if (courses.size() > 0) {
            for (Course c : courses) {
                orgs.put(c.getId(), c.getName());
            }
        }
        return SUCCESS;
    }

    @Action(value = "courseInfoModify", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseInfoModified"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".initCourseInfoModify")})
    public String courseInfoModify() {
        Course realCourse = courseDao.findById(this.getCourse().getId());
        courseDao.courseModification(realCourse, this.getCourse());
        if (this.getUploadFileName() != null && this.getUploadFileName() == "") {
            String path = "/" + this.getCourse().getId() + "/" + this.getUploadFileName();
            File imageFile = new File(ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_IMAGE_PATH_FOR_COURSE) + path);
            if (!imageFile.getParentFile().exists()) {
                imageFile.getParentFile().mkdirs();
            }
            Utils.copy(this.getUpload(), imageFile);
            realCourse.setLogoUrl(Constants.UPLOAD_IMAGE_PATH_FOR_COURSE + path);
        }

        realCourse.setInviteStudentNum(this.getEmails().size());
        this.setCourse(realCourse);

        courseDao.persistAbstract(realCourse);
        if (realCourse.getClasses() == null) {
            this.setClassCount(1);
        } else {
            this.setClassCount(realCourse.getClasses().size() + 1);
        }

        courseInviteStudents = courseInviteStudentDao.findByCourseId(this.getCourse().getId());
        if (courseInviteStudents.size() != 0) {
            for (int i = 0; i < courseInviteStudents.size(); i++) {
                courseInviteStudentDao.delete(courseInviteStudents.get(i));
            }
        }

        for (String email : emails) {
            if (email != null && !email.equals("")) {
                CourseInviteStudent curr = courseInviteStudentDao.findByCourseAndEmail(this.getCourse().getId(), email);
                if (curr == null) {
                    CourseInviteStudent courseInviteStudent = new CourseInviteStudent();
                    courseInviteStudent.setCourse(this.getCourse());
                    courseInviteStudent.setInvitedStudentEmail(email);
                    courseInviteStudentDao.persistAbstract(courseInviteStudent);
                }
            }
        }
        return SUCCESS;

    }

    @Action(value = "courseGet2public", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}),
            @Result(name = "orgSUCCESS", type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myForcastClass", "course.id", "${course.id}"})})

    public String go2public() {
        course = courseDao.findById(this.getCourse().getId());
        this.getCourse().setMasterConfirmed(true);
        this.getCourse().setTeacherConfirmed(true);
        this.getCourse().setCameraManConfirmed(true);
        this.getCourse().setTotalHours(this.getCourse().getClasses().size());
        this.getCourse().setPublicationTime(Utils.getCurrentCalender());
        if (course.getTeacher() != null) {
            course.getTeacher().setTeacher(true);// every user who create a course will become a teacher  automatically
            baseUserDao.persistAbstract(course.getTeacher());
        }
        courseDao.persistAbstract(course);
        DateFormat dateFormat = new SimpleDateFormat(this.getText("dateformat.forclass"));
        courseInviteStudents = courseInviteStudentDao.findByCourseId(this.getCourse().getId());
        Calendar courseStartTime = Calendar.getInstance();
        courseStartTime.setTime(course.getStartDate().getTime());

        StringBuilder classesInfo = new StringBuilder();
        for (CourseClass cc : course.getClasses()) {
            Calendar classStartTime = Calendar.getInstance();
            classStartTime.setTime(cc.getDate().getTime());
            classesInfo = classesInfo.append("<tr><td>" + cc.getName() + "</td><td>" + Utils.getEmptyString(cc.getNickName()) + "</td><td>" + dateFormat.format(Utils.changeBaseOnTimeZone4Action(classStartTime).getTime()) + "</td><td>" + cc.getDuration() + "</td><td>" + this.getText("label.day.of.week." + classStartTime.get(Calendar.DAY_OF_WEEK)) + "</td></tr>");
        }
        if (course.getOrganization() != null) {
            String serialNo = this.getSessionNickName() + (new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime()));
            Matter matter = new Matter(Calendar.getInstance(), serialNo, Matter.MATTER_COURSE_TEACHER, baseUserDao.findByEmail(this.getSessionUserEmail()), null, course.getTeacherEmail(), course, null, null, null, false);
            matterDao.persistAbstract(matter);


            String css = "<style type=\"text/css\">\n" +
                    "#rvmDiv #logoDiv {background-image: url(http://www.gogowise.com/images/logo.jpg);background-repeat: no-repeat;height: 65px;margin-left: 45px;}\n" +
                    "#rvmDiv #rvmcontentDiv ul .welcomeTittle {margin-left: 30px;}\n" +
                    "#rvmDiv {float: left;width: 100%;font-family: \"微软雅黑\", \"宋体\", \"Lucida Sans Unicode\", \"Lucida Grande\", sans-serif;}\n" +
                    "#logoDiv {float: left;width: 100%;}\n" +
                    "#rvmcontentDiv {float: left;width: 100%;}\n" +
                    "#rvmDiv #rvmcontentDiv ul li {list-style-type: none;}\n" +
                    "#rvmDiv #rvmcontentDiv .orangeWords {color: rgb(255,155,55);}\n" +
                    "#rvmDiv #rvmcontentDiv ul .lastWords {margin-top: 50px;}\n" +
                    "table,tr,td{border-collapse:collapse;border-top-width: 1px;border-right-width: 1px;border-bottom-width: 1px;border-left-width: 1px;\n" +
                    "border-right-color:#09F;border-bottom-color: #09F;border-left-color: #09F;}\n" +
                    "tr.odd{background-color:#CEFFFF;}\n" +
                    "</style>";
            //=====================================  课程发布时，组织发送邮件给老师   =====================

            String tile = this.getText("org.invite.teacher.email.title", new String[]{course.getOrganization().getSchoolName()});

            String acceptArrange = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=true&teacher=true&user.email=" + course.getTeacherEmail();
            String rejectArrange = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=false&teacher=true&user.email=" + course.getTeacherEmail();
            String[] args = {course.getTeacherEmail(), course.getOrganization().getSchoolName(), course.getName(), course.getDescription(), dateFormat.format(Utils.changeBaseOnTimeZone4Action(courseStartTime).getTime()),
                    course.getTotalHours().toString(), classesInfo.toString(), acceptArrange, rejectArrange, acceptArrange, rejectArrange, this.getCourse().getTeacherEmail()};
            EmailUtil.sendMail(course.getTeacherEmail(), tile, css + this.getText("org.invite.teacher.email.content", args), "text/html;charset=utf-8");


            //=====================================  课程发布时，组织发送邮件给学生   =====================

            for (CourseInviteStudent courseInviteStudent : courseInviteStudents) {
                String tile2 = this.getText("org.invite.student.email.title", new String[]{course.getName()});
                String acceptArrange2student = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=true&teacher=false&user.email=" + courseInviteStudent.getInvitedStudentEmail();
                String rejectArrange2student = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=false&teacher=false&user.email=" + courseInviteStudent.getInvitedStudentEmail();
                String[] args2student = {courseInviteStudent.getInvitedStudentEmail(), course.getOrganization().getSchoolName(), course.getName(), course.getDescription(), dateFormat.format(courseStartTime.getTime()),
                        course.getTotalHours().toString(), classesInfo.toString(), acceptArrange2student, rejectArrange2student, acceptArrange2student, rejectArrange2student, courseInviteStudent.getInvitedStudentEmail()};
                EmailUtil.sendMail(courseInviteStudent.getInvitedStudentEmail(), tile2, css + this.getText("org.invite.student.email.content", args2student), "text/html;charset=utf-8");
                matter = new Matter(Calendar.getInstance(), serialNo, Matter.MATTER_COURSE_STUDENT, baseUserDao.findByEmail(this.getSessionUserEmail()), null, courseInviteStudent.getInvitedStudentEmail(), course, null, null, null, false);
                matterDao.persistAbstract(matter);
            }


        } else {

            String css = "<style type=\"text/css\">\n" +
                    "#container {width: 100%;float: left;padding: 0px;margin: 0px 100px;background: #FFF;}\n" +
                    "#logo {height: 60px;width: 100%;padding-bottom: 5px;border-bottom: 1px solid #999;float: left;}\n" +
                    "#sayhello {font-weight: lighter;}\n" +
                    "#content {float: left;width: 100%;border-bottom: 1px solid #999;font-weight: lighter;}\n" +
                    "#footer {float: left;width: 100%;}\n" +
                    ".wordtype{color:#cc6600;}\n" +
                    "</style>";
            for (CourseInviteStudent courseInviteStudent : courseInviteStudents) {
                String hrefAccept = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=true&teacher=false&user.email=" + courseInviteStudent.getInvitedStudentEmail();
                String hrefReject = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=false&teacher=false&user.email=" + courseInviteStudent.getInvitedStudentEmail();
                EmailUtil.sendMail(courseInviteStudent.getInvitedStudentEmail(),
                        this.getText("course.invite.student.email.content.you.friend") + " " + course.getTeacher().getNickName() + " " + this.getText("course.invite.student.email.content.invite") + " " + course.getName() + " " + this.getText("course.invite.student.email.content.course"),
                        css + this.getText("course.invite.student.email.content", new String[]{
                                course.getTeacher().getNickName(),
                                course.getTeacher().getEmail(),
                                course.getName(),
                                course.getDescription(),
                                dateFormat.format(Utils.changeBaseOnTimeZone4Action(courseStartTime).getTime()),
                                course.getTotalHours().toString(),
                                hrefAccept, hrefReject,
                                hrefAccept, hrefReject,
                                courseInviteStudent.getInvitedStudentEmail()}),
                        "text/html;charset=utf-8");
                Matter matter = new Matter(Calendar.getInstance(), null, Matter.MATTER_COURSE_STUDENT_NO_ORG, baseUserDao.findByEmail(this.getSessionUserEmail()), null, courseInviteStudent.getInvitedStudentEmail(), course, null, null, null, false);
                matterDao.persistAbstract(matter);
            }
        }
        if (this.getCourse().getTeachingNum() == 4) {  //if the course is a normal big class,so we'll send an advertisement email to the course creator for him to resend
            String courseCreatorEmail = this.getSessionNickName();
            String href = getBasePath() + "/initBigCourseAdvertiseEmail.html?course.id=" + course.getId();
            String advertiseTitle = this.getText("big.course.advertisement.email.title", new String[]{courseCreatorEmail, course.getName()});
            String advertiseContent = Constants.BIG_COURSE_ADVERTISE_EMAIL_CSS + this.getText("big.course.advertisement.email.content", new String[]{
                    this.getSessionNickName(),
                    course.getName(),
                    Utils.getEmptyString(course.getDescription()),
                    dateFormat.format(courseStartTime.getTime()),
                    course.getTotalHours().toString(),
                    classesInfo.toString(),
                    href, href
            });
            EmailUtil.sendMail(this.getSessionUserEmail(), advertiseTitle, advertiseContent, "text/html;charset=utf-8");
        }
        if (course.getOrganization() != null) {
            return "orgSUCCESS";
        }
        return SUCCESS;
    }

    @Action(value = "initBigCourseAdvertiseEmail", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initBigCourseAdvertiseEmail"),
            @Result(name = NONE, type = Constants.RESULT_NAME_TILES, location = ".notExist")})
    public String initBigCourseAdvertiseEmail() {
        if (this.getCourse().getId() != null) {
            course = courseDao.findById(this.getCourse().getId());
            return SUCCESS;
        }
        return NONE;
    }

    @Action(value = "courseRegForBigCourse")
    public void courseRegForBigCourse() {
        course = courseDao.findById(this.getCourse().getId());
        CourseInviteStudent curr = courseInviteStudentDao.findByCourseAndEmail(this.getCourse().getId(), email);
        DateFormat dateFormat = new SimpleDateFormat(this.getText("dateformat.forclass"));
        StringBuilder classesInfo = new StringBuilder();
        for (CourseClass cc : course.getClasses()) {
            Calendar classStartTime = Calendar.getInstance();
            classStartTime.setTime(cc.getDate().getTime());
            classesInfo = classesInfo.append("<tr><td>" + cc.getName() + "</td><td>" + Utils.getEmptyString(cc.getNickName()) + "</td><td>" + dateFormat.format(Utils.changeBaseOnTimeZone4Action(classStartTime).getTime()) + "</td><td>" + cc.getDuration() + "</td><td>" + this.getText("label.day.of.week." + classStartTime.get(Calendar.DAY_OF_WEEK)) + "</td></tr>");
        }
        String href = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=true&teacher=false&user.email=" + this.getEmail();
        String title = this.getText("big.course.advertise.email.confirm.title", new String[]{course.getName()});
        String content = Constants.BIG_COURSE_ADVERTISE_EMAIL_CSS + this.getText("big.course.advertise.email.confirm.content", new String[]{
                this.getEmail(),
                course.getName(),
                course.getDescription(),
                classesInfo.toString(),
                href,
                href,
                this.getEmail()
        });
        if (StringUtils.isNotBlank(this.getEmail())) {
            if (curr == null && course.getTeachingNum().equals(4)) {
                EmailUtil.sendMail(this.getEmail(), title, content, "text/html;charset=utf-8");
                CourseInviteStudent courseInviteStudent = new CourseInviteStudent();
                courseInviteStudent.setCourse(this.getCourse());
                courseInviteStudent.setInvitedStudentEmail(email);
                courseInviteStudentDao.persistAbstract(courseInviteStudent);
            }
        }
    }

    @Action(value = "emailHandleForCourseCreation", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}),
            @Result(name = "inviteReject", type = Constants.RESULT_NAME_TILES, location = ".emailHandleReject"),
            @Result(name = NONE, type = Constants.RESULT_NAME_TILES, location = ".notExist")})
    public String emailHandleForCourseCreation() throws Exception {
        if (this.getCourse().getId() != null && this.getUser().getEmail() != null) {
            course = courseDao.findById(this.getCourse().getId());
            user = baseUserDao.findByEmail(this.getUser().getEmail());
            if (accept.equals(true) && this.getTeacher().equals(false)) {      // students' email accept handle
                CourseInviteStudent courseInviteStudent = courseInviteStudentDao.findByCourseAndEmail(this.getCourse().getId(), this.getUser().getEmail());
                if (courseInviteStudent != null) {
                    courseInviteStudent.setStudent(user);
                    courseInviteStudent.setAcceptInvite(true);
                    courseInviteStudentDao.persistAbstract(courseInviteStudent);
                    SeniorClassRoom sc = seniorClassRoomDao.findClassRoomByCourseAndStudent(course.getId(), user.getId());
                    if (sc != null) {
                        return SUCCESS;
                    }
                    SeniorClassRoom seniorClassRoom = new SeniorClassRoom();
                    seniorClassRoom.setCourse(courseDao.findById(this.getCourse().getId()));
                    seniorClassRoom.setStudent(user);
                    seniorClassRoomDao.persistAbstract(seniorClassRoom);

                    //=============================给老师和学生发送的课程预定协议===========================================
                    String filePath = "d:/contract/" + course.getName() + ".pdf";
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
                    return SUCCESS;
                }
                return NONE;
            } else if (accept.equals(true) && this.getTeacher().equals(true)) {   // teacher's email accept handle
                course.setTeacher(user);
                courseDao.persistAbstract(course);
                user.setTeacher(true);
                baseUserDao.persist(user);
                return SUCCESS;
            } else {  //email reject handle
                return "inviteReject";
            }
        }
        return SUCCESS;
    }

    @Action(value = "modifyCourseStep2", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".modifyCourseStep3")})
    public String modifyCourseStep2() {
        Course existCourse = courseDao.findById(this.getCourse().getId());
        if (StringUtils.isNotBlank(course.getName())) existCourse.setName(course.getName());
        if (StringUtils.isNotBlank(course.getDescription())) existCourse.setDescription(course.getDescription());
        if (StringUtils.isNotBlank(course.getLogoUrl()) && !StringUtils.startsWithIgnoreCase(course.getLogoUrl(), "upload/") && !StringUtils.equals(course.getLogoUrl(), Constants.DEFAULT_COURSE_IMAGE)) {
            String courseDir = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_COURSE_PATH);
            courseDir = courseDir + File.separator + course.getId();

            File temp = new File(courseDir);
            if (!temp.exists()) temp.mkdirs();

            Utils.notReplaceFileFromTmpModified(temp.getAbsolutePath(), course.getLogoUrl());

            //Utils.notReplaceFileFromTmp(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId(), course.getLogoUrl());
            //existCourse.setLogoUrl(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId()+"/"+course.getLogoUrl());
            existCourse.setLogoUrl(Constants.UPLOAD_COURSE_PATH + "/" + course.getId() + "/" + course.getLogoUrl());
        }
        if (existCourse.getOrganization() != null && this.getTeacherEmail() != null && !existCourse.getTeacherEmail().endsWith(this.getTeacherEmail())) {
            this.setTeacherChange(true);
            existCourse.setTeacherEmail(this.getTeacherEmail());
        }
        this.setClassCount(course.getClasses().size() + 1);
        courseDao.persistAbstract(existCourse);
        this.setCourse(existCourse);
        return SUCCESS;
    }


    @Action(value = "modifyGet2public", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myForcastClass", "course.id", "${course.id}"})})
    public String modifyGet2public() {
        DateFormat dateFormat = new SimpleDateFormat(this.getText("dateformat.forclass"));
        DateFormat dateFormat4StartDate = new SimpleDateFormat(this.getText("dateformat.email"));
        course = courseDao.findById(this.getCourse().getId());
        Calendar courseStartTime = Calendar.getInstance();
        courseStartTime.setTime(course.getStartDate().getTime());
        StringBuilder classesInfo = new StringBuilder();
        for (CourseClass cc : course.getClasses()) {
            Calendar classStartTime = Calendar.getInstance();
            classStartTime.setTime(cc.getDate().getTime());
            classesInfo = classesInfo.append("<tr><td>" + cc.getName() + "</td><td>" + Utils.getEmptyString(cc.getNickName()) + "</td><td>" + dateFormat.format(Utils.changeBaseOnTimeZone4Action(classStartTime).getTime()) + "</td><td>" + cc.getDuration() + "</td><td>" + this.getText("label.day.of.week." + classStartTime.get(Calendar.DAY_OF_WEEK)) + "</td></tr>");
        }
        String css = "<style type=\"text/css\">\n" +
                "#rvmDiv #logoDiv {background-image: url(http://www.gogowise.com/images/logo.jpg);background-repeat: no-repeat;height: 65px;margin-left: 45px;}\n" +
                "#rvmDiv #rvmcontentDiv ul .welcomeTittle {margin-left: 30px;}\n" +
                "#rvmDiv {float: left;width: 100%;font-family: \"微软雅黑\", \"宋体\", \"Lucida Sans Unicode\", \"Lucida Grande\", sans-serif;}\n" +
                "#logoDiv {float: left;width: 100%;}\n" +
                "#rvmcontentDiv {float: left;width: 100%;}\n" +
                "#rvmDiv #rvmcontentDiv ul li {list-style-type: none;}\n" +
                "#rvmDiv #rvmcontentDiv .orangeWords {color: rgb(255,155,55);}\n" +
                "#rvmDiv #rvmcontentDiv ul .lastWords {margin-top: 50px;}\n" +
                "table,tr,td{border-collapse:collapse;border-top-width: 1px;border-right-width: 1px;border-bottom-width: 1px;border-left-width: 1px;\n" +
                "border-right-color:#09F;border-bottom-color: #09F;border-left-color: #09F;}\n" +
                "tr.odd{background-color:#CEFFFF;}\n" +
                "</style>";
        if ((course.getOrganization() != null) && this.getTeacherChange()) {      //变化

            String tile = this.getText("org.invite.teacher.email.title", new String[]{course.getOrganization().getSchoolName()});
            String acceptArrange = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=true&teacher=true&user.email=" + course.getTeacherEmail();
            String rejectArrange = getBasePath() + "/emailHandleForCourseCreation.html?course.id=" + course.getId() + "&accept=false&teacher=true&user.email=" + course.getTeacherEmail();
            String[] args = {course.getTeacherEmail(), course.getOrganization().getSchoolName(), course.getName(), course.getDescription(), dateFormat4StartDate.format(Utils.changeBaseOnTimeZone4Action(courseStartTime).getTime()),
                    course.getTotalHours().toString(), classesInfo.toString(), acceptArrange, rejectArrange, acceptArrange, acceptArrange, this.getCourse().getTeacherEmail()};
            EmailUtil.sendMail(course.getTeacherEmail(), tile, css + this.getText("org.invite.teacher.email.content", args), "text/html;charset=utf-8");
        } else if ((course.getOrganization() != null) && !this.getTeacherChange()) {

            String tile = this.getText("org.modify.teacher.email.title", new String[]{course.getName()});

            String[] args = {course.getTeacherEmail(), course.getName(), course.getName(), course.getDescription(), dateFormat4StartDate.format(Utils.changeBaseOnTimeZone4Action(courseStartTime).getTime()),
                    course.getTotalHours().toString(), classesInfo.toString(), this.getCourse().getTeacherEmail()};
            EmailUtil.sendMail(course.getTeacherEmail(), tile, css + this.getText("org.modify.teacher.email.content", args), "text/html;charset=utf-8");
        }
        List<BaseUser> regs = courseDao.findRegUser(course.getId(), new Pagination(2000));
        for (BaseUser bu : regs) {
            String tile = this.getText("org.modify.teacher.email.title", new String[]{course.getName()});


            String[] args = {bu.getNickName(), course.getName(), course.getName(), course.getDescription(), dateFormat4StartDate.format(Utils.changeBaseOnTimeZone4Action(courseStartTime).getTime()),
                    course.getTotalHours().toString(), classesInfo.toString(), bu.getNickName()};
            EmailUtil.sendMail(bu.getEmail(), tile, css + this.getText("org.modify.teacher.email.content", args), "text/html;charset=utf-8");
        }


        return SUCCESS;
    }


    @Action(value = "goback2saveCourse", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initStep2")})
    public String goBack2SaveCourse() {
        course = courseDao.findById(this.getCourse().getId());
        courseInviteStudents = courseInviteStudentDao.findByCourseId(this.getCourse().getId());
        if (Constants.COURSE_TYPE_ORG.equals(this.getCourseType())) {
            Organization orgTmp = organizationDao.findMyOrg(super.getSessionUserId());
            if (orgTmp != null) orgs.put(orgTmp.getId(), orgTmp.getSchoolName());

        }
        return SUCCESS;
    }

    @Action(value = "goback2firstStep", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initStep1")})
    public String goBack2firstStep() {
        if (this.getCourse().getId() != null) {
            course = courseDao.findById(this.getCourse().getId());
        }
        return SUCCESS;
    }


//    @Action(value = "emailHandleAccept", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseInviteLogin"),
//            @Result(name = ERROR, type = Constants.RESULT_NAME_TILES, location = ".courseInviteIdentityConfirm"),
//            @Result(name = NONE, type = Constants.RESULT_NAME_TILES, location = ".notExist")})
//    public String emailHandleAccept() throws Exception {
//        course = courseDao.findById(this.getCourse().getId());
//        CourseInviteStudent courseInviteStudent = courseInviteStudentDao.findByCourseAndEmail(this.getCourse().getId(), this.getEmail());
//        if (courseInviteStudent != null) {
//            courseInviteStudent.setAcceptInvite(true);
//            courseInviteStudentDao.persistAbstract(courseInviteStudent);
//
//            SeniorClassRoom seniorClassRoom = new SeniorClassRoom();
//            seniorClassRoom.setCourse(courseDao.findById(this.getCourse().getId()));
//            BaseUser curr = baseUserDao.findByEmail(this.getEmail());
//            if (curr != null) { //if the  user exist
//                seniorClassRoom.setStudent(curr);
//                SeniorClassRoom sc = seniorClassRoomDao.findClassRoomByCourseAndStudent(this.getCourse().getId(), curr.getId());
//                //the user exist but is not the first time to click the button of accept
//                if (sc != null) {
//                    return SUCCESS;
//                } else {
//                    seniorClassRoomDao.persistAbstract(seniorClassRoom);
//
//                    //=============================给老师和学生发送的课程预定协议===========================================
//                    String filePath = "d:/contract/" + course.getName() + ".pdf";
//                    String tile = "预定课程协议";
//                    String content = "内容见附件";
//                    PdfUtil.createCourseContract(filePath, courseDao.findById(course.getId()), curr);
//                    EmailUtil.sendMail(curr.getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
//                    EmailUtil.sendMail(course.getTeacher().getEmail(), tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
//                    EmailUtil.sendMail(Constants.COURSE_CONFIRM_EMAIL, tile, content, new String[]{"contract.pdf"}, new String[]{filePath});
//
//                    //=============================给老师的邮件反馈===========================================
//
//                    EmailUtil.sendMail(course.getTeacher().getEmail(), this.getText("course.invite.student.email.content.you.friend") + curr.getNickName() + this.getText("course.invite.student.and.accept"),
//                            css + this.getText("course.invite.student.to.teacher.feedback", new String[]{curr.getNickName(), course.getName(), dateFormat.format(course.getStartDate().getTime()), course.getTeacher().getEmail(), course.getTeacher().getEmail()}),
//                            "text/html;charset=utf-8");
//                    return SUCCESS;
//                }
//            } else {
//                return ERROR;
//            }
//        }
//        return NONE;
//    }


    @Action(value = "teacherIdentityLogin", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseInviteLogin")})
    public String teacherIdentityLogin() {
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

        EmailUtil.sendMail(course.getTeacher().getEmail(), this.getText("course.invite.student.email.content.you.friend") + user.getNickName() + this.getText("course.invite.student.and.accept"),
                Constants.CSS + this.getText("course.invite.student.to.teacher.feedback", new String[]{user.getNickName(), course.getName(), dateFormat.format(course.getStartDate().getTime()), course.getTeacher().getEmail(), course.getTeacher().getEmail()}),
                "text/html;charset=utf-8");
        return SUCCESS;
    }


//    @Action(value = "emailHandleReject", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".emailHandleReject")})
//    public String emailHandleReject() {
//        course = courseDao.findById(this.getCourse().getId());
//        course.setInviteStudentNum(course.getInviteStudentNum() - 1);
//        courseDao.persistAbstract(this.getCourse());
//        CourseInviteStudent courseInviteStudent = courseInviteStudentDao.findByCourseAndEmail(this.getCourse().getId(), this.getEmails().get(0));
//        courseInviteStudentDao.delete(courseInviteStudent);
//
//
//        //==================================== 给老师的邮件反馈：学生点击拒绝================================
//
//        EmailUtil.sendMail(course.getTeacher().getEmail(), this.getText("course.invite.student.email.content.you.friend") + user.getNickName() + this.getText("course.invite.student.and.refused"),
//                css + this.getText("course.invite.student.to.teacher.refuse.feedback", new String[]{user.getNickName(), course.getName(), dateFormat.format(course.getStartDate().getTime()), course.getTeacher().getEmail(), course.getTeacher().getEmail()}),
//                "text/html;charset=utf-8");
//        return SUCCESS;
//    }

    @Action(value = "courseAdminManage",
            results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".courseAdminManage"),
                       @Result(name = ERROR, type = Constants.RESULT_NAME_TILES, location = ".noPermission")})
    public String courseAdminManage()
    {
        BaseUser admin = baseUserDao.findByEmail((String) ActionContext.getContext().getSession().get(Constants.SESSION_USER_EMAIL))  ;
        Integer userID = (Integer) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID);
        boolean havePermission = userService.havePermission(userID, "admin");

        if( !havePermission ) return ERROR;

        courses = this.courseDao.findlatestCourses(null);
        return SUCCESS;
    }

    @Action(value = "removeCourseConfirm",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "courseAdminManage"}) })
    public String removeCourseConfirm()
    {
        if (this.getCourse().getId() != null)
        {
            Course course = courseDao.findById(this.getCourse().getId());

            if(course != null)
            {
                course.setIsDeleted(true);
                courseDao.persistAbstract(course);
            }
        }

        return SUCCESS;
    }

    public String age() {
        courses = courseDao.findCourseOfAgeClass(pagination);
        this.setOperaType(Constants.OPERA_TYPE_FOR_AGE_COURSE);
        return SUCCESS;
    }

    public String living() {
        this.getPagination().setPageSize(9);
        courses = courseDao.findCourseOnline(pagination);
        this.setOperaType(Constants.OPERA_TYPE_FOR_LIVING_COURSE);
        return SUCCESS;
    }

    @Action(value = "forcastClass", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".forcastClass")})
//     @Action(value = "forcastClass", results = {@Result(name = SUCCESS, location = "/jsp/gogowise/course/forcastClasses.jsp")})
    public String forcast() {
        courses = courseDao.findCourseOfForcastClass(pagination);
        this.setOperaType(Constants.OPERA_TYPE_FOR_NEW_COURSE);
        return SUCCESS;
    }


    @Action(value = "myForcastClass", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".myForcastClass")})
//     @Action(value = "myForcastClass", results = {@Result(name = SUCCESS, location = "/jsp/gogowise/course/myForcastClass.css")})
    public String myForcast() {
        //   courses = courseDao.findMyCourseOfForcastClass(pagination, this.getSessionUserId());
        courses = courseDao.findUserCreatedCourses(this.getSessionUserId(), pagination);
        return SUCCESS;
    }

    @Action(value = "myRegistration", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".myRegistration")})
//     @Action(value = "myForcastClass", results = {@Result(name = SUCCESS, location = "/jsp/gogowise/course/myForcastClass.css")})
    public String myRegister() {
        //  courses = courseDao.findMyCourseOfForcastClass(pagination, this.getSessionUserId());
        courses = courseDao.findUserRegCourses(this.getSessionUserId(), pagination);

        return SUCCESS;
    }


    @Action(value = "myAgeCourses", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".repeatCourseInfo"),
            @Result(name = NONE, type = Constants.RESULT_NAME_TILES, location = ".repeatCourseNotExist")})
    public String myAgeCourses() {
        if (this.getCourse() != null && this.getCourse().getId() != null) {
            course = courseDao.findById(this.getCourse().getId());
            courseInviteStudents = courseInviteStudentDao.findByCourseId(this.getCourse().getId());
        }
        courses = courseDao.findMyCourseOFAgePart(pagination, this.getSessionUserId());
        if (courses.size() > 0) {
            for (Course c : courses) {
                orgs.put(c.getFromCourse().getId(), c.getName());
            }
            return SUCCESS;
        }
        return NONE;
    }


    @Action(value = "regCourseSystem", results = {@Result(name = SUCCESS, type = "tiles", location = ".regCourseSystem")})
    public String regCourse() {
        courses = courseDao.findTheCanRegCourseByUid(pagination, this.getSessionUserId());
        return SUCCESS;
    }

    public String voa() {
        /*if (course == null) {
            course = courseDao.findById((Integer) ActionContext.getContext().getSession().get("SessionCourseId"));
            ActionContext.getContext().getSession().remove("SessionCourseId");
            courseComments = courseCommentDao.findByCourseId(new Pagination(10), course.getId());
            this.setCommentsNum(courseComments.size());
            courseQuestions = courseQuestionDao.findNewByCourseId(pagination, course.getId());
            courseResources = courseResourceDao.findByCourseId(pagination, course.getId());
            return SUCCESS;
        }*/
        course = courseDao.findById(this.getCourse().getId());
        Pagination page = new Pagination(Constants.DEFAULT_PAGE_OF_COMMENTS_INCREASED_SIZE);
        courseComments = courseCommentDao.findByCourseId(page, course.getId());
        this.setCommentsNum(courseComments.size());
        if( commentsNum < page.getTotalSize()) {
            this.setCommentsNumOverflow(true);
        }else{
            this.setCommentsNumOverflow(false);
        }
        courseQuestions = courseQuestionDao.findNewByCourseId(pagination, course.getId());
        courseResources = courseResourceDao.findByCourseId(pagination, course.getId());
        hotCourses = courseDao.findHotCourses(new Pagination(4));
        if (course.getTeacher() != null) {
            courses2teacher = courseDao.findCourses2Teacher(course.getTeacher().getId(), new Pagination(4));
        }
        courseRelateCourses = courseDao.findCourseRelateCourses("%" + course.getName() + "%", new Pagination(4));
        courseNewEvents = courseNewEventDao.findLatestTenEvents(new Pagination(10));
        return SUCCESS;
    }

    @Action(value = "initOrgCourseCreation", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "createCourse", "courseType", "1"}),
            @Result(name = "tips", type = Constants.RESULT_NAME_TILES, location = ".orgInitCourseCreation")})
    public String initOrgCourseCreation() {
        Organization org = organizationDao.findMyOrg(this.getSessionUserId());
        if (org != null) {
            this.setCourseType(Constants.COURSE_TYPE_ORG);
            return SUCCESS;
        } else {
            return "tips";
        }
    }

    @Action(value = "repeatCourseInfo", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".repeatCourseInfo")})
    public String repeatCourseInfo() {
        course = courseDao.findById(this.getCourse().getId());
        return SUCCESS;
    }

    @Action(value = "repeatCourse", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".repeatClassInfo"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".repeatCourseInfo")})
    public String repeatCourse() {
        Course _course = courseDao.findById(this.getCourse().getFromCourse().getId());

        if (this.getCourse() != null && this.getCourse().getId() != null) {       //if the user select to getBack from step3 to step2,than delete the new course which has been created just now.
            List<CourseInviteStudent> courseInviteStudents = courseInviteStudentDao.findByCourseId(this.getCourse().getId());
            for (CourseInviteStudent courseInviteStudent : courseInviteStudents) {
                courseInviteStudentDao.delete(courseInviteStudent);
            }
            Course _newCourse = courseDao.findById(this.getCourse().getId());
            for (CourseClass courseClass : _newCourse.getClasses()) {
                classDao.delete(courseClass);
            }
            courseDao.delete(_newCourse);
        }

        this.setCourse(courseDao.saveRepeatCourse(startTime, _course, Utils.getEmptyString(this.getTeacherEmail())));
        course.setTeachingNum(emails.size());
        courseDao.persistAbstract(course);
        this.setClassCount(this.getCourse().getClasses().size() + 1);

        for (String email : emails) {
            if (email != null && !email.equals("")) {
                CourseInviteStudent curr = courseInviteStudentDao.findByCourseAndEmail(this.getCourse().getId(), email);
                if (curr == null) {
                    CourseInviteStudent courseInviteStudent = new CourseInviteStudent();
                    courseInviteStudent.setCourse(this.getCourse());
                    courseInviteStudent.setInvitedStudentEmail(email);
                    courseInviteStudentDao.persistAbstract(courseInviteStudent);
                }
            }
        }
        return SUCCESS;
    }

    @Action(value = "orgInterview", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgInterview")})
    public String orgInterview() {
        Organization orgTmp = organizationDao.findMyOrg(super.getSessionUserId());
        if (orgTmp != null)
            orgs.put(orgTmp.getId(), orgTmp.getSchoolName());
        return SUCCESS;
    }


    // @Action(value = "saveCourseReservation",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "voaCourseBlog","course.id","${course.id}"})})
    @Action(value = "saveCourseReservation")
    public void saveCourseReservation() throws IOException {
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        if (courseReservationDao.findByCourseAndUser(this.getCourse().getId(), this.getSessionUserId()) == null) {
            BaseUser owner = baseUserDao.findById(this.getSessionUserId());
            course = courseDao.findById(this.getCourse().getId());
            courseReservation.setCourse(course);
            courseReservation.setOwner(owner);
            courseReservation.setCreteDate(Calendar.getInstance());
            if (courseReservation.getComments().equals("")) {
                courseReservation.setComments(this.getText("course.reservation.comments"));
            }
            courseReservationDao.persistAbstract(this.getCourseReservation());
            String email = "";
            if (course.getOrganization() != null) email = course.getOrganization().getResponsiblePerson().getEmail();
            else email = course.getTeacher().getEmail();

            String serialNo = this.getSessionNickName() + (new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime()));

            Matter matter = new Matter(Calendar.getInstance(), serialNo, Matter.MATTER_COURSE_RESERVATION, baseUserDao.findByEmail(this.getSessionUserEmail()), MD5.endCode(email), email, course, null, null, null, false);
            matterDao.persistAbstract(matter);
            String href = getBasePath() + "/matterHandler.html?courseReservation.id=" + this.getCourseReservation().getId() + "&email=" + email + "&code=" + MD5.endCode(email) + "&serialNo=" + serialNo + "&matterType=" + Matter.MATTER_COURSE_RESERVATION;
            Calendar startTime = Calendar.getInstance();
            startTime.setTime(this.getCourseReservation().getInitial().getTime());
            Calendar endTime = Calendar.getInstance();
            endTime.setTime(this.getCourseReservation().getAtLatest().getTime());
            EmailUtil.sendMail(email, this.getText("course.reservation.email.title", new String[]{course.getName()}),
                    Constants.CSS + this.getText("course.reservation.email.content", new String[]{
                            course.getName(),
                            this.getSessionUserEmail(),
                            dateFormat.format(Utils.changeBaseOnTimeZone4Action(startTime).getTime()),
                            dateFormat.format(Utils.changeBaseOnTimeZone4Action(endTime).getTime()),
                            course.getCharges() + this.getText("label.zhibi." + course.getConsumptionType()),
                            this.getCourseReservation().getComments(),
                            href, href,
                            email
                    }));
            out.println("success");
        } else {
            out.println("");
        }
        out.close();
    }


    @Action(value = "courseTypeJudge")
    public void courseTypeJudge() throws Exception {
        String data = "";
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        course = courseDao.findById(this.getCourse().getId());
        if (course.getOrganization() != null) {
            data = "isOrganization";
        }
        out.print(data);
        out.close();
    }

    @Action(value = "recommendCourse")
    public void recommendCourse() {
        course = courseDao.findById(this.getCourse().getId());
        for (String email : emails) {
            CourseRecommend courseRecommend = new CourseRecommend();
            courseRecommend.setCourse(course);
            courseRecommend.setEmail(email);
            courseRecommend.setComments(comments);
            courseRecommend.setCreateTime(Calendar.getInstance());
            courseRecommendDao.persistAbstract(courseRecommend);

            String href = getBasePath() + "/initInterviewIdentityConfirm.html?courseRecommend.id=" + courseRecommend.getId() + "&email=" + email + "&code=" + MD5.endCode(email);
            EmailUtil.sendMail(email, this.getText("course.recommend.email.title", new String[]{this.getSessionNickName(), course.getName()}), Constants.BIG_COURSE_ADVERTISE_EMAIL_CSS + this.getText("course.recommend.email.content", new String[]{
                    email,
                    this.getSessionUserEmail(),
                    course.getName(),
                    comments,
                    href,
                    href,
                    email
            }), "text/html;charset=utf-8");
        }
    }


    @Action(value = "courseSupervise", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseSupervise")})
    public String courseSupervise() {
        this.getPagination().setPageSize(9);
        courses = courseDao.findMyOrgCourseForSupervision(this.getSessionUserId(), pagination);
        return SUCCESS;
    }

    @Action(value = "virtualRoomEmailInviteFriends")
    public void virtualRoomEmailInviteFriends() {
        courseClass = classDao.findById(this.getCourseClass().getId());
        BaseUser friend = null;
        if (this.getUser().getId() != null) {

            friend = baseUserDao.findById(this.getUser().getId());
        } else {
            if (baseUserDao.findByNickName("匿名用户") == null) {
                friend = new BaseUser();
                friend.setNickName("匿名用户");
                baseUserDao.persistAbstract(friend);
            }
            friend = baseUserDao.findByNickName("匿名用户");
        }


        DateFormat dateFormat = new SimpleDateFormat(this.getText("dateformat.forclass"));
        String href = getBasePath() + "/courseOnlineAudit.html?courseClass.id=" + this.getCourseClass().getId() + "&courseOnline=true";
        String title = this.getText("virtual.room.invite.friend.email.title", new String[]{friend.getNickName(), courseClass.getCourse().getName()});
        Calendar startTime = Calendar.getInstance();
        startTime.setTime(courseClass.getDate().getTime());
        Calendar endTime = Calendar.getInstance();
        startTime.setTime(courseClass.getFinishDate().getTime());


        for (String email : emails) {
            String serialNo = this.getSessionNickName() + (new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime()));
            Matter matter = new Matter(Calendar.getInstance(), serialNo, Matter.MATTER_COURSE_INVITE, friend, courseClass.getId() + "", email, courseClass.getCourse(), null, null, null, false);
            matterDao.persistAbstract(matter);
            String content = this.getText("virtual.room.invite.friend.email.content", new String[]{
                    email,
                    friend.getNickName(),
                    courseClass.getCourse().getName(),
                    courseClass.getCourse().getClassOneTheCornerSequence().toString(),
                    dateFormat.format(Utils.changeBaseOnTimeZone4Action(startTime).getTime()),
                    dateFormat.format(Utils.changeBaseOnTimeZone4Action(endTime).getTime()),
                    this.getInviteMessage().equals("") ? this.getText("virtual.room.invite.friend.message.default") : this.getInviteMessage(),
                    href,
                    href,
            });
            EmailUtil.sendMail(email, title, content, "text/html;charset=utf-8");
        }
    }

    @Action(value = "newEventsManage", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".newEventsManage")})
    public String newEventsManage() {
        pagination.setPageSize(20);
        courseNewEvents = courseNewEventDao.findByCourseID(this.getCourse().getId(), pagination);
        return SUCCESS;
    }

    @Action(value = "initAddCourseEvent", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".addCourseEvent")})
    public String initAddCourseEvent() {
        return SUCCESS;
    }

    @Action(value = "addCourseEvent", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "courseEventRead", "courseNewEvent.id", "${courseNewEvent.id}"})})
    public String addCourseEvent() {
        course = courseDao.findById(this.getCourse().getId());
        courseNewEvent.setCourse(course);
        courseNewEvent.setCreateTime(Calendar.getInstance());
        courseNewEvent.setOwner(baseUserDao.findById(this.getSessionUserId()));
        courseNewEventDao.persistAbstract(courseNewEvent);
        return SUCCESS;
    }

    @Action(value = "deleteCourseNewEvent")
    public void deleteCourseNewEvent() {
        courseNewEvent = courseNewEventDao.findById(this.getCourseNewEvent().getId());
        courseNewEventDao.delete(courseNewEvent);
    }

    @Action(value = "initEditCourseNewEvent", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseNewEventsEdit")})
    public String initEditCourseNewEvent() {
        courseNewEvent = courseNewEventDao.findById(this.getCourseNewEvent().getId());
        return SUCCESS;
    }

    @Action(value = "editCourseNewEvent", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".newEventsManage")})
    public String editCourseNewEvent() {
        CourseNewEvent cne = courseNewEventDao.findById(this.getCourseNewEvent().getId());
        cne.setTitle(courseNewEvent.getTitle());
        cne.setContent(courseNewEvent.getContent());

        courseNewEventDao.persistAbstract(cne);
        pagination.setPageSize(20);
        courseNewEvents = courseNewEventDao.findByCourseID(cne.getCourse().getId(), pagination);
        return SUCCESS;
    }
    //==============getter and setter==========

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }


    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }


    public ClassRoomDao getClassRoomDao() {
        return classRoomDao;
    }

    public void setClassRoomDao(ClassRoomDao classRoomDao) {
        this.classRoomDao = classRoomDao;
    }


    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }


    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }


    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }


    public Integer getIdentity() {
        return identity;
    }

    public void setIdentity(Integer identity) {
        this.identity = identity;
    }


    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }


    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }


    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }


    public SeniorClassRoomDao getSeniorClassRoomDao() {
        return seniorClassRoomDao;
    }

    public void setSeniorClassRoomDao(SeniorClassRoomDao seniorClassRoomDao) {
        this.seniorClassRoomDao = seniorClassRoomDao;
    }


    public List<SeniorClassRoom> getSeniorClassRooms() {
        return seniorClassRooms;
    }

    public void setSeniorClassRooms(List<SeniorClassRoom> seniorClassRooms) {
        this.seniorClassRooms = seniorClassRooms;
    }


    public Integer getClassCount() {
        return classCount;
    }

    public void setClassCount(Integer classCount) {
        this.classCount = classCount;
    }


    public CourseCommentDao getCourseCommentDao() {
        return courseCommentDao;
    }

    public void setCourseCommentDao(CourseCommentDao courseCommentDao) {
        this.courseCommentDao = courseCommentDao;
    }


    public List<CourseComment> getCourseComments() {
        return courseComments;
    }

    public void setCourseComments(List<CourseComment> courseComments) {
        this.courseComments = courseComments;
    }


    public CourseResourceDao getCourseResourceDao() {
        return courseResourceDao;
    }

    public void setCourseResourceDao(CourseResourceDao courseResourceDao) {
        this.courseResourceDao = courseResourceDao;
    }


    public List<CourseResource> getCourseResources() {
        return courseResources;
    }

    public void setCourseResources(List<CourseResource> courseResources) {
        this.courseResources = courseResources;
    }

    public List<Course> getCoursesOnline() {
        return coursesOnline;
    }

    public List<Course> getCourseForSquare() {
        List<Course> latestCourse = courseDao.findLatest4Course(new Pagination(10));
        int k = this.getCoursesOnline().size();
        if (k < 3) {
            int m = 3 - k;
            for (Course c : this.getCoursesOnline()) {
                Course curr = null;
                for (Course cc : latestCourse) {
                    if (c.getId().equals(cc.getId())) {
                        curr = cc;
                    }
                }
                if (curr != null) {
                    latestCourse.remove(curr);
                }
            }
//            for(Course cc : latestCourse){
//                 for(Course c : this.getCoursesOnline()){
//                      if(c.getId() == cc.getId()){
//                             latestCourse.remove(cc);
//                             break;
//                      }
//                 }
//            }
            if (latestCourse.size() < m) {
                for (Course c : latestCourse) {
                    this.getCoursesOnline().add(c);
                }
            } else {
                for (int i = 0; i < m; i++) {
                    this.getCoursesOnline().add(latestCourse.get(i));
                }
            }
        }
        return coursesOnline;

    }

    public void setCoursesOnline(List<Course> coursesOnline) {
        this.coursesOnline = coursesOnline;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }


    public CourseQuestionDao getCourseQuestionDao() {
        return courseQuestionDao;
    }

    public void setCourseQuestionDao(CourseQuestionDao courseQuestionDao) {
        this.courseQuestionDao = courseQuestionDao;
    }


    public List<CourseQuestion> getCourseQuestions() {
        return courseQuestions;
    }

    public void setCourseQuestions(List<CourseQuestion> courseQuestions) {
        this.courseQuestions = courseQuestions;
    }


    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }


    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }


    public List<Course> getCourses2teacher() {
        return courses2teacher;
    }

    public void setCourses2teacher(List<Course> courses2teacher) {
        this.courses2teacher = courses2teacher;
    }


    public List<Course> getHotCourses() {
        return hotCourses;
    }

    public void setHotCourses(List<Course> hotCourses) {
        this.hotCourses = hotCourses;
    }


    public List<Course> getUserConcernCourses() {
        return userConcernCourses;
    }

    public void setUserConcernCourses(List<Course> userConcernCourses) {
        this.userConcernCourses = userConcernCourses;
    }

    public List<Course> getCoursesInTypes() {
        return coursesInTypes;
    }

    public void setCoursesInTypes(List<Course> coursesInTypes) {
        this.coursesInTypes = coursesInTypes;
    }

    public List<Course> getCourseRelateCourses() {
        return courseRelateCourses;
    }

    public void setCourseRelateCourses(List<Course> courseRelateCourses) {
        this.courseRelateCourses = courseRelateCourses;
    }


    public Integer getOperaType() {
        return operaType;
    }

    public void setOperaType(Integer operaType) {
        this.operaType = operaType;
    }


    public CourseInviteStudentDao getCourseInviteStudentDao() {
        return courseInviteStudentDao;
    }

    public void setCourseInviteStudentDao(CourseInviteStudentDao courseInviteStudentDao) {
        this.courseInviteStudentDao = courseInviteStudentDao;
    }


    public List<String> getEmails() {
        List<String> finalEmails = new ArrayList<String>();
        for (String email : emails) {
            if (!email.equals("")) {
                finalEmails.add(email);
            }
        }
        return finalEmails;
    }

    public void setEmails(List<String> emails) {
        this.emails = emails;
    }


    public List<CourseInviteStudent> getCourseInviteStudents() {
        return courseInviteStudents;
    }

    public void setCourseInviteStudents(List<CourseInviteStudent> courseInviteStudents) {
        this.courseInviteStudents = courseInviteStudents;
    }


    public Integer getCourseType() {
        return courseType;
    }

    public void setCourseType(Integer courseType) {
        this.courseType = courseType;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTeacherEmail() {
        return teacherEmail;
    }

    public void setTeacherEmail(String teacherEmail) {
        this.teacherEmail = teacherEmail;
    }

    public Map<Integer, String> getOrgs() {
        return orgs;
    }

    public void setOrgs(Map<Integer, String> orgs) {
        this.orgs = orgs;
    }

    public Calendar getStartTime() {
        return startTime;
    }

    public void setStartTime(Calendar startTime) {
        this.startTime = startTime;
    }

    public CourseReservationDao getCourseReservationDao() {
        return courseReservationDao;
    }

    public void setCourseReservationDao(CourseReservationDao courseReservationDao) {
        this.courseReservationDao = courseReservationDao;
    }

    public CourseReservation getCourseReservation() {
        return courseReservation;
    }

    public void setCourseReservation(CourseReservation courseReservation) {
        this.courseReservation = courseReservation;
    }

    public DateFormat getDateFormat() {
        return dateFormat;
    }

    public void setDateFormat(DateFormat dateFormat) {
        this.dateFormat = dateFormat;
    }

    public CourseRecommendDao getCourseRecommendDao() {
        return courseRecommendDao;
    }

    public void setCourseRecommendDao(CourseRecommendDao courseRecommendDao) {
        this.courseRecommendDao = courseRecommendDao;
    }

    public CourseRecommend getCourseRecommend() {
        return courseRecommend;
    }

    public void setCourseRecommend(CourseRecommend courseRecommend) {
        this.courseRecommend = courseRecommend;
    }

    public String getComments() {
        if (this.getComments().equals("")) {
            comments = this.getText("course.recommend.default");
        }
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Integer getOriginalId() {
        return originalId;
    }

    public void setOriginalId(Integer originalId) {
        this.originalId = originalId;
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

    public Course getRepeatCourse() {
        return repeatCourse;
    }

    public void setRepeatCourse(Course repeatCourse) {
        this.repeatCourse = repeatCourse;
    }

    public ClassDao getClassDao() {
        return classDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }

    public CourseClass getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(CourseClass courseClass) {
        this.courseClass = courseClass;
    }

    public String getInviteMessage() {
        return inviteMessage;
    }

    public void setInviteMessage(String inviteMessage) {
        this.inviteMessage = inviteMessage;
    }

    public Boolean getTeacherChange() {
        return teacherChange;
    }

    public void setTeacherChange(Boolean teacherChange) {
        this.teacherChange = teacherChange;
    }

    public List<Course> getCoursesForAds() {
        return coursesForAds;
    }

    public void setCoursesForAds(List<Course> coursesForAds) {
        this.coursesForAds = coursesForAds;
    }

    public CourseNewEventDao getCourseNewEventDao() {
        return courseNewEventDao;
    }

    public void setCourseNewEventDao(CourseNewEventDao courseNewEventDao) {
        this.courseNewEventDao = courseNewEventDao;
    }

    public List<CourseNewEvent> getCourseNewEvents() {
        return courseNewEvents;
    }

    public void setCourseNewEvents(List<CourseNewEvent> courseNewEvents) {
        this.courseNewEvents = courseNewEvents;
    }

    public Integer getCommentsNum() {
        return commentsNum;
    }

    public void setCommentsNum(Integer commentsNum) {
        this.commentsNum = commentsNum;
    }

    public List<BaseUser> getHottestTeacher() {
        for (BaseUser teacher : hottestTeacher) {
            teacher.setUserFocused(false);
            if (this.getSessionUserId() != null && userFansDao.findByUserAndFans(teacher.getId(), this.getSessionUserId()) != null) {
                teacher.setUserFocused(true);
            }
        }
        return hottestTeacher;
    }

    public void setHottestTeacher(List<BaseUser> hottestTeacher) {
        this.hottestTeacher = hottestTeacher;
    }

    public GoGoWiseAnnounceDao getGoGoWiseAnnounceDao() {
        return goGoWiseAnnounceDao;
    }

    public void setGoGoWiseAnnounceDao(GoGoWiseAnnounceDao goGoWiseAnnounceDao) {
        this.goGoWiseAnnounceDao = goGoWiseAnnounceDao;
    }

    public List<GoGoWiseAnnounce> getGoGoWiseAnnounces() {
        return goGoWiseAnnounces;
    }

    public void setGoGoWiseAnnounces(List<GoGoWiseAnnounce> goGoWiseAnnounces) {
        this.goGoWiseAnnounces = goGoWiseAnnounces;
    }

    public Boolean getCommentsNumOverflow() {
        return commentsNumOverflow;
    }

    public void setCommentsNumOverflow(Boolean commentsNumOverflow) {
        this.commentsNumOverflow = commentsNumOverflow;
    }

    public CourseNewEvent getCourseNewEvent() {
        return courseNewEvent;
    }

    public void setCourseNewEvent(CourseNewEvent courseNewEvent) {
        this.courseNewEvent = courseNewEvent;
    }

    public UserFansDao getUserFansDao() {
        return userFansDao;
    }

    public void setUserFansDao(UserFansDao userFansDao) {
        this.userFansDao = userFansDao;
    }

    public MatterDao getMatterDao() {
        return matterDao;
    }

    public void setMatterDao(MatterDao matterDao) {
        this.matterDao = matterDao;
    }

    public List<Organization> getOrganizations() {
        return organizations;
    }

    public void setOrganizations(List<Organization> organizations) {
        this.organizations = organizations;
    }

    public Integer getCourseTermsNum() {
        if (this.getCourse() != null && this.getCourse().getFromCourse() != null) {
            return courseDao.findByFromCourse(this.getCourse().getFromCourse().getId(), null).size();
        }
        return 0;
    }

    public Integer getCourseCommentsNum() {
        return this.getCourseComments().size();
    }

    public Integer getTeacherCourseNum() {
        if (this.getCourse() != null && this.getCourse().getTeacher() != null) {
            List<Course> curr = courseDao.findCourses2Teacher(this.getCourse().getTeacher().getId(), null);
            return curr.size();
        }
        return 0;
    }

    public Boolean getFocusedCourseTeacher() {
        if (this.getCourse() != null && this.getCourse().getTeacher() != null) {
            UserFans uf = userFansDao.findByUserAndFans(this.getCourse().getTeacher().getId(), this.getSessionUserId() == null ? 0 : this.getSessionUserId());
            if (uf != null) return true;
        }
        return false;
    }

    public Integer getOrgCourseNum() {
        if (this.getCourse() != null && this.getCourse().getOrganization() != null) {
            return courseDao.findByOrg(this.getCourse().getId(), null).size();
        }
        return 0;
    }

    public Boolean isExistCourses() {
        if (this.getCourses().size() == 0) {
            return false;
        }
        return true;
    }

    public List<Course> getCoursesInTypesLeft() {
        List<Course> courses = new ArrayList<Course>();
        int k = this.getCoursesInTypes().size();
        int end = (k % 2 == 0 ? k / 2 : (k / 2) + 1);
        for (int i = 0; i < end; i++) {
            courses.add(this.getCoursesInTypes().get(i));
        }
        return courses;
    }

    public List<Course> getCoursesInTypesRight() {
        List<Course> courses = new ArrayList<Course>();
        int k = this.getCoursesInTypes().size();
        int end = (k % 2 == 0 ? k / 2 : (k / 2) + 1);
        for (int i = end; i < k; i++) {
            courses.add(this.getCoursesInTypes().get(i));
        }
        return courses;
    }

    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    public Set<BaseUser> getTeachers() {
        return teachers;
    }

    public void setTeachers(Set<BaseUser> teachers) {
        this.teachers = teachers;
    }

    public List<Integer> getTeacherIds() {
        return teacherIds;
    }

    public void setTeacherIds(List<Integer> teacherIds) {
        this.teacherIds = teacherIds;
    }

    public Integer getCoursePageShowType() {
        return this.coursePageShowType;
    }

    public void setCoursePageShowType(Integer coursePageShowType) {
        this.coursePageShowType = coursePageShowType;
    }

    public List<Course> getCenterCourses() {
        return this.centerCourses;
    }

    public void setCenterCourses(List<Course> centerCourses) {
        this.centerCourses = centerCourses;
    }

    public BaseUserRoleTypeDao getBaseUserRoleTypeDao() {
        return baseUserRoleTypeDao;
    }

    public void setBaseUserRoleTypeDao(BaseUserRoleTypeDao baseUserRoleTypeDao) {
        this.baseUserRoleTypeDao = baseUserRoleTypeDao;
    }
}
