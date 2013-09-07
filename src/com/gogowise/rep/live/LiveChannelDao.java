package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.live.LiveChannel;
import com.gogowise.domain.Pagination;
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

}
