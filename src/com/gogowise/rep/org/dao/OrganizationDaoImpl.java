package com.gogowise.rep.org.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.Pagination;
import com.gogowise.common.utils.Utils;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository("organizationDao")
public class OrganizationDaoImpl extends ModelDaoImpl<Organization> implements OrganizationDao {


    public void createOrganization(Organization organization) {
        this.persistAbstract(organization);
    }

    public List<BaseUser> findHotTeacherByOrgId(Integer orgId, Pagination pagination) {

//        String hql = "select distinct ot.teacher from OrganizationTeacher ot, CourseEvaluation ce  where ot.teacher.id = ce.course.teacher.id and  ot.org.id= ?  group by ot.teacher  order by count(ce.id) desc ";
        String hql = "select distinct ot.teacher from OrganizationTeacher ot where  ot.org.id= ?    order by ot.id desc ";
        return this.find(hql, pagination, orgId);

    }


    public List<BaseUser> findLatestTeacherByOrgId(Integer orgId, Pagination pagination) {
        String hql = "select ot.teacher from OrganizationTeacher ot where ot.org.id= ?  order by ot.createDate desc ";
        return this.find(hql, pagination, orgId);
    }


    public Organization findOngoingOrg(Integer userId) {
        String hql = "select o from Organization o where o.responsiblePerson.id = ? and o.confirmed = false    order by o.createDate desc ";
       return this.findFist(hql, userId);
    }

    public List<Organization> findOngoingForAdmin(){
        String hql = "select o from Organization o order by o.id desc ";
        //return this.find(hql);
        List<Organization> orgs = this.find(hql);
        List<Organization> removeDeletedOrgs = this.removeDeletedOrgs(orgs);
        return removeDeletedOrgs;
    }

    public Organization findConfirmedOrg(Integer userId) {
        String hql = "select o from Organization o where o.responsiblePerson.id = ? and o.confirmed = true   order by o.createDate desc ";
        return this.findFist(hql, userId);
    }

    public Organization findByResId(Integer userId) {
        String hql = "select o from Organization o where o.responsiblePerson.id = ? and o.confirmed = true    order by o.createDate desc ";
        return this.findFist(hql, userId);
    }

    public Organization findMyOrg(Integer userId) {
        Organization ret = this.findByResId(userId);
        if (ret != null) return  ret;
        return this.findByOrgTeacherId(userId);
    }

    public Organization findOrganizationByOrganizationName(String name) {
        return this.findFist("From Organization sc where sc.schoolName = ?", name);
    }

    private Organization findByOrgTeacherId(Integer id) {
       return this.findFist("select ot.org From OrganizationTeacher ot where ot.teacher.id = ?", id);
    }

    public Organization findByAuthTeacher(Integer id) {
        return this.findFist("select ot.org From OrganizationTeacher ot where ot.teacher.id = ? and orgRoleType = true"  , id);
    }

    public List<Organization> findLatestOrgs(Pagination pagination) {
        String hql = "From Organization org where org.confirmed = true order by org.createDate desc";
        //return this.find(hql,pagination);
        List<Organization> orgs = this.find(hql,pagination);
        List<Organization> removeDeletedOrgs = this.removeDeletedOrgs(orgs);
        return removeDeletedOrgs;
    }

    public List<Organization> searchOrgs(String searchStr, Pagination pagination) {
        if(searchStr == null || searchStr.equals("")) return this.findLatestOrgs(pagination);
        String hql = "From Organization org where org.confirmed = true and org.schoolName like ? order by org.id desc";
        //return this.find(hql,pagination,"%"+searchStr+"%");
        List<Organization> orgs = this.find(hql,pagination,"%"+searchStr+"%");
        List<Organization> removeDeletedOrgs = this.removeDeletedOrgs(orgs);
        return removeDeletedOrgs;
    }

    public void updateResposerInfo(BaseUser existUser, BaseUser newUser) {
        existUser.setUserName(Utils.getEmptyString(newUser.getUserName()));
        existUser.setSexy(newUser.getSexy());
        existUser.setBirthDay(newUser.getBirthDay());
        existUser.setTelphone(Utils.getEmptyString(newUser.getTelphone()));
//        existUser.setIdCardUrl(Utils.getEmptyString(newUser.getIdCardUrl()));
        this.persistAbstract(existUser);
    }

    public void updateOrgInfo(Organization oldOrg, Organization newOrg) {
        oldOrg.setSchoolName(Utils.getEmptyString(newOrg.getSchoolName()));
        oldOrg.setDescription(Utils.getEmptyString(newOrg.getDescription()));
        oldOrg.setDepositBankName(Utils.getEmptyString(newOrg.getDepositBankName()));
        oldOrg.setDepositBankAccount(Utils.getEmptyString(newOrg.getDepositBankAccount()));
        oldOrg.setDepositName(Utils.getEmptyString(newOrg.getDepositName()));
        oldOrg.setMemberSize(Utils.getEmptyInteger(newOrg.getMemberSize()));
        oldOrg.setMultipleOrg(newOrg.getMultipleOrg());
        this.persistAbstract(oldOrg);
    }

    public void updateOrgContactInfo(Organization oldOrg, Organization newOrg) {
        oldOrg.setContactName(Utils.getEmptyString(newOrg.getContactName()));
        oldOrg.setTelPhone(Utils.getEmptyString(newOrg.getTelPhone()));
        oldOrg.setCellPhone(Utils.getEmptyString(newOrg.getCellPhone()));
        oldOrg.setBusinessAddress(Utils.getEmptyString(newOrg.getBusinessAddress()));
        oldOrg.setZipCode(Utils.getEmptyString(newOrg.getZipCode()));
        this.persistAbstract(oldOrg);
    }

    public List<Organization> removeDeletedOrgs(List<Organization> orgs)
    {
        if(orgs == null) return null;

        List<Organization> result = new ArrayList<Organization>();

        for(Organization org:orgs)
        {
            if( org.getIsDeleted()!= null)
            {
                if(org.getIsDeleted().booleanValue() == true)
                {
                    continue;
                }
            }

            result.add(org);
        }

        return result;
    }

}
