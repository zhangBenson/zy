package com.gogowise.action.android;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.live.LiveChannelDao;
import com.gogowise.domain.*;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-7-29
 * Time: 下午4:44
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
@Results({
        @Result(name = "json", type = "json")
})
public class LiveForAndroidAction extends BasicAction{
    private List<AndroidLiveChannel> liveChannels;
    private LiveChannelDao liveChannelDao;
    private Integer page=0;
     @Action(value="multiLiveChannel4Android")
    public String multiLiveChannel(){
//        List<LiveChannel>  temp = liveChannelDao.findAllOwnFutureTermsChannel(page==0? new Pagination(10):new Pagination(page*7));
         List<LiveChannel>  temp = liveChannelDao.findAllOwnFutureTermsChannel(page==0 ? new Pagination(6):new Pagination(page*6));
         liveChannels=new ArrayList<AndroidLiveChannel>();
         if(temp!=null&&temp.size()!=0){
          for(int i=0;i<temp.size();i++){
            LiveChannel t=temp.get(i);
            AndroidLiveChannel a=new AndroidLiveChannel();
            a.setName(t.getName());
            a.setDescription(t.getDescription());
            a.setLogoUrl(t.getLogoUrl());
            ChannelTerms channelTerms=  t.getTheLatestChannelTerms();
            AndroidLiveChannelTerms androidLiveChannelTerms=new AndroidLiveChannelTerms();
            androidLiveChannelTerms.setSubTitle(channelTerms.getSubTitle());
            androidLiveChannelTerms.setDescription(channelTerms.getDescription());
            androidLiveChannelTerms.setLogoUrl(channelTerms.getLogoUrl());

            Calendar cal= channelTerms.getStartTime();
            cal.add(Calendar.MINUTE,8*60);
            androidLiveChannelTerms.setStartTime(cal);
            a.setChannelTerms(androidLiveChannelTerms);
            a.setHost(t.getCreator().getNickName());

            liveChannels.add(a);
          }
        }

//        if(this.getSessionUserId() != null) setUserTypeForChannels(liveChannels,this.getSessionUserId());
       return "json";
    }

    public List<AndroidLiveChannel> getLiveChannels() {
        return liveChannels;
    }

    public void setLiveChannels(List<AndroidLiveChannel> liveChannels) {
        this.liveChannels = liveChannels;
    }

    @JSON(serialize = false)
    public LiveChannelDao getLiveChannelDao() {
        return liveChannelDao;
    }

    public void setLiveChannelDao(LiveChannelDao liveChannelDao) {
        this.liveChannelDao = liveChannelDao;
    }

    @JSON(serialize = false)
    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }
}
