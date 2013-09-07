package com.gogowise.repository.user;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.user.UserMatters;


public interface UserMattersDao extends ModelDao<UserMatters> {

    public UserMatters  findByUser(Integer userID);
}
