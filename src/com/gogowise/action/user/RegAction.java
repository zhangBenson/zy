package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.MD5;
import com.gogowise.rep.org.OrgService;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.UserService;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.RoleType;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Calendar;

@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class RegAction extends BasicAction {

    @Autowired
    private BaseUserDao baseUserDao;
    @Autowired
    private BaseUserRoleTypeDao baseUserRoleTypeDao;
    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private OrgService orgService;

    @Autowired
    private UserService userService;

    private String duplicate;

    private BaseUser user = new BaseUser();
    private String reDirectUrl;
    private String emailBoxUrl;
    private boolean confirmForOrg = false;
    private Organization org;
    private boolean isT = false;


    @Action(value = "easyReg",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".easyReg")}
    )
    public String easyReg() {
        return SUCCESS;
    }

    @Action(value = "easyRegCheck",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}),
                    @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".easyReg"),
                    @Result(name = "redirect", type = "redirect", location = "${reDirectUrl}")}
    )
    public String easyRegCheck() {

        BaseUser localUser = baseUserDao.findByEmail(this.getUser().getEmail());
        if (localUser != null) {
            addFieldError("user.email", this.getText("reEmail"));
            return INPUT;
        }


        user.setEmail(StringUtils.trim(user.getEmail()));
        user.setNickName(StringUtils.trim(user.getNickName()));
        user.setLockedOut(true);
        user.setPassword(MD5.endCode(user.getPassword()));
        user.setRegDate(Calendar.getInstance());
        String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
        user.setActiveCode(md5);
        user.setLanguage(ActionContext.getContext().getLocale().getLanguage());
        baseUserDao.persistAbstract(user);
        if (ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL) == null) {
            sendEmail(user);
        }
        this.emailBoxUrl = EmailUtil.getEmailBoxUrl(user.getEmail());
        setUserToSession(user);
        setUserOrg(user);
        if (StringUtils.isNotBlank(this.getReDirectUrl())) {
            return "redirect";
        }
        return SUCCESS;
    }

    @Action(value = "initReg",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".easyReg")}
    )
    public String initReg() {
        return SUCCESS;
    }

    @Action(value = "initTeacherReg",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".teacherReg")}
    )
    public String initTeacherReg() {
        return SUCCESS;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public String getReDirectUrl() {
        return reDirectUrl;
    }

    public void setReDirectUrl(String reDirectUrl) {
        this.reDirectUrl = reDirectUrl;
    }

    private void setUserOrg(BaseUser user) {
        Organization org = organizationDao.findByResId(user.getId());
        if (org != null) {
            ActionContext.getContext().getSession().put(Constants.SESSION_USER_OWN_ORG, org.getSchoolName());
        }
    }

    public void sendEmail(BaseUser user) {

        String activeUrl = getBasePath() + "/active.html?email=" + user.getEmail() + "&activeCode=" + user.getActiveCode();
        EmailUtil.sendMail(user.getEmail(), this.getText("member.email.validation"), Constants.REG_CSS + this.getText("member.reg.email", new String[]{user.getEmail(), activeUrl, activeUrl, user.getEmail()}), "text/html;charset=utf-8");
    }

    public String getEmailBoxUrl() {
        return emailBoxUrl;
    }

    @Action(value = "reg",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "personalCenter"}),
                    @Result(name = "myFirstPage", type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}),
                    @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".easyReg"),
                    @Result(name = "redirect", type = Constants.RESULT_NAME_REDIRECT, location = "${reDirectUrl}")}
    )
    public String reg() {

        BaseUser localUser = baseUserDao.findByEmail(this.getUser().getEmail());

        user.setEmail(StringUtils.trim(user.getEmail()));
        user.setNickName(StringUtils.trim(user.getNickName()));
        user.setLockedOut(true);
        user.setPassword(MD5.endCode(user.getPassword()));
        user.setRegDate(Calendar.getInstance());
        String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
        user.setActiveCode(md5);
        user.setLanguage(ActionContext.getContext().getLocale().getLanguage());
        String permission;
        if (isT) {
            permission = RoleType.TEACHER;
        } else {
            permission = RoleType.STUDENT;
        }
        userService.regUser(user, permission);

        if (ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL) == null) {
            sendEmail(user);
        }

        this.emailBoxUrl = EmailUtil.getEmailBoxUrl(user.getEmail());
        setUserToSession(user);
        setUserOrg(user);
        if (StringUtils.isNotBlank(this.getReDirectUrl())) {
            return "redirect";
        } else if (userService.havePermission(user.getId(), RoleType.TEACHER)) {
            return "myFirstPage";
        }
        return SUCCESS;
    }

    public void validateReg() {
        if (baseUserDao.findByEmail(StringUtils.trim(user.getEmail())) != null) {
            String reEmail = getText("reEmail");
            addFieldError("user.email", reEmail);
        }
        if (baseUserDao.findByNickName(StringUtils.trim(user.getNickName())) != null) {
            addFieldError("user.nickName", this.getText("member.reg.nickname.exist"));
        }
    }

    public boolean isConfirmForOrg() {
        return confirmForOrg;
    }

    public void setConfirmForOrg(boolean confirmForOrg) {
        this.confirmForOrg = confirmForOrg;
    }

    public Organization getOrg() {
        return org;
    }

    public void setOrg(Organization org) {
        this.org = org;
    }

    public void setEmailBoxUrl(String emailBoxUrl) {
        this.emailBoxUrl = emailBoxUrl;
    }

    public String getDuplicate() {
        return duplicate;
    }

    public void setDuplicate(String duplicate) {
        this.duplicate = duplicate;
    }

    public boolean getIsT() {
        return isT;
    }

    public void setIsT(boolean isT) {
        this.isT = isT;
    }
}
