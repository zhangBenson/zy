package com.gogowise.action.valueobject;


import com.gogowise.domain.BaseUser;
import com.gogowise.domain.ChannelTerms;
import com.gogowise.domain.LiveChannel;
import com.gogowise.domain.MemberOfLiveChannel;
import com.gogowise.utils.Constants;
import com.gogowise.utils.Utils;

public class OnliveGuestSession {
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private String UserID = Constants.DEFAULT_BLANK_VALUE;
    private String OnliveID = Constants.DEFAULT_BLANK_VALUE ;
    private String CurrentID = Constants.DEFAULT_BLANK_VALUE;
    private String UserType = Constants.DEFAULT_BLANK_VALUE;  //说明: 0:会员观众；1：匿名观众；2：参与人员类型1,选手；3：参与人员类型2，嘉宾
    private String Title = Constants.DEFAULT_BLANK_VALUE;
    private String Abstract = Constants.DEFAULT_BLANK_VALUE;
    private String Server = Constants.DEFAULT_BLANK_VALUE;
    private String MasterName = Constants.DEFAULT_BLANK_VALUE;
    private String MasterID = Constants.DEFAULT_BLANK_VALUE;
    private String UserLocation = Constants.DEFAULT_BLANK_VALUE;

    public void initWithUserLiveChannel(ChannelTerms channelTerms,BaseUser user){
        this.setUserName(Utils.getEmptyString(user.getNickName()));
        this.setUserID(Utils.getEmptyString(user.getId().toString()));
        this.setOnliveID(Utils.getEmptyString(channelTerms.getId().toString()));
        this.setCurrentID(Utils.getEmptyString(channelTerms.getCurrentID().toString()));
        this.setTitle(Utils.getEmptyString(channelTerms.getSubTitle()));
        this.setAbstract(Utils.getEmptyString(channelTerms.getLiveChannel().getDescription()));
        if(channelTerms.getHost() != null){
             this.setMasterName(Utils.getEmptyString(channelTerms.getHost().getNickName()));
             this.setMasterID(Utils.getEmptyString(channelTerms.getHost().getId().toString()));
        }
        Boolean initType = false;
        for(MemberOfLiveChannel curr : channelTerms.getMemberOfLiveChannels()){
            if(curr.getMember() != null && curr.getMember().getId().equals(user.getId())){
                this.setUserType(curr.getType().toString());
                initType = true;
            }
        }
        if(!initType) this.setUserType("1");
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

    public String getOnliveID() {
        return OnliveID;
    }

    public void setOnliveID(String onliveID) {
        OnliveID = onliveID;
    }

    public String getCurrentID() {
        return CurrentID;
    }

    public void setCurrentID(String currentID) {
        CurrentID = currentID;
    }

    public String getUserType() {
        return UserType;
    }

    public void setUserType(String userType) {
        UserType = userType;
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

    public String getUserLocation() {
        return UserLocation;
    }

    public void setUserLocation(String userLocation) {
        UserLocation = userLocation;
    }
}
