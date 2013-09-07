package com.gogowise.repository.live;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.live.UserPrivateChannel;
import org.springframework.stereotype.Repository;


@Repository("userPrivateChannelDao")
public class UserPrivateChannelDaoImpl extends ModelDaoImpl<UserPrivateChannel> implements UserPrivateChannelDao{
    public UserPrivateChannel findByUser(Integer userID) {
        String hql = "From UserPrivateChannel upc where upc.user.id = ?";
        return this.findFist(hql,userID);
    }
}
