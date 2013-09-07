package com.gogowise.domain.live;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-6-11
 * Time: 下午1:06
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class MyShow extends AbstractPersistence {
    private String name;
    private Integer type;
    private String description;
    private String logoUrl;
    private Calendar showDate;     //show的开始日期
    private Calendar showFixedTime;    //show 当天的直播开始时间
    private Integer duration;
    private String dateOfWeek;      //show 每周几直播
    @OneToMany(mappedBy = "myShow")
    @OrderBy("startTime asc")
    private List<ShowTerms> showTermses = new ArrayList<ShowTerms>();
    @OneToOne
    private BaseUser owner;
    private Calendar publishTime;
    @OneToMany(mappedBy = "myShow")
    private List<ShowFans> showFanses = new ArrayList<ShowFans>();

    @OneToMany(mappedBy = "myShow")
    @OrderBy("bidPrice desc")
    private List<Advertisement> advertisements = new ArrayList<Advertisement>();
    @OneToMany(mappedBy = "myShow")
    private List<SeasonIncreasedShowFans> seasonIncreasedShowFanses =new ArrayList<SeasonIncreasedShowFans>();
    @OneToMany(mappedBy = "myShow")
    private List<ShowNewEvent> showNewEvents = new ArrayList<ShowNewEvent>();

    private Double interest = Constants.DEFAULT_DOUBLE_VALUE;            //    趣味性
    private Double available = Constants.DEFAULT_DOUBLE_VALUE;           //    实用性
    private Double interaction = Constants.DEFAULT_DOUBLE_VALUE;         //    互动性
    private Double synthetical = Constants.DEFAULT_DOUBLE_VALUE;         //     综合评分
    private Integer fansNum = 0;
    private Integer totalInviteNum = 0;    //累计访问用户，用户只要进入一次博客和虚拟教室，访问量加1
                                              //季度访问人数，用户只要进入一次秀博客和虚拟教室，访问量加1，此关系保存在SeasonIncreasedShowFans中
                                              //季度新增用户，用户成为粉丝之后，当前季度粉丝量加1，此关系任保存在SeasonIncreasedShowFans中

    private Boolean userFocused = false;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public Calendar getShowDate() {
        return showDate;
    }

    public void setShowDate(Calendar showDate) {
        this.showDate = showDate;
    }

    public Calendar getShowFixedTime() {
        return showFixedTime;
    }

    public void setShowFixedTime(Calendar showFixedTime) {
        this.showFixedTime = showFixedTime;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public String getDateOfWeek() {
        return dateOfWeek;
    }

    public void setDateOfWeek(String dateOfWeek) {
        this.dateOfWeek = dateOfWeek;
    }

    public List<ShowTerms> getShowTermses() {
        return showTermses;
    }

    public void setShowTermses(List<ShowTerms> showTermses) {
        this.showTermses = showTermses;
    }

    public BaseUser getOwner() {
        return owner;
    }

    public void setOwner(BaseUser owner) {
        this.owner = owner;
    }

    public List<ShowFans> getShowFanses() {
        return showFanses;
    }

    public void setShowFanses(List<ShowFans> showFanses) {
        this.showFanses = showFanses;
    }

    public Calendar getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Calendar publishTime) {
        this.publishTime = publishTime;
    }


    public void setFansNum(Integer fansNum) {
        this.fansNum = fansNum;
    }

    public Integer getFansNum(){
        return fansNum;
    }

    public Integer getShowTermsNum(){
        return this.getShowTermses().size();
    }

    public List<ShowTerms> getFutureTerms(){
        List<ShowTerms> curr = new ArrayList<ShowTerms>();
        for (ShowTerms st : this.getShowTermses()) {
            Calendar finishDate = (Calendar) st.getStartTime().clone();
            finishDate.add(Calendar.MINUTE, this.getDuration());
            if (Utils.getCurrentCalender().before(finishDate)) {
                curr.add(st);
            }
        }
        return curr;
    }

      public List<ShowTerms> getRealFutureTerms(){
        List<ShowTerms> curr = new ArrayList<ShowTerms>();
        for (ShowTerms st : this.getShowTermses()) {
            Calendar startTime = (Calendar) st.getStartTime().clone();
            if (Utils.getCurrentCalender().before(startTime)) {
                curr.add(st);
            }
        }
        return curr;
    }

    public Integer getRealFutureTermsNum(){
        return this.getRealFutureTerms().size();
    }

    public List<ShowTerms> getFinishedTerms(){
        List<ShowTerms> curr = new ArrayList<ShowTerms>();
        for (ShowTerms st : this.getShowTermses()) {
            Calendar finishDate = (Calendar) st.getStartTime().clone();
            finishDate.add(Calendar.MINUTE, this.getDuration());
            if (Utils.getCurrentCalender().after(finishDate)) {
                curr.add(st);
            }
        }
        return curr;
    }

    public Integer getFirstFutureTermSquence(){
        return getFinishedTerms().size()+1;
    }
    public Double getTotalBidPrice(){
        Double sum = 0.0;
        for(Advertisement ad : this.getNextSeasonAdvertisements()){
            sum = sum + ad.getBidPrice();
        }
        return sum;
    }

    public Double getHighestBidPrice(){
        Double price = 0.0;
        for (Advertisement ad : this.getNextSeasonAdvertisements()){
            if(ad.getBidPrice() > price){
                price = ad.getBidPrice();
            }
        }
        return price;
    }

    public Double getLowestBidPrice(){
        if(this.getNextSeasonAdvertisements().size() == 0) return 0.0;
        double price = this.getNextSeasonAdvertisements().get(0).getBidPrice();
        for (Advertisement ad : this.getNextSeasonAdvertisements()){
            if(ad.getBidPrice() < price){
                price = ad.getBidPrice();
            }
        }
        return price;
    }

    public Integer getBidNum(){
        return this.getNextSeasonAdvertisements().size();
    }

    public Integer getTotalBidNum(){
        return this.getAdvertisements().size();
    }


    public Boolean isExistAdvertisement(){
         if(this.getNextSeasonAdvertisements().size() == 0){
             return false;
         }
        return true;
    }

    public ShowTerms getFirstFutureTerm(){
        return  this.getFutureTerms().get(0);
    }


    public Integer getFinishedTermsNum(){
        return this.getShowTermsNum() - this.getFutureTerms().size();
    }
    public Double getInterest() {
        return interest;
    }

    public void setInterest(Double interest) {
        this.interest = interest;
    }

    public Double getAvailable() {
        return available;
    }

    public void setAvailable(Double available) {
        this.available = available;
    }

    public Boolean getUserFocused() {
        return userFocused;
    }

    public void setUserFocused(Boolean userFocused) {
        this.userFocused = userFocused;
    }

    public Double getInteraction() {
        return interaction;
    }

    public void setInteraction(Double interaction) {
        this.interaction = interaction;
    }
    public List<ShowNewEvent> getShowNewEvents() {
        return showNewEvents;
    }

    public void setShowNewEvents(List<ShowNewEvent> showNewEvents) {
        this.showNewEvents = showNewEvents;
    }

     public Double getSynthetical() {
        return synthetical;
    }

    public void setSynthetical() {
        this.synthetical = Math.round((this.available + this.interest + this.interaction ) * 10 / 3) / 10.0;
    }

    public List<Advertisement> getAdvertisements() {
        return advertisements;
    }

    public void setAdvertisements(List<Advertisement> advertisements) {
        this.advertisements = advertisements;
    }

    public List<Advertisement> getNextSeasonAdvertisements(){
        List<Advertisement>  allAd = this.getAdvertisements();
        List<Advertisement> nestSeasons = new ArrayList<Advertisement>();
        for(Advertisement ad : allAd){
            if(ad.getSeason() == (Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH))+1)){
                 nestSeasons.add(ad);
            }
        }
        return nestSeasons;
    }

    public List<Advertisement> getCurrentSeasonAcceptedAdvertisement(){
         List<Advertisement> currentSeasons = new ArrayList<Advertisement>();
        for(Advertisement ad : this.getAdvertisements()){
            if(ad.getAccept() == true && ad.getSeason() == Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH))){
                currentSeasons.add(ad);
            }
        }
        return currentSeasons;
    }

    public Integer getTotalInviteNum() {
        return totalInviteNum;
    }

    public void setTotalInviteNum(Integer totalInviteNum) {
        this.totalInviteNum = totalInviteNum;
    }

    public List<SeasonIncreasedShowFans> getSeasonIncreasedShowFanses() {
        return seasonIncreasedShowFanses;
    }

    public void setSeasonIncreasedShowFanses(List<SeasonIncreasedShowFans> seasonIncreasedShowFanses) {
        this.seasonIncreasedShowFanses = seasonIncreasedShowFanses;
    }

    public Integer getSeasonIncreasedFansNum(){
        int increasedNum = 0;
        for(SeasonIncreasedShowFans sisf : this.getSeasonIncreasedShowFanses()){
              if(sisf.getSeason() == Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)) && sisf.getYear() == Utils.getCurrentCalender().get(Calendar.YEAR)){
                  increasedNum = sisf.getFansNum();
              }
        }
        return increasedNum;
    }

    public Integer getSeasonIncreasedInviteNum(){
         int increasedNum = 0;
        for(SeasonIncreasedShowFans sisf : this.getSeasonIncreasedShowFanses()){
              if(sisf.getSeason() == Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)) && sisf.getYear() == Utils.getCurrentCalender().get(Calendar.YEAR)){
                  increasedNum = sisf.getInviteNum();
              }
        }
        return increasedNum;
    }

}
