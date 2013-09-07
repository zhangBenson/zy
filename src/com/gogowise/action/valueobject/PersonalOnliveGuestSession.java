package com.gogowise.action.valueobject;

import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.live.enity.PersonalOnlive;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-7-30
 * Time: 上午10:13
 * To change this template use File | Settings | File Templates.
 */
public class PersonalOnliveGuestSession {
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private String UserID = Constants.DEFAULT_BLANK_VALUE;
    private String MasterID = Constants.DEFAULT_BLANK_VALUE;
    private String Sever = Constants.DEFAULT_BLANK_VALUE;
    private String OnliveID = "0";
    private String Status = "1";  //0 匿名 1 登录

    public void initWithGuestData(PersonalOnlive personalOnlive,BaseUser user){
        if(user.getId() == null){
            this.setUserName(user.getNickName());
            this.setStatus("0");
        }else {
            this.setUserName(user.getNickName());
            this.setUserID(user.getId().toString());
        }
        this.setMasterID(Utils.getEmptyString(personalOnlive.getOwner() != null?personalOnlive.getOwner().getId().toString():"0"));
        this.setOnliveID(personalOnlive.getId().toString());
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

    public String getMasterID() {
        return MasterID;
    }

    public void setMasterID(String masterID) {
        MasterID = masterID;
    }

    public String getSever() {
        return Sever;
    }

    public void setSever(String sever) {
        Sever = sever;
    }

    public String getOnliveID() {
        return OnliveID;
    }

    public void setOnliveID(String onliveID) {
        OnliveID = onliveID;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }
}
