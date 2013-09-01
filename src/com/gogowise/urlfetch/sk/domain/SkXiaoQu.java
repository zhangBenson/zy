package com.gogowise.urlfetch.sk.domain;

import com.gogowise.urlfetch.AbstractUrlFetchPersistence;

import javax.persistence.Entity;

@Entity
public class SkXiaoQu extends AbstractUrlFetchPersistence {
    private String name;
    private Float lng;
    private Float lat;
    private String address;
    private Integer schoolId;
    private  Integer regId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public Integer getRegId() {
        return regId;
    }

    public void setRegId(Integer regId) {
        this.regId = regId;
    }
}
