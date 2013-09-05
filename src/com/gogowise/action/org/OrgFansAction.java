package com.gogowise.action.org;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.org.OrgFansDao;
import com.gogowise.dao.org.OrganizationDao;
import com.gogowise.domain.OrgFans;
import com.gogowise.domain.Organization;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-10-8
 * Time: 上午11:26
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({@Result(name = "json", type = "json")})
public class OrgFansAction extends BasicAction{
    private BaseUserDao baseUserDao;
    private OrganizationDao organizationDao;
    private OrgFansDao orgFansDao;
    private Organization organization;
    private String message;

    @Action(value = "saveOrgFans")
    public String saveOrgFans(){
         organization = organizationDao.findById(this.getOrganization().getId());
        OrgFans orgFans = orgFansDao.findByOrgAndUser(organization.getId(),this.getSessionUserId());
        if(orgFans != null){
            this.setMessage("You have focused on this organization");
        }else {
            OrgFans ofs = new OrgFans();
            ofs.setOrganization(organization);
            ofs.setFan(baseUserDao.findById(this.getSessionUserId()));
            ofs.setFocusTime(Calendar.getInstance());
            orgFansDao.persistAbstract(ofs);
            organization.setFansNum( organization.getFansNum() == null?1:(organization.getFansNum()+1));
            organizationDao.persistAbstract(organization);
            this.setMessage("Success to focus");
        }
         return "json";
    }



    @JSON(serialize = false)
    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
    @JSON(serialize = false)
    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }
    @JSON(serialize = false)
    public OrgFansDao getOrgFansDao() {
        return orgFansDao;
    }

    public void setOrgFansDao(OrgFansDao orgFansDao) {
        this.orgFansDao = orgFansDao;
    }
   @JSON(serialize = false)
    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
