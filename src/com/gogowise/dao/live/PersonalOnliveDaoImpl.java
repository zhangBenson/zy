package com.gogowise.dao.live;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.live.PersonalOnlive;
import com.gogowise.common.utils.Utils;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Repository("personalOnliveDao")
public class PersonalOnliveDaoImpl extends ModelDaoImpl<PersonalOnlive> implements PersonalOnliveDao{
    public PersonalOnlive findLatestOneForUser(Integer userID,Pagination pagination) {
       // String hql = "From PersonalOnlive po where po.owner.id=? and po.id =(select max(tp.id) from PersonalOnlive tp)";
        String hql = "From PersonalOnlive po where po.owner.id=? order by po.id desc";
        List<PersonalOnlive> personalOnlives =  this.find(hql,pagination,userID);
        if(personalOnlives.size() == 0) return null;
        return personalOnlives.get(0);
    }

    public List<PersonalOnlive> findOwnRecordPLForUser(Integer userID, Pagination pagination) {
        String hql = "From PersonalOnlive po where po.owner.id=? and po.haveRecord = true order by id desc ";
        return this.find(hql, pagination, userID);
    }

    public List<PersonalOnlive> findLitterPartOwnRecordPL(Integer userID, Integer minID, Pagination pagination) {
        String hql = "From PersonalOnlive po where po.owner.id=? and po.sequence<? and po.haveRecord = true order by id desc ";
        return this.find(hql,pagination,userID,minID);
    }

    public List<PersonalOnlive> findBigPartOwnRecordPL(Integer userID, Integer maxID, Pagination pagination) {
        String hql = "From PersonalOnlive po where po.owner.id=? and po.sequence>? and po.sequence<? and po.haveRecord = true order by id desc ";
        return this.find(hql,pagination,userID,maxID,maxID+5);
    }

    public List<PersonalOnlive> findAllForOwner(Integer ownerID, Pagination pagination) {
        String hql = "From PersonalOnlive po where po.owner.id=?";
        return this.find(hql,pagination,ownerID);
    }

    public List<PersonalOnlive> findOtherLivingOnline(Integer myID, Pagination pagination) {
        String hql = "From PersonalOnlive po where po.owner.id != ? and 5 > timestampdiff(minute,po.flagUpdateTime,?) and po.id in (select max(poo.id) from PersonalOnlive poo group by poo.owner.id)";
        return this.find(hql,pagination,myID, Utils.getCurrentCalender());
    }

    public List<PersonalOnlive> findAllLivingOnline(Pagination pagination){
         String hql = "From PersonalOnlive po where 5 > timestampdiff(minute,po.flagUpdateTime,?) and po.id in (select max(poo.id) from PersonalOnlive poo group by poo.owner.id)";
       //  String hql = "From PersonalOnlive po where 5 > timestampdiff(minute,po.flagUpdateTime,?) group by po.owner.id   having   po.id=max(po.id)";
        return this.find(hql,pagination,Utils.getCurrentCalender());
    }

    public PersonalOnlive findOnlivingByUser(Integer userID) {
        String hql = "From PersonalOnlive po where po.owner.id = ? and 5 > timestampdiff(minute,po.flagUpdateTime,?) order by po.id desc";
        return this.findFist(hql, userID, Utils.getCurrentCalender());
    }


    public List<PersonalOnlive> findCurrentGoingOnlive(Pagination pagination) {
        String hql="From PersonalOnlive pl where pl.id in \n" +
                "(select max(ppl.id) from PersonalOnlive ppl where ppl.owner.id in \n" +
                "      (select distinct pppl.owner.id from PersonalOnlive pppl)\n" +
                " group by ppl.owner.id)";
                //SELECT * from personalonlive where id in (SELECT max(id) FROM `personalonlive` where owner_id in(SELECT DISTINCT owner_id from personalonlive) GROUP BY owner_id);
       return this.find(hql, pagination);
    }

    public List<PersonalOnlive> findByLiveTimes(Pagination pagination) {
        String  hql = "select distinct po from PersonalOnlive po group by po.owner.id order by count(po) desc";
        return this.find(hql,pagination);
    }

    public Long findOnliveTimesByUser(Integer userID) {
        String hql = "select count(po) from PersonalOnlive po where po.owner.id=?";
        Query queryCount = this.getSession().createQuery(hql);
        queryCount.setParameter(0,userID);
        List countList = queryCount.list();
        if (countList.size() == 1) {
           return (Long)countList.get(0);
        } else if (countList.size() >1  ) {
           return  new Long(countList.size());
        }else {
           return new Long(0);
        }
    }

    public List<PersonalOnlive> findOnliveHistoryForUser(Integer userID, Pagination pagination) {
       //String hql="From PersonalOnlive po where po.owner.id = ? and 5 < timestampdiff(minute,po.flagUpdateTime,?) and po.duration > 20 and po.startTime>?";
        String hql="From PersonalOnlive po where po.owner.id = ? and ( 5 < timestampdiff(minute,po.flagUpdateTime,?) or po.realFinished = true)and po.startTime>? order by po.id desc";
        Calendar latestTime = Calendar.getInstance();
        latestTime.add(Calendar.MONTH,-2);
        return this.find(hql,pagination,userID,Calendar.getInstance(),latestTime);
    }

    public List<PersonalOnlive> findHottestOnlive(Pagination pagination) {
        String hql = "From PersonalOnlive po where po.id in (select max(poo.id) from PersonalOnlive poo group by poo.owner.id) order by po.clickRate desc";
        return this.find(hql,pagination);
    }

    public List<PersonalOnlive> findAllLiveOnMap(Pagination pagination){
        String hql = "From PersonalOnlive po where 5 > timestampdiff(minute,po.flagUpdateTime,?) and po.address is not null";
        return this.find(hql,pagination,Utils.getCurrentCalender());
    }

    public List<PersonalOnlive> findLiveOnMap(String searchStr,Pagination pagination){
        if(searchStr == null || searchStr.equals("")) return this.findAllLiveOnMap(pagination);
        String hql = "From PersonalOnlive po " +
                "where 5 > timestampdiff(minute,po.flagUpdateTime,?) and po.address is not null " +
                "and (po.title like ? or po.announcement like ? or po.address like ?)";
        return this.find(hql,pagination,Utils.getCurrentCalender(),"%"+searchStr+"%","%"+searchStr+"%","%"+searchStr+"%");
    }

    public List<PersonalOnlive> findOtherLiveOnMap(String searchStr,Pagination pagination){
        if(searchStr == null || searchStr.equals("")) return new ArrayList<PersonalOnlive>();
        String hql = "From PersonalOnlive po " +
                "where 5 > timestampdiff(minute,po.flagUpdateTime,?)  and po.address is not null " +
                "and title not like ? and announcement not like ? and address not like ?";
        return this.find(hql,pagination,Utils.getCurrentCalender(),"%"+searchStr+"%","%"+searchStr+"%","%"+searchStr+"%");
    }

//    private BaseUser owner;
//    private String title;
//    private String announcement;
//    private String address;
}
