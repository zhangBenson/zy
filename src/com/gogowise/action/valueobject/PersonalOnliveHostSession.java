package com.gogowise.action.valueobject;

import com.gogowise.domain.BaseUser;
import com.gogowise.domain.PersonalOnlive;
import com.gogowise.utils.Constants;
import com.gogowise.utils.Utils;

public class PersonalOnliveHostSession {
    private String UserName = Constants.DEFAULT_BLANK_VALUE;
    private String UserID = Constants.DEFAULT_BLANK_VALUE;
    private String Server = Constants.DEFAULT_BLANK_VALUE;
    private String OnliveID = "0";

    public  void initWithHostData(PersonalOnlive personalOnlive,BaseUser user){
        this.setUserName(Utils.getEmptyString(user.getNickName()));
        this.setUserID(Utils.getEmptyString(user.getId().toString()));
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

    public String getServer() {
        return Server;
    }

    public void setServer(String server) {
        Server = server;
    }

    public String getOnliveID() {
        return OnliveID;
    }

    public void setOnliveID(String onliveID) {
        OnliveID = onliveID;
    }
}
