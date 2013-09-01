package com.gogowise.action.valueobject;

import com.gogowise.domain.BaseUser;
import com.gogowise.domain.SubPrivateChannel;
import com.gogowise.domain.UserPrivateChannel;
import com.gogowise.utils.Constants;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-10-24
 * Time: 上午10:17
 * To change this template use File | Settings | File Templates.
 */
public class MChannelGuestSession {
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private String UserID = Constants.DEFAULT_BLANK_VALUE;
    private String UserType = Constants.DEFAULT_BLANK_VALUE;
    private String Server = Constants.DEFAULT_BLANK_VALUE;
    private String MasterName = Constants.DEFAULT_BLANK_VALUE;
    private String MasterID = Constants.DEFAULT_BLANK_VALUE;
    private String SubID0 = "0";
    private String SubID0Title = Constants.DEFAULT_BLANK_VALUE;
    private String SubID1 = "0";
    private String SubID1Title = Constants.DEFAULT_BLANK_VALUE;
    private String SubID2 = "0";
    private String SubID2Title = Constants.DEFAULT_BLANK_VALUE;
    private String UserLocation = Constants.DEFAULT_BLANK_VALUE;

    public void initSession(UserPrivateChannel  userPrivateChannel,BaseUser user,String userType){
        if(user != null){
            this.setUserName(getEmptyString(user.getNickName()));
            if(user.getId().equals(userPrivateChannel.getUser().getId())){
                  this.setUserID(getEmptyString(user.getId().toString()));
            }else {
                this.setUserID(getEmptyString(user.getId().toString()));
            }
            this.setUserType(getEmptyString(userType));
            this.setMasterName(userPrivateChannel.getUser().getNickName());
            this.setMasterID(userPrivateChannel.getUser().getId().toString());
            for(int i=0; i< userPrivateChannel.getSubPrivateChannels().size();i++){
                  SubPrivateChannel spc = userPrivateChannel.getSubPrivateChannels().get(i);
                  if(i== 0){
                     if(spc.channelFinished())  this.setSubID0("0");
                     else this.setSubID0("1");
                     this.setSubID0Title(getEmptyString(spc.getName()));
                  } else if(i == 1){
                      if(spc.channelFinished())  this.setSubID1("0");
                      else this.setSubID1("1");
                      this.setSubID1Title(getEmptyString(spc.getName()));
                  } else if(i == 2){
                      if(spc.channelFinished())  this.setSubID2("0");
                      else this.setSubID2("1");
                      this.setSubID2Title(getEmptyString(spc.getName()));
                      break;
                  }
            }

        }
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

    public String getUserType() {
        return UserType;
    }

    public void setUserType(String userType) {
        UserType = userType;
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

    public String getMasterID() {
        return MasterID;
    }

    public void setMasterID(String masterID) {
        MasterID = masterID;
    }

    public String getSubID0() {
        return SubID0;
    }

    public void setSubID0(String subID0) {
        SubID0 = subID0;
    }

    public String getSubID0Title() {
        return SubID0Title;
    }

    public void setSubID0Title(String subID0Title) {
        SubID0Title = subID0Title;
    }

    public String getSubID1() {
        return SubID1;
    }

    public void setSubID1(String subID1) {
        SubID1 = subID1;
    }

    public String getSubID1Title() {
        return SubID1Title;
    }

    public void setSubID1Title(String subID1Title) {
        SubID1Title = subID1Title;
    }

    public String getSubID2() {
        return SubID2;
    }

    public void setSubID2(String subID2) {
        SubID2 = subID2;
    }

    public String getSubID2Title() {
        return SubID2Title;
    }

    public void setSubID2Title(String subID2Title) {
        SubID2Title = subID2Title;
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

}
