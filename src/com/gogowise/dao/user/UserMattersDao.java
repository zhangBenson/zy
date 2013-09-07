package com.gogowise.dao.user;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.user.UserMatters;


public interface UserMattersDao extends ModelDao<UserMatters> {

    public UserMatters  findByUser(Integer userID);
}
