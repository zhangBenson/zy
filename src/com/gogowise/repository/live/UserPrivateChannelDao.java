package com.gogowise.repository.live;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.live.UserPrivateChannel;


public interface UserPrivateChannelDao extends ModelDao<UserPrivateChannel> {

    public UserPrivateChannel findByUser(Integer userID);
}
