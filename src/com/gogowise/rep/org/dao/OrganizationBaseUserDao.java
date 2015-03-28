package com.gogowise.rep.org.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.org.enity.OrganizationBaseUser;
import com.gogowise.rep.user.enity.BaseUser;

import java.util.List;

public interface OrganizationBaseUserDao extends ModelDao<OrganizationBaseUser> {

    List<OrganizationBaseUser> find(Integer orgId, Pagination pagination);

    List<OrganizationBaseUser> findOrgUsers(Integer orgId, Integer roleType, Pagination pagination);

    OrganizationBaseUser findByOrgIdAndUserId(Integer orgId, Integer userId, Integer roleType);

    OrganizationBaseUser findByOrgIdAndEmail(Integer orgId, String email);

    OrganizationBaseUser findByOrgIdAndEmailAndRoleType(Integer orgId, String email, Integer roleTyp);

    OrganizationBaseUser findByEmailAndStatus(String email, Integer status);

    List<OrganizationBaseUser> findByIdAndStatus(Integer id, Short status, Integer roleTyp);

    List<BaseUser> findUsersByOrgIdAndRoleType(Integer orgId, Integer roleType, Pagination pagination);

    List<BaseUser> findLatestUsersByOrgIdAndRoleType(Integer orgId, Integer roleType, Pagination pagination);

    OrganizationBaseUser findMyOrgByUserIdAndRole(Integer userID, Integer roleType);

    List<OrganizationBaseUser> findByUserAndOrg(Integer userID, Integer orgId);

    List<BaseUser> findLatestUsersByRoleType(Integer roleType, Pagination pagination);
}
