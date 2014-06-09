package com.gogowise.action.org;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.rep.org.OrgService;
import com.gogowise.rep.org.dao.OrganizationBaseUserDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.org.enity.OrganizationBaseUser;
import com.gogowise.rep.user.UserService;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.RoleType;
import com.gogowise.action.valueobject.ResultData;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
public class OrgBaseUserAction extends BasicAction {
    @Autowired
    private BaseUserDao baseUserDao;
    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private OrganizationBaseUserDao organizationBaseUserDao;

    @Autowired
    private UserService userService;

    @Autowired
    private OrgService orgService;

    private List<OrganizationBaseUser> orgUsers = new ArrayList<>();
    private BaseUser user;
    private Integer roleType;
    private boolean isT;
    private OrganizationBaseUser orgUser;
    private String applicantEmail;

    @Action(value = "manageOrgUsers", results = { @Result(name = RoleType.STUDENT, type = Constants.RESULT_NAME_TILES, location = ".studentManage"), @Result(name = RoleType.TEACHER, type = Constants.RESULT_NAME_TILES, location = ".teacherManage") })
    public String manageOrgUsers() {

        Organization org = this.organizationDao.findByResId(this.getSessionUserId());
        this.orgUsers = organizationBaseUserDao.findOrgUsers(org.getId(), roleType, this.getPagination());
        if (roleType == RoleType.ROLE_TYPE_TEACHER) {
            return RoleType.TEACHER;
        }
        return RoleType.STUDENT;
    }

    @Action(value = "saveOrgUser", results = { @Result(name = RoleType.STUDENT, type = Constants.RESULT_NAME_TILES, location = ".studentManage"), @Result(name = RoleType.TEACHER, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = { "actionName", "manageOrgUsers", "roleType", "${roleType}" }) })
    public String saveOrgUser() throws UnsupportedEncodingException {

        Organization org = orgService.findMyOrg(this.getSessionUserId());
        //判断添加老师是否已经存在
        for (OrganizationBaseUser ou : orgUsers) {
            if (ou == null) {
                continue;
            }

            String userEmail = ou.getEmail();
            BaseUser baseUser = baseUserDao.findByEmail(userEmail);
            OrganizationBaseUser orgUser = organizationBaseUserDao.findByOrgIdAndEmailAndRoleType(org.getId(), userEmail, roleType);

            if (orgUser != null) {
                continue;
            }

            //保存组织用户关系
            ou.setOrg(org);
            ou.setCreateDate(Calendar.getInstance());
            ou.setUserStatus(OrganizationBaseUser.USER_STATUS_UNCONFIRMED);
            ou.setRoleType(roleType);
            organizationBaseUserDao.persistAbstract(ou);

            sendInviteEmail(ou, userEmail, ou.getRealName(), RoleType.ROLE_TYPE_TEACHER.equals(roleType), baseUser != null);
        }

        this.getPagination().setPageSize(30);
        this.orgUsers = organizationBaseUserDao.findOrgUsers(org.getId(), roleType, this.getPagination());
        return RoleType.getRoleNameById(roleType);
    }

    @Action(value = "confirmBaseUserForOrg")
    public String confirmBaseUserForOrg() {

        if (!StringUtils.equalsIgnoreCase(this.getSessionUserEmail(), applicantEmail) || orgUser.getOrg() == null) {
            return COMMON_ERROR;
        }
        if (isT) {
            this.roleType = RoleType.ROLE_TYPE_TEACHER;
        } else {
            this.roleType = RoleType.ROLE_TYPE_STUDENT;
        }

        OrganizationBaseUser exist = organizationBaseUserDao.findByOrgIdAndEmailAndRoleType(orgUser.getOrg().getId(), this.getSessionUserEmail(), roleType);
        if (exist == null && isT) {
            return COMMON_ERROR;
        }

        if (isT && orgService.confirmedOtherOrg(orgUser.getId(), orgUser.getOrg().getId())) {
            addActionError(this.getText("org.apply.teacher.confirm.error"));
            exist.setUserStatus(OrganizationBaseUser.USER_STATUS_UNACCEPTED);
            organizationBaseUserDao.persistAbstract(exist);
            return COMMON_ERROR;
        }

        BaseUser applicant = baseUserDao.findById(this.getSessionUserId());
        exist.setPreviousStatus(exist.getUserStatus());
        exist.setUserStatus(OrganizationBaseUser.USER_STATUS_CONFIRMED);
        exist.setUser(applicant);
        organizationBaseUserDao.persistAbstract(exist);
        userService.grantPermission(applicant, RoleType.getRoleNameById(roleType));
        return redirectToMyCenter(isT);
    }

    private void sendInviteEmail(OrganizationBaseUser ou, String userEmail, String realName, boolean isTeacher, boolean isExist) throws UnsupportedEncodingException {

        //2. 发邮件通知

        String confirmUrl = URLEncoder.encode("/confirmBaseUserForOrg.html?applicantEmail=" + ou.getEmail() + "&orgUser.org.id=" + ou.getOrg().getId() + "&isT=" + isTeacher, "utf-8");
        String url;
        if (isExist) {
            url = getBasePath() + "/easyLogon.html?user.email=" + ou.getEmail() + "&reDirectUrl=" + confirmUrl;
        } else {
            url = getBasePath() + "/initReg.html?user.email=" + ou.getEmail() + "&reDirectUrl=" + confirmUrl;
        }
        String teacherOrStudent = isTeacher ? this.getText("label.teacher") : this.getText("label.student");
        String title = this.getText("org.invite.be.member.title", new String[] { teacherOrStudent });
        String content = this.getText("org.invite.be.member.content", new String[] { realName, ou.getOrg().getSchoolName(), url, userEmail, teacherOrStudent, url });
        EmailUtil.sendMail(userEmail, title, content);
    }

    @Action(value = "deleteUser", results = { @Result(name = SUCCESS, type = "json") })
    public String deleteUser() {

        ResultData<String> rd = new ResultData<String>();
        ActionContext.getContext().getValueStack().push(rd);
        try {

            organizationBaseUserDao.delete(organizationBaseUserDao.findById(orgUser.getId()));
            //不删除角色
            rd.setResult(200);
        } catch (Exception e) {
            rd.setResult(500);
            rd.setMessage("Delete Failure:" + e.getMessage());
            logger.error("Delete Failure", e);
        }
        return SUCCESS;
    }

    @Action(value = "reInviteUser", results = { @Result(name = SUCCESS, type = "json") })
    public String reInviteUser() {

        ResultData<String> rd = new ResultData<String>();
        ActionContext.getContext().getValueStack().push(rd);
        try {
            String email = user.getEmail();
            Organization org = organizationDao.findByResId(getSessionUserId());
            OrganizationBaseUser orgUser = organizationBaseUserDao.findByOrgIdAndEmailAndRoleType(org.getId(), email, roleType);
            //            orgUser.setUserStatus(OrganizationBaseUser.USER_STATUS_UNCONFIRMED);
            organizationBaseUserDao.persistAbstract(orgUser);
            sendInviteEmail(orgUser, email, orgUser.getRealName(), RoleType.ROLE_TYPE_TEACHER.equals(roleType), baseUserDao.findByEmail(email) != null);
            rd.setResult(200);
        } catch (Exception e) {
            rd.setResult(500);
            rd.setMessage("ReInvite Failure:" + e.getMessage());
            logger.error("ReInvite Failure", e);
        }
        return SUCCESS;
    }

    public BaseUser getUser() {

        return user;
    }

    public void setUser(BaseUser user) {

        this.user = user;
    }

    public Integer getRoleType() {

        return roleType;
    }

    public void setRoleType(Integer roleType) {

        this.roleType = roleType;
    }

    public List<OrganizationBaseUser> getOrgUsers() {

        return orgUsers;
    }

    public void setOrgUsers(List<OrganizationBaseUser> orgUsers) {

        this.orgUsers = orgUsers;
    }

    public boolean getIsT() {

        return isT;
    }

    public void setIsT(boolean isT) {

        this.isT = isT;
    }

    public void setOrgUser(OrganizationBaseUser orgUser) {

        this.orgUser = orgUser;
    }

    public void setApplicantEmail(String applicantEmail) {

        this.applicantEmail = applicantEmail;
    }
}
