package com.gogowise.dao.org;

//import com.gogowise.domain.ApplyOrganization;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.BaseUser;
import com.gogowise.domain.Organization;
import com.gogowise.domain.Pagination;
import org.aspectj.weaver.ast.Or;

import java.util.List;


public interface OrganizationDao extends ModelDao<Organization> {
    public void createOrganization(Organization organization);

    public Organization findOrganizationByOrganizationName(String name);

    public Organization findByAuthTeacher(Integer id);

    public Organization findConfirmedOrg(Integer userId);

    public List<BaseUser> findHotTeacherByOrgId(Integer orgId, Pagination pagination);

    public List<BaseUser> findLatestTeacherByOrgId(Integer orgId, Pagination pagination);

    public Organization findOngoingOrg(Integer userId);

    public List<Organization> findOngoingForAdmin();

    public Organization findByResId(Integer userId);

    public Organization findMyOrg(Integer userId);

    public void updateResposerInfo(BaseUser existUser,BaseUser newUser);

    public void updateOrgInfo(Organization oldOrg , Organization newOrg);

    public void updateOrgContactInfo(Organization oldOrg , Organization newOrg);

    public List<Organization> findLatestOrgs(Pagination pagination);

    public List<Organization> searchOrgs(String searchStr , Pagination pagination);
}
