package com.gogowise.rep.live;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.live.live.UserPrivateChannel;
import org.springframework.stereotype.Repository;


@Repository("userPrivateChannelDao")
public class UserPrivateChannelDaoImpl extends ModelDaoImpl<UserPrivateChannel> implements UserPrivateChannelDao{
    public UserPrivateChannel findByUser(Integer userID) {
        String hql = "From UserPrivateChannel upc where upc.user.id = ?";
        return this.findFist(hql,userID);
    }
}
