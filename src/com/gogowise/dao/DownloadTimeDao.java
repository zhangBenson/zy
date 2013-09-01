package com.gogowise.dao;

import com.gogowise.domain.DownloadTime;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-10-12
 * Time: 上午11:03
 * To change this template use File | Settings | File Templates.
 */
public interface DownloadTimeDao extends ModelDao<DownloadTime> {

    public DownloadTime findRecord();

}
