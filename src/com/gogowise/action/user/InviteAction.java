package com.gogowise.action.user;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.user.dao.BaseUserDao;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class InviteAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = 8298811288458899213L;
    private static final String REGEX = "^([a-z0-9A-Z]+[-_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
    private List<String> friendEmails = new ArrayList<String>();
    private BaseUserDao baseUserDao;
    private List<Boolean> checkBox = new ArrayList<Boolean>();
    private Integer sessionId;
    private List<Integer> invitedUsers = new ArrayList<Integer>();


    @Action(value = "initRecomend", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initRecomond") })
    public String initRecomond() {
        friendEmails.clear();
        return SUCCESS;
    }

    public List<Boolean> getCheckBox() {
        return checkBox;
    }

    public void setCheckBox(List<Boolean> checkBox) {
        this.checkBox = checkBox;
    }

    public Integer getSessionId() {
        return sessionId;
    }

    public void setSessionId(Integer sessionId) {
        this.sessionId = sessionId;
    }

    public List<Integer> getInvitedUsers() {
        return invitedUsers;
    }

    public void setInvitedUsers(List<Integer> invitedUsers) {
        this.invitedUsers = invitedUsers;
    }

    public List<String> getFriendEmails() {
        return friendEmails;
    }

    public void setFriendEmails(List<String> friendEmails) {
        this.friendEmails = friendEmails;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
}
