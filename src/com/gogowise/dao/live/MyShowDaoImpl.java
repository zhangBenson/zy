package com.gogowise.dao.live;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.domain.*;
import com.gogowise.domain.live.MyShow;
import com.gogowise.domain.live.SeasonIncreasedShowFans;
import com.gogowise.domain.live.ShowFans;
import com.gogowise.domain.live.ShowTerms;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.common.utils.Utils;
import org.springframework.stereotype.Repository;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;


@Repository("myShowDao")
public class MyShowDaoImpl extends ModelDaoImpl<MyShow> implements MyShowDao {
    private  BaseUserDao baseUserDao;
    private  ShowTermsDao showTermsDao;
    private ShowFansDao showFansDao;
    private SeasonIncreasedShowFansDao seasonIncreasedShowFansDao;
    public void saveFirstShowTerm(MyShow myShow) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        for(int i=0;i<10;i++){
        ShowTerms showTerms = new ShowTerms();
        showTerms.setMyShow(myShow);

        Calendar myShowDate = Calendar.getInstance();
        myShowDate.setTime(myShow.getShowDate().getTime());
        String dateOfWeeks[] = myShow.getDateOfWeek().split(",");
        if(i==0){
            showTerms.setStartTime(Utils.getDateOfWeekForTheFirstTerm(myShow.getShowDate(), dateOfWeeks, myShow.getShowFixedTime()));
        }else {
            showTerms.setStartTime(Utils.getDateOfWeek(myShow.getShowTermses().get(i-1).getStartTime(),dateOfWeeks,myShow.getShowFixedTime()));
        }
        showTermsDao.persistAbstract(showTerms);
        myShow.getShowTermses().add(showTerms);
        }

    }

    public void manageMyShow(MyShow oldShow, MyShow newShow) {

       // oldShow.setName(newShow.getName());
        oldShow.setDescription(newShow.getDescription());
        oldShow.setType(newShow.getType());
        oldShow.setShowFixedTime(newShow.getShowFixedTime());
        oldShow.setDateOfWeek(newShow.getDateOfWeek());
        oldShow.setDuration(newShow.getDuration());
    }


    public List<MyShow> findByUser(Integer uid, Pagination pagination) {
        String hql = "select distinct ms from MyShow ms,ShowTerms st left join ms.showFanses sf where ms.id = st.myShow.id and ms.duration > timestampdiff(minute,st.startTime,?) and (ms.owner.id = ? or sf.fan.id = ?) order by ms.publishTime desc";
        return this.find(hql,pagination,Utils.getCurrentCalender(),uid,uid);
    }

    public List<MyShow> findHotestShow(Pagination pagination){
        String hql = "select distinct ms from MyShow ms,ShowTerms st left join ms.showFanses sf where ms.id = st.myShow.id order by ms.fansNum desc";
        return this.find(hql,pagination);
    }


    public List<MyShow> findByInviteNum(Pagination pagination) {
        String hql = "From MyShow ms order by ms.totalInviteNum desc";
        return this.find(hql,pagination);
    }

    public String saveFansForShow(Integer uid,MyShow myShow) {
        if(uid.equals(myShow.getOwner().getId()))
            return  "you.are.the.show.owner";
        List<ShowFans> showFanses = showFansDao.findByShow(myShow.getId(),null);
        for(ShowFans showFans : showFanses){
            if(showFans.getFan().getId().equals(uid));
                 return "you.are.the.fans.of.the.show";
        }
        BaseUser fans = baseUserDao.findById(uid);
        ShowFans showFans = new ShowFans();
        showFans.setFan(fans);
        showFans.setMyShow(myShow);
        showFans.setConcernTime(Utils.getCurrentCalender());
        showFans.setConfrimCondition(true);
        showFansDao.persistAbstract(showFans);
        myShow.getShowFanses().add(showFans);
        myShow.setFansNum(myShow.getShowFanses().size());
        this.persistAbstract(myShow);


        SeasonIncreasedShowFans sisf = seasonIncreasedShowFansDao.findByShowYearAndSeason(myShow.getId(),Utils.getCurrentCalender().get(Calendar.YEAR),Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
        if(sisf != null){
            sisf.setFansNum(sisf.getFansNum()+1);
            seasonIncreasedShowFansDao.persistAbstract(sisf);
        }else {
            SeasonIncreasedShowFans curr = new SeasonIncreasedShowFans();
            curr.setMyShow(myShow);
            curr.setYear(Utils.getCurrentCalender().get(Calendar.YEAR));
            curr.setFansNum(1);
            curr.setSeason(Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
            seasonIncreasedShowFansDao.persistAbstract(curr);
        }
        return "success.to.focus.on.the.show";
    }

    public List<MyShow> findAllByUser(Integer uid, Pagination pagination) {
        String hql = "select distinct ms from MyShow ms,ShowTerms st where ms.id = st.myShow.id and ms.owner.id = ? order by ms.publishTime desc";
        return this.find(hql,pagination,uid);
    }

    public List<MyShow> findUserFocusedShows(Integer userID, Pagination pagination) {
        String hql = "select distinct ms from MyShow ms left join ms.showFanses sf where sf.fan.id = ? order by ms.publishTime desc";
        return this.find(hql,pagination ,userID);
    }

    public List<MyShow> findByShowName(String showName) {
        String hql = "From MyShow ms where ms.name = ?";
        return this.find(hql,showName);
    }

    public List<MyShow> findShowOnline(Pagination pagination) {
        String hql = "select distinct ms From MyShow ms , ShowTerms st where ms.id = st.myShow.id and "+getFinishDateBiggerThanNow()+" group by ms order by MIN(st.startTime) asc";
        return this.find(hql,pagination,Utils.getCurrentCalender());
    }

    public List<MyShow> findLatestShows(Pagination pagination) {
        String hql = "From MyShow ms order by ms.publishTime desc";
        return this.find(hql,pagination);
    }

    public List<MyShow> searchShows(String searchStr, Pagination pagination) {
        if(searchStr == null || searchStr.equals("")) return this.findHotestShow(pagination);
        String hql = "From MyShow ms where ms.name like ? order by ms.fansNum desc";
        return this.find(hql,pagination,"%"+searchStr+"%");
    }

    private String getFinishDateBiggerThanNow(){
        return " ms.duration > timestampdiff(minute,st.startTime ,? ) ";
    }
    public ShowTermsDao getShowTermsDao() {
        return showTermsDao;
    }

    public void setShowTermsDao(ShowTermsDao showTermsDao) {
        this.showTermsDao = showTermsDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public ShowFansDao getShowFansDao() {
        return showFansDao;
    }

    public void setShowFansDao(ShowFansDao showFansDao) {
        this.showFansDao = showFansDao;
    }

    public SeasonIncreasedShowFansDao getSeasonIncreasedShowFansDao() {
        return seasonIncreasedShowFansDao;
    }

    public void setSeasonIncreasedShowFansDao(SeasonIncreasedShowFansDao seasonIncreasedShowFansDao) {
        this.seasonIncreasedShowFansDao = seasonIncreasedShowFansDao;
    }
}
