package com.gogowise.action.valueobject;

import com.gogowise.domain.Interview;
import com.gogowise.utils.Constants;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-3
 * Time: 下午1:04
 * To change this template use File | Settings | File Templates.
 */
public class InterviewCandidatureSession {
     private Integer UserID = Constants.DEFAULT_INT_VALUE;
     private String UserName = Constants.DEFAULT_BLANK_VALUE;
     private Integer Type = 5;
     private String Title = Constants.DEFAULT_BLANK_VALUE; //course name
     private String Abstract = Constants.DEFAULT_BLANK_VALUE; //面试内容摘要
     private String Content = Constants.DEFAULT_BLANK_VALUE;  //course description
     private Integer OrganizationID = Constants.DEFAULT_INT_VALUE;
     private Integer InterviewID= Constants.DEFAULT_INT_VALUE;
     private String Server = Constants.DEFAULT_BLANK_VALUE;
     private String MasterName = Constants.DEFAULT_BLANK_VALUE;
     private Integer MasterID = Constants.DEFAULT_INT_VALUE;
     private String UserLocation = Constants.DEFAULT_BLANK_VALUE;

      public void initWithSession(Interview interview){
         this.setTitle(getEmptyString(interview.getOrganization().getSchoolName()+"知元网上面试"));
         this.setContent(getEmptyString(interview.getContent()));
         this.setOrganizationID(getEmptyInteger(interview.getOrganization().getId()));
         this.setInterviewID(getEmptyInteger(interview.getId()));
         if(interview.getInterviewer()!=null){
               this.setMasterID(getEmptyInteger(interview.getInterviewer().getId()));
               this.setMasterName(getEmptyString(interview.getInterviewer().getNickName()));
         }

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

    public String getMasterName() {
        return MasterName;
    }

    public void setMasterName(String masterName) {
        MasterName = masterName;
    }

    public Integer getMasterID() {
        return MasterID;
    }

    public void setMasterID(Integer masterID) {
        MasterID = masterID;
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
