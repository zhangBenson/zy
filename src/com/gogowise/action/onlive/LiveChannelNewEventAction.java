package com.gogowise.action.onlive;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.live.LiveChannelDao;
import com.gogowise.rep.live.LiveChannelNewEventDao;
import com.gogowise.rep.live.enity.LiveChannel;
import com.gogowise.rep.live.enity.LiveChannelNewEvent;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class LiveChannelNewEventAction extends BasicAction{
    private LiveChannelNewEvent liveChannelNewEvent;
    private LiveChannel liveChannel;
    private LiveChannelNewEventDao liveChannelNewEventDao;
    private LiveChannelDao liveChannelDao;
//
//    @Action(value = "saveChannelNewEvent")
//    public void saveChannelNewEvent(){
//        liveChannel = liveChannelDao.findById(this.getLiveChannel().getId());
//        liveChannelNewEvent.setLiveChannel(liveChannel);
//        liveChannelNewEvent.setCreateTime(Utils.getCurrentCalender());
//        if (StringUtils.isNotBlank(liveChannelNewEvent.getLogoUrl())) {
//                Utils.notReplaceFileFromTmp(Constants.UPLOAD_ONLIVE_PATH + "/" + getSessionUserId(), liveChannelNewEvent.getLogoUrl());
//                liveChannelNewEvent.setLogoUrl(Constants.UPLOAD_ONLIVE_PATH + "/" + getSessionUserId()+"/"+liveChannelNewEvent.getLogoUrl());
//        }
//        liveChannelNewEventDao.persistAbstract(liveChannelNewEvent);
//    }

    public LiveChannelNewEvent getLiveChannelNewEvent() {
        return liveChannelNewEvent;
    }

    public void setLiveChannelNewEvent(LiveChannelNewEvent liveChannelNewEvent) {
        this.liveChannelNewEvent = liveChannelNewEvent;
    }

    public LiveChannelNewEventDao getLiveChannelNewEventDao() {
        return liveChannelNewEventDao;
    }

    public void setLiveChannelNewEventDao(LiveChannelNewEventDao liveChannelNewEventDao) {
        this.liveChannelNewEventDao = liveChannelNewEventDao;
    }

    public LiveChannel getLiveChannel() {
        return liveChannel;
    }

    public void setLiveChannel(LiveChannel liveChannel) {
        this.liveChannel = liveChannel;
    }

    public LiveChannelDao getLiveChannelDao() {
        return liveChannelDao;
    }

    public void setLiveChannelDao(LiveChannelDao liveChannelDao) {
        this.liveChannelDao = liveChannelDao;
    }
}
