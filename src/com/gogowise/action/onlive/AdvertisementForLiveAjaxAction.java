package com.gogowise.action.onlive;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.live.AdvertisementForLiveDao;
import com.gogowise.domain.AdvertisementForLive;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "json", type = "json")
})
public class AdvertisementForLiveAjaxAction extends BasicAction{
    private AdvertisementForLiveDao advertisementForLiveDao;
    private AdvertisementForLive advertisementForLive;

    private String brandLink;
    private String brandDescription;
    private String brandPrice;
    private String brandLogoUrl;


    @Action(value = "findAdvertiseForLive")
    public String findAdvertiseForLive(){
        if(this.getAdvertisementForLive() != null && this.getAdvertisementForLive().getId() != -1){
            advertisementForLive = advertisementForLiveDao.findById(this.getAdvertisementForLive().getId());
            this.setBrandLink(advertisementForLive.getLinkAddress());
            this.setBrandDescription(advertisementForLive.getDescription());
            this.setBrandPrice(advertisementForLive.getBidPrice().toString());
            this.setBrandLogoUrl(advertisementForLive.getAdLogoUrl());
        }
         return "json";
    }

    @JSON(serialize = false)
    public AdvertisementForLiveDao getAdvertisementForLiveDao() {
        return advertisementForLiveDao;
    }

    public void setAdvertisementForLiveDao(AdvertisementForLiveDao advertisementForLiveDao) {
        this.advertisementForLiveDao = advertisementForLiveDao;
    }
    @JSON(serialize = false)
    public AdvertisementForLive getAdvertisementForLive() {
        return advertisementForLive;
    }

    public void setAdvertisementForLive(AdvertisementForLive advertisementForLive) {
        this.advertisementForLive = advertisementForLive;
    }

    public String getBrandLink() {
        return brandLink;
    }

    public void setBrandLink(String brandLink) {
        this.brandLink = brandLink;
    }

    public String getBrandDescription() {
        return brandDescription;
    }

    public void setBrandDescription(String brandDescription) {
        this.brandDescription = brandDescription;
    }

    public String getBrandPrice() {
        return brandPrice;
    }

    public void setBrandPrice(String brandPrice) {
        this.brandPrice = brandPrice;
    }

    public String getBrandLogoUrl() {
        return brandLogoUrl;
    }

    public void setBrandLogoUrl(String brandLogoUrl) {
        this.brandLogoUrl = brandLogoUrl;
    }
}
