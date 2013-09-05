package com.gogowise.dao.impl;

import com.gogowise.dao.UserFansDao;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.UserFans;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userFansDao")
public class UserFansDaoImpl extends ModelDaoImpl<UserFans> implements UserFansDao{
    public UserFans findByUserAndFans(Integer userID, Integer fanID) {
        String hql = "From UserFans uf where uf.user.id=? and uf.fan.id=?";
        return this.findFist(hql, userID, fanID);
    }

    public List<UserFans> findAllFansForUser(Integer userID,Pagination pagination) {
        String hql = "From UserFans uf where uf.user.id=? order by uf.id asc";
        return this.find(hql,pagination ,userID);
    }

    public List<UserFans> findUsersAsFans(Integer fansID, Pagination pagination) {
        String hql = "From UserFans uf where uf.fan.id=?";
        return this.find(hql,pagination ,fansID);
    }
}

