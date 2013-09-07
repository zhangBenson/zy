package com.gogowise.action.higsec;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.user.BaseUserRoleTypeDao;
import com.gogowise.dao.user.RoleTypeDao;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.domain.user.BaseUserRoleType;
import com.gogowise.domain.user.RoleType;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class UserRoleForBackendAction extends BasicAction {

    private RoleTypeDao roleTypeDao;
    private BaseUserRoleTypeDao baseUserRoleTypeDao;
    private BaseUserDao baseUserDao;
    private String email;
    private Map<Integer, String> roles = new HashMap<Integer, String>();
    private List<Integer> myRoles = new ArrayList<Integer>();
    private BaseUser user;

    @Action(value = "higSecInitGrantPermission", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".higSecInitGrantPermission"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "easyLogon"})})
    public String higSecInitGrantPermission() {
        if (!baseUserRoleTypeDao.havePermission(baseUserDao.findByEmail((String) ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL)).getId(), "grant"))  return INPUT;
        user = baseUserDao.findByEmail(this.email);
        List<RoleType> roleTypes = roleTypeDao.findAll();
        for (RoleType type : roleTypes) {
            roles.put(type.getId(), type.getRoleName());
        }

        List<BaseUserRoleType> baseUserRoleTypes = baseUserRoleTypeDao.findByUserId(user.getId());
        for (BaseUserRoleType baseUserRoleType : baseUserRoleTypes) {
            myRoles.add(baseUserRoleType.getRoleType().getId());
        }
        return SUCCESS;
    }

    @Action(value = "higSecGrantPermission", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "higSecInitGrantPermission", "email","${email}"}),
            @Result(name = INPUT, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "easyLogon"})})
    public String higSecGrantPermission() {
        if (!baseUserRoleTypeDao.havePermission(baseUserDao.findByEmail((String) ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL)).getId(), "grant"))  return INPUT;
        user = baseUserDao.findByEmail(this.email);
        List<BaseUserRoleType> baseUserRoleTypes = baseUserRoleTypeDao.findByUserId(user.getId());


        for (BaseUserRoleType baseUserRoleType : baseUserRoleTypes) {
            if (!myRoles.contains( baseUserRoleType.getRoleType().getId())) {
                baseUserRoleTypeDao.delete(baseUserRoleType);
            }
        }
        for (Integer roleId : myRoles) {
            boolean  exist = false;
            for (BaseUserRoleType baseUserRoleType : baseUserRoleTypes) {
                if (baseUserRoleType.getRoleType().getId().equals(roleId)) {
                    exist = true;
                }
            }
            if (!exist) {
                BaseUserRoleType baseUserRoleTypeForSave = new BaseUserRoleType();
                baseUserRoleTypeForSave.setBaseUser(user);
                baseUserRoleTypeForSave.setRoleType(roleTypeDao.findById(roleId));
                baseUserRoleTypeDao.persist(baseUserRoleTypeForSave);
            }
        }

        return SUCCESS;
    }

    @Action(value = "higSecSendEmailByAdmin", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".higSecSendEmailByAdmin")})
    public String higSecSendEmailByAdmin() {

        if (this.user != null && this.user.getEmail() != null)
        EmailUtil.sendMail(this.user.getEmail(),this.user.getNickName(),this.user.getPassword());
        return SUCCESS;
    }


    public RoleTypeDao getRoleTypeDao() {
        return roleTypeDao;
    }

    public void setRoleTypeDao(RoleTypeDao roleTypeDao) {
        this.roleTypeDao = roleTypeDao;
    }

    public BaseUserRoleTypeDao getBaseUserRoleTypeDao() {
        return baseUserRoleTypeDao;
    }

    public void setBaseUserRoleTypeDao(BaseUserRoleTypeDao baseUserRoleTypeDao) {
        this.baseUserRoleTypeDao = baseUserRoleTypeDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Map<Integer, String> getRoles() {
        return roles;
    }

    public void setRoles(Map<Integer, String> roles) {
        this.roles = roles;
    }

    public List<Integer> getMyRoles() {
        return myRoles;
    }

    public void setMyRoles(List<Integer> myRoles) {
        this.myRoles = myRoles;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }
}
