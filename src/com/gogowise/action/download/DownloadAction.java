package com.gogowise.action.download;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.system.dao.DownloadTimeDao;
import com.gogowise.rep.system.enity.DownloadTime;
import com.gogowise.common.utils.Constants;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


/**
 * Created by GoGoWise
 * User: GGW
 * Date: 12-4-30
 * Time: 下午6:08
 * To change this template use File | Settings | File Templates.
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class DownloadAction extends BasicAction{
    private DownloadTimeDao downloadTimeDao;
    private DownloadTime downloadTime;

    @Action(value = "ggw4android", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".gogowise4android") })
    public String download() {
        downloadTime = downloadTimeDao.findRecord();
        return SUCCESS;
    }

    @Action(value = "downloadRemoteEye", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".remoteEyeDownload") })
    public String downloadRemoteEye() {
        downloadTime = downloadTimeDao.findRecord();
        return SUCCESS;
    }

    @Action(value = "addDownloadTime")
    public void  addDownloadTime(){
        DownloadTime dt = downloadTimeDao.findRecord();
        dt.setDownloadTimes(dt.getDownloadTimes()+1);
        downloadTimeDao.persistAbstract(dt);
    }

    public DownloadTimeDao getDownloadTimeDao() {
        return downloadTimeDao;
    }

    public void setDownloadTimeDao(DownloadTimeDao downloadTimeDao) {
        this.downloadTimeDao = downloadTimeDao;
    }

    public DownloadTime getDownloadTime() {
        return downloadTime;
    }

    public void setDownloadTime(DownloadTime downloadTime) {
        this.downloadTime = downloadTime;
    }
}
