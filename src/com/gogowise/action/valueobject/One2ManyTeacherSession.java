package com.gogowise.action.valueobject;

import com.gogowise.common.utils.Constants;
import com.gogowise.rep.course.enity.CourseClass;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-3-8
 * Time: 下午4:23
 * To change this template use File | Settings | File Templates.
 */
public class One2ManyTeacherSession {
    private Integer UserID = Constants.DEFAULT_INT_VALUE;
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private String UserLogo = Constants.DEFAULT_USER_LOGO;
    private Integer Type = Constants.DEFAULT_INT_VALUE;//说明: 公开课是 1，才艺大比拼是2，我的个人秀是3, 个人家教是4
    private String Title = Constants.DEFAULT_BLANK_VALUE; //course name
    private String Abstract = Constants.DEFAULT_BLANK_VALUE; //课程摘要
    private String Content = Constants.DEFAULT_BLANK_VALUE;  //course description
    private Integer ClassID = Constants.DEFAULT_INT_VALUE;  //课堂的ClassId
    private Integer CourseID = Constants.DEFAULT_INT_VALUE;//课堂所属课程的 Id
    private String Server = Constants.DEFAULT_BLANK_VALUE; //video 服务器地
    private String UserLocation = Constants.DEFAULT_BLANK_VALUE;
    private String GGame = Constants.DEFAULT_BLANK_VALUE;

    public void initWithSession(CourseClass courseClass){
        if(courseClass.getCourse().getPersonalTeacher()!=null) this.setType(4);
        this.setTitle(getEmptyString(courseClass.getCourse().getName()));
        this.setAbstract(getEmptyString(""));
        //this.setContent(getEmptyString(courseClass.getCourse().getDescription()));
        this.setClassID(getEmptyInteger(courseClass.getId()));
        this.setCourseID(getEmptyInteger(courseClass.getCourse().getId()));
        if (courseClass.getGameExist()) {
            this.setGGame("http://games.gogowise.com/question.html?id=" + this.getGGame());
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

    public String getUserLogo() {
        return UserLogo;
    }

    public void setUserLogo(String userLogo) {
        UserLogo = userLogo;
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

    public String getUserLocation() {
        return UserLocation;
    }

    public void setUserLocation(String userLocation) {
        UserLocation = userLocation;
    }

    public String getGGame() {
        return GGame;
    }

    public void setGGame(String GGame) {
        this.GGame = GGame;
    }

    private String getEmptyString(String s) {
           return  s== null ? "": s;
    }
    private Integer getEmptyInteger(Integer s) {
           return  s == null ? 0: s;
    }
}
