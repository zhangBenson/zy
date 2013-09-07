package com.gogowise.urlfetch.sk;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.util.Calendar;

@Entity
public class School extends AbstractPersistence {
    private String name;

    @Column(columnDefinition = "longtext")
    private String introduce;
    private String logUrl;
    private  String homePageUrl;

    private String phone;
    private String phoneExt;

    private String uid;

    private String adv1;
    private String adv2;
    private String adv3;

    private Calendar createTime = Calendar.getInstance();


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getLogUrl() {
        return logUrl;
    }

    public void setLogUrl(String logUrl) {
        this.logUrl = logUrl;
    }

    public String getHomePageUrl() {
        return homePageUrl;
    }

    public void setHomePageUrl(String homePageUrl) {
        this.homePageUrl = homePageUrl;
    }

    public String getPhoneExt() {
        return phoneExt;
    }

    public void setPhoneExt(String phoneExt) {
        this.phoneExt = phoneExt;
    }

    public String getAdv1() {
        return adv1;
    }

    public void setAdv1(String adv1) {
        this.adv1 = adv1;
    }

    public String getAdv2() {
        return adv2;
    }

    public void setAdv2(String adv2) {
        this.adv2 = adv2;
    }

    public String getAdv3() {
        return adv3;
    }

    public void setAdv3(String adv3) {
        this.adv3 = adv3;
    }

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }
}
