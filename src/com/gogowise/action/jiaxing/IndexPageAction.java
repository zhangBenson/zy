package com.gogowise.action.jiaxing;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.org.dao.OrganizationBaseUserDao;
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

@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class IndexPageAction extends BasicAction {


    private List<Course> courses = new ArrayList<>();
    private List<Course> records = new ArrayList<>();
    private List<BaseUser> teachers = new ArrayList<>();
    private Pagination pagination = new Pagination(8);


    @Autowired
    private CourseDao courseDao;
    @Autowired
    private OrganizationBaseUserDao organizationBaseUserDao;

    @Action(value = "index", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.index")})
    public String index() {

        courses = courseDao.findForecastCourse(new Pagination(4));
        records = courseDao.findRecordCourse(new Pagination(7));
        teachers = organizationBaseUserDao.findLatestUsersByRoleType(RoleType.ROLE_TYPE_TEACHER, new Pagination(4));

        return SUCCESS;
    }


    @Action(value = "zbClass", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.zb")})
    public String zbClass() {
        pagination.setPageSize(8);
        courses = courseDao.findForecastCourse(pagination);
        return SUCCESS;
    }

    @Action(value = "dbClass", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.db")})
    public String dbClass() {
        pagination.setPageSize(8);
        courses = courseDao.findRecordCourse(pagination);
        return SUCCESS;
    }

    @Action(value = "msList", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.msList")})
    public String msList() {
        pagination.setPageSize(4);
        teachers = organizationBaseUserDao.findLatestUsersByRoleType(RoleType.ROLE_TYPE_TEACHER, pagination);
        records = courseDao.findRecordCourse(new Pagination(6));
        return SUCCESS;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public List<Course> getRecords() {
        return records;
    }

    public List<BaseUser> getTeachers() {
        return teachers;
    }

    @Override
    public Pagination getPagination() {
        return pagination;
    }

    @Override
    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }
}
