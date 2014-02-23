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
    public List<OrganizationBaseUser> findOrgUsers(Integer orgId, Integer roleType,Pagination pagination) {
        return this.find("From OrganizationBaseUser ot where ot.org.id = ? and ot.roleType=? order by ot.id desc",pagination,orgId,roleType);
    }

    @Override
    public OrganizationBaseUser findByOrgIdAndUserId(Integer orgId, Integer userId,Integer roleType) {
        return this.findFist("From OrganizationBaseUser ot where ot.org.id = ? and ot.user.id=? and ot.roleType=?", orgId, userId,roleType);
    }

    @Override
    public List<BaseUser> findUsersByOrgIdAndRoleType(Integer orgId, Integer roleType, Pagination pagination) {
        return find("select ot.user From OrganizationBaseUser ot where ot.org.id = ? and ot.roleType=?",pagination,orgId,roleType);
    }

}
