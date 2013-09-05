package com.gogowise.dao;

import com.gogowise.domain.UserMatters;


public interface UserMattersDao extends ModelDao<UserMatters>{

    public UserMatters  findByUser(Integer userID);
}
