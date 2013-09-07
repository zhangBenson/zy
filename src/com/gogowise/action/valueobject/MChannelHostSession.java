package com.gogowise.action.valueobject;

import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.common.utils.Constants;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-10-18
 * Time: 下午2:31
 * To change this template use File | Settings | File Templates.
 */
public class MChannelHostSession {
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private String UserID = Constants.DEFAULT_BLANK_VALUE;
    private String SubID = Constants.DEFAULT_BLANK_VALUE;  //子频道代号
    private String Server = Constants.DEFAULT_BLANK_VALUE;
    private String SubStatus=Constants.DEFAULT_BLANK_VALUE;

    public void initSession(Integer subChannelID,BaseUser user,String subStatus){
        this.setUserName(user.getNickName());
        this.setUserID(user.getId().toString());
        this.setSubID(subChannelID.toString());
        this.setSubStatus(subStatus);
    }


    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String userID) {
        UserID = userID;
    }

    public String getSubID() {
        return SubID;
    }

    public void setSubID(String subID) {
        SubID = subID;
    }

    public String getServer() {
        return Server;
    }

    public void setServer(String server) {
        Server = server;
    }

    public String getSubStatus() {
        return SubStatus;
    }

    public void setSubStatus(String subStatus) {
        SubStatus = subStatus;
    }
}
