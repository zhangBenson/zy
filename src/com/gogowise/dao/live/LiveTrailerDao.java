package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.*;
import com.gogowise.utils.Utils;
import org.springframework.stereotype.Repository;

import java.util.List;



public interface LiveTrailerDao extends ModelDao<LiveTrailer> {

    public List<LiveTrailer> findByPublishTime(Pagination pagination);

    @Repository("liveChannelCommentDao")
    class LiveChannelCommentDaoImpl extends ModelDaoImpl<LiveChannelComment> implements LiveChannelCommentDao{

        public List<LiveChannelComment> findByChannelID(Integer channelID ,Pagination pagination) {
            String hql = "From LiveChannelComment lcc where lcc.liveChannel.id=? order by lcc.id desc";
            return this.find(hql,pagination,channelID);
        }
    }

    @Repository("liveChannelDao")
    class LiveChannelDaoImpl extends ModelDaoImpl<LiveChannel> implements LiveChannelDao{

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

    @Repository("liveChannelNewEventDao")
    class LiveChannelNewEventDaoImpl extends ModelDaoImpl<LiveChannelNewEvent> implements LiveChannelNewEventDao{

        public List<LiveChannelNewEvent> findLatestNews(Pagination pagination) {
            String hql = "From LiveChannelNewEvent lcne order by lcne.id desc";
            return this.find(hql,pagination);
        }
    }

    @Repository("liveTermCommentDao")
    class LiveTermCommentDaoImpl extends ModelDaoImpl<LiveTermComment> implements LiveTermCommentDao{

        public List<LiveTermComment> findByTermsID(Integer termsID, Pagination pagination) {
            String hql = "From LiveTermComment ltc where ltc.channelTerms.id=? order by ltc.commentTime desc ,ltc.id desc";
            return this.find(hql,pagination,termsID);
        }
    }

    @Repository("liveTrailerDao")
    class LiveTrailerDaoImpl extends ModelDaoImpl<LiveTrailer> implements LiveTrailerDao{

        public List<LiveTrailer> findByPublishTime(Pagination pagination) {
            String hql = "From LiveTrailer lt order by lt.id desc";
            return this.find(hql,pagination);
        }
    }
}
