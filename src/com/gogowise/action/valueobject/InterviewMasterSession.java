package com.gogowise.action.valueobject;

import com.gogowise.domain.org.Interview;
import com.gogowise.domain.org.InterviewAppointer;
import com.gogowise.common.utils.Constants;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-3
 * Time: 下午12:30
 * To change this template use File | Settings | File Templates.
 */
public class InterviewMasterSession {
     private Integer UserID = Constants.DEFAULT_INT_VALUE;
     private String UserName = Constants.DEFAULT_BLANK_VALUE;
     private Integer Type = 5;
     private String Title = Constants.DEFAULT_BLANK_VALUE; //course name
     private String Abstract = Constants.DEFAULT_BLANK_VALUE; //面试内容摘要
     private String Content = Constants.DEFAULT_BLANK_VALUE;  //course description
     private Integer OrganizationID = Constants.DEFAULT_INT_VALUE;
     private Integer InterviewID= Constants.DEFAULT_INT_VALUE;
     private String Server = Constants.DEFAULT_BLANK_VALUE;
     private String Candidature = Constants.DEFAULT_BLANK_VALUE;
     private String UserLocation = Constants.DEFAULT_BLANK_VALUE;


     public void initWithSession(Interview interview){
         this.setTitle(getEmptyString(interview.getOrganization().getSchoolName()+"知元网上面试"));
         this.setContent(getEmptyString(interview.getContent()));
         this.setOrganizationID(getEmptyInteger(interview.getOrganization().getId()));
         this.setInterviewID(getEmptyInteger(interview.getId()));
         StringBuilder candidature = new StringBuilder();
         for(int i=0;i<interview.getInterviewAppointers().size();i++){
             InterviewAppointer interviewAppointer = interview.getInterviewAppointers().get(i);
             if(interviewAppointer.getInterviewee()!=null){
                candidature.append(interviewAppointer.getInterviewee().getId()+","+interviewAppointer.getInterviewee().getNickName());
             }
             if(i<interview.getInterviewAppointers().size()-1){
                 candidature.append("|");
             }
         }
         this.setCandidature(getEmptyString(candidature.toString()));
     }

    public Integer getUserID() {
        return UserID;
    }

    public void setUserID(Integer userID) {
        UserID = userID;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public Integer getType() {
        return Type;
    }

    public void setType(Integer type) {
        Type = type;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getAbstract() {
        return Abstract;
    }

    public void setAbstract(String anAbstract) {
        Abstract = anAbstract;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public Integer getOrganizationID() {
        return OrganizationID;
    }

    public void setOrganizationID(Integer organizationID) {
        OrganizationID = organizationID;
    }

    public Integer getInterviewID() {
        return InterviewID;
    }

    public void setInterviewID(Integer interviewID) {
        InterviewID = interviewID;
    }

    public String getServer() {
        return Server;
    }

    public void setServer(String server) {
        Server = server;
    }

    public String getCandidature() {
        return Candidature;
    }

    public void setCandidature(String candidature) {
        Candidature = candidature;
    }

    public String getUserLocation() {
        return UserLocation;
    }

    public void setUserLocation(String userLocation) {
        UserLocation = userLocation;
    }

     private String getEmptyString(String s) {
           return  s== null ? "": s;
    }
    private Integer getEmptyInteger(Integer s) {
           return  s == null ? 0: s;
    }
}
