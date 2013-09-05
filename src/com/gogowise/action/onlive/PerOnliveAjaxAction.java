package com.gogowise.action.onlive;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.BaseUserDao;
import com.gogowise.dao.UserMattersDao;
import com.gogowise.domain.BaseUser;
import com.gogowise.domain.UserMatters;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "json", type = "json")
})
public class PerOnliveAjaxAction extends BasicAction{
    private BaseUser user;
    private BaseUserDao baseUserDao;
    private UserMattersDao userMattersDao;

    private String userName;
    private String userLogoUrl;
    private Integer personalOnliveID;
    private Integer userMattersID;
    private Boolean perOnliveFinished = false;


    @Action(value = "findUserFanPerOnlive")
    public String findUserFanPerOnlive(){
        user = baseUserDao.findById(this.getSessionUserId());
        UserMatters userMatters = userMattersDao.findByUser(user.getId());
        if(userMatters != null){
            this.setUserName(userMatters.getPersonalOnlive().getOwner().getNickName());
            this.setPersonalOnliveID(userMatters.getPersonalOnlive().getId());
            this.setUserMattersID(userMatters.getId());
            this.setUserLogoUrl(userMatters.getPersonalOnlive().getOwner().getPic());
            if(userMatters.getPersonalOnlive().getFinished() == true){
                this.setPerOnliveFinished(true);
            }
        }
        return "json";
    }

     @JSON(serialize = false)
    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }
     @JSON(serialize = false)
    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
     @JSON(serialize = false)
    public UserMattersDao getUserMattersDao() {
        return userMattersDao;
    }

    public void setUserMattersDao(UserMattersDao userMattersDao) {
        this.userMattersDao = userMattersDao;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getPersonalOnliveID() {
        return personalOnliveID;
    }

    public void setPersonalOnliveID(Integer personalOnliveID) {
        this.personalOnliveID = personalOnliveID;
    }

    public Integer getUserMattersID() {
        return userMattersID;
    }

    public void setUserMattersID(Integer userMattersID) {
        this.userMattersID = userMattersID;
    }

    public Boolean getPerOnliveFinished() {
        return perOnliveFinished;
    }

    public void setPerOnliveFinished(Boolean perOnliveFinished) {
        this.perOnliveFinished = perOnliveFinished;
    }

    public String getUserLogoUrl() {
        return userLogoUrl;
    }

    public void setUserLogoUrl(String userLogoUrl) {
        this.userLogoUrl = userLogoUrl;
    }
}
