package com.gogowise.action.org;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.MD5;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.dao.OrganizationTeacherDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.org.enity.OrganizationBaseUser;
import com.gogowise.rep.org.enity.OrganizationTeacher;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import com.gogowise.rep.user.dao.RoleTypeDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.BaseUserRoleType;
import com.gogowise.rep.user.enity.RoleType;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class OrgAuthAction extends BasicAction {
    private List<OrganizationTeacher> orgTeachers = new ArrayList<OrganizationTeacher>();
    private OrganizationTeacher orgTeacher;
    private Integer orgId;

    private OrganizationTeacherDao organizationTeacherDao;
    private BaseUserDao baseUserDao;
    private BaseUserRoleTypeDao baseUserRoleTypeDao;
    private RoleTypeDao roleTypeDao;
    private OrganizationDao organizationDao;

    @Action(value = "initOrgAuthorization", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgAuthorization"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".orgAuthorization")})
    public String initOrgAuthorization() {
        Organization org = this.organizationDao.findByResId(this.getSessionUserId());
        this.orgTeachers = organizationTeacherDao.find(org.getId(), this.getPagination());
        return SUCCESS;
    }

    @Action(value = "manageStudents", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".studentManage"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".studentManage")})
    public String manageStudents() {
        Organization org = this.organizationDao.findByResId(this.getSessionUserId());
        this.orgTeachers = organizationTeacherDao.find(org.getId(), this.getPagination());
        return SUCCESS;
    }

    @Action(value = "manageTeachers", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".teacherManage"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".teacherManage")})
    public String manageTeachers() {
        Organization org = this.organizationDao.findByResId(this.getSessionUserId());
        this.getPagination().setPageSize(30);
        this.orgTeachers = organizationTeacherDao.find(org.getId(), this.getPagination());
        return SUCCESS;
    }

    @Action(value = "saveOrgAuthorization", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".teacherManage"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".teacherManage")})
    public String saveOrgAuthorization() {
        Organization org = organizationDao.findMyOrg(this.getSessionUserId());
        //判断添加老师是否已经存在
        BaseUser teacher = null;
        BaseUserRoleType baseUserRoleType = null;
        for (OrganizationTeacher ot : orgTeachers) {
            if (ot == null) {
                continue;
            }

            String teacherEmail = ot.getTeacher().getEmail();
            teacher = baseUserDao.findByEmail(teacherEmail);
            //该用户注册过
            if (teacher != null) {
                //判断是否已经是学校的老师了
                this.orgTeacher = organizationTeacherDao.findByOrgIdAndTeacherId(org.getId(), teacher.getId());
                if (orgTeacher != null) {
                    continue;
                }
                teacher.setUserName(ot.getTeacher().getUserName());
                //该用户没   注册过
            } else {
                //设置随机密码，发送至邮件
                teacher = new BaseUser();
                teacher.setEmail(ot.getTeacher().getEmail());
                teacher.setUserName(ot.getTeacher().getUserName());
                teacher.setNickName(ot.getTeacher().getUserName());
                teacher.setLockedOut(true);
                teacher.setRegDate(Calendar.getInstance());
                String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
                teacher.setActiveCode(md5);
                teacher.setLanguage(ActionContext.getContext().getLocale().getLanguage());
                String randomPwd = "123456";
                teacher.setPassword(MD5.endCode(randomPwd));
                //2. 发邮件通知
                String tile = "GoGoWise" + ot.getOrg() + "学校邀请";
                String content = "GoGoWise" + ot.getOrg() + "学校邀请您成为它的老师，帐号为您的邮箱：" + teacherEmail + ",密码为：" + randomPwd + ",点击<a href='http:'>这里</a>接受，点击<a href='#'>这里</a>拒绝";
                EmailUtil.sendMail(teacherEmail, tile, content, null, null);
            }

            //保存老师信息
            baseUserDao.persistAbstract(teacher);

            //添加老师角色信息
            boolean haveTeacherPermission = baseUserRoleTypeDao.havePermission(teacher.getId(), RoleType.TEACHER);
            if (!haveTeacherPermission) {
                baseUserRoleType = new BaseUserRoleType();
                baseUserRoleType.setBaseUser(teacher);
                baseUserRoleType.setRoleType(roleTypeDao.findById(RoleType.ROLE_TYPE_TEACHER));
                baseUserRoleTypeDao.persistAbstract(baseUserRoleType);
            }

            //保存组织老师关系
            ot.setOrg(org);
            ot.setTeacher(teacher);
            ot.setCreateDate(Calendar.getInstance());
            ot.setTeacherStatus(OrganizationBaseUser.USER_STATUS_UNCONFIRMED);
            organizationTeacherDao.persistAbstract(ot);
        }

        this.getPagination().setPageSize(30);
        this.orgTeachers = organizationTeacherDao.find(org.getId(), this.getPagination());
        return SUCCESS;
    }

    public void validateSaveOrgAuthorization() {
        /*Organization org = this.organizationDao.findByResId(this.getSessionUserId());

        BaseUser teacher = baseUserDao.findByEmailAndNickName(this.getOrgTeacher().getTeacher().getEmail(), this.getOrgTeacher().getTeacher().getNickName());
        if (teacher == null) {
            addFieldError("orgTeacher.teacher.email", "用户不存在");

        } else {
            Organization newOrg = organizationDao.findMyOrg(teacher.getId());
            if (newOrg != null && org.getId().equals(newOrg.getId())) {
                addFieldError("orgTeacher.teacher.email", "此用户已加入该组织");
            } else if (newOrg != null && !org.getId().equals(newOrg.getId())) {
                addFieldError("orgTeacher.teacher.email", "此用户已加入其他组织");
            }
        }
        this.orgTeachers = organizationTeacherDao.find(org.getId(), this.getPagination());*/
    }

    public List<OrganizationTeacher> getOrgTeachers() {
        return orgTeachers;
    }

    public void setOrgTeachers(List<OrganizationTeacher> orgTeachers) {
        this.orgTeachers = orgTeachers;
    }

    public OrganizationTeacher getOrgTeacher() {
        return orgTeacher;
    }

    public void setOrgTeacher(OrganizationTeacher orgTeacher) {
        this.orgTeacher = orgTeacher;
    }

    public OrganizationTeacherDao getOrganizationTeacherDao() {
        return organizationTeacherDao;
    }

    public void setOrganizationTeacherDao(OrganizationTeacherDao organizationTeacherDao) {
        this.organizationTeacherDao = organizationTeacherDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public BaseUserRoleTypeDao getBaseUserRoleTypeDao() {
        return baseUserRoleTypeDao;
    }

    public void setBaseUserRoleTypeDao(BaseUserRoleTypeDao baseUserRoleTypeDao) {
        this.baseUserRoleTypeDao = baseUserRoleTypeDao;
    }

    public RoleTypeDao getRoleTypeDao() {
        return roleTypeDao;
    }

    public void setRoleTypeDao(RoleTypeDao roleTypeDao) {
        this.roleTypeDao = roleTypeDao;
    }

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

}
