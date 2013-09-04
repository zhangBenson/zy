package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.course.CourseDao;
import com.gogowise.dao.course.CourseNewEventDao;
import com.gogowise.domain.Course;
import com.gogowise.domain.CourseNewEvent;
import com.gogowise.utils.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CourseNewEventAction extends BasicAction{
    private CourseDao courseDao;
    private CourseNewEventDao courseNewEventDao;
    private CourseNewEvent courseNewEvent;
    private Course course;

    @Action(value = "saveCourseNewEvent")
    public void saveCourseNewEvent(){
        course = courseDao.findById(this.getCourse().getId());
        courseNewEvent.setCourse(course);
        courseNewEvent.setCreateTime(Utils.getCurrentCalender());
//        if(StringUtils.isNotBlank(courseNewEvent.getLogoUrl())){
//             Utils.notReplaceFileFromTmp(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId(), courseNewEvent.getLogoUrl());
//             courseNewEvent.setLogoUrl(Constants.UPLOAD_COURSE_PATH + "/" + getSessionUserId()+"/"+courseNewEvent.getLogoUrl());
//        }
        courseNewEventDao.persistAbstract(courseNewEvent);
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public CourseNewEventDao getCourseNewEventDao() {
        return courseNewEventDao;
    }

    public void setCourseNewEventDao(CourseNewEventDao courseNewEventDao) {
        this.courseNewEventDao = courseNewEventDao;
    }

    public CourseNewEvent getCourseNewEvent() {
        return courseNewEvent;
    }

    public void setCourseNewEvent(CourseNewEvent courseNewEvent) {
        this.courseNewEvent = courseNewEvent;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}
