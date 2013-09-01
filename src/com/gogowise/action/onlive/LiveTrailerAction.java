package com.gogowise.action.onlive;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.BaseUserDao;
import com.gogowise.dao.LiveTrailerDao;
import com.gogowise.domain.LiveTrailer;
import com.gogowise.utils.Constants;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Calendar;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class LiveTrailerAction extends BasicAction{

    private BaseUserDao baseUserDao;
    private LiveTrailerDao liveTrailerDao;
    private LiveTrailer liveTrailer;

    @Action(value = "saveLiveTrailer",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "liveTrailerRead","liveTrailer.id", "${liveTrailer.id}"})})
    public String saveLiveTrailer(){
        liveTrailer.setOwner(baseUserDao.findById(this.getSessionUserId()));
        liveTrailer.setPublishTime(Calendar.getInstance());
        liveTrailerDao.persist(liveTrailer);
        return SUCCESS;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public LiveTrailerDao getLiveTrailerDao() {
        return liveTrailerDao;
    }

    public void setLiveTrailerDao(LiveTrailerDao liveTrailerDao) {
        this.liveTrailerDao = liveTrailerDao;
    }

    public LiveTrailer getLiveTrailer() {
        return liveTrailer;
    }

    public void setLiveTrailer(LiveTrailer liveTrailer) {
        this.liveTrailer = liveTrailer;
    }
}
