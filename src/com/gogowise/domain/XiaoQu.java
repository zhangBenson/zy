package com.gogowise.domain;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.Calendar;

@Entity
public class XiaoQu extends AbstractPersistence {
    private String name;

    private String address;

    private Float lng;
    private Float lat;

    private Integer regId;

    private boolean noLocation = false;


    @ManyToOne
    private School school;


    private Calendar createTime = Calendar.getInstance();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Float getLng() {
        return lng;
    }

    public void setLng(Float lng) {
        this.lng = lng;
    }

    public Float getLat() {
        return lat;
    }

    public void setLat(Float lat) {
        this.lat = lat;
    }

    public Integer getRegId() {
        return regId;
    }

    public void setRegId(Integer regId) {
        this.regId = regId;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }

    public boolean isNoLocation() {
        return noLocation;
    }

    public void setNoLocation(boolean noLocation) {
        this.noLocation = noLocation;
    }
}
