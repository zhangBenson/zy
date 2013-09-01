package com.gogowise.action.valueobject;

import com.gogowise.domain.BaseUser;
import com.gogowise.domain.CourseClass;
import com.gogowise.domain.OrgMeeting;
import com.gogowise.utils.Constants;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-4
 * Time: 下午1:17
 * To change this template use File | Settings | File Templates.
 */
public class ClassSession {
    private Integer UserID = Constants.DEFAULT_INT_VALUE;
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private Integer Type = Constants.DEFAULT_INT_VALUE;

    private Integer MasterID = Constants.DEFAULT_INT_VALUE;  // teacher's id
    private String MasterName = Constants.DEFAULT_BLANK_VALUE;        //teacher's name

    private String Title = Constants.DEFAULT_BLANK_VALUE; //course name
    private String Abstract = Constants.DEFAULT_BLANK_VALUE; //课程摘要
    private String Content = Constants.DEFAULT_BLANK_VALUE;  //course description
    private Integer ClassID = Constants.DEFAULT_INT_VALUE;  //课堂的ClassId
    private String CourseID = Constants.DEFAULT_BLANK_VALUE;//课堂所属课程的 Id
    private String Server = Constants.DEFAULT_BLANK_VALUE; //video 服务器地址

    private String StudentName = Constants.DEFAULT_BLANK_VALUE; //学生昵称
    private Integer StudentID =Constants.DEFAULT_INT_VALUE;
    private String UserLocation = Constants.DEFAULT_BLANK_VALUE; //老师所在地

    //===========getter and setter===========


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

    public Integer getMasterID() {
        return MasterID;
    }

    public void setMasterID(Integer masterID) {
        MasterID = masterID;
    }

    public String getMasterName() {
        return MasterName;
    }

    public void setMasterName(String masterName) {
        MasterName = masterName;
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

    public Integer getClassID() {
        return ClassID;
    }

    public void setClassID(Integer classID) {
        ClassID = classID;
    }

    public String getCourseID() {
        return CourseID;
    }

    public void setCourseID(String courseID) {
        CourseID = courseID;
    }

    public String getServer() {
        return Server;
    }

    public void setServer(String server) {
        Server = server;
    }

    public String getStudentName() {
        return StudentName;
    }

    public void setStudentName(String studentName) {
        StudentName = studentName;
    }

    public Integer getStudentID() {
        return StudentID;
    }

    public void setStudentID(Integer studentID) {
        StudentID = studentID;
    }

    public String getUserLocation() {
        return UserLocation;
    }

    public void setUserLocation(String userLocation) {
        UserLocation = userLocation;
    }

    public void initWithSession(CourseClass courseClass){
       //this.setUserID(getEmptyInteger(courseClass.get));
        this.setMasterID(getEmptyInteger(courseClass.getCourse().getTeacher() == null ? 0: courseClass.getCourse().getTeacher().getId()));
        this.setMasterName(getEmptyString(courseClass.getCourse().getTeacher()==null?"":courseClass.getCourse().getTeacher().getUserName() ));
        this.setTitle(getEmptyString(courseClass.getCourse().getName()));
        this.setAbstract(getEmptyString(""));
        this.setContent(getEmptyString(courseClass.getCourse().getDescription()));
        this.setClassID(getEmptyInteger(courseClass.getId()));
        this.setCourseID(getEmptyString(courseClass.getCourse().getId().toString()));

    }

    public void initSessionWithMeeting(OrgMeeting orgMeeting ,BaseUser user){
        this.setUserID(getEmptyInteger(user.getId()));
        this.setUserName(getEmptyString(user.getNickName()));
        if(orgMeeting.getHostMan()!=null){
            this.setMasterID(getEmptyInteger(orgMeeting.getHostMan().getId()));
            this.setMasterName(getEmptyString(orgMeeting.getHostMan().getNickName()));
        }
        this.setTitle(getEmptyString(orgMeeting.getOrganization().getSchoolName()));
        this.setAbstract(getEmptyString(""));
        this.setContent(getEmptyString(orgMeeting.getContent()));
        this.setCourseID("meeting"+getEmptyString(orgMeeting.getId().toString()));
        this.setClassID(getEmptyInteger(0));
        if(orgMeeting.getOrgMeetingMembers().size() == 1){
            if(orgMeeting.getOrgMeetingMembers().get(0).getMember() != null){
                 this.setStudentID(orgMeeting.getOrgMeetingMembers().get(0).getMember().getId());
                this.setStudentName(orgMeeting.getOrgMeetingMembers().get(0).getMember().getNickName());
            }
        }
    }
    private String getEmptyString(String s) {
           return  s== null ? "": s;
    }
    private Integer getEmptyInteger(Integer s) {
           return  s == null ? 0: s;
    }




}
