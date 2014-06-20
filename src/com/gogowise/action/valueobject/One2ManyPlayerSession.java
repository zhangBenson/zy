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
public class One2ManyPlayerSession {
    private Integer UserID = Constants.DEFAULT_INT_VALUE;
    private Integer MasterID = Constants.DEFAULT_INT_VALUE;
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private String MasterName = Constants.DEFAULT_BLANK_VALUE;
    private String UserLogo = Constants.DEFAULT_USER_LOGO;
    private String MasterLogo = Constants.DEFAULT_USER_LOGO;
    private String Abstract = Constants.DEFAULT_BLANK_VALUE; //课程摘要
    private Integer ClassID = Constants.DEFAULT_INT_VALUE;  //课堂的ClassId
    private Integer CourseID = Constants.DEFAULT_INT_VALUE;//课堂所属课程的 Id
    private String Server = Constants.DEFAULT_BLANK_VALUE; //video 服务器地
    private Integer videoVersionId = Constants.DEFAULT_INT_VALUE;
    private String GGame = Constants.DEFAULT_BLANK_VALUE;

    public void initWithSession(CourseClass courseClass){
        this.setAbstract(getEmptyString(""));
        this.setClassID(getEmptyInteger(courseClass.getId()));
        this.setCourseID(getEmptyInteger(courseClass.getCourse().getId()));
        this.setVideoVersionId(courseClass.getVideoVersionId());
        if(courseClass.getCourse().getTeacher()!=null){
            this.setMasterID(getEmptyInteger(courseClass.getCourse().getTeacher().getId()));
            this.setMasterName(getEmptyString(courseClass.getCourse().getTeacher().getNickName()));
            this.setMasterLogo(getEmptyString(courseClass.getCourse().getTeacher().getPic()));
        }
        if (courseClass.getGameExist()) {
            this.setGGame("http://games.gogowise.com/question.html?id=" + courseClass.getGameId());
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

    public String getAbstract() {
        return Abstract;
    }

    public void setAbstract(String anAbstract) {
        Abstract = anAbstract;
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

    public String getMasterLogo() {
        return MasterLogo;
    }

    public void setMasterLogo(String masterLogo) {
        MasterLogo = masterLogo;
    }

    private String getEmptyString(String s) {
           return  s== null ? "": s;
    }
    private Integer getEmptyInteger(Integer s) {
           return  s == null ? 0: s;
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

    public Integer getVideoVersionId() {
        return videoVersionId;
    }

    public String getGGame() {
        return GGame;
    }

    public void setGGame(String GGame) {
        this.GGame = GGame;
    }

    public void setVideoVersionId(Integer videoVersionId) {
        this.videoVersionId = videoVersionId;
    }
}
