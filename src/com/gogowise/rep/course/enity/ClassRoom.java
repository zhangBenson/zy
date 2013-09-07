package com.gogowise.rep.course.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-3
 * Time: 上午10:06
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class ClassRoom extends AbstractPersistence {
    @OneToOne
    private Course course;
    @OneToOne
    private BaseUser student;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public BaseUser getStudent() {
        return student;
    }

    public void setStudent(BaseUser student) {
        this.student = student;
    }
}
