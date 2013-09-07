package com.gogowise.action.valueobject;

import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.live.enity.ChannelTerms;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;


public class OnLiveHostSession {
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private String UserID = Constants.DEFAULT_BLANK_VALUE;
    private String OnliveID = Constants.DEFAULT_BLANK_VALUE ;
    private String CurrentID = Constants.DEFAULT_BLANK_VALUE;
    private String Title = Constants.DEFAULT_BLANK_VALUE;
    private String Abstract = Constants.DEFAULT_BLANK_VALUE;
    private String Server = Constants.DEFAULT_BLANK_VALUE;
    private String UserLocation = Constants.DEFAULT_BLANK_VALUE;

    public void initWithUserLiveChannel(ChannelTerms channelTerms,BaseUser user){
        this.setUserName(Utils.getEmptyString(user.getNickName()));
        this.setUserID(Utils.getEmptyString(user.getId().toString()));
        this.setOnliveID(Utils.getEmptyString(channelTerms.getId().toString()));
        this.setCurrentID(Utils.getEmptyString(channelTerms.getCurrentID().toString()));
        this.setTitle(Utils.getEmptyString(channelTerms.getSubTitle()));
        this.setAbstract(Utils.getEmptyString(channelTerms.getLiveChannel().getDescription()));
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

    public String getUserLocation() {
        return UserLocation;
    }

    public void setUserLocation(String userLocation) {
        UserLocation = userLocation;
    }
}
