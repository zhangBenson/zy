package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.org.OrganizationDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.MD5;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Calendar;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({@Result(name = "json", type = "json")})
public class UserAjaxLoginAction extends BasicAction{
    private OrganizationDao organizationDao;
    private BaseUserDao baseUserDao;
    private BaseUser user;
    private String loginMessage;

    @Action(value = "ajaxLogin")
    public String ajaxLogin(){
        if(validateUserInfo(this.getUser().getEmail())){
            BaseUser user = baseUserDao.findByEmail(this.getUser().getEmail());
            setUserToSession(user);
            setUserOrg(user);
            user.setLastLoginDate(Calendar.getInstance());
            baseUserDao.persistAbstract(user);
            this.setLoginMessage("success");
        }
        return "json";
    }

    private Boolean validateUserInfo(String userEmail){
        BaseUser user = baseUserDao.findByEmail(userEmail);
        if (user == null) {
            this.setLoginMessage(this.getText("message.logon.account.not.exist"));
            return false;
        } else if (!user.getPassword().equals(MD5.endCode(this.user.getPassword()))) {
            this.setLoginMessage(this.getText("message.logon.password.error"));
            return false;
        }
        return true;

    }

        private void setUserOrg(BaseUser user){
        Organization org = organizationDao.findByResId(user.getId());
        if(org != null){
           ActionContext.getContext().getSession().put(Constants.SESSION_USER_OWN_ORG,org.getSchoolName());
        }
    }

     @JSON(serialize = false)
    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    @JSON(serialize = false)
    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    @JSON(serialize = false)
    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public String getLoginMessage() {
        return loginMessage;
    }

    public void setLoginMessage(String loginMessage) {
        this.loginMessage = loginMessage;
    }
}
