package com.gogowise.action.course;


import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseClass;
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
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class DesignGameAction extends BasicAction {

    private Course course;
    private List<CourseClass> classes = new ArrayList<>();

    @Autowired
    private ClassDao classDao;
    @Autowired
    private CourseDao courseDao;

    @Action(value = "designGame", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = "www.course.designGame")})
    public String designGame() {
        course = courseDao.findById(course.getId());
        classes = classDao.findByCourseId(course.getId());
        return SUCCESS;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public List<CourseClass> getClasses() {
        return classes;
    }

    public void setClasses(List<CourseClass> classes) {
        this.classes = classes;
    }


}
