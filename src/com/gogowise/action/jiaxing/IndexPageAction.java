package com.gogowise.action.jiaxing;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
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


    List<Course> courses = new ArrayList<>();
    List<Course> records = new ArrayList<>();

    @Autowired
    private CourseDao courseDao;
    @Action(value = "index", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.index")})
    public String index() {

        courses = courseDao.findForecastCourse(new Pagination(4));
        records = courseDao.findRecordCourse(new Pagination(7));
        return SUCCESS;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public List<Course> getRecords() {
        return records;
    }
}
