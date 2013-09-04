package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.course.CourseDao;
import com.gogowise.dao.course.CourseEvaluationDao;
import com.gogowise.domain.BaseUser;
import com.gogowise.domain.Course;
import com.gogowise.domain.CourseEvaluation;
import com.gogowise.domain.Pagination;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-21
 * Time: 下午1:57
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CourseEvaluateAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = 2908543161571653955L;
    private CourseDao courseDao;
    private CourseEvaluationDao courseEvaluationDao;
    private BaseUserDao baseUserDao;
    private CourseEvaluation courseEvaluation;
    private List<CourseEvaluation> courseEvaluations;
    private Pagination page = new Pagination();

    @Action(value = "saveCourseEvaluation")
    public void saveCourseEvaluation() throws IOException {
        CourseEvaluation curr = courseEvaluationDao.findByCourseId(this.getCourseEvaluation().getCourse().getId());
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        if (curr != null) {
            out.println(this.getText("courseEvaluation.failed.result") + "$" + 0);
        } else if (courseDao.findCourseWithStudentIdAndCourseId(this.getSessionUserId(), this.getCourseEvaluation().getCourse().getId() ).size() == 0 ){
            out.println(this.getText("courseEvaluation.failed.result.not.student") + "$" + 0);
        }else {
            BaseUser evaluator = baseUserDao.findById(this.getSessionUserId());
            courseEvaluation.setEvaluator(evaluator);
            courseEvaluation.setSynthetical();
            Course course = courseDao.findById(courseEvaluation.getCourse().getId());
            course.setInterest(Math.round((course.getInterest() * course.getEvaluatorNums() + courseEvaluation.getInterest()) * 10 / (course.getEvaluatorNums() + 1)) / 10.0);
            course.setAvailable(Math.round((course.getAvailable() * course.getEvaluatorNums() + courseEvaluation.getAvailable()) * 10 / (course.getEvaluatorNums() + 1)) / 10.0);
            course.setInteraction(Math.round((course.getInteraction() * course.getEvaluatorNums() + courseEvaluation.getInteraction()) * 10 / (course.getEvaluatorNums() + 1)) / 10.0);
            course.setCostPerformance(Math.round((course.getCostPerformance() * course.getEvaluatorNums() + courseEvaluation.getCostPerformance()) * 10 / (course.getEvaluatorNums() + 1)) / 10.0);
            course.setSynthetical();
            course.setEvaluatorNums(course.getEvaluatorNums() + 1);
            courseDao.persistAbstract(course);
            courseEvaluationDao.persistAbstract(courseEvaluation);
            out.println(this.getText("courseEvaluation.success.result") + "$" + courseEvaluation.getSynthetical());
        }
        out.close();
    }


    //====================Getter and Setter=====================


    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public CourseEvaluationDao getCourseEvaluationDao() {
        return courseEvaluationDao;
    }

    public void setCourseEvaluationDao(CourseEvaluationDao courseEvaluationDao) {
        this.courseEvaluationDao = courseEvaluationDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public CourseEvaluation getCourseEvaluation() {
        return courseEvaluation;
    }

    public void setCourseEvaluation(CourseEvaluation courseEvaluation) {
        this.courseEvaluation = courseEvaluation;
    }

    public List<CourseEvaluation> getCourseEvaluations() {
        return courseEvaluations;
    }

    public void setCourseEvaluations(List<CourseEvaluation> courseEvaluations) {
        this.courseEvaluations = courseEvaluations;
    }

    public Pagination getPage() {
        return page;
    }

    public void setPage(Pagination page) {
        this.page = page;
    }
}
