package com.gogowise.action.valueobject;

import com.gogowise.common.utils.Constants;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.live.enity.ShowTerms;
import com.gogowise.rep.user.enity.BaseUser;

public class VirtualClassRoomSession {
    public static final String DEFAULT_CLASS_VER = "1";
    public static final String DEFAULT_STATUS = "0";
    private Integer UserID = Constants.DEFAULT_INT_VALUE;
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private Integer ClassID = Constants.DEFAULT_INT_VALUE;  //课堂的ClassId
    private Integer CourseID = Constants.DEFAULT_INT_VALUE;//课堂所属课程的 Id
    private String Server = Constants.DEFAULT_BLANK_VALUE; //video 服务器地
    private String UserLogo =   Constants.DEFAULT_PERSON_IMAGE;
    private String ClassVer = DEFAULT_CLASS_VER;
    private String Status  = DEFAULT_STATUS;
    private String MasterName = Constants.DEFAULT_BLANK_VALUE;
    private Integer MasterID  = Constants.DEFAULT_INT_VALUE;

    public void initWithSession(CourseClass courseClass){
        this.setClassID(getEmptyInteger(courseClass.getId()));
        this.setCourseID(getEmptyInteger(courseClass.getCourse().getId()));
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

    public String getClassVer() {
        return ClassVer;
    }

    public void setClassVer(String classVer) {
        ClassVer = classVer;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public String getUserLogo() {
        return UserLogo;
    }

    public void setUserLogo(String userLogo) {
        UserLogo = userLogo;
    }

    private String getEmptyString(String s) {
           return  s== null ? "": s;
    }
    private Integer getEmptyInteger(Integer s) {
           return  s == null ? 0: s;
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
}
