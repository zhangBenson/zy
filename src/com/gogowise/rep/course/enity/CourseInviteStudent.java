package com.gogowise.rep.course.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-2-16
 * Time: 下午4:56
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class CourseInviteStudent extends AbstractPersistence {
    @ManyToOne
    private Course course;
    @OneToOne
    private BaseUser student;
    private String invitedStudentEmail;
    private Boolean acceptInvite = false;

    public String getInvitedStudentEmail() {
        return invitedStudentEmail;
    }

    public void setInvitedStudentEmail(String invitedStudentEmail) {
        this.invitedStudentEmail = invitedStudentEmail;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Boolean getAcceptInvite() {
        return acceptInvite;
    }

    public void setAcceptInvite(Boolean acceptInvite) {
        this.acceptInvite = acceptInvite;
    }

    public BaseUser getStudent() {
        return student;
    }

    public void setStudent(BaseUser student) {
        this.student = student;
    }
}
