package com.gogowise.domain.live;

import com.gogowise.domain.*;
import com.gogowise.domain.course.Course;
import com.gogowise.domain.org.Interview;
import com.gogowise.domain.org.OrgMeeting;
import com.gogowise.domain.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

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
    @OneToOne
    private Interview interview;
    @OneToOne
    private MyShow myShow;
    @OneToOne
    private OrgMeeting orgMeeting;
    private Boolean done;
    private Calendar createDate;
    private String serialNo;
    private String email;

    public static final Integer MATTER_COURSE_MESSAGE=1;
    public static final Integer MATTER_COURSE_RESOURCE=2;
    public static final Integer MATTER_COURSE_INVITE=3;
    public static final Integer MATTER_MYSHOW_MESSAGE=4;
    public static final Integer MATTER_INTERVIEW_INTERVIEWEE=5;
    public static final Integer MATTER_ORGMEETING=6;
    public static final Integer MATTER_COURSE_REGISTER=7;
    public static final Integer MATTER_COURSE_RESERVATION=8;
    public static final Integer MATTER_COURSE_TEACHER=9;
    public static final Integer MATTER_INTERVIEW_INTERVIEWER=10;
    public static final Integer MATTER_ORGMEETING_HOSTMAN=11;
    public static final Integer MATTER_COURSE_STUDENT=12;
    public static final Integer MATTER_COURSE_STUDENT_NO_ORG=13;


    public Matter(Calendar createDate,String serialNo, Integer type, BaseUser fromUser,String email, String toEmail, Course course, Interview interview, MyShow myShow, OrgMeeting orgMeeting, Boolean done) {
        this.createDate = createDate;
        this.type = type;
        this.fromUser = fromUser;
        this.toEmail = toEmail;
        this.course = course;
        this.interview = interview;
        this.myShow = myShow;
        this.orgMeeting = orgMeeting;
        this.done = done;
        this.serialNo=serialNo;
        this.email=email;
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

    public Interview getInterview() {
        return interview;
    }

    public void setInterview(Interview interview) {
        this.interview = interview;
    }

    public MyShow getMyShow() {
        return myShow;
    }

    public void setMyShow(MyShow myShow) {
        this.myShow = myShow;
    }

    public OrgMeeting getOrgMeeting() {
        return orgMeeting;
    }

    public void setOrgMeeting(OrgMeeting orgMeeting) {
        this.orgMeeting = orgMeeting;
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
