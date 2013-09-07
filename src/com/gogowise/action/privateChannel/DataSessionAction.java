package com.gogowise.action.privateChannel;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.MChannelGuestSession;
import com.gogowise.action.valueobject.MChannelHostSession;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.live.MonitorAuthorizeDao;
import com.gogowise.rep.live.PersonalOnliveDao;
import com.gogowise.rep.live.SubPrivateChannelDao;
import com.gogowise.rep.live.UserPrivateChannelDao;
import com.gogowise.rep.system.GoGoWiseAnnounceDao;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.live.enity.MonitorAuthorize;
import com.gogowise.rep.live.enity.PersonalOnlive;
import com.gogowise.rep.live.enity.SubPrivateChannel;
import com.gogowise.rep.live.enity.UserPrivateChannel;
import com.gogowise.rep.system.enity.GoGoWiseAnnounce;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.common.utils.Constants;
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
import java.util.ArrayList;
import java.util.List;

 @Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class DataSessionAction extends BasicAction {
    private UserPrivateChannelDao userPrivateChannelDao;
    private SubPrivateChannelDao subPrivateChannelDao;
    private UserPrivateChannel userPrivateChannel;
    private SubPrivateChannel subPrivateChannel;
    private BaseUserDao baseUserDao;
    private PersonalOnliveDao personalOnliveDao;
    private GoGoWiseAnnounceDao goGoWiseAnnounceDao;

    private String initSeesionString;
    private String initSeesionString1;
    private String initSeesionString2;
    private String flashPatch;
    private String flashPatch1;
    private String flashPatch2;
    private Boolean isHost = false;
     private List<PersonalOnlive> hotOnlives = new ArrayList<PersonalOnlive>();
    private List<GoGoWiseAnnounce> goGoWiseAnnounces = new ArrayList<GoGoWiseAnnounce>();
    private long validDays;
    private BaseUser otherUser;         //7429

    private MonitorAuthorizeDao monitorAuthorizeDao;

    @Action(value = "openPrivateChannel",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".multiVideoRoomPrivate"),
                                                        @Result(name = "failed",type = Constants.RESULT_NAME_TILES,location = ".channelUsedUp"),
                                                       @Result(name = "redirect",type = Constants.RESULT_NAME_TILES,location = ".privateLiveTip")})
    public String openPrivateChannel(){
        BaseUser user = baseUserDao.findByEmail(this.getSessionUserEmail());

        if(!user.getOpenPrivateChannel()){
            return "redirect";
        }

        userPrivateChannel = userPrivateChannelDao.findByUser(user.getId());
         //有效期
//        validDays = (userPrivateChannel.getEndTime().getTimeInMillis() - Calendar.getInstance().getTimeInMillis())/(1000*3600*24);

        Integer subChannelID = getSubChannelID(userPrivateChannel);                                            //获得子频道代号
        subPrivateChannel = subPrivateChannelDao.findByUserChannelAndSubChannel(userPrivateChannel.getId(), 0);
        MChannelHostSession mChannelHostSession = new MChannelHostSession();
        mChannelHostSession.initSession(0,baseUserDao.findById(this.getSessionUserId()),subPrivateChannel.getUsing()==true?"1":"0");




        XStream xstream = new XStream();
        xstream.alias("Session", MChannelHostSession.class);
        OutputStream output = new ByteArrayOutputStream();
        xstream.marshal(mChannelHostSession, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString(output.toString());
         subPrivateChannel = subPrivateChannelDao.findByUserChannelAndSubChannel(userPrivateChannel.getId(), 1);
        mChannelHostSession.initSession(1, baseUserDao.findById(this.getSessionUserId()), subPrivateChannel.getUsing()==true?"1":"0");

        xstream = new XStream();
        xstream.alias("Session", MChannelHostSession.class);
        output = new ByteArrayOutputStream();
        xstream.marshal(mChannelHostSession, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString1(output.toString());
          subPrivateChannel = subPrivateChannelDao.findByUserChannelAndSubChannel(userPrivateChannel.getId(), 2);
         mChannelHostSession.initSession(2,baseUserDao.findById(this.getSessionUserId()),subPrivateChannel.getUsing()==true?"1":"0");

        xstream = new XStream();
        xstream.alias("Session", MChannelHostSession.class);
        output = new ByteArrayOutputStream();
        xstream.marshal(mChannelHostSession, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString2(output.toString());
        this.setFlashPatch("flash/Monitor_AllinOne.swf");


        this.setHost(true);

        //最热在直播和知元新闻
        hotOnlives = personalOnliveDao.findHottestOnlive(new Pagination(4));
        goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(new Pagination(14));

        return SUCCESS;
    }


     @Action(value = "openOtherPrivateChannel",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".multiVideoRoomPrivate"),
                                                              @Result(name = "index",type = Constants.RESULT_CHAIN_ACTION,params ={"actionName","index"})})
      public String openOtherPrivateChannel(){
        BaseUser user=baseUserDao.findById(this.getOtherUser().getId());

         MonitorAuthorize ma = monitorAuthorizeDao.findByAuthorizeAndAuthorizeToEamil(user,baseUserDao.findById(this.getSessionUserId()).getEmail());
         if(ma == null){
             return "index";
         }

         userPrivateChannel=userPrivateChannelDao.findByUser(user.getId());
         //有效期
//         validDays = (userPrivateChannel.getEndTime().getTimeInMillis() - Calendar.getInstance().getTimeInMillis())/(1000*3600*24);
//
//         if(validDays < 0){
//             return "index";
//         }

        Integer subChannelID = getSubChannelID(userPrivateChannel);                                            //获得子频道代号
        subPrivateChannel = subPrivateChannelDao.findByUserChannelAndSubChannel(userPrivateChannel.getId(), 0);
        MChannelHostSession mChannelHostSession = new MChannelHostSession();
        mChannelHostSession.initSession(0,baseUserDao.findById(this.getOtherUser().getId()),subPrivateChannel.getUsing()==true?"1":"0");

        XStream xstream = new XStream();
        xstream.alias("Session", MChannelHostSession.class);
        OutputStream output = new ByteArrayOutputStream();
        xstream.marshal(mChannelHostSession, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString(output.toString());
         subPrivateChannel = subPrivateChannelDao.findByUserChannelAndSubChannel(userPrivateChannel.getId(), 1);
        mChannelHostSession.initSession(1, baseUserDao.findById(this.getOtherUser().getId()), subPrivateChannel.getUsing()==true?"1":"0");

        xstream = new XStream();
        xstream.alias("Session", MChannelHostSession.class);
        output = new ByteArrayOutputStream();
        xstream.marshal(mChannelHostSession, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString1(output.toString());
          subPrivateChannel = subPrivateChannelDao.findByUserChannelAndSubChannel(userPrivateChannel.getId(), 2);
         mChannelHostSession.initSession(2,baseUserDao.findById(this.getOtherUser().getId()),subPrivateChannel.getUsing()==true?"1":"0");

        xstream = new XStream();
        xstream.alias("Session", MChannelHostSession.class);
        output = new ByteArrayOutputStream();
        xstream.marshal(mChannelHostSession, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString2(output.toString());
        this.setFlashPatch("flash/Monitor_AllinOne.swf");


        this.setHost(false);

        //最热在直播和知元新闻
        hotOnlives = personalOnliveDao.findHottestOnlive(new Pagination(4));
        goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(new Pagination(14));

        return SUCCESS;
    }


    @Action(value = "watchPrivateChannel",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".openPrivateChannel_guest")})
    public String watchPrivateChannel(){
        userPrivateChannel = userPrivateChannelDao.findById(this.getUserPrivateChannel().getId());
        MChannelGuestSession mChannelGuestSession = new MChannelGuestSession();
        mChannelGuestSession.initSession(userPrivateChannel,baseUserDao.findById(this.getSessionUserId()),"3");

        XStream xStream = new XStream();
        xStream.alias("Session",MChannelGuestSession.class);
        OutputStream outputStream = new ByteArrayOutputStream();
        xStream.marshal(mChannelGuestSession,new CompactWriter(new OutputStreamWriter(outputStream)));
        this.setInitSeesionString(outputStream.toString());
        this.setFlashPatch("flash/Monitor_AllinOne.swf");
        return SUCCESS;
    }


    private Integer getSubChannelID(UserPrivateChannel userPrivateChannel){
        Integer limitChannelNum = userPrivateChannel.getChannelNum();
        List<Integer> limitNumList = new ArrayList<Integer>();
        List<Integer> limitNumFinalList = new ArrayList<Integer>();

        for(int i= 0;i<limitChannelNum;i++){
                 limitNumList.add(i);
                 limitNumFinalList.add(i);
        }
        for(SubPrivateChannel subChannel : userPrivateChannel.getSubPrivateChannels()){
            if(!subChannel.channelFinished()){
                for(Integer num : limitNumList){
                  if(num.equals(subChannel.getSubChannelNum())) limitNumFinalList.remove(num);
                }
            }
        }
        if(limitNumFinalList.size() != 0){
            return limitNumFinalList.get(0);
        }
        else return -1;
    }

    public UserPrivateChannelDao getUserPrivateChannelDao() {
        return userPrivateChannelDao;
    }

    public void setUserPrivateChannelDao(UserPrivateChannelDao userPrivateChannelDao) {
        this.userPrivateChannelDao = userPrivateChannelDao;
    }

    public UserPrivateChannel getUserPrivateChannel() {
        return userPrivateChannel;
    }

    public void setUserPrivateChannel(UserPrivateChannel userPrivateChannel) {
        this.userPrivateChannel = userPrivateChannel;
    }

    public SubPrivateChannelDao getSubPrivateChannelDao() {
        return subPrivateChannelDao;
    }

    public void setSubPrivateChannelDao(SubPrivateChannelDao subPrivateChannelDao) {
        this.subPrivateChannelDao = subPrivateChannelDao;
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

    public SubPrivateChannel getSubPrivateChannel() {
        return subPrivateChannel;
    }

    public void setSubPrivateChannel(SubPrivateChannel subPrivateChannel) {
        this.subPrivateChannel = subPrivateChannel;
    }

    public Boolean getHost() {
        return isHost;
    }

    public void setHost(Boolean host) {
        isHost = host;
    }

     public String getFlashPatch1() {
         return flashPatch1;
     }

     public void setFlashPatch1(String flashPatch1) {
         this.flashPatch1 = flashPatch1;
     }

     public String getFlashPatch2() {
         return flashPatch2;
     }

     public void setFlashPatch2(String flashPatch2) {
         this.flashPatch2 = flashPatch2;
     }

     public String getInitSeesionString1() {
         return initSeesionString1;
     }

     public void setInitSeesionString1(String initSeesionString1) {
         this.initSeesionString1 = initSeesionString1;
     }

     public String getInitSeesionString2() {
         return initSeesionString2;
     }

     public void setInitSeesionString2(String initSeesionString2) {
         this.initSeesionString2 = initSeesionString2;
     }

     public List<PersonalOnlive> getHotOnlives() {
         return hotOnlives;
     }

     public void setHotOnlives(List<PersonalOnlive> hotOnlives) {
         this.hotOnlives = hotOnlives;
     }

     public List<GoGoWiseAnnounce> getGoGoWiseAnnounces() {
         return goGoWiseAnnounces;
     }

     public void setGoGoWiseAnnounces(List<GoGoWiseAnnounce> goGoWiseAnnounces) {
         this.goGoWiseAnnounces = goGoWiseAnnounces;
     }

     public PersonalOnliveDao getPersonalOnliveDao() {
         return personalOnliveDao;
     }

     public void setPersonalOnliveDao(PersonalOnliveDao personalOnliveDao) {
         this.personalOnliveDao = personalOnliveDao;
     }

     public GoGoWiseAnnounceDao getGoGoWiseAnnounceDao() {
         return goGoWiseAnnounceDao;
     }

     public void setGoGoWiseAnnounceDao(GoGoWiseAnnounceDao goGoWiseAnnounceDao) {
         this.goGoWiseAnnounceDao = goGoWiseAnnounceDao;
     }

     public long getValidDays() {
         return validDays;
     }

     public void setValidDays(long validDays) {
         this.validDays = validDays;
     }

     public BaseUser getOtherUser() {
         return otherUser;
     }

     public void setOtherUser(BaseUser otherUser) {
         this.otherUser = otherUser;
     }

     public MonitorAuthorizeDao getMonitorAuthorizeDao() {
         return monitorAuthorizeDao;
     }

     public void setMonitorAuthorizeDao(MonitorAuthorizeDao monitorAuthorizeDao) {
         this.monitorAuthorizeDao = monitorAuthorizeDao;
     }
 }
