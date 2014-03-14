package com.gogowise.action.org;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.MD5;
import com.gogowise.rep.org.dao.OrganizationBaseUserDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.org.enity.OrganizationBaseUser;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import com.gogowise.rep.user.dao.RoleTypeDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.BaseUserRoleType;
import com.gogowise.rep.user.enity.RoleType;
import com.gogowise.vo.ResultData;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

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
    private BaseUserRoleTypeDao baseUserRoleTypeDao;
    @Autowired
    private RoleTypeDao roleTypeDao;

    private List<OrganizationBaseUser> orgUsers;
    private BaseUser user;
    private Integer roleType;

    @Action(value="manageOrgUsers",results = {@Result(name=RoleType.STUDENT,type = Constants.RESULT_NAME_TILES, location = ".studentManage"),
            @Result(name=RoleType.TEACHER,type = Constants.RESULT_NAME_TILES, location = ".teacherManage")})
    public String manageOrgUsers() {
        Organization org = this.organizationDao.findByResId(this.getSessionUserId());
        this.orgUsers = organizationBaseUserDao.findOrgUsers(org.getId(),roleType,this.getPagination());
        if(roleType==Constants.ROLE_TYPE_TEACHER){
            return RoleType.TEACHER;
        }
        return RoleType.STUDENT;
    }

    @Action(value="saveOrgUser",results = {@Result(name = RoleType.STUDENT,type = Constants.RESULT_NAME_TILES, location = ".studentManage"),
            @Result(name=RoleType.TEACHER,type = Constants.RESULT_NAME_TILES, location = ".teacherManage")})
    public String saveOrgUser(){
        Organization org = organizationDao.findMyOrg(this.getSessionUserId());
        //判断添加老师是否已经存在
        BaseUser baseUser = null;
        BaseUserRoleType baseUserRoleType = null;
        OrganizationBaseUser orgUser = null;
        for(OrganizationBaseUser ou : orgUsers){
            if(ou==null){
                continue;
            }

            String userEmail = ou.getUser().getEmail();
            baseUser = baseUserDao.findByEmail(userEmail);
            //该用户注册过
            if(baseUser!=null){
                //判断该用户是否已经属于该学校
                orgUser = organizationBaseUserDao.findByOrgIdAndUserId(org.getId(),baseUser.getId(),roleType);
                if(orgUser!=null){
                    continue;
                }
                baseUser.setUserName(ou.getUser().getUserName());
                //该用户没   注册过
            }else{
                //设置随机密码，发送至邮件
                baseUser = new BaseUser();
                baseUser.setEmail(ou.getUser().getEmail());
                baseUser.setUserName(ou.getUser().getUserName());
                baseUser.setNickName(ou.getUser().getUserName());
                baseUser.setLockedOut(true);
                baseUser.setRegDate(Calendar.getInstance());
                String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
                baseUser.setActiveCode(md5);
                baseUser.setLanguage(ActionContext.getContext().getLocale().getLanguage());
                String randomPwd = "123456";
                baseUser.setPassword(MD5.endCode(randomPwd));
                //2. 发邮件通知
                String tile = "GoGoWise"+org.getSchoolName()+"学校邀请";
                //TODO: 邮件内容待确认
                String content = "GoGoWise" + org.getSchoolName() + "学校邀请您成为它的老师，帐号为您的邮箱：" + userEmail + ",密码为：" + randomPwd;
//                        +",点击<a href='http:'>这里</a>接受，点击<a href='#'>这里</a>拒绝";
                EmailUtil.sendMail(userEmail, tile, content, null, null);
            }

            //保存老师信息
            baseUserDao.persistAbstract(baseUser);

            //添加用户角色信息
            boolean haveTeacherPermission = baseUserRoleTypeDao.havePermission(baseUser.getId(), RoleType.getRoleNameById(roleType));
            if(!haveTeacherPermission){
                baseUserRoleType = new BaseUserRoleType();
                baseUserRoleType.setBaseUser(baseUser);
                baseUserRoleType.setRoleType(roleTypeDao.findById(roleType));
                baseUserRoleTypeDao.persistAbstract(baseUserRoleType);
            }

            //保存组织用户关系
            ou.setOrg(org);
            ou.setUser(baseUser);
            ou.setCreateDate(Calendar.getInstance());
            ou.setUserStatus(Constants.USER_STATUS_UNCONFIRMED);
            ou.setRoleType(roleType);
            organizationBaseUserDao.persistAbstract(ou);
        }

        this.getPagination().setPageSize(30);
        this.orgUsers = organizationBaseUserDao.findOrgUsers(org.getId(), roleType, this.getPagination());
        return RoleType.getRoleNameById(roleType);
    }

    @Action(value = "disableUser", results = {@Result(name = SUCCESS, type = "json")})
    public String disableUser() {
        ResultData<String> rd = new ResultData<String>();
        ActionContext.getContext().getValueStack().push(rd);
        try {
            BaseUser baseUser = baseUserDao.findByEmail(user.getEmail());
            Organization org = organizationDao.findByResId(getSessionUserId());
            OrganizationBaseUser orgUser = organizationBaseUserDao.findByOrgIdAndUserId(org.getId(), baseUser.getId(),roleType);
            orgUser.setPreviousStatus(orgUser.getUserStatus());
            orgUser.setUserStatus(Constants.USER_STATUS_DISABLED);
            organizationBaseUserDao.persistAbstract(orgUser);
            rd.setResult(200);
        } catch (Exception e) {
            rd.setResult(500);
            rd.setMessage("Disable Failure:" + e.getMessage());
            logger.error("Disable Failure",e);
        }
        return SUCCESS;
    }

    @Action(value = "enableUser", results = {@Result(name = SUCCESS, type = "json")})
    public String enableUser() {
        ResultData<String> rd = new ResultData<String>();
        ActionContext.getContext().getValueStack().push(rd);
        try {
            BaseUser baseUser = baseUserDao.findByEmail(user.getEmail());
            Organization org = organizationDao.findByResId(getSessionUserId());
            OrganizationBaseUser orgUser = organizationBaseUserDao.findByOrgIdAndUserId(org.getId(), baseUser.getId(), roleType);
            orgUser.setUserStatus(orgUser.getPreviousStatus());
            organizationBaseUserDao.persistAbstract(orgUser);
            rd.setResult(200);
            rd.setData(String.valueOf(orgUser.getPreviousStatus()));
        } catch (Exception e) {
            rd.setResult(500);
            rd.setMessage("Enable Failure:" + e.getMessage());
            logger.error("Enable Failure",e);
        }
        return SUCCESS;
    }

    @Action(value = "deleteUser", results = {@Result(name = SUCCESS, type = "json")})
    public String deleteUser() {
        ResultData<String> rd = new ResultData<String>();
        ActionContext.getContext().getValueStack().push(rd);
        try {
            BaseUser baseUser = baseUserDao.findByEmail(user.getEmail());
            Organization org = organizationDao.findByResId(getSessionUserId());
            OrganizationBaseUser orgUser = organizationBaseUserDao.findByOrgIdAndUserId(org.getId(), baseUser.getId(),roleType);
            //删除用户
            organizationBaseUserDao.delete(orgUser);
            //不删除角色
            rd.setResult(200);
        } catch (Exception e) {
            rd.setResult(500);
            rd.setMessage("Delete Failure:" + e.getMessage());
            logger.error("Delete Failure",e);
        }
        return SUCCESS;
    }
    @Action(value = "reInviteUser", results = {@Result(name = SUCCESS, type = "json")})
    public String reInviteUser() {
        ResultData<String> rd = new ResultData<String>();
        ActionContext.getContext().getValueStack().push(rd);
        try {
            BaseUser student = baseUserDao.findByEmail(user.getEmail());
            Organization org = organizationDao.findByResId(getSessionUserId());
            OrganizationBaseUser orgUser = organizationBaseUserDao.findByOrgIdAndUserId(org.getId(), student.getId(), roleType);
            orgUser.setUserStatus(Constants.USER_STATUS_UNCONFIRMED);
            organizationBaseUserDao.persistAbstract(orgUser);
            rd.setResult(200);
        } catch (Exception e) {
            rd.setResult(500);
            rd.setMessage("ReInvite Failure:" + e.getMessage());
            logger.error("ReInvite Failure",e);
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
}
