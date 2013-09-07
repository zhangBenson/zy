package com.gogowise.rep.live.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.common.utils.Utils;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Entity
public class LiveChannel extends AbstractPersistence {
    @OneToOne
    private BaseUser creator;
    @OneToOne
    private Organization organization;
    private String name;
    private String description;
    private String logoUrl;
    private Calendar createTime;
    @OneToMany(mappedBy = "liveChannel")
    @OrderBy("startTime asc")
    private List<ChannelTerms> channelTermses = new ArrayList<ChannelTerms>();
    @OneToMany(mappedBy = "liveChannel")
    private List<OnliveFollower> onliveFollowers = new ArrayList<OnliveFollower>();
    private Integer userType = 1;//默认用户相对于该栏目的类型为1，如果是该栏目的粉丝，则类型为0，用户个人中心进入虚拟教室用
    @OneToMany(mappedBy = "liveChannel")
    private List<SeasonIncreasedOnliveFans> seasonIncreasedOnliveFanses = new ArrayList<SeasonIncreasedOnliveFans>();
    @OneToMany(mappedBy = "liveChannel")
    private List<LiveChannelNewEvent> liveChannelNewEvents = new ArrayList<LiveChannelNewEvent>();
    private Integer totalInviteNum = 0;    //累计访问用户，用户只要进入一次博客和虚拟教室，访问量加1
                                              //季度访问人数，用户只要进入一次秀博客和虚拟教室，访问量加1，此关系保存在SeasonIncreasedOnliveFans中
                                              //季度新增用户，用户成为粉丝之后，当前季度粉丝量加1，此关系任保存在SeasonIncreasedOnliveFans中

    private Double synthetical = 3.0;
    @OneToMany(mappedBy = "liveChannel")
    private List<AdvertisementForLive> advertisementForLives  = new ArrayList<AdvertisementForLive>();

    public BaseUser getCreator() {
        return creator;
    }

    public void setCreator(BaseUser creator) {
        this.creator = creator;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }

    public List<ChannelTerms> getChannelTermses() {
        return channelTermses;
    }

    public void setChannelTermses(List<ChannelTerms> channelTermses) {
        this.channelTermses = channelTermses;
    }

    public List<OnliveFollower> getOnliveFollowers() {
        return onliveFollowers;
    }

    public void setOnliveFollowers(List<OnliveFollower> onliveFollowers) {
        this.onliveFollowers = onliveFollowers;
    }

    public List<AdvertisementForLive> getAdvertisementForLives() {
        return advertisementForLives;
    }

    public void setAdvertisementForLives(List<AdvertisementForLive> advertisementForLives) {
        this.advertisementForLives = advertisementForLives;
    }

    public Double getSynthetical() {
        return synthetical;
    }

    public void setSynthetical(Double synthetical) {
        this.synthetical = synthetical;
    }

    public Integer getFansNum(){
        return this.getOnliveFollowers().size();
    }

    public ChannelTerms getTheLatestChannelTerms(){
          return this.getFutureTerms().get(0);
    }

    public List<SeasonIncreasedOnliveFans> getSeasonIncreasedOnliveFanses() {
        return seasonIncreasedOnliveFanses;
    }

    public void setSeasonIncreasedOnliveFanses(List<SeasonIncreasedOnliveFans> seasonIncreasedOnliveFanses) {
        this.seasonIncreasedOnliveFanses = seasonIncreasedOnliveFanses;
    }

    public List<ChannelTerms> getFutureTerms(){
          List<ChannelTerms> cts = new ArrayList<ChannelTerms>();
          for(ChannelTerms ct : this.getChannelTermses()){
            Calendar ctFinishTime = (Calendar)ct.getStartTime().clone();
            ctFinishTime.add(Calendar.MINUTE,100);
            if(ctFinishTime.after(Utils.getCurrentCalender())) cts.add(ct);
          }
          return cts;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public Integer getTotalInviteNum() {
        return totalInviteNum;
    }

    public void setTotalInviteNum(Integer totalInviteNum) {
        this.totalInviteNum = totalInviteNum;
    }

    public Integer getTotalTermsNum(){
        return this.getChannelTermses().size();
    }

    public Integer getTotalFollowerNum(){
        return this.getOnliveFollowers().size();
    }

    public List<LiveChannelNewEvent> getLiveChannelNewEvents() {
        return liveChannelNewEvents;
    }

    public void setLiveChannelNewEvents(List<LiveChannelNewEvent> liveChannelNewEvents) {
        this.liveChannelNewEvents = liveChannelNewEvents;
    }

    public Integer getSeasonIncreasedFansNum(){
        int increasedNum = 0;
        for(SeasonIncreasedOnliveFans siof : this.getSeasonIncreasedOnliveFanses()){
            if(siof.getFocusTime().get(Calendar.YEAR) == Utils.getCurrentCalender().get(Calendar.YEAR) && Utils.getSeasonOfYear(siof.getFocusTime().get(Calendar.MONTH)).equals(Utils.getCurrentCalender().get(Calendar.MONTH))){
                increasedNum = siof.getFansNum();
            }
        }
        return increasedNum;
    }

    public Integer getSeasonIncreasedInviteNum(){
        int increasedNum = 0;
        for(SeasonIncreasedOnliveFans siof : this.getSeasonIncreasedOnliveFanses()){
            if(siof.getFocusTime().get(Calendar.YEAR) == Utils.getCurrentCalender().get(Calendar.YEAR) && Utils.getSeasonOfYear(siof.getFocusTime().get(Calendar.MONTH)).equals(Utils.getCurrentCalender().get(Calendar.MONTH))){
                increasedNum = siof.getInviteNum();
            }
        }
        return increasedNum;
    }

    public List<AdvertisementForLive> getThisSeasonAd(){
        List<AdvertisementForLive> advertisementForLives = new ArrayList<AdvertisementForLive>();
        for(AdvertisementForLive ad : this.getAdvertisementForLives()){
            if(ad.getSeason().equals(Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)))){
                advertisementForLives.add(ad);
            }
        }
        return advertisementForLives;
    }

    public List<AdvertisementForLive> getNextSeasonAd(){
           List<AdvertisementForLive> advertisementForLives = new ArrayList<AdvertisementForLive>();
           for(AdvertisementForLive ad : this.getAdvertisementForLives()){
               if(ad.getSeason().equals(Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)) + 1)){
                   advertisementForLives.add(ad);
               }
           }
           return advertisementForLives;
       }

    public Boolean isExistNextSeasonAd(){
        if(this.getNextSeasonAd().size() == 0) return false;
        return true ;
    }


    public Double getTotalBidPrice(){
        double total = 0.0;
        for(AdvertisementForLive ad : this.getAdvertisementForLives()){
            total = total +ad.getBidPrice();
        }
        return total;
    }

    public Double getHighestBidPriceOfThisSeason(){
        if(this.getThisSeasonAd().size() == 0 )  return  0.0;
        double  highestPrice = this.getThisSeasonAd().get(0).getBidPrice();
        for(AdvertisementForLive ad : this.getThisSeasonAd()){
            if(ad.getBidPrice() > highestPrice) highestPrice = ad.getBidPrice();
        }
        return highestPrice;
    }

    public Double getLowestBidPriceOfThisSeason(){
        if(this.getThisSeasonAd().size() == 0 )  return  0.0;
        double  highestPrice = this.getThisSeasonAd().get(0).getBidPrice();
        for(AdvertisementForLive ad : this.getThisSeasonAd()){
            if(ad.getBidPrice() < highestPrice) highestPrice = ad.getBidPrice();
        }
        return highestPrice;
    }

    public Integer getBidNum(){
        return this.getAdvertisementForLives().size();
    }

    public ChannelTerms getLastOwnRecordTerm(){
        for(int i=this.getChannelTermses().size()-1;i>=0;i--){
            ChannelTerms ct = this.getChannelTermses().get(i);
           if(ct.getHaveRecord()){
               return ct;
           }
        }
        return null;
    }

    public  List<BaseUser> getAllHosts(){
        List<BaseUser> hosts = new ArrayList<BaseUser>();
        for(ChannelTerms ct : this.getChannelTermses()){
            if(ct.getHost()!= null) hosts.add(ct.getHost());
        }
        return hosts;
    }

    public  Integer getAllHostsNum(){
        return this.getAllHosts().size();
    }

    public List<BaseUser> getAllContestants(){
        List<BaseUser> users = new ArrayList<BaseUser>();
        for(ChannelTerms ct : this.getChannelTermses()){
            for(MemberOfLiveChannel mol : ct.getContestants()){
                if(mol.getMember() != null) users.add(mol.getMember());
            }
        }
        return users;
    }

    public  Integer getAllContestantsNum(){
        return this.getAllContestants().size();
    }

    public List<BaseUser> getAllGuests(){
        List<BaseUser> users = new ArrayList<BaseUser>();
        for(ChannelTerms ct : this.getChannelTermses()){
            for(MemberOfLiveChannel mol : ct.getGuests()){
                if(mol.getMember() != null) users.add(mol.getMember());
            }
        }
        return users;
    }

    public Integer getAllGuestsNum(){
       return this.getAllGuests().size();
    }
}
