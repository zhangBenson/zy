package com.gogowise.action.valueobject;

import com.gogowise.common.utils.Constants;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.live.enity.ShowTerms;
import com.gogowise.rep.user.enity.BaseUser;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-3-8
 * Time: 下午4:02
 * To change this template use File | Settings | File Templates.
 */
public class One2ManyStudentSession {
    private Integer UserID = Constants.DEFAULT_INT_VALUE;
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private String UserLogo = Constants.DEFAULT_USER_LOGO;//Logo url of user
    private Integer Type = Constants.DEFAULT_INT_VALUE;//说明: 公开课是 1，才艺大比拼是2，我的个人秀是3, 个人家教是4
    private String Title = Constants.DEFAULT_BLANK_VALUE; //course name
    private String Abstract = Constants.DEFAULT_BLANK_VALUE; //课程摘要
    private String Content = Constants.DEFAULT_BLANK_VALUE;  //course description
    private Integer ClassID = Constants.DEFAULT_INT_VALUE;  //课堂的ClassId
    private Integer CourseID = Constants.DEFAULT_INT_VALUE;//课堂所属课程的 Id
    private String Server = Constants.DEFAULT_BLANK_VALUE; //video 服务器地

    private String MasterName = Constants.DEFAULT_BLANK_VALUE;        //teacher's name
    private Integer MasterID = Constants.DEFAULT_INT_VALUE;  // teacher's id
    private String UserLocation = Constants.DEFAULT_BLANK_VALUE;



    public void initWithSession(CourseClass courseClass){
        if(courseClass.getCourse().getPersonalTeacher()!=null) this.setType(4);
        this.setTitle(getEmptyString(courseClass.getCourse().getName()));
        //this.setAbstract(getEmptyString(""));
        //this.setContent(getEmptyString(courseClass.getCourse().getDescription()));
        this.setClassID(getEmptyInteger(courseClass.getId()));
        this.setCourseID(getEmptyInteger(courseClass.getCourse().getId()));
        if(courseClass.getCourse().getTeacher()!=null){
           this.setMasterID(getEmptyInteger(courseClass.getCourse().getTeacher().getId()));
           this.setMasterName(getEmptyString(courseClass.getCourse().getTeacher().getNickName()));
        }
    }

    public void initWithSessionForShow(ShowTerms showTerms,BaseUser user){
        this.setUserID(getEmptyInteger(user.getId()));
         this.setUserName(getEmptyString(user.getNickName()));
         this.setType(3);
         this.setTitle(getEmptyString(showTerms.getMyShow().getName()));
         this.setAbstract(getEmptyString(""));
         this.setContent(getEmptyString(showTerms.getMyShow().getDescription()));
         this.setClassID(getEmptyInteger(showTerms.getId()));
         this.setCourseID(getEmptyInteger(showTerms.getMyShow().getId()));
         this.setMasterID(getEmptyInteger(showTerms.getMyShow().getOwner().getId()));
         this.setMasterName(getEmptyString(showTerms.getMyShow().getOwner().getNickName()));
    }
    public Integer getUserID() {
        return UserID;
    }

    public void setUserID(Integer userID) {
        UserID = userID;
    }

    public String getUserLogo() {
        return UserLogo;
    }

    public void setUserLogo(String userLogo) {
        UserLogo = userLogo;
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
    private String getEmptyString(String s) {
           return  s== null ? "": s;
    }
    private Integer getEmptyInteger(Integer s) {
           return  s == null ? 0: s;
    }
}
