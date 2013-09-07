package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.course.ClassRoomDao;
import com.gogowise.rep.course.CourseDao;
import com.gogowise.rep.course.SeniorClassRoomDao;
import com.gogowise.rep.course.enity.ClassRoom;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.SeniorClassRoom;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-3
 * Time: 上午10:31
 * To change this template use File | Settings | File Templates.
 */

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class ClassRoomAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = 4643718717641950564L;
    private CourseDao courseDao;
    private BaseUserDao baseUserDao;
    private ClassRoomDao classRoomDao;
    private SeniorClassRoomDao seniorClassRoomDao;
    private ClassRoom classRoom;


    @Action(value = "saveClassRoom")
    public void saveClassRoom() throws IOException {
        Course curr = courseDao.findById(classRoom.getCourse().getId());
        classRoom.setCourse(curr);
        classRoom.setStudent(baseUserDao.findById(this.getSessionUserId()));
        ClassRoom cr = classRoomDao.findClassRoomByCourseAndStudent(classRoom.getCourse().getId(), this.getSessionUserId());
        SeniorClassRoom scr = seniorClassRoomDao.findClassRoomByCourseAndStudent(classRoom.getCourse().getId(), this.getSessionUserId());


        PrintWriter out = ServletActionContext.getResponse().getWriter();
        if (cr != null) {
            out.println(this.getText("course.already.observation"));
        } else {
            classRoomDao.saveStudentforClassRoom(classRoom);
            out.println(this.getText("course.first.observation"));
        }
    }


    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public ClassRoomDao getClassRoomDao() {
        return classRoomDao;
    }

    public void setClassRoomDao(ClassRoomDao classRoomDao) {
        this.classRoomDao = classRoomDao;
    }

    public ClassRoom getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(ClassRoom classRoom) {
        this.classRoom = classRoom;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public SeniorClassRoomDao getSeniorClassRoomDao() {
        return seniorClassRoomDao;
    }

    public void setSeniorClassRoomDao(SeniorClassRoomDao seniorClassRoomDao) {
        this.seniorClassRoomDao = seniorClassRoomDao;
    }
}
