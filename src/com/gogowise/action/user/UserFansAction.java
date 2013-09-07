package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.user.UserFansDao;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.domain.live.UserFans;
import com.gogowise.common.utils.Utils;
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
@Results({@Result(name = "json", type = "json")})
public class UserFansAction extends BasicAction{
    private BaseUser user;
    private BaseUserDao baseUserDao;
    private UserFansDao userFansDao;
    private UserFans userFans;
    private String message;


    @Action(value = "addUserFocus")
    public String addUserFocus(){
        if(!this.getUser().getId().equals(this.getSessionUserId())){
            userFans = userFansDao.findByUserAndFans(this.getUser().getId(),this.getSessionUserId());
            if(userFans == null){
                user = baseUserDao.findById(this.getUser().getId());
                BaseUser fan = baseUserDao.findById(this.getSessionUserId());
                UserFans uf = new UserFans();
                uf.setUser(user);
                uf.setFan(fan);
                uf.setFocusTime(Utils.getCurrentCalender());
                userFansDao.persistAbstract(uf);
                user.setFansNum(user.getFansNum() == null? 1: (user.getFansNum()+1));
                baseUserDao.persistAbstract(user);
                this.setMessage("Success to focus");
            }else {
               this.setMessage("You have focused on this user");
            }
        }else {
            this.setMessage("Sorry,You can't focus on yourself");
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
    public UserFansDao getUserFansDao() {
        return userFansDao;
    }

    public void setUserFansDao(UserFansDao userFansDao) {
        this.userFansDao = userFansDao;
    }
    @JSON(serialize = false)
    public UserFans getUserFans() {
        return userFans;
    }

    public void setUserFans(UserFans userFans) {
        this.userFans = userFans;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
