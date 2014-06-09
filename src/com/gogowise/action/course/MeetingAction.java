package com.gogowise.action.course;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
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

    @Action(value = "meetingHome", results = { @Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = "bc.meeting.initHome") })
    public String meetingHome() {

        return SUCCESS;
    }

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

    @Action(value = "ajaxSaveCourse")
    public String ajaxSaveCourse() {

        // Save course
        CourseSpecification specification = CourseSpecification.create(course, this.getSessionUserId(), 101, this.getTeacherIds());
        courseService.saveCourse(specification);

        course = courseService.findById(course.getId());

        course.setStudentAgeType(this.getCourse().getStudentAgeType());
        course.setIsPublic(this.getCourse().getIsPublic());
        courseDao.persist(course);

        // copy jpg
        if (StringUtils.isNotBlank(course.getLogoUrl()) && !StringUtils.startsWithIgnoreCase(course.getLogoUrl(), "upload/")) {
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

        this.setCourse_id(course.getId());
        return "json";
    }

}
