package com.gogowise.action.show;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.live.AdvertisementDao;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.live.MyShowDao;
import com.gogowise.domain.live.Advertisement;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.domain.live.MyShow;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-6-21
 * Time: 上午8:29
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class AdvertisementAction extends BasicAction {
    private AdvertisementDao advertisementDao;
    private Advertisement advertisement;
    private MyShowDao myShowDao;
    private MyShow myShow;
    private BaseUserDao baseUserDao;

    @Action(value = "saveAdvertise",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "showAdBidList","myShow.id","${myShow.id}"})})
    public String saveAdvertise(){
        if (StringUtils.isNotBlank(advertisement.getAdLogoUrl()) ) {
                Utils.notReplaceFileFromTmp(Constants.UPLOAD_SHOW_PATH + "/" + getSessionUserId(), advertisement.getAdLogoUrl());
                advertisement.setAdLogoUrl(Constants.UPLOAD_SHOW_PATH + "/" + getSessionUserId()+"/"+advertisement.getAdLogoUrl());
        }else {
              advertisement.setAdLogoUrl(Constants.DEFAULT_AD_IMAGE);
         }
        if(advertisement.getFromAdvertisement()!=null){
            Advertisement ad = advertisementDao.findById(this.getAdvertisement().getFromAdvertisement().getId());
            advertisement.setProductName(ad.getProductName());
            advertisement.setAdLogoUrl(ad.getAdLogoUrl());
        }
        BaseUser user  = baseUserDao.findById(this.getSessionUserId());
        advertisement.setProvider(user);
        advertisement.setBidTime(Utils.getCurrentCalender());
        advertisement.setSeason(Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH))+1);

        myShow = myShowDao.findById(this.getMyShow().getId());
        advertisement.setMyShow(myShow);
        if(advertisement.getFromAdvertisement() == null) advertisement.setFromAdvertisement(advertisement);
        advertisementDao.persistAbstract(advertisement);

        String  message = myShowDao.saveFansForShow(this.getSessionUserId(),myShow);
        return SUCCESS;
    }


    @Action(value = "acceptBid")
    public void acceptBid(){
        advertisement = advertisementDao.findById(this.getAdvertisement().getId());
        advertisement.setAccept(true);
        advertisementDao.persistAbstract(advertisement);
    }

    @Action(value = "cancelAcceptBid")
    public void cancelAcceptBid(){
        advertisement = advertisementDao.findById(this.getAdvertisement().getId());
        advertisement.setAccept(false);
        advertisementDao.persistAbstract(advertisement);
    }


    public AdvertisementDao getAdvertisementDao() {
        return advertisementDao;
    }

    public void setAdvertisementDao(AdvertisementDao advertisementDao) {
        this.advertisementDao = advertisementDao;
    }

    public Advertisement getAdvertisement() {
        return advertisement;
    }

    public void setAdvertisement(Advertisement advertisement) {
        this.advertisement = advertisement;
    }

    public MyShowDao getMyShowDao() {
        return myShowDao;
    }

    public void setMyShowDao(MyShowDao myShowDao) {
        this.myShowDao = myShowDao;
    }

    public MyShow getMyShow() {
        return myShow;
    }

    public void setMyShow(MyShow myShow) {
        this.myShow = myShow;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
}
