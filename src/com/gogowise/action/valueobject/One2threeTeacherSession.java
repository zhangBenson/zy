package com.gogowise.action.valueobject;

import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.org.enity.OrgMeeting;
import com.gogowise.common.utils.Constants;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-2-24
 * Time: 下午1:20
 * To change this template use File | Settings | File Templates.
 */
public class One2threeTeacherSession {

    private Integer UserID = Constants.DEFAULT_INT_VALUE;
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private Integer Type = Constants.DEFAULT_INT_VALUE;//说明: 公开课是 1，才艺大比拼是2，我的个人秀是3, 个人家教是4
    private String Title = Constants.DEFAULT_BLANK_VALUE; //course name
    private String Abstract = Constants.DEFAULT_BLANK_VALUE; //课程摘要
    private String Content = Constants.DEFAULT_BLANK_VALUE;  //course description
    private Integer ClassID = Constants.DEFAULT_INT_VALUE;  //课堂的ClassId
    private String CourseID = Constants.DEFAULT_BLANK_VALUE;//课堂所属课程的 Id
    private String Server = Constants.DEFAULT_BLANK_VALUE; //video 服务器地

    private String StudentName1 = Constants.DEFAULT_BLANK_VALUE;
    private Integer StudentID1 = Constants.DEFAULT_INT_VALUE;
    private String StudentName2 = Constants.DEFAULT_BLANK_VALUE;
    private Integer StudentID2 = Constants.DEFAULT_INT_VALUE;
    private String StudentName3 = Constants.DEFAULT_BLANK_VALUE;
    private Integer StudentID3 = Constants.DEFAULT_INT_VALUE;

    private String UserLocation = Constants.DEFAULT_BLANK_VALUE;




    public void initWithSession(CourseClass courseClass){
        this.setType(4);
        this.setTitle(getEmptyString(courseClass.getCourse().getName()));
        this.setAbstract(getEmptyString(""));
        this.setContent(getEmptyString(courseClass.getCourse().getDescription()));
        this.setClassID(getEmptyInteger(courseClass.getId()));
        this.setCourseID(getEmptyString(courseClass.getCourse().getId().toString()));
    }

    public void initSessionWithMeeting(OrgMeeting orgMeeting ,BaseUser user){
        this.setUserID(getEmptyInteger(user.getId()));
        this.setUserName(getEmptyString(user.getNickName()));
        this.setType(4);
        this.setTitle(getEmptyString(orgMeeting.getOrganization().getSchoolName()));
        this.setAbstract(getEmptyString(""));
        this.setContent(getEmptyString(orgMeeting.getContent()));
        this.setClassID(getEmptyInteger(0));
        this.setCourseID("meeting"+getEmptyString(orgMeeting.getId().toString()));
        if(orgMeeting.getOrgMeetingMembers().size() == 3){
              if(orgMeeting.getOrgMeetingMembers().get(0).getMember() != null){
                  this.setStudentID1(orgMeeting.getOrgMeetingMembers().get(0).getMember().getId());
                  this.setStudentName1(orgMeeting.getOrgMeetingMembers().get(0).getMember().getNickName());
              }
              if(orgMeeting.getOrgMeetingMembers().get(1).getMember() != null){
                  this.setStudentID2(orgMeeting.getOrgMeetingMembers().get(1).getMember().getId());
                  this.setStudentName2(orgMeeting.getOrgMeetingMembers().get(1).getMember().getNickName());
              }
              if(orgMeeting.getOrgMeetingMembers().get(2).getMember() != null){
                  this.setStudentID3(orgMeeting.getOrgMeetingMembers().get(2).getMember().getId());
                  this.setStudentName3(orgMeeting.getOrgMeetingMembers().get(2).getMember().getNickName());
              }
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

    public String getStudentName1() {
        return StudentName1;
    }

    public void setStudentName1(String studentName1) {
        StudentName1 = studentName1;
    }

    public Integer getStudentID1() {
        return StudentID1;
    }

    public void setStudentID1(Integer studentID1) {
        StudentID1 = studentID1;
    }

    public String getStudentName2() {
        return StudentName2;
    }

    public void setStudentName2(String studentName2) {
        StudentName2 = studentName2;
    }

    public Integer getStudentID2() {
        return StudentID2;
    }

    public String getStudentName3() {
        return StudentName3;
    }

    public void setStudentName3(String studentName3) {
        StudentName3 = studentName3;
    }

    public Integer getStudentID3() {
        return StudentID3;
    }

    public void setStudentID3(Integer studentID3) {
        StudentID3 = studentID3;
    }

    public void setStudentID2(Integer studentID2) {
        StudentID2 = studentID2;
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
