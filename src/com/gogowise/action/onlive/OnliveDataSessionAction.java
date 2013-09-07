package com.gogowise.action.onlive;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.OnLiveHostSession;
import com.gogowise.action.valueobject.OnliveGuestSession;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.live.ChannelTermsDao;
import com.gogowise.rep.live.LiveChannelDao;
import com.gogowise.rep.live.SeasonIncreasedOnliveFansDao;
import com.gogowise.rep.user.user.BaseUser;
import com.gogowise.rep.live.live.ChannelTerms;
import com.gogowise.rep.live.live.LiveChannel;
import com.gogowise.rep.live.live.SeasonIncreasedOnliveFans;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.CompactWriter;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.Calendar;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class OnliveDataSessionAction  extends BasicAction{
    private LiveChannelDao liveChannelDao;
    private LiveChannel liveChannel;
    private ChannelTermsDao channelTermsDao;
    private ChannelTerms channelTerms;
    private BaseUser user;
    private BaseUserDao baseUserDao;
    private String initSeesionString;
    private String flashPatch;
     private Integer roleType;
    private SeasonIncreasedOnliveFansDao seasonIncreasedOnliveFansDao;
    @Action(value = "startOnLive",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".startOnLive")})
    public String startOnLive(){
        channelTerms = channelTermsDao.findById(this.getChannelTerms().getId());
        liveChannel = channelTerms.getLiveChannel();
        user = baseUserDao.findById(this.getSessionUserId());
        if(channelTerms.getHost() != null && this.getSessionUserId() == channelTerms.getHost().getId()){
            OnLiveHostSession onLiveHostSession = new OnLiveHostSession();
            onLiveHostSession.initWithUserLiveChannel(channelTerms,user);
            XStream xstream = new XStream();
            xstream.alias("Session", OnLiveHostSession.class);
            OutputStream output = new ByteArrayOutputStream();
            xstream.marshal(onLiveHostSession, new CompactWriter(new OutputStreamWriter(output)));
            this.setInitSeesionString(output.toString());
            this.setFlashPatch("flash/Onlive_Host.swf");
            this.setRoleType(1);
        }else {
            OnliveGuestSession onliveGuestSession = new OnliveGuestSession();
            onliveGuestSession.initWithUserLiveChannel(channelTerms,user);
            XStream xstream = new XStream();
            xstream.alias("Session", OnliveGuestSession.class);
            OutputStream output = new ByteArrayOutputStream();
            xstream.marshal(onliveGuestSession , new CompactWriter(new OutputStreamWriter(output)));
            this.setInitSeesionString(output.toString());
            this.setFlashPatch("flash/Onlive_Guest.swf");
            this.setRoleType(2);
        }
        channelTerms.setViewTheOnliveNum(channelTerms.getViewTheOnliveNum() == null?1:channelTerms.getViewTheOnliveNum()+1);
        channelTermsDao.persistAbstract(channelTerms);

        liveChannel.setTotalInviteNum(liveChannel.getTotalInviteNum() == null?1:liveChannel.getTotalInviteNum()+1);      //用户进入一次虚拟教室 栏目访问量加1
        liveChannelDao.persistAbstract(liveChannel);

        SeasonIncreasedOnliveFans siof = seasonIncreasedOnliveFansDao.findByLiveAndCalendar(channelTerms.getLiveChannel().getId(), Utils.getCurrentCalender().get(Calendar.YEAR),Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
        if(siof == null){    //用户进入一次虚拟教室，当前季度用户访问量加1
               SeasonIncreasedOnliveFans curr = new SeasonIncreasedOnliveFans();
               curr.setLiveChannel(channelTerms.getLiveChannel());
               curr.setFocusTime(Utils.getCurrentCalender());
               curr.setYear(Utils.getCurrentCalender().get(Calendar.YEAR));
               curr.setSeason(Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
               curr.setInviteNum(1);
               seasonIncreasedOnliveFansDao.persistAbstract(curr);
        }else {
               siof.setInviteNum(siof.getInviteNum()+1);
               seasonIncreasedOnliveFansDao.persistAbstract(siof);
        }
        return SUCCESS;
    }

    public LiveChannelDao getLiveChannelDao() {
        return liveChannelDao;
    }

    public void setLiveChannelDao(LiveChannelDao liveChannelDao) {
        this.liveChannelDao = liveChannelDao;
    }

    public LiveChannel getLiveChannel() {
        return liveChannel;
    }

    public void setLiveChannel(LiveChannel liveChannel) {
        this.liveChannel = liveChannel;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public String getInitSeesionString() {
        return initSeesionString;
    }

    public void setInitSeesionString(String initSeesionString) {
        this.initSeesionString = initSeesionString;
    }

    public String getFlashPatch() {
        return flashPatch;
    }

    public void setFlashPatch(String flashPatch) {
        this.flashPatch = flashPatch;
    }

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

    public ChannelTermsDao getChannelTermsDao() {
        return channelTermsDao;
    }

    public void setChannelTermsDao(ChannelTermsDao channelTermsDao) {
        this.channelTermsDao = channelTermsDao;
    }

    public ChannelTerms getChannelTerms() {
        return channelTerms;
    }

    public void setChannelTerms(ChannelTerms channelTerms) {
        this.channelTerms = channelTerms;
    }

    public SeasonIncreasedOnliveFansDao getSeasonIncreasedOnliveFansDao() {
        return seasonIncreasedOnliveFansDao;
    }

    public void setSeasonIncreasedOnliveFansDao(SeasonIncreasedOnliveFansDao seasonIncreasedOnliveFansDao) {
        this.seasonIncreasedOnliveFansDao = seasonIncreasedOnliveFansDao;
    }
}
