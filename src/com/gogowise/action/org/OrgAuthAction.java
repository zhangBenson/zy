package com.gogowise.action.org;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.org.OrganizationDao;
import com.gogowise.dao.org.OrganizationTeacherDao;
import com.gogowise.domain.BaseUser;
import com.gogowise.domain.Organization;
import com.gogowise.domain.OrganizationTeacher;
import com.gogowise.utils.Constants;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class OrgAuthAction  extends BasicAction {
    private List<OrganizationTeacher> orgTeachers = new ArrayList<OrganizationTeacher>();
    private OrganizationTeacher orgTeacher;
    private Integer orgId;

    private OrganizationTeacherDao organizationTeacherDao;
    private BaseUserDao baseUserDao;
    private OrganizationDao organizationDao;

    @Action(value="initOrgAuthorization",results = {@Result(name=SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".orgAuthorization"),
            @Result(name=INPUT,type = Constants.RESULT_NAME_TILES, location = ".orgAuthorization")})
    public String initOrgAuthorization() {
        Organization org = this.organizationDao.findByResId(this.getSessionUserId());
        this.orgTeachers = organizationTeacherDao.find(org.getId(), this.getPagination());
        return SUCCESS;
    }


    @Action(value="saveOrgAuthorization",results = {@Result(name=SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".orgAuthorization"),
            @Result(name=INPUT,type = Constants.RESULT_NAME_TILES, location = ".orgAuthorization")})
    public String saveOrgAuthorization(){
        BaseUser teacher = baseUserDao.findByEmailAndNickName(this.getOrgTeacher().getTeacher().getEmail(), this.getOrgTeacher().getTeacher().getNickName());
        this.orgTeacher.setTeacher( teacher);
        Organization org = organizationDao.findMyOrg(this.getSessionUserId());
        this.orgTeacher.setOrg(org);
        organizationTeacherDao.persistAbstract(orgTeacher);
        this.orgTeachers = organizationTeacherDao.find(org.getId(), this.getPagination());
        return SUCCESS;
    }

    public void validateSaveOrgAuthorization() {
        Organization org = this.organizationDao.findByResId(this.getSessionUserId());

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
        this.orgTeachers = organizationTeacherDao.find(org.getId(), this.getPagination());
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
