package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.SearchCondition;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.Pagination;
import com.gogowise.common.utils.Constants;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CourseSearchAction extends BasicAction {

    private List<Course> courses;
    private List<Course> hotCourse;
    private List<BaseUser> hotTeacher;
    private String courseName;
    private String searchTyp;

    private List<SearchCondition> searchConditions = new ArrayList<>();

    {
        if (searchConditions.size() == 0) {
            for (int i = 0; i < 4; i++) {
                searchConditions.add(new SearchCondition());
            }
        }
    }

    private CourseDao courseDao;
    private BaseUserDao baseUserDao;

    private Pagination pagination = new Pagination(9);


    @Action(value = "courseSelection",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".courseSelection")})
    public String courseSelection() {
//        Object[] parameter = new Object[5];
        List<Object> parameter = new ArrayList<>();
        String whereCourse = "";
        if ("adv".equalsIgnoreCase(this.searchTyp)) {
            for (SearchCondition sc : this.searchConditions) {
                if (sc.getRealValue() != null) {
                    whereCourse += sc.buildCourseSql();
                    parameter.add(sc.getRealValue());
                }
            }
        } else if (StringUtils.isNotBlank(courseName)) {
            whereCourse += " and c.name like ? ";
            parameter.add("%" + courseName + "%");

        }

        String hql = "select distinct c from Course c where  c.cameraManConfirmed=true  " + whereCourse + " order by c.id desc";
        courses = courseDao.find(hql, pagination, parameter.toArray());

        hotCourse = courseDao.findHotCourses(new Pagination(4));
        hotTeacher = baseUserDao.findHotTeacher(new Pagination(4));

        return SUCCESS;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public List<Course> getHotCourse() {
        return hotCourse;
    }

    public void setHotCourse(List<Course> hotCourse) {
        this.hotCourse = hotCourse;
    }

    public List<SearchCondition> getSearchConditions() {
        return searchConditions;
    }

    public void setSearchConditions(List<SearchCondition> searchConditions) {
        this.searchConditions = searchConditions;
    }

    public String getSearchTyp() {
        return searchTyp;
    }

    public void setSearchTyp(String searchTyp) {
        this.searchTyp = searchTyp;
    }

    public List<BaseUser> getHotTeacher() {
        return hotTeacher;
    }

    public void setHotTeacher(List<BaseUser> hotTeacher) {
        this.hotTeacher = hotTeacher;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
}
