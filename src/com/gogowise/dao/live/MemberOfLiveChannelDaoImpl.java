package com.gogowise.dao.live;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.MemberOfLiveChannel;
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
