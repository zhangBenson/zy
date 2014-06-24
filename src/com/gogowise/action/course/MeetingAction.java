package com.gogowise.action.course;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.SeniorClassRoomDao;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.org.OrgService;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.omg.PortableInterceptor.SUCCESSFUL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.course.CourseService;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.dao.CourseInviteStudentDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseInviteStudent;
import com.gogowise.rep.course.vo.CourseSpecification;
import com.gogowise.rep.org.dao.OrganizationBaseUserDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.RoleType;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class MeetingAction extends BasicAction {

    private List<BaseUser> teachers = new ArrayList<>();
    private List<BaseUser> students = new ArrayList<>();
    private Course course;
    private List<Integer> teacherIds;
    private List<CourseInviteStudent> courseInviteStudents = new ArrayList<>();
    private List<String> emails = new ArrayList<>();
    private Integer course_id;

    private List<Course> meetings;
    private Pagination pagination = new Pagination();

    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private OrganizationBaseUserDao organizationBaseUserDao;

    @Autowired
    private CourseService courseService;
    @Autowired
    private CourseDao courseDao;
    @Autowired
    private BaseUserDao baseUserDao;
    @Autowired
    private CourseInviteStudentDao courseInviteStudentDao;
    @Autowired
    private ClassDao classDao;
    @Autowired
    private OrgService orgService;
    @Autowired
    private SeniorClassRoomDao seniorClassRoomDao;

    @Action(value = "initCreateMeeting", results = { @Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".createMeeting") })
    public String initCreateMeeting() {

        Organization org = organizationDao.findByResId(this.getSessionUserId());
        teachers = organizationBaseUserDao.findUsersByOrgIdAndRoleType(org.getId(), RoleType.ROLE_TYPE_TEACHER, null);
        students = organizationBaseUserDao.findUsersByOrgIdAndRoleType(org.getId(), RoleType.ROLE_TYPE_STUDENT, null);
        if (course == null)
            course = new Course();
        return SUCCESS;
    }

    public Integer getCourse_id() {

        return course_id;
    }

    public void setCourse_id(Integer course_id) {

        this.course_id = course_id;
    }

    public List<BaseUser> getTeachers() {

        return teachers;
    }

    public void setTeachers(List<BaseUser> teachers) {

        this.teachers = teachers;
    }

    public List<BaseUser> getStudents() {

        return students;
    }

    public void setStudents(List<BaseUser> students) {

        this.students = students;
    }

    @JSON(serialize = false)
    public Course getCourse() {

        return course;
    }

    public void setCourse(Course course) {

        this.course = course;
    }

    public List<Integer> getTeacherIds() {

        return teacherIds;
    }

    public void setTeacherIds(List<Integer> teacherIds) {

        this.teacherIds = teacherIds;
    }

    public List<CourseInviteStudent> getCourseInviteStudents() {

        return courseInviteStudents;
    }

    public void setCourseInviteStudents(List<CourseInviteStudent> courseInviteStudents) {

        this.courseInviteStudents = courseInviteStudents;
    }

    public List<String> getEmails() {

        return emails;
    }

    public void setEmails(List<String> emails) {

        this.emails = emails;
    }

    @Action(value = "ajaxSaveMeeting")
    public String ajaxSaveMeeting() {

        // Save course
        CourseSpecification specification = CourseSpecification.create(course, this.getSessionUserId(), Constants.COURSE_TYPE_ORG, this.getTeacherIds());
        String logUrlFromPage = course.getLogoUrl();
        courseService.saveCourse(specification);

        course = courseService.findById(course.getId());

        course.setCameraManConfirmed(true);
        course.setTeacherConfirmed(true);
        course.setStudentAgeType(this.getCourse().getStudentAgeType());
        course.setIsPublic(this.getCourse().getIsPublic());
        course.setStudentType(Constants.MEETING_TYPE);
        courseDao.persist(course);

        // copy jpg
        if (StringUtils.isNotBlank(course.getLogoUrl()) && !StringUtils.startsWithIgnoreCase(course.getLogoUrl(), "upload/")) {
            if (StringUtils.isNotBlank(logUrlFromPage)  ) course.setLogoUrl(logUrlFromPage);
            //Utils.notReplaceFileFromTmp(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId(), course.getLogoUrl());
            String courseDir = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_COURSE_PATH);
            courseDir = courseDir + File.separator + course.getId();

            File temp = new File(courseDir);
            if (!temp.exists())
                temp.mkdirs();

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

        courseInviteStudents = courseInviteStudentDao.findByCourseId(this.getCourse().getId()); //this step is used to delete the students if it was saved before
        if (courseInviteStudents.size() != 0) {
            for (CourseInviteStudent courseInviteStudent : courseInviteStudents) {
                courseInviteStudentDao.delete(courseInviteStudent);
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

        CourseClass courseClass = new CourseClass();
        courseClass.setName(Constants.MEETING_TYPE);
        courseClass.setDate(course.getStartDate() );
        classDao.saveClass(courseClass, course,Integer.MAX_VALUE);


        for (String email : emails) {
            if (StringUtils.isNotBlank(email)) {
                BaseUser studentTemp = baseUserDao.findByEmail(email);
                if (studentTemp != null )
                    seniorClassRoomDao.saveSeniorClassRoom(this.course.getId(),studentTemp.getId());
            }
        }

        this.setCourse_id(course.getId());
        return "json";
    }

    @Action(value = "maintenanceMeeting", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".createMeeting")})
    public String maintenanceCourse() {
        course = courseDao.findById(this.getCourse().getId());
        Organization org = organizationDao.findByResId(this.getSessionUserId());

        //if org is null, then this user is a teacher
        if (org == null) {
            org = orgService.findMyOrg(this.getSessionUserId());
        }

        //If this teacher doesn't belong to any org
        if (org == null) {
            teachers = new ArrayList<>();
            teachers.add(baseUserDao.findById(this.getSessionUserId()));
        } else {
            teachers = organizationBaseUserDao.findUsersByOrgIdAndRoleType(org.getId(), RoleType.ROLE_TYPE_TEACHER, null);
            students = organizationBaseUserDao.findUsersByOrgIdAndRoleType(org.getId(), RoleType.ROLE_TYPE_STUDENT, null);
        }

        for (BaseUser existTeacher : course.getTeachers()) {
            teacherIds.add(existTeacher.getId());
        }

        return SUCCESS;
    }

    @Action(value = "meetingHome", results={@Result(name= SUCCESS, type=Constants.RESULT_NAME_TILES, location = ".myCreatedMeeting")})
    public String meetingHome()
    {
        Organization org = organizationDao.findByResId(this.getSessionUserId());

        //if org is null, then this user is a teacher
        if (org == null) {
            org = orgService.findMyOrg(this.getSessionUserId());
        }

        meetings = this.courseDao.findMeeting(org.getId(), pagination);


        return SUCCESS;
    }

    @Action(value = "myCreatedMeeting", results={@Result(name= SUCCESS, type=Constants.RESULT_NAME_TILES, location = ".myCreatedMeeting")})
    public String myCreatedMeeting()
    {
        Organization org = organizationDao.findByResId(this.getSessionUserId());

        //if org is null, then this user is a teacher
        if (org == null) {
            org = orgService.findMyOrg(this.getSessionUserId());
        }

        meetings = this.courseDao.findMeeting(org.getId(),pagination);

        return SUCCESS;
    }

    @Action(value = "myRegisteredMeeting", results={@Result(name= SUCCESS, type=Constants.RESULT_NAME_TILES, location = ".myRegisteredMeeting")})
    public String myRegisteredMeeting()
    {
        meetings = this.courseDao.findMeetingForStudent(this.getSessionUserId(),pagination);

        return SUCCESS;
    }


    public List<Course> getMeetings() {
        return meetings;
    }

    public void setMeetings(List<Course> meetings) {
        this.meetings = meetings;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }


}
