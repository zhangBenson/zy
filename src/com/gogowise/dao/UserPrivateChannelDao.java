package com.gogowise.dao;

import com.gogowise.domain.UserPrivateChannel;


public interface UserPrivateChannelDao extends ModelDao<UserPrivateChannel>{

    public UserPrivateChannel findByUser(Integer userID);
}
