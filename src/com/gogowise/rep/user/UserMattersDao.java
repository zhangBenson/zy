package com.gogowise.rep.user;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.user.UserMatters;


public interface UserMattersDao extends ModelDao<UserMatters> {

    public UserMatters  findByUser(Integer userID);
}
