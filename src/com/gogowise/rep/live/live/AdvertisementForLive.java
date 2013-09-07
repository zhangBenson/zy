package com.gogowise.rep.live.live;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class AdvertisementForLive extends AbstractPersistence {
     @OneToOne
     private BaseUser provider;
     private String productName;
     private String linkAddress;
     private String description;
     private Double bidPrice;
     private String adLogoUrl;
     private Calendar bidTime;
     private Integer season;
    @ManyToOne(fetch = FetchType.LAZY)
     private AdvertisementForLive fromAdvertisement;

    @ManyToOne
     private LiveChannel liveChannel;
     private Boolean accept = false;

    public BaseUser getProvider() {
        return provider;
    }

    public void setProvider(BaseUser provider) {
        this.provider = provider;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getLinkAddress() {
        return linkAddress;
    }

    public void setLinkAddress(String linkAddress) {
        this.linkAddress = linkAddress;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getBidPrice() {
        return bidPrice;
    }

    public void setBidPrice(Double bidPrice) {
        this.bidPrice = bidPrice;
    }

    public String getAdLogoUrl() {
        return adLogoUrl;
    }

    public void setAdLogoUrl(String adLogoUrl) {
        this.adLogoUrl = adLogoUrl;
    }

    public Calendar getBidTime() {
        return bidTime;
    }

    public void setBidTime(Calendar bidTime) {
        this.bidTime = bidTime;
    }

    public Integer getSeason() {
        return season;
    }

    public void setSeason(Integer season) {
        this.season = season;
    }

    public AdvertisementForLive getFromAdvertisement() {
        return fromAdvertisement;
    }

    public void setFromAdvertisement(AdvertisementForLive fromAdvertisement) {
        this.fromAdvertisement = fromAdvertisement;
    }

    public LiveChannel getLiveChannel() {
        return liveChannel;
    }

    public void setLiveChannel(LiveChannel liveChannel) {
        this.liveChannel = liveChannel;
    }

    public Boolean getAccept() {
        return accept;
    }

    public void setAccept(Boolean accept) {
        this.accept = accept;
    }
}
