package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.ClassSession;
import com.gogowise.action.valueobject.OpenClassSession;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.CourseService;
import com.gogowise.rep.course.dao.*;
import com.gogowise.rep.course.enity.*;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
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
import java.util.*;

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
    private Set<BaseUser> teachers = new HashSet<>();
    private CourseService courseService;
    private Integer courseType = 1;
    private List<Course> courses = new ArrayList();
    private Course course;
    private Integer operaType;
    private CourseDao courseDao;


    @Action(value = "createCourseAllInOne", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".createCourseAllInOne"),
            @Result(name = "failed", type = Constants.RESULT_NAME_TILES, location = ".identityConfirmation")})
    public String createCourseAllInOne() {
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
