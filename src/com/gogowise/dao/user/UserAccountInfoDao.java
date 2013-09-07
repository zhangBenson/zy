package com.gogowise.dao.user;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.finance.UserAccountInfo;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-3
 * Time: 上午9:45
 * To change this template use File | Settings | File Templates.
 */
public interface UserAccountInfoDao extends ModelDao<UserAccountInfo> {
    public UserAccountInfo findByUserId(Integer id);
}
