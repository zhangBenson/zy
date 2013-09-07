package com.gogowise.action.course;


import com.gogowise.action.BasicAction;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.course.BrowsedCourseDao;
import com.gogowise.rep.course.CourseDao;
import com.gogowise.domain.course.BrowsedCourse;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class BrowsedCourseAction extends BasicAction {

    private static final int MAX_BROWSER_COURSE_SIZE = 3;
    private Integer courseId;
    private BrowsedCourseDao browsedCourseDao;
    private BaseUserDao baseUserDao;
    private CourseDao courseDao;

    @Action(value = "browsedCourse")
    public String browsedCourse() {
        if (this.getSessionUserId() != null && this.getCourseId() != null) {
            List<BrowsedCourse> browsedCourseSet =browsedCourseDao.findByUserId(this.getSessionUserId());
            BrowsedCourse olderCourse = new BrowsedCourse();
            for (BrowsedCourse b : browsedCourseSet) {
                if (this.getCourseId().equals(b.getCourse().getId())) {
                    return NONE;
                }
                if (olderCourse.getId() == null || olderCourse.getId() > b.getId()) {
                    olderCourse = b;
                }
            }
            BrowsedCourse browsedCourse = new BrowsedCourse();
            browsedCourse.setCourse(courseDao.findById(this.getCourseId()));
            browsedCourse.setOwner(baseUserDao.findById(this.getSessionUserId()));
            browsedCourseDao.persistAbstract(browsedCourse);
            if (browsedCourseSet.size() >= MAX_BROWSER_COURSE_SIZE) {
                browsedCourseDao.delete(olderCourse);
            }
        }
        return NONE;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public BrowsedCourseDao getBrowsedCourseDao() {
        return browsedCourseDao;
    }

    public void setBrowsedCourseDao(BrowsedCourseDao browsedCourseDao) {
        this.browsedCourseDao = browsedCourseDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }
}
