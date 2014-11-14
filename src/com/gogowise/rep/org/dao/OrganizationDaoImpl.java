package com.gogowise.rep.org.dao;

import com.gogowise.common.utils.Utils;
import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.org.enity.Organization;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository("organizationDao")
public class OrganizationDaoImpl extends ModelDaoImpl<Organization> implements OrganizationDao {


    public Organization findOngoingOrg(Integer userId) {
        String hql = "select o from Organization o where o.responsiblePerson.id = ? and o.confirmed = false    order by o.createDate desc ";
       return this.findFist(hql, userId);
    }

    public List<Organization> findOngoingForAdmin(){
        String hql = "select o from Organization o order by o.id desc ";
        //return this.find(hql);
        List<Organization> orgs = this.find(hql);
        return this.removeDeletedOrgs(orgs);
    }

    public Organization findByResId(Integer userId) {
        String hql = "select o from Organization o where o.responsiblePerson.id = ? and o.confirmed = true    order by o.createDate desc ";
        return this.findFist(hql, userId);
    }


    public Organization findOrganizationByOrganizationName(String name) {
        return this.findFist("From Organization sc where sc.schoolName = ?", name);
    }

    public List<Organization> findLatestOrgs(Pagination pagination) {
        String hql = "From Organization org where org.confirmed = true order by org.createDate desc";
        //return this.find(hql,pagination);
        List orgs = this.find(hql, pagination);
        return this.removeDeletedOrgs(orgs);
    }

    public List<Organization> searchOrgs(String searchStr, Pagination pagination) {
        if(searchStr == null || searchStr.equals("")) return this.findLatestOrgs(pagination);
        String hql = "From Organization org where org.confirmed = true and org.schoolName like ? order by org.id desc";
        //return this.find(hql,pagination,"%"+searchStr+"%");
        List orgs = this.find(hql, pagination, "%" + searchStr + "%");
        return this.removeDeletedOrgs(orgs);
    }


    public void updateOrgContactInfo(Organization oldOrg, Organization newOrg) {
        oldOrg.setContactName(Utils.getEmptyString(newOrg.getContactName()));
        oldOrg.setTelPhone(Utils.getEmptyString(newOrg.getTelPhone()));
        oldOrg.setCellPhone(Utils.getEmptyString(newOrg.getCellPhone()));
        oldOrg.setBusinessAddress(Utils.getEmptyString(newOrg.getBusinessAddress()));
        oldOrg.setZipCode(Utils.getEmptyString(newOrg.getZipCode()));
        this.persistAbstract(oldOrg);
    }

    public Organization findBySecDomain(String secDomain) {
        return this.findFist("From Organization org where org.secDomain = ? ", secDomain);
    }

    public List<Organization> removeDeletedOrgs(List<Organization> orgs)
    {
        if(orgs == null) return null;

        List<Organization> result = new ArrayList<>();

        for(Organization org:orgs)
        {
            if( org.getIsDeleted()!= null)
            {
                if (org.getIsDeleted())
                {
                    continue;
                }
            }

            result.add(org);
        }

        return result;
    }

}
