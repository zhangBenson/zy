package com.gogowise.action.show;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.advertisement.AdvertisementDao;
import com.gogowise.domain.Advertisement;
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
public class AdvertisementAjaxAction extends BasicAction{

    private AdvertisementDao advertisementDao;
    private Advertisement advertisement;

    private String brandLink;
    private String brandDescription;
    private String brandPrice;
    private String brandLogoUrl;

    @Action(value = "findAdvertise")
    public String findAdvertise(){
        if(this.getAdvertisement() != null && this.getAdvertisement().getId() != -1){
            advertisement = advertisementDao.findById(this.getAdvertisement().getId());
            this.setBrandLink(advertisement.getLinkAddress());
            this.setBrandDescription(advertisement.getDescription());
            this.setBrandPrice(advertisement.getBidPrice().toString());
            this.setBrandLogoUrl(advertisement.getAdLogoUrl());
        }
         return "json";
    }

    @JSON(serialize = false)
    public AdvertisementDao getAdvertisementDao() {
        return advertisementDao;
    }

    public void setAdvertisementDao(AdvertisementDao advertisementDao) {
        this.advertisementDao = advertisementDao;
    }
     @JSON(serialize = false)
    public Advertisement getAdvertisement() {
        return advertisement;
    }

    public void setAdvertisement(Advertisement advertisement) {
        this.advertisement = advertisement;
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
