package com.gogowise.rep.org.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.org.enity.OrganizationBaseUser;
import com.gogowise.rep.user.enity.BaseUser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("organizationBaseUserDao")
public class OrganizationBaseUserDaoImpl extends ModelDaoImpl<OrganizationBaseUser> implements OrganizationBaseUserDao {
    @Override
    public List<OrganizationBaseUser> find(Integer orgId, Pagination pagination) {
        return this.find("From OrganizationBaseUser ot where ot.org.id = ? order by ot.id desc", pagination, orgId);
    }

    @Override
    public List<OrganizationBaseUser> findOrgUsers(Integer orgId, Integer roleType, Pagination pagination) {
        return this.find("From OrganizationBaseUser ot where ot.org.id = ? and ot.roleType=? order by ot.id desc", pagination, orgId, roleType);
    }

    @Override
    public OrganizationBaseUser findByOrgIdAndUserId(Integer orgId, Integer userId, Integer roleType) {
        return this.findFist("From OrganizationBaseUser ot where ot.org.id = ? and ot.user.id=? and ot.roleType=?", orgId, userId, roleType);
    }

    @Override
    public OrganizationBaseUser findByOrgIdAndEmail(Integer orgId, String email) {
        return this.findFist("From OrganizationBaseUser ot where ot.org.id = ? and ot.email=?  ", orgId, email);
    }

    @Override
    public OrganizationBaseUser findByOrgIdAndEmailAndRoleType(Integer orgId, String email, Integer roleTyp) {
        return this.findFist("From OrganizationBaseUser ot where ot.org.id = ? and ot.email=? and ot.roleType=? ", orgId, email, roleTyp);
    }

    @Override
    public OrganizationBaseUser findByEmailAndStatus(String email, Integer status) {
        return this.findFist("From OrganizationBaseUser ot where ot.email=? and ot.userStatus=? ", email, status);
    }

    @Override
    public List<OrganizationBaseUser> findByIdAndStatus(Integer id, Short status, Integer roleTyp) {
        return this.find("From OrganizationBaseUser ot where ot.user.id=? and ot.userStatus=? and  ot.roleType=?  ", id, status, roleTyp);
    }

    @Override
    public List<BaseUser> findUsersByOrgIdAndRoleType(Integer orgId, Integer roleType, Pagination pagination) {
        return find("select ot.user From OrganizationBaseUser ot where ot.org.id = ? and ot.roleType=?", pagination, orgId, roleType);
    }

    @Override
    public List<BaseUser> findLatestUsersByOrgIdAndRoleType(Integer orgId, Integer roleType, Pagination pagination) {
        return find("select ot.user From OrganizationBaseUser ot where ot.org.id = ? and ot.roleType=? order by ot.createDate desc", pagination, orgId, roleType);
    }

    @Override
    public OrganizationBaseUser findMyOrgByUserIdAndRole(Integer userID, Integer roleType) {
        String hql = "From OrganizationBaseUser ot where ot.user.id = ? and ot.roleType=? order by ot.createDate desc";
        return this.findFist(hql, userID, roleType);
    }

    @Override
    public List<OrganizationBaseUser> findByUserAndOrg(Integer userID, Integer orgId) {
        String hql = "From OrganizationBaseUser ot where ot.user.id = ? and  ot.org.id = ?";
        return this.find(hql, userID, orgId);
    }


}
