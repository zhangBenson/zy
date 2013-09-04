package com.gogowise.action.onlive;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.advertisement.AdvertisementForLiveDao;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.live.LiveChannelDao;
import com.gogowise.domain.AdvertisementForLive;
import com.gogowise.domain.BaseUser;
import com.gogowise.domain.LiveChannel;
import com.gogowise.utils.Constants;
import com.gogowise.utils.Utils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class LiveAdvertiseAction extends BasicAction{
    private BaseUser user;
    private BaseUserDao baseUserDao;
    private LiveChannelDao  liveChannelDao;
    private LiveChannel liveChannel;
    private AdvertisementForLiveDao advertisementForLiveDao;
    private AdvertisementForLive advertisementForLive;
    private List<AdvertisementForLive> advertisementForLives = new ArrayList<AdvertisementForLive>();


    @Action(value = "saveAdvertiseForLive",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "listLiveChannelAdBid","liveChannel.id","${liveChannel.id}"})})
   public String saveAdvertiseForLive(){
         if (StringUtils.isNotBlank(advertisementForLive.getAdLogoUrl()) ) {
                Utils.notReplaceFileFromTmp(Constants.UPLOAD_ONLIVE_PATH + "/" + getSessionUserId(), advertisementForLive.getAdLogoUrl());
                advertisementForLive.setAdLogoUrl(Constants.UPLOAD_ONLIVE_PATH + "/" + getSessionUserId()+"/"+advertisementForLive.getAdLogoUrl());
        }else {
              advertisementForLive.setAdLogoUrl(Constants.DEFAULT_AD_IMAGE);
         }
        if(advertisementForLive.getFromAdvertisement()!=null){
            AdvertisementForLive ad = advertisementForLiveDao.findById(this.getAdvertisementForLive().getFromAdvertisement().getId());
            advertisementForLive.setProductName(ad.getProductName());
            advertisementForLive.setAdLogoUrl(ad.getAdLogoUrl());
        }

        BaseUser user  = baseUserDao.findById(this.getSessionUserId());
        advertisementForLive.setProvider(user);
        advertisementForLive.setBidTime(Utils.getCurrentCalender());
        advertisementForLive.setSeason(Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH))+1);

        liveChannel = liveChannelDao.findById(this.getLiveChannel().getId());
        advertisementForLive.setLiveChannel(liveChannel);
        if(advertisementForLive.getFromAdvertisement() == null) advertisementForLive.setFromAdvertisement(advertisementForLive);
        advertisementForLiveDao.persistAbstract(advertisementForLive);
        return SUCCESS;
    }

    @Action(value = "acceptBidForOnlive")
    public void acceptBidForOnlive(){
        advertisementForLive = advertisementForLiveDao.findById(this.getAdvertisementForLive().getId());
        advertisementForLive.setAccept(true);
        advertisementForLiveDao.persistAbstract(advertisementForLive);
    }

    @Action(value = "cancelAcceptBidForOnlive")
    public void cancelAcceptBidForOnlive(){
        advertisementForLive = advertisementForLiveDao.findById(this.getAdvertisementForLive().getId());
        advertisementForLive.setAccept(false);
        advertisementForLiveDao.persistAbstract(advertisementForLive);
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public LiveChannelDao getLiveChannelDao() {
        return liveChannelDao;
    }

    public void setLiveChannelDao(LiveChannelDao liveChannelDao) {
        this.liveChannelDao = liveChannelDao;
    }

    public LiveChannel getLiveChannel() {
        return liveChannel;
    }

    public void setLiveChannel(LiveChannel liveChannel) {
        this.liveChannel = liveChannel;
    }

    public AdvertisementForLiveDao getAdvertisementForLiveDao() {
        return advertisementForLiveDao;
    }

    public void setAdvertisementForLiveDao(AdvertisementForLiveDao advertisementForLiveDao) {
        this.advertisementForLiveDao = advertisementForLiveDao;
    }

    public AdvertisementForLive getAdvertisementForLive() {
        return advertisementForLive;
    }

    public void setAdvertisementForLive(AdvertisementForLive advertisementForLive) {
        this.advertisementForLive = advertisementForLive;
    }

    public List<AdvertisementForLive> getAdvertisementForLives() {
        return advertisementForLives;
    }

    public void setAdvertisementForLives(List<AdvertisementForLive> advertisementForLives) {
        this.advertisementForLives = advertisementForLives;
    }

}
