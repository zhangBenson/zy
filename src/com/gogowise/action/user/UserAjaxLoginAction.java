package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.MD5;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.RoleType;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Calendar;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class UserAjaxLoginAction extends BasicAction{
    @Autowired
    private BaseUserRoleTypeDao baseUserRoleTypeDao;
    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private BaseUserDao baseUserDao;

    private BaseUser user;
    private String loginMessage;


    @Action(value = "ajaxLogin",results = {@Result(name = SUCCESS,type = "json")})
    public String ajaxLogin(){
        if(validateUserInfo(this.getUser().getEmail())){
            BaseUser user = baseUserDao.findByEmail(this.getUser().getEmail());
            setUserToSession(user);
            setUserOrg(user);
            user.setLastLoginDate(Calendar.getInstance());
            baseUserDao.persistAbstract(user);

            if (baseUserRoleTypeDao.havePermission(user.getId(), RoleType.TEACHER)) {
                ActionContext.getContext().getSession().put(Constants.SESSION_USER_IS_TEACHER, true);
            }

            this.setLoginMessage("success");
        }

        ActionContext.getContext().getValueStack().push(loginMessage);
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
