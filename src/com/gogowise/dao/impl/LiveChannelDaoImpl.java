package com.gogowise.dao.impl;

import com.gogowise.dao.LiveChannelDao;
import com.gogowise.domain.LiveChannel;
import com.gogowise.domain.Pagination;
import com.gogowise.utils.Utils;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("liveChannelDao")
public class LiveChannelDaoImpl extends ModelDaoImpl<LiveChannel> implements LiveChannelDao{

    public List<LiveChannel> findByUserID(Integer userID, Pagination pagination) {
        String hql = "select distinct lc from LiveChannel lc join lc.channelTermses ct left join ct.memberOfLiveChannels mlc left join lc.onliveFollowers onf where lc.id = ct.liveChannel.id and ( ct.host.id=? or mlc.member.id=? or onf.follower.id=?) and 100 > timestampdiff(minute,ct.startTime ,? ) group by lc order by MIN(ct.startTime) asc ";
        return this.find(hql,pagination,userID,userID,userID, Utils.getCurrentCalender());
    }

    public List<LiveChannel> findUserRegChannel(Integer userID, Pagination pagination) {
        String hql = "select distinct lc from LiveChannel lc join lc.channelTermses ct left join ct.memberOfLiveChannels mlc left join lc.onliveFollowers onf where lc.id = ct.liveChannel.id and ( ct.host.id=? or mlc.member.id=?) group by lc order by lc.createTime desc ";
        return this.find(hql,pagination,userID,userID);
    }

    public List<LiveChannel> findUserFollowed(Integer userID, Pagination pagination) {
        String hql = "select distinct lc from LiveChannel lc join lc.channelTermses ct left join lc.onliveFollowers onf where lc.id = ct.liveChannel.id and onf.follower.id=? group by lc order by lc.createTime desc ";
        return this.find(hql,pagination,userID);
    }

    public List<LiveChannel> findForcastChannel(Pagination pagination) {
        String hql = "select distinct lc from LiveChannel lc join lc.channelTermses ct where lc.id = ct.liveChannel.id and 100 > timestampdiff(minute,ct.startTime ,? ) group by lc order by MIN(ct.startTime) asc ";
        return this.find(hql,pagination,Utils.getCurrentCalender());
    }

    public List<LiveChannel> findMyChannelByID(Integer userID, Pagination pagination) {
        String hql = "From LiveChannel lc where lc.creator.id = ?";
        return this.find(hql,pagination,userID);
    }

    public List<LiveChannel> findAllOwnFutureTermsChannel(Pagination pagination) {
        String hql = "select distinct lc from LiveChannel lc join lc.channelTermses ct left join ct.memberOfLiveChannels mlc where lc.id = ct.liveChannel.id and 100 > timestampdiff(minute,ct.startTime ,? ) group by lc order by MIN(ct.startTime) asc ";
        return this.find(hql,pagination,Utils.getCurrentCalender());
    }

    public List<LiveChannel> findByTermHost(Integer hostID, Pagination pagination) {
        String hql = "select distinct lc from LiveChannel lc join lc.channelTermses ct where lc.id = ct.liveChannel.id and ct.host.id=? group by lc";
        return null;
    }

    public List<LiveChannel> findAllForBidding(Pagination pagination) {
        String hql = "From LiveChannel lc order by lc.totalInviteNum desc";
        return this.find(hql,pagination);
    }

    public List<LiveChannel> findOtherLatest4Channel(Integer myChannelID,Pagination pagination) {
        String hql = "From LiveChannel lc where lc.id != ? order by lc.createTime desc";
        return this.find(hql,pagination,myChannelID);
    }

    public List<LiveChannel> findOwnTermsRecord(Pagination pagination) {
        String hql = "select distinct lc from LiveChannel lc join lc.channelTermses ct where lc.id = ct.liveChannel.id and ct.haveRecord = true order by lc.totalInviteNum desc";
        return this.find(hql,pagination);
    }

    public List<LiveChannel> findLatest4Channel(Pagination pagination) {
        String hql = "From LiveChannel lc order by lc.createTime desc";
        return this.find(hql,pagination);
    }

    public List<LiveChannel> searchLiveChannels(String searchStr, Pagination pagination) {
        if(searchStr == null || searchStr.equals(""))  return this.findAllForBidding(pagination);
        String hql = "From LiveChannel lc where lc.name like ? order by lc.totalInviteNum desc";
        return this.find(hql,pagination,"%"+searchStr+"%");
    }
}
