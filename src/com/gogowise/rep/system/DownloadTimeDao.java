package com.gogowise.rep.system;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.system.enity.DownloadTime;

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
