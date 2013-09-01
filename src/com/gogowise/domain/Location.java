package com.gogowise.domain;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

/**
 * Created by IntelliJ IDEA.
 * User: YYZ
 * Date: 12-12-28
 * Time: 下午9:42
 * To change this template use File | Settings | File Templates.
 */
public class Location extends AbstractPersistence {
    private String address;
    private double latitude;
    private double longitude;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }
}
