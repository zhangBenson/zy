package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.*;

import java.util.List;


public interface LiveChannelDao extends ModelDao<LiveChannel> {

    public List<LiveChannel> findByUserID(Integer userID,Pagination pagination);    //个人中心用，个人将来的直播节目

    public List<LiveChannel> findUserRegChannel(Integer userID,Pagination pagination); //用户参与过的栏目。

    public List<LiveChannel> findUserFollowed(Integer userID,Pagination pagination);

    public List<LiveChannel> findForcastChannel(Pagination pagination);     //查询拥有未直播的栏目,按时间与当前时间大小来排序

    public List<LiveChannel> findMyChannelByID(Integer userID, Pagination pagination);  //查询我创建的栏目

    public List<LiveChannel> findAllOwnFutureTermsChannel(Pagination pagination);

    public List<LiveChannel> findByTermHost(Integer hostID,Pagination pagination);

    public List<LiveChannel> findAllForBidding(Pagination pagination);   //根据用户访问量，查询最热直播。

    public List<LiveChannel> findOtherLatest4Channel(Integer myChannelID, Pagination pagination);

    public List<LiveChannel> findOwnTermsRecord(Pagination pagination);  //根据访问量查询拥有节目录像的栏目。

    public List<LiveChannel> findLatest4Channel(Pagination pagination);

    public List<LiveChannel> searchLiveChannels(String searchStr , Pagination pagination);

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-7-16
     * Time: 上午11:35
     * To change this template use File | Settings | File Templates.
     */
    interface MemberOfLiveChannelDao extends ModelDao<MemberOfLiveChannel>{

        public MemberOfLiveChannel findByChannelTermAndEmail(Integer channelTermID, String memberEmail);
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-7-9
     * Time: 下午1:24
     * To change this template use File | Settings | File Templates.
     */
    interface ShowCommentDao extends ModelDao<ShowComment>{

        public List<ShowComment> findByShow(Integer showID, Pagination pagination);

    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-6-13
     * Time: 下午1:21
     * To change this template use File | Settings | File Templates.
     */
    interface ShowFansDao extends ModelDao<ShowFans>{

        public List<ShowFans> findByShow(Integer showId, Pagination pagination);

        public ShowFans findByUserAndShow(Integer userID, Integer showID);
    }

    interface ShowNewEventDao extends ModelDao<ShowNewEvent>{

        public List<ShowNewEvent> findLatestNews(Pagination pagination);

        public List<ShowNewEvent> findByShowID(Integer showID, Pagination pagination);
    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-6-11
     * Time: 下午3:14
     * To change this template use File | Settings | File Templates.
     */
    interface ShowTermsDao extends ModelDao<ShowTerms>{
    }

    interface UserMattersDao extends ModelDao<UserMatters>{

        public UserMatters  findByUser(Integer userID);
    }
}
