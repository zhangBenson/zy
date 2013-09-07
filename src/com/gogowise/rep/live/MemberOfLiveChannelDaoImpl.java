package com.gogowise.rep.live;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.live.live.MemberOfLiveChannel;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-7-16
 * Time: 上午11:36
 * To change this template use File | Settings | File Templates.
 */
@Repository("memberOfLiveChannelDao")
public class MemberOfLiveChannelDaoImpl extends ModelDaoImpl<MemberOfLiveChannel> implements MemberOfLiveChannelDao{
    public MemberOfLiveChannel findByChannelTermAndEmail(Integer channelTermID, String memberEmail) {
        String hql = "From MemberOfLiveChannel mlc where mlc.channelTerms.id=? and mlc.memberEmail=?";
        return this.findFist(hql,channelTermID,memberEmail);
    }
}
