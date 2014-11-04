package com.gogowise.rep.system.enity;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.user.enity.BaseUser;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-6-16
 * Time: 下午2:56
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class Matter extends AbstractPersistence {
    private Integer type;
    @OneToOne
    private BaseUser fromUser;


    private String toEmail;
    @OneToOne
    private Course course;


    private Boolean done;
    private Calendar createDate;
    private String serialNo;
    private String email;

    public static final Integer MATTER_COURSE_MESSAGE = 1;
    public static final Integer MATTER_COURSE_RESOURCE = 2;
    public static final Integer MATTER_COURSE_INVITE = 3;
    public static final Integer MATTER_MYSHOW_MESSAGE = 4;
    public static final Integer MATTER_INTERVIEW_INTERVIEWEE = 5;
    public static final Integer MATTER_ORGMEETING = 6;
    public static final Integer MATTER_COURSE_REGISTER = 7;
    public static final Integer MATTER_COURSE_TEACHER = 9;
    public static final Integer MATTER_INTERVIEW_INTERVIEWER = 10;
    public static final Integer MATTER_ORGMEETING_HOSTMAN = 11;
    public static final Integer MATTER_COURSE_STUDENT = 12;
    public static final Integer MATTER_COURSE_STUDENT_NO_ORG = 13;


    public Matter(Calendar createDate, String serialNo, Integer type, BaseUser fromUser, String email, String toEmail, Course course, Boolean done) {
        this.createDate = createDate;
        this.type = type;
        this.fromUser = fromUser;
        this.toEmail = toEmail;
        this.course = course;
        this.done = done;
        this.serialNo = serialNo;
        this.email = email;
    }

    public Matter() {
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Boolean getDone() {
        return done;
    }

    public void setDone(Boolean done) {
        this.done = done;
    }

    public Calendar getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Calendar createDate) {
        this.createDate = createDate;
    }

    public BaseUser getFromUser() {
        return fromUser;
    }

    public void setFromUser(BaseUser fromUser) {
        this.fromUser = fromUser;
    }

    public String getToEmail() {
        return toEmail;
    }

    public void setToEmail(String toEmail) {
        this.toEmail = toEmail;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getSerialNo() {
        return serialNo;
    }

    public void setSerialNo(String serialNo) {
        this.serialNo = serialNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


}
