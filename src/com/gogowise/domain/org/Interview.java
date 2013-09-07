package com.gogowise.domain.org;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-1
 * Time: 上午10:02
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class Interview extends AbstractPersistence {
    @OneToOne
    private BaseUser interviewer;
    private String interviewerEmail;
    @OneToOne
    private Organization organization;
    private String content;
    private Calendar startTime;
    @OneToMany(mappedBy = "interview")
    private List<InterviewAppointer> interviewAppointers = new ArrayList<InterviewAppointer>();
    public BaseUser getInterviewer() {
        return interviewer;
    }

    public void setInterviewer(BaseUser interviewer) {
        this.interviewer = interviewer;
    }

    public String getInterviewerEmail() {
        return interviewerEmail;
    }

    public void setInterviewerEmail(String interviewerEmail) {
        this.interviewerEmail = interviewerEmail;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Calendar getStartTime() {
        return startTime;
    }

    public void setStartTime(Calendar startTime) {
        this.startTime = startTime;
    }
    public List<InterviewAppointer> getInterviewAppointers() {
        return interviewAppointers;
    }

    public void setInterviewAppointers(List<InterviewAppointer> interviewAppointers) {
        this.interviewAppointers = interviewAppointers;
    }

    public Integer getIntervieweeNum(){
        return interviewAppointers.size();
    }

    public Integer getIntervieweeRealNum(){
        int sum = 0;
        for(InterviewAppointer interviewAppointer : interviewAppointers){
               if(interviewAppointer.getInterviewee()!=null) sum++;
        }
        return sum;
    }
}
