package com.gogowise.action.valueobject;

import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.common.utils.Constants;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-24
 * Time: 下午1:54
 * To change this template use File | Settings | File Templates.
 */
public class VideoSession {
    private Integer UserID = Constants.DEFAULT_INT_VALUE;
    private Integer MasterID = Constants.DEFAULT_INT_VALUE;
    private Integer ClassID = Constants.DEFAULT_INT_VALUE;
    private Integer CourseID = Constants.DEFAULT_INT_VALUE;
    private String Server = Constants.DEFAULT_BLANK_VALUE;
    private Integer Type = Constants.DEFAULT_INT_VALUE;

    public Integer getUserID() {
        return UserID;
    }

    public void setUserID(Integer userID) {
        UserID = userID;
    }

    public Integer getMasterID() {
        return MasterID;
    }

    public void setMasterID(Integer masterID) {
        MasterID = masterID;
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

    public Integer getType() {
        return Type;
    }

    public void setType(Integer type) {
        Type = type;
    }

    public void initWithSession(CourseClass courseClass) {
        this.setMasterID(getEmptyInteger(courseClass.getCourse().getTeacher().getId()));
        this.setClassID(getEmptyInteger(courseClass.getId()));
        this.setCourseID(getEmptyInteger(courseClass.getCourse().getId()));
        this.setServer("video.gogowise.com");
        this.setType(getEmptyInteger(1));
    }

    //TODO : Removed unused
//    private String getEmptyString(String s) {
//           return  s== null ? "": s;
//    }
    private Integer getEmptyInteger(Integer s) {
        return s == null ? 0 : s;
    }


}
