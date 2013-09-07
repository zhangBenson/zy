package com.gogowise.repository.live;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.live.SubPrivateChannel;
import com.gogowise.domain.live.UserPrivateChannel;


public interface SubPrivateChannelDao extends ModelDao<SubPrivateChannel> {

    public SubPrivateChannel findByParentAndChannelID(UserPrivateChannel userPrivateChannel,Integer subChannelID); // 查找私有频道的相应子频道

    public SubPrivateChannel findByUserChannelAndSubChannel(Integer userPrivateChannelID, Integer subChannelNum);// 根据私有频道和子频道号查找该私有频道的相应子频道

}
