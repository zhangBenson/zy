package com.gogowise.rep.course.enity;

import com.gogowise.common.utils.Constants;
import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.Calendar;

/**
 * 该类记录了用户在class里面的状态，包括了：没有记录、进入、完成三个状态。
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-28 20:05
 * Email: jhji@ir.hit.edu.cn
 */
@Entity
public class ClassMembership extends AbstractPersistence{

    @ManyToOne
    private CourseClass courseClass;

    @ManyToOne
    private BaseUser user;  //学生用户

    private Integer status = Constants.Class_User_Status_Default;  //该用户所处的状态

    private Calendar date;  //状态改变时间


    public CourseClass getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(CourseClass courseClass) {
        this.courseClass = courseClass;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Calendar getDate() {
        return date;
    }

    public void setDate(Calendar date) {
        this.date = date;
    }
}
