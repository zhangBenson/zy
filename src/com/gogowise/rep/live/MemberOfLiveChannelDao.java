package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.live.enity.MemberOfLiveChannel;

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
