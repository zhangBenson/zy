package com.gogowise.domain.android_domain;

import com.gogowise.domain.AbstractPersistence;

import javax.persistence.Entity;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-12-6
 * Time: 下午5:17
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class SerialNO extends AbstractPersistence {
    private String serialNum;
    private String password;
    private Integer validTimes;

    public String getSerialNum() {
        return serialNum;
    }

    public void setSerialNum(String serialNum) {
        this.serialNum = serialNum;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getValidTimes() {
        return validTimes;
    }

    public void setValidTimes(Integer validTimes) {
        this.validTimes = validTimes;
    }
}
