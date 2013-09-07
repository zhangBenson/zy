package com.gogowise.urlfetch.hotel;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import java.util.Calendar;


@Entity
@XmlType(name = "Hotel")
@XmlRootElement(name = "Hotel")
public class Hotel extends AbstractPersistence {

    private String shopname;
    private Float latitude;
    private Float longitude;
    private Float star;
    private String telephone;
    private String streetAddress;
    private String logo;
    private String dangci;
    private String imgurl;
    private Float miniprice;
    private Calendar createDate;

    @Column(columnDefinition = "longtext")
    private String introduction;
    private Float rate;

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public Float getLatitude() {
        return latitude;
    }

    public void setLatitude(Float latitude) {
        this.latitude = latitude;
    }

    public Float getLongitude() {
        return longitude;
    }

    public void setLongitude(Float longitude) {
        this.longitude = longitude;
    }

    public Float getStar() {
        return star;
    }

    public void setStar(Float star) {
        this.star = star;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Float getRate() {
        return rate;
    }

    public void setRate(Float rate) {
        this.rate = rate;
    }

    public String getDangci() {
        return dangci;
    }

    public void setDangci(String dangci) {
        this.dangci = dangci;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public Float getMiniprice() {
        return miniprice;
    }

    public void setMiniprice(Float miniprice) {
        this.miniprice = miniprice;
    }

    public Calendar getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Calendar createDate) {
        this.createDate = createDate;
    }
}
