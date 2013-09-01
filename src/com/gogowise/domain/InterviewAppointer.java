package com.gogowise.domain;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-1
 * Time: 下午4:41
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class InterviewAppointer extends AbstractPersistence{
    @ManyToOne
    private Interview interview;
    private String intervieweeEmail;
     @ManyToOne
    private BaseUser interviewee;
    private Boolean accept = false;

    public Interview getInterview() {
        return interview;
    }

    public void setInterview(Interview interview) {
        this.interview = interview;
    }

    public String getIntervieweeEmail() {
        return intervieweeEmail;
    }

    public void setIntervieweeEmail(String intervieweeEmail) {
        this.intervieweeEmail = intervieweeEmail;
    }

    public Boolean getAccept() {
        return accept;
    }

    public void setAccept(Boolean accept) {
        this.accept = accept;
    }

    public BaseUser getInterviewee() {
        return interviewee;
    }

    public void setInterviewee(BaseUser interviewee) {
        this.interviewee = interviewee;
    }
}
