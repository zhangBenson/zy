package com.gogowise.urlfetch.sk.domain;

import com.gogowise.urlfetch.AbstractUrlFetchPersistence;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import java.util.ArrayList;
import java.util.List;

@Entity
public class SkClass extends AbstractUrlFetchPersistence {
    private String name;
    private String homePageUrl;
    private Integer classId;

    private Boolean isExpire;
    private Integer schoolId;
    private Integer typeId;
    private Float price;
    private String typeUrl;

    @Column(columnDefinition = "longtext")
    private String introduce;


    @ManyToMany(fetch = FetchType.EAGER)
    private List<SkXiaoQu> xiaoqus = new ArrayList<SkXiaoQu>();


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHomePageUrl() {
        return homePageUrl;
    }

    public void setHomePageUrl(String homePageUrl) {
        this.homePageUrl = homePageUrl;
    }

    public List<SkXiaoQu> getXiaoqus() {
        return xiaoqus;
    }

    public void setXiaoqus(List<SkXiaoQu> xiaoqus) {
        this.xiaoqus = xiaoqus;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Boolean getExpire() {
        return isExpire;
    }

    public void setExpire(Boolean expire) {
        isExpire = expire;
    }


    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public void addXiaoqu(SkXiaoQu xiaoqu) {
        for (SkXiaoQu skXiaoQu : this.getXiaoqus()) {
            if (skXiaoQu.getId().equals(xiaoqu.getId())) {
                return;
            }
        }
        this.getXiaoqus().add(xiaoqu);
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public String getTypeUrl() {
        return typeUrl;
    }

    public void setTypeUrl(String typeUrl) {
        this.typeUrl = typeUrl;
    }
}
