package com.gogowise.action.course;


import com.gogowise.action.BasicAction;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.course.CourseDao;
import com.gogowise.rep.course.CourseQuestionDao;
import com.gogowise.domain.course.Course;
import com.gogowise.domain.course.CourseQuestion;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Calendar;


/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-25
 * Time: 下午4:55
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CourseQuestionAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = -5939154663704148338L;
    private CourseQuestionDao courseQuestionDao;
    private CourseQuestion courseQuestion;
    private BaseUserDao baseUserDao;
    private CourseDao courseDao;
    private Course course;


    @Action(value = "saveQuestion", results = {@Result(name = SUCCESS, type = "redirectAction", params = {"actionName", "voaCourseBlog"})})
    public String saveQuestion() {
        course = courseDao.findById(this.getCourse().getId());
        courseQuestion.setCourse(course);
        courseQuestion.setPutTime(Calendar.getInstance());
        courseQuestion.setQuestioner(baseUserDao.findById(this.getSessionUserId()));
        courseQuestion.setAnswered(false);
        courseQuestionDao.persistAbstract(courseQuestion);
        ActionContext.getContext().getSession().put("SessionCourseId", this.getCourse().getId());
        return SUCCESS;
    }

    public CourseQuestionDao getCourseQuestionDao() {

        return courseQuestionDao;
    }

    public void setCourseQuestionDao(CourseQuestionDao courseQuestionDao) {
        this.courseQuestionDao = courseQuestionDao;
    }

    public CourseQuestion getCourseQuestion() {
        return courseQuestion;
    }

    public void setCourseQuestion(CourseQuestion courseQuestion) {
        this.courseQuestion = courseQuestion;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
}
