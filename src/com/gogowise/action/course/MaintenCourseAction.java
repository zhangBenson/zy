package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.course.CourseService;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.org.dao.OrganizationBaseUserDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.RoleType;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
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
public class MaintenCourseAction extends BasicAction {
    private List<BaseUser> teachers = new ArrayList<>();
    private List<BaseUser> students = new ArrayList<>();
    private CourseService courseService;
    private Integer courseType = 1;
    private List<Course> courses = new ArrayList<>();
    private Course course;
    private Integer operaType;
    private CourseDao courseDao;
    @Autowired
    private OrganizationBaseUserDao organizationBaseUserDao;
    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private BaseUserDao baseUserDao;

    private ClassDao classDao;
    private List<CourseClass> classes = new ArrayList<>();
    private List<Integer> teacherIds = new ArrayList<>();


    @Action(value = "createCourseAllInOne", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".createCourseAllInOne"),
            @Result(name = "failed", type = Constants.RESULT_NAME_TILES, location = ".identityConfirmation")})
    public String createCourseAllInOne() {
        Organization org = organizationDao.findByResId(this.getSessionUserId());
        teachers = organizationBaseUserDao.findUsersByOrgIdAndRoleType(org.getId(), RoleType.ROLE_TYPE_TEACHER, null);
        students = organizationBaseUserDao.findUsersByOrgIdAndRoleType(org.getId(), RoleType.ROLE_TYPE_STUDENT, null);
        return SUCCESS;
    }

    @Action(value = "maintenanceSearchResult", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".maintenanceSearchResult")})
    public String maintenanceSearchResult() {
        courses = courseService.findMaintenanceCourses(this.getSessionUserId(), super.getPagination());
        this.setOperaType(Constants.OPERA_TYPE_FOR_COURSE_MODIFY);
        return SUCCESS;
    }


    @Action(value = "maintenanceCourse", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".maintenanceCourse"),
            @Result(name = "failed", type = Constants.RESULT_NAME_TILES, location = ".identityConfirmation")})
    public String maintenanceCourse() {
        course = courseDao.findById(this.getCourse().getId());
        Organization org = organizationDao.findByResId(this.getSessionUserId());

        //if org is null, then this user is a teacher
        if (org == null) {
            org = organizationDao.findMyOrg(this.getSessionUserId());
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

        //find the classes
        classes = classDao.findByCourseId( course.getId() );

        return SUCCESS;
    }

    public List<BaseUser> getStudents() {
        return students;
    }

    public void setStudents(List<BaseUser> students) {
        this.students = students;
    }

    public List<BaseUser> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<BaseUser> teachers) {
        this.teachers = teachers;
    }

    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    public CourseService getCourseService() {
        return courseService;
    }

    public Integer getCourseType() {
        return courseType;
    }

    public void setCourseType(Integer courseType) {
        this.courseType = courseType;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    public Integer getOperaType() {
        return operaType;
    }

    public void setOperaType(Integer operaType) {
        this.operaType = operaType;
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


    public OrganizationBaseUserDao getOrganizationBaseUserDao() {
        return organizationBaseUserDao;
    }

    public void setOrganizationBaseUserDao(OrganizationBaseUserDao organizationBaseUserDao) {
        this.organizationBaseUserDao = organizationBaseUserDao;
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public ClassDao getClassDao() {
        return classDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }

    public List<CourseClass> getClasses() {
        return classes;
    }

    public void setClasses(List<CourseClass> classes) {
        this.classes = classes;
    }

    public List<Integer> getTeacherIds() {
        return teacherIds;
    }

    public void setTeacherIds(List<Integer> teacherIds) {
        this.teacherIds = teacherIds;
    }
}
