package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.domain.*;
import com.gogowise.utils.Utils;
import org.springframework.stereotype.Repository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

public interface LiveChannelNewEventDao extends ModelDao<LiveChannelNewEvent> {

    public List<LiveChannelNewEvent> findLatestNews(Pagination pagination);

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-6-11
     * Time: 下午3:14
     * To change this template use File | Settings | File Templates.
     */
    interface MyShowDao extends ModelDao<MyShow>{

        public void saveFirstShowTerm(MyShow myShow);

        public void manageMyShow(MyShow oldShow, MyShow newShow);

        public List<MyShow> findByUser(Integer uid, Pagination pagination);

        public List<MyShow> findHotestShow(Pagination pagination);

        public List<MyShow> findByInviteNum(Pagination pagination);

        public String saveFansForShow(Integer uid, MyShow myShow);

        public List<MyShow> findAllByUser(Integer uid, Pagination pagination);

        public List<MyShow> findUserFocusedShows(Integer userID, Pagination pagination);

        public List<MyShow> findByShowName(String showName);

        public List<MyShow> findShowOnline(Pagination pagination);

        public List<MyShow> findLatestShows(Pagination pagination);

        public List<MyShow> searchShows(String searchStr, Pagination pagination);

    }

    /**
     * Created by IntelliJ IDEA.
     * User: Administrator
     * Date: 12-7-19
     * Time: 下午3:34
     * To change this template use File | Settings | File Templates.
     */
    interface OnliveFollowerDao extends ModelDao<OnliveFollower>{

        public OnliveFollower findByLiveAndUser(Integer onliveID, Integer userID);

        public List<OnliveFollower> findHottestOnlive(Pagination pagination);

        public List<OnliveFollower> findByOnlive(Integer onliveID, Pagination pagination);

    }

    interface PersonalOnliveDao extends ModelDao<PersonalOnlive> {

        public PersonalOnlive findLatestOneForUser(Integer userID, Pagination pagination);

        public List<PersonalOnlive> findOwnRecordPLForUser(Integer userID, Pagination pagination);

        public List<PersonalOnlive> findLitterPartOwnRecordPL(Integer userID, Integer minID, Pagination pagination); //  查询小于当前ID的记录

        public List<PersonalOnlive> findBigPartOwnRecordPL(Integer userID, Integer maxID, Pagination pagination);    //查询大于当前ID的记录

        public List<PersonalOnlive> findAllForOwner(Integer ownerID, Pagination pagination);

        public List<PersonalOnlive> findOtherLivingOnline(Integer myID, Pagination pagination);   //查询其他正在直播的直播

        public List<PersonalOnlive> findAllLivingOnline(Pagination pagination);

        public PersonalOnlive findOnlivingByUser(Integer userID);  //查询指定用户的正在直播的记录

        public List<PersonalOnlive> findCurrentGoingOnlive(Pagination pagination);

        public List<PersonalOnlive> findByLiveTimes(Pagination pagination);

        public Long findOnliveTimesByUser(Integer userID);

        public List<PersonalOnlive> findOnliveHistoryForUser(Integer userID, Pagination pagination);  //查询最近2个月的用户直播记录

        public List<PersonalOnlive> findHottestOnlive(Pagination pagination);

        public List<PersonalOnlive> findAllLiveOnMap(Pagination pagination);

        public List<PersonalOnlive> findLiveOnMap(String searchStr, Pagination pagination);

        public List<PersonalOnlive> findOtherLiveOnMap(String searchStr, Pagination pagination);
    }

    interface SeasonIncreasedOnliveFansDao extends ModelDao<SeasonIncreasedOnliveFans>{

        public SeasonIncreasedOnliveFans findByLiveAndCalendar(Integer liveID, Integer year, Integer season);
    }

    interface SeasonIncreasedShowFansDao extends ModelDao<SeasonIncreasedShowFans>{

        public SeasonIncreasedShowFans findByShowYearAndSeason(Integer showID, Integer year, Integer season);

    }

    interface UserPrivateChannelDao extends ModelDao<UserPrivateChannel>{

        public UserPrivateChannel findByUser(Integer userID);
    }

    @Repository("myShowDao")
    class MyShowDaoImpl extends ModelDaoImpl<MyShow> implements MyShowDao {
        private BaseUserDao baseUserDao;
        private LiveChannelDao.ShowTermsDao showTermsDao;
        private LiveChannelDao.ShowFansDao showFansDao;
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
        public LiveChannelDao.ShowTermsDao getShowTermsDao() {
            return showTermsDao;
        }

        public void setShowTermsDao(LiveChannelDao.ShowTermsDao showTermsDao) {
            this.showTermsDao = showTermsDao;
        }

        public BaseUserDao getBaseUserDao() {
            return baseUserDao;
        }

        public void setBaseUserDao(BaseUserDao baseUserDao) {
            this.baseUserDao = baseUserDao;
        }

        public LiveChannelDao.ShowFansDao getShowFansDao() {
            return showFansDao;
        }

        public void setShowFansDao(LiveChannelDao.ShowFansDao showFansDao) {
            this.showFansDao = showFansDao;
        }

        public SeasonIncreasedShowFansDao getSeasonIncreasedShowFansDao() {
            return seasonIncreasedShowFansDao;
        }

        public void setSeasonIncreasedShowFansDao(SeasonIncreasedShowFansDao seasonIncreasedShowFansDao) {
            this.seasonIncreasedShowFansDao = seasonIncreasedShowFansDao;
        }
    }

    @Repository("onliveFollowerDao")
    class OnliveFollowerDaoImpl extends ModelDaoImpl<OnliveFollower> implements OnliveFollowerDao {

        public OnliveFollower findByLiveAndUser(Integer onliveID, Integer userID) {
            String hql = "select onf From OnliveFollower onf where onf.liveChannel.id=? and onf.follower.id=?";
            return this.findFist(hql,onliveID,userID);
        }

        public List<OnliveFollower> findHottestOnlive(Pagination pagination) {
            String hql = "select distinct ofl from OnliveFollower ofl group by ofl.liveChannel.id order by count(ofl) desc";
            return this.find(hql,pagination);
        }

        public List<OnliveFollower> findByOnlive(Integer onliveID, Pagination pagination) {
            String hql = "From OnliveFollower ofl where ofl.liveChannel.id=? order by ofl.id desc";
            return this.find(hql,pagination,onliveID);
        }
    }
}
