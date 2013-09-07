package com.gogowise.action.valueobject;

import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.live.enity.PersonalOnlive;
import com.gogowise.common.utils.Constants;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-8-6
 * Time: 下午12:19
 * To change this template use File | Settings | File Templates.
 */
public class PerOnliveVideoSession {
    private String UserID = Constants.DEFAULT_BLANK_VALUE;
    private String MasterID = Constants.DEFAULT_BLANK_VALUE;
    private String ClassID = Constants.DEFAULT_BLANK_VALUE;
    private String CourseID = Constants.DEFAULT_BLANK_VALUE;
    private String Server = Constants.DEFAULT_BLANK_VALUE;
    private String Type = Constants.DEFAULT_BLANK_VALUE;

    public void initWithPerOnliveData(PersonalOnlive personalOnlive,BaseUser user){
        this.setUserID(user != null ?user.getId().toString():"0");
        this.setMasterID(personalOnlive.getOwner().getId().toString());
        this.setClassID("0");
        this.setCourseID(personalOnlive.getId().toString());
        this.setServer("video.gogowise.com");
        this.setType("1");
    }


    public String getUserID() {
        return UserID;
    }

    public void setUserID(String userID) {
        UserID = userID;
    }

    public String getMasterID() {
        return MasterID;
    }

    public void setMasterID(String masterID) {
        MasterID = masterID;
    }

    public String getClassID() {
        return ClassID;
    }

    public void setClassID(String classID) {
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

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }
}
