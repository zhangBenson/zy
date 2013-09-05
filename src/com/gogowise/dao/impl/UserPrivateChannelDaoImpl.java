package com.gogowise.dao.impl;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.UserPrivateChannelDao;
import com.gogowise.domain.UserPrivateChannel;
import org.springframework.stereotype.Repository;


@Repository("userPrivateChannelDao")
public class UserPrivateChannelDaoImpl extends ModelDaoImpl<UserPrivateChannel> implements UserPrivateChannelDao{
    public UserPrivateChannel findByUser(Integer userID) {
        String hql = "From UserPrivateChannel upc where upc.user.id = ?";
        return this.findFist(hql,userID);
    }
}
