package com.gogowise.dao.impl;

import com.gogowise.dao.BaseUserDao;
import com.gogowise.dao.UserAccountInfoDao;
import com.gogowise.domain.UserAccountInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-3
 * Time: 上午9:53
 * To change this template use File | Settings | File Templates.
 */
@Repository("userAccountInfoDao")
public class UserAccountInfoDaoImpl extends ModelDaoImpl<UserAccountInfo> implements UserAccountInfoDao {
    private UserAccountInfoDao userAccountInfoDao;
    private BaseUserDao baseUserDao;
    public UserAccountInfo findByUserId(Integer id) {
        List<UserAccountInfo> list =  this.find("select uc from UserAccountInfo uc where uc.user.id = ?", id);
        if (list.size() > 0 )   return list.get(0);
        UserAccountInfo userAccountInfo =  new UserAccountInfo();
        userAccountInfo.setUser( baseUserDao.findById(id));
        userAccountInfoDao.persistAbstract(userAccountInfo);
        return userAccountInfo;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public UserAccountInfoDao getUserAccountInfoDao() {
        return userAccountInfoDao;
    }

    public void setUserAccountInfoDao(UserAccountInfoDao userAccountInfoDao) {
        this.userAccountInfoDao = userAccountInfoDao;
    }
}
