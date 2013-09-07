package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.live.enity.UserPrivateChannel;


public interface UserPrivateChannelDao extends ModelDao<UserPrivateChannel> {

    public UserPrivateChannel findByUser(Integer userID);
}
