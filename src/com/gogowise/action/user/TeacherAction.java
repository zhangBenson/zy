package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.MD5;
import com.gogowise.rep.finance.UserAccountInfoDao;
import com.gogowise.rep.finance.enity.UserAccountInfo;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * TeacherAction
 *
 * @author 苑永志
 * @version 1.0
 * @since 2014年01月28日 13:41
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class TeacherAction extends BasicAction{
    @Autowired
    private BaseUserDao baseUserDao;
    @Autowired
    private UserAccountInfoDao userAccountInfoDao;
    @Autowired
    private OrganizationDao organizationDao;

    private BaseUser user;
    private UserAccountInfo userAccountInfo;
    private String rePwd;
    private String rePasswordCode;

    @Action(value = "setting", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initUpdate_teacher")})
    public String initUpdate() {
        user = baseUserDao.findById(getSessionUserId());
        userAccountInfo = userAccountInfoDao.findByUserId(this.getSessionUserId());
        return SUCCESS;
    }

    @Action(value = "update_setting", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName","setting"}),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".initUpdate_teacher")})
    public String updateUserInfo() {
        BaseUser _user = baseUserDao.findById(getSessionUserId());
        if(user.getNickName()!=null)
            _user.setNickName(this.user.getNickName());
        if(user.getCardId()!=null)
            _user.setCardId(this.user.getCardId());
        if(user.getPic()!=null)
            _user.setPic(this.user.getPic());
        if(user.getUserName()!=null)
            _user.setUserName(user.getUserName());
        if(StringUtils.isNotBlank(user.getSelfDescription())){
            _user.setSelfDescription(user.getSelfDescription());
        }
        _user.setSexy(user.getSexy());
        UserAccountInfo userAccountInfoForSave = this.userAccountInfoDao.findByUserId(this.getSessionUserId());
        userAccountInfoForSave.setBankName(this.getUserAccountInfo().getBankName());
        userAccountInfoForSave.setDisposeName(this.getUserAccountInfo().getDisposeName());
        userAccountInfoForSave.setBankAccount(this.getUserAccountInfo().getBankAccount());
        userAccountInfoForSave.setUser(_user);
        userAccountInfoDao.persist(userAccountInfoForSave);
        baseUserDao.persistAbstract(_user);
        this.setUser(_user);
        this.setUserAccountInfo(userAccountInfoForSave);
        this.setUserToSession(_user);
        setUserOrg(_user);
        return SUCCESS;
    }

    private void setUserOrg(BaseUser user){
        Organization org = organizationDao.findByResId(user.getId());
        if(org != null){
            ActionContext.getContext().getSession().put(Constants.SESSION_USER_OWN_ORG,org.getSchoolName());
        }
    }

    @Action(value = "yzRePasswordCode", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".yzRePasswordCode"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".findEmailUser")})
    public String yzRePasswordCode() {
        return SUCCESS;
    }

    @Action(value = "reWritePassword", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".reWritePassword"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".yzRePasswordCode")})
    public String reWritePassword() {
        BaseUser _user = baseUserDao.findByEmail(user.getEmail());
        _user.setPassword(MD5.endCode(rePwd));
        baseUserDao.persistAbstract(_user);
        return SUCCESS;
    }

    public void validateUpdateUserInfo() {
        /*String cardId = this.getUser().getCardId();
        if (!(cardId != null && (cardId.length() == 0 || cardId.length() == 15 || cardId.length() == 18))) {
            addFieldError("user.cardId", "身份证号错误");
        }*/
        BaseUser nickNameUser = baseUserDao.findByNickName(StringUtils.trim(user.getNickName()));
        if (nickNameUser != null && !this.getSessionUserId().equals( nickNameUser.getId())) {
            addFieldError("user.nickName", this.getText("member.reg.nickname.exist"));
        }
    }

    public void validateReWritePassword() {
        if (rePwd == null || !rePwd.equals(user.getPassword())) {
            addFieldError("user.password", this.getText("psdNOsame"));
        }
    }

    public void validateYzRePasswordCode() {
        if (rePasswordCode == null || !rePasswordCode.equals(ActionContext.getContext().getSession().get("validationCode"))) {
            addFieldError("rePasswordCode", this.getText("massage.valid.code.error"));
        }
    }


    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public UserAccountInfo getUserAccountInfo() {
        return userAccountInfo;
    }

    public void setUserAccountInfo(UserAccountInfo userAccountInfo) {
        this.userAccountInfo = userAccountInfo;
    }

    public String getRePwd() {
        return rePwd;
    }

    public void setRePwd(String rePwd) {
        this.rePwd = rePwd;
    }

    public String getRePasswordCode() {
        return rePasswordCode;
    }

    public void setRePasswordCode(String rePasswordCode) {
        this.rePasswordCode = rePasswordCode;
    }
}
