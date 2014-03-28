package com.gogowise.rep.org.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.org.enity.OrganizationBaseUser;
import com.gogowise.rep.user.enity.BaseUser;

import java.util.List;

public interface OrganizationBaseUserDao extends ModelDao<OrganizationBaseUser> {

    List<OrganizationBaseUser> find(Integer orgId, Pagination pagination);

    List<OrganizationBaseUser> findOrgUsers(Integer orgId,Integer roleType,Pagination pagination);

    OrganizationBaseUser findByOrgIdAndUserId(Integer orgId, Integer userId,Integer roleType);

    OrganizationBaseUser findByOrgIdAndEmail(Integer orgId, String email);

    public OrganizationBaseUser findByOrgIdAndEmailAndRoleType(Integer orgId, String email, Integer roleTyp);

    List<BaseUser> findUsersByOrgIdAndRoleType(Integer orgId,Integer roleType,Pagination pagination);

    List<BaseUser> findLatestUsersByOrgIdAndRoleType(Integer orgId, Integer roleType, Pagination pagination);

    OrganizationBaseUser findMyOrgByUserID(Integer userID, Integer roleType);
}
