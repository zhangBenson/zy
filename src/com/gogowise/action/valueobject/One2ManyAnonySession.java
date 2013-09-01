package com.gogowise.action.valueobject;

import com.gogowise.domain.CourseClass;
import com.gogowise.utils.Constants;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-19
 * Time: 下午3:26
 * To change this template use File | Settings | File Templates.
 */
public class One2ManyAnonySession {
    private Integer UserID = Constants.DEFAULT_INT_VALUE;     //用户昵称
    private String UserName = Constants.DEFAULT_BLANK_VALUE;    //用户ID
    private Integer Type = Constants.DEFAULT_INT_VALUE;         //说明: 公开课是 1，才艺大比拼是2，我的个人秀是3, 个人家教是4

    private String Title = Constants.DEFAULT_BLANK_VALUE; //course name
    private String Abstract = Constants.DEFAULT_BLANK_VALUE; //课程摘要
    private String Content = Constants.DEFAULT_BLANK_VALUE;  //course description
    private Integer ClassID = Constants.DEFAULT_INT_VALUE;  //课堂的ClassId
    private Integer CourseID = Constants.DEFAULT_INT_VALUE;//课堂所属课程的 Id
    private String Server = Constants.DEFAULT_BLANK_VALUE; //video 服务器地

    private String MasterName = Constants.DEFAULT_BLANK_VALUE;        //teacher's name
    private Integer MasterID = Constants.DEFAULT_INT_VALUE;  // teacher's id
     private String UserLocation = Constants.DEFAULT_BLANK_VALUE; // 学生所在地区
    private String CourseLogo = Constants.DEFAULT_BLANK_VALUE;    //课程logo的http路径
    private String TeacherLogo = Constants.DEFAULT_BLANK_VALUE;   //老师logo的http路径



     public void initWithSession(CourseClass courseClass){
        if(courseClass.getCourse().getTeacher()!=null){
            this.setMasterID(getEmptyInteger(courseClass.getCourse().getTeacher().getId()));
            this.setMasterName(getEmptyString(courseClass.getCourse().getTeacher().getNickName()));
            this.setTeacherLogo(getEmptyString(courseClass.getCourse().getTeacher().getPic()));
        }
        this.setTitle(getEmptyString(courseClass.getCourse().getName()));
        this.setAbstract(getEmptyString(""));
        this.setContent(getEmptyString(courseClass.getCourse().getDescription()));
        this.setClassID(getEmptyInteger(courseClass.getId()));
        this.setCourseID(getEmptyInteger(courseClass.getCourse().getId()));
        this.setCourseLogo(getEmptyString(courseClass.getCourse().getLogoUrl()));
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

    public Integer getCourseID() {
        return CourseID;
    }

    public void setCourseID(Integer courseID) {
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

    public String getUserLocation() {
        return UserLocation;
    }

    public void setUserLocation(String userLocation) {
        UserLocation = userLocation;
    }

    public String getCourseLogo() {
        return CourseLogo;
    }

    public void setCourseLogo(String courseLogo) {
        CourseLogo = courseLogo;
    }

    public String getTeacherLogo() {
        return TeacherLogo;
    }

    public void setTeacherLogo(String teacherLogo) {
        TeacherLogo = teacherLogo;
    }

    private String getEmptyString(String s) {
           return  s== null ? "": s;
    }
    private Integer getEmptyInteger(Integer s) {
           return  s == null ? 0: s;
    }
}
