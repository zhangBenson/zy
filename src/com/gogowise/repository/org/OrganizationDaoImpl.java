package com.gogowise.repository.org;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.domain.org.Organization;
import com.gogowise.domain.Pagination;
import com.gogowise.common.utils.Utils;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("organizationDao")
public class OrganizationDaoImpl extends ModelDaoImpl<Organization> implements OrganizationDao {


    public void createOrganization(Organization organization) {
        this.persistAbstract(organization);
    }

    public List<BaseUser> findHotTeacherByOrgId(Integer orgId, Pagination pagination) {

        String hql = "select distinct ot.teacher from OrganizationTeacher ot, CourseEvaluation ce  where ot.teacher.id = ce.course.teacher.id and  ot.org.id= ?  group by ot.teacher  order by count(ce.id) desc ";
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
        String hql = "select o from Organization o where o.confirmed = false  and o.creator is not null and o.reviewer is null order by o.id desc ";
        return this.find(hql);
    }

    public Organization findConfirmedOrg(Integer userId) {
        String hql = "select o from Organization o where o.responsiblePerson.id = ? and o.confirmed = true    order by o.createDate desc ";
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
        return this.find(hql,pagination);
    }

    public List<Organization> searchOrgs(String searchStr, Pagination pagination) {
        if(searchStr == null || searchStr.equals("")) return this.findLatestOrgs(pagination);
        String hql = "From Organization org where org.confirmed = true and org.schoolName like ? order by org.id desc";
        return this.find(hql,pagination,"%"+searchStr+"%");
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


}
