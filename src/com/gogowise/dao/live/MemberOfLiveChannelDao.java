package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.live.MemberOfLiveChannel;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-7-16
 * Time: 上午11:35
 * To change this template use File | Settings | File Templates.
 */
public interface MemberOfLiveChannelDao extends ModelDao<MemberOfLiveChannel> {

    public MemberOfLiveChannel findByChannelTermAndEmail(Integer channelTermID,String memberEmail);
}
