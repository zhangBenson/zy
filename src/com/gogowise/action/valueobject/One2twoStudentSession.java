package com.gogowise.action.valueobject;

import com.gogowise.common.utils.Constants;
import com.gogowise.rep.course.enity.CourseClass;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-2-23
 * Time: 上午11:15
 * To change this template use File | Settings | File Templates.
 */
public class One2twoStudentSession {

    private Integer UserID = Constants.DEFAULT_INT_VALUE;
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private Integer Type = Constants.DEFAULT_INT_VALUE;//说明: 公开课是 1，才艺大比拼是2，我的个人秀是3, 个人家教是4
    private String Title = Constants.DEFAULT_BLANK_VALUE; //course name
    private String Abstract = Constants.DEFAULT_BLANK_VALUE; //课程摘要
    private String Content = Constants.DEFAULT_BLANK_VALUE;  //course description
    private Integer ClassID = Constants.DEFAULT_INT_VALUE;  //课堂的ClassId
    private String CourseID = Constants.DEFAULT_BLANK_VALUE;//课堂所属课程的 Id
    private String Server = Constants.DEFAULT_BLANK_VALUE; //video 服务器地

    private String MasterName = Constants.DEFAULT_BLANK_VALUE;        //teacher's name
    private Integer MasterID = Constants.DEFAULT_INT_VALUE;  // teacher's id
    private String StudentName1 = Constants.DEFAULT_BLANK_VALUE; // 学生1昵称
    private Integer StudentID1 = Constants.DEFAULT_INT_VALUE;    // 学生1ID

    private String UserLocation = Constants.DEFAULT_BLANK_VALUE;

    public void initWithSession(CourseClass courseClass){
        this.setType(4);
        this.setTitle(getEmptyString(courseClass.getCourse().getName()));
        this.setAbstract(getEmptyString(""));
        this.setContent(getEmptyString(courseClass.getCourse().getDescription()));
        this.setClassID(getEmptyInteger(courseClass.getId()));
        this.setCourseID(getEmptyString(courseClass.getCourse().getId().toString()));
        if(courseClass.getCourse().getTeacher()!=null){
           this.setMasterID(getEmptyInteger(courseClass.getCourse().getTeacher().getId()));
          this.setMasterName(getEmptyString(courseClass.getCourse().getTeacher().getNickName()));
        }
    }

    public String getUserLocation() {
        return UserLocation;
    }

    public void setUserLocation(String userLocation) {
        UserLocation = userLocation;
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
    private String getEmptyString(String s) {
           return  s== null ? "": s;
    }
    private Integer getEmptyInteger(Integer s) {
           return  s == null ? 0: s;
    }
}
