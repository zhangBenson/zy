package com.gogowise.repository.live;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.live.PersonalOnlive;

import java.util.List;

public interface PersonalOnliveDao extends ModelDao<PersonalOnlive> {

    public PersonalOnlive findLatestOneForUser(Integer userID,Pagination pagination);

    public List<PersonalOnlive> findOwnRecordPLForUser(Integer userID,Pagination pagination);

    public List<PersonalOnlive> findLitterPartOwnRecordPL(Integer userID,Integer minID,Pagination pagination); //  查询小于当前ID的记录

    public List<PersonalOnlive> findBigPartOwnRecordPL(Integer userID,Integer maxID,Pagination pagination);    //查询大于当前ID的记录

    public List<PersonalOnlive> findAllForOwner(Integer ownerID,Pagination pagination);

    public List<PersonalOnlive> findOtherLivingOnline(Integer myID ,Pagination pagination);   //查询其他正在直播的直播

    public List<PersonalOnlive> findAllLivingOnline(Pagination pagination);

    public PersonalOnlive findOnlivingByUser(Integer userID);  //查询指定用户的正在直播的记录

    public List<PersonalOnlive> findCurrentGoingOnlive(Pagination pagination);

    public List<PersonalOnlive> findByLiveTimes(Pagination pagination);

    public Long findOnliveTimesByUser(Integer userID);

    public List<PersonalOnlive> findOnliveHistoryForUser(Integer userID,Pagination pagination);  //查询最近2个月的用户直播记录

    public List<PersonalOnlive> findHottestOnlive(Pagination pagination);

    public List<PersonalOnlive> findAllLiveOnMap(Pagination pagination);

    public List<PersonalOnlive> findLiveOnMap(String searchStr,Pagination pagination);

    public List<PersonalOnlive> findOtherLiveOnMap(String searchStr,Pagination pagination);
}
