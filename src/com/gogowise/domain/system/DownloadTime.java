package com.gogowise.domain.system;

import com.gogowise.domain.AbstractPersistence;

import javax.persistence.Entity;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-10-12
 * Time: 上午11:00
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class DownloadTime extends AbstractPersistence {
    private Integer downloadTimes;

    public Integer getDownloadTimes() {
        return downloadTimes;
    }

    public void setDownloadTimes(Integer downloadTimes) {
        this.downloadTimes = downloadTimes;
    }
}
