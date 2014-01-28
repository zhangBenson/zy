package com.gogowise.action.org;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.course.CourseService;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.user.enity.BaseUser;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * OrgCourseAction
 *
 * @author 苑永志
 * @version 1.0
 * @since 2014年01月28日 14:34
 */
@Controller
@Namespace("/org/course")
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class OrgCourseAction extends BasicAction{
    private Set<BaseUser> teachers = new HashSet<>();
    private CourseService courseService;
    private Integer courseType = 1;
    private List<Course> courses = new ArrayList();
    private Course course;
    private Integer operaType;
    private CourseDao courseDao;


    @Action(value = "create", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".createCourseAllInOne"),
            @Result(name = "failed", type = Constants.RESULT_NAME_TILES, location = ".identityConfirmation")})
    public String toCreate() {
        teachers = courseService.findAllTeachersByOrgCreator(this.getSessionUserId());
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
        teachers = courseService.findAllTeachersByOrgCreator(this.getSessionUserId());
        return SUCCESS;
    }

    public Set<BaseUser> getTeachers() {
        return teachers;
    }

    public void setTeachers(Set<BaseUser> teachers) {
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
}
