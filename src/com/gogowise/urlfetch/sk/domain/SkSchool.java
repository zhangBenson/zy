package com.gogowise.urlfetch.sk.domain;

import com.gogowise.urlfetch.AbstractUrlFetchPersistence;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import java.util.List;

@Entity
public class SkSchool extends AbstractUrlFetchPersistence {
    private Integer schoolId;
    private String name;


    private String logUrl;
    private  String homePageUrl;


    private String adv1;
    private String adv2;
    private String adv3;

    private String phone;
    private String phoneExt;

    @ManyToMany (fetch = FetchType.EAGER)
    private List<SkClassType> classGroups;

    @Column(columnDefinition = "TEXT")
    private String keyPoint;

    @Column(columnDefinition = "longtext")
    private String introduce;

    @Column(columnDefinition = "TEXT")
    private String introduceShort;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhoneExt() {
        return phoneExt;
    }

    public void setPhoneExt(String phoneExt) {
        this.phoneExt = phoneExt;
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public String getKeyPoint() {
        return keyPoint;
    }

    public void setKeyPoint(String keyPoint) {
        this.keyPoint = keyPoint;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getIntroduceShort() {
        return introduceShort;
    }

    public void setIntroduceShort(String introduceShort) {
        this.introduceShort = introduceShort;
    }

    public List<SkClassType> getClassGroups() {
        return classGroups;
    }

    public void setClassGroups(List<SkClassType> classGroups) {
        this.classGroups = classGroups;
    }

    public void addClassGroup(SkClassType skClassType){
        for (SkClassType classType :this.getClassGroups()) {
            if (classType.getId().equals(skClassType.getId())) {
                return;
            }
        }
        this.getClassGroups().add(skClassType);
    }
}
