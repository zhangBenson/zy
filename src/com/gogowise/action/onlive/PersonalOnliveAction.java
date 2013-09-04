package com.gogowise.action.onlive;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.PersonalOnliveGuestSession;
import com.gogowise.action.valueobject.PersonalOnliveHostSession;
import com.gogowise.dao.course.CourseDao;
import com.gogowise.dao.live.LiveChannelDao;
import com.gogowise.dao.live.LiveChannelNewEventDao;
import com.gogowise.dao.live.LiveTermCommentDao;
import com.gogowise.dao.live.LiveTrailerDao;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.user.UserFansDao;
import com.gogowise.domain.*;
import com.gogowise.utils.Constants;
import com.gogowise.utils.EmailUtil;
import com.gogowise.utils.Utils;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.CompactWriter;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class PersonalOnliveAction extends BasicAction{
    private BaseUser user;
    private BaseUserDao baseUserDao;
    private LiveChannelDao liveChannelDao;
    private PersonalOnlive personalOnlive;
    private LiveChannelNewEventDao.PersonalOnliveDao personalOnliveDao;
    private String initSeesionString;
    private String flashPatch;
    private Boolean enteredRoom = false;
    private UserMatters userMatters;
    private UserFansDao userFansDao;
    private LiveChannelDao.UserMattersDao userMattersDao;
    private List<UserFans> userFanses = new ArrayList<UserFans>();
    private CourseDao courseDao;
    private List<Course> courses = new ArrayList<Course>();
    private List<BaseUser> hotestUsers = new ArrayList<BaseUser>();
    private List<PersonalOnlive> personalOnlives = new ArrayList<PersonalOnlive>();
    private String inviteFriendHref;
    private String inviteMessage;
    private List<String> emails;
    private Boolean isHost = false;
    private Pagination pagination = new Pagination();
    private List<LiveChannel> latestChannel = new ArrayList<LiveChannel>();
    private List<LiveTrailer> liveTrailers = new ArrayList<LiveTrailer>();
    private LiveTrailerDao liveTrailerDao;
    private Boolean enteredVirtualRoom = false;
    private String chatMessage;
    private List<BaseUser> regAudiences = new ArrayList<BaseUser>();
    private LiveTermCommentDao.ValidUserDao validUserDao;

    private String address;
    private double latitude;
    private double longitude;


    @Action(value = "startPersonalOnlive",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".startPersonalOnlive")})
    public String startPersonalOnlive(){
        user = baseUserDao.findById(this.getSessionUserId());
        //如果用户正在进行直播，则不创建新的直播
        personalOnlive = personalOnliveDao.findOnlivingByUser(user.getId());
        if(personalOnlive == null){
            personalOnlive = new PersonalOnlive();
            personalOnlive.setTitle(this.getText("user.personalOnlive.title",new String[]{this.getSessionNickName()}));
            personalOnlive.setOwner(user);
            personalOnlive.setStartTime(Utils.getCurrentCalender());
            personalOnlive.setNumOfAudience(1);
//            List<PersonalOnlive> pos = personalOnliveDao.findAllForOwner(this.getSessionUserId(),null);
//            personalOnlive.setSequence(pos.size()+1);
            personalOnliveDao.persistAbstract(personalOnlive);

//            user.setOnliveTimes(personalOnliveDao.findOnliveTimesByUser(user.getId()));
            user.setOnliveTimes(user.getOnliveTimes()==null?1:user.getOnliveTimes()+1);
            baseUserDao.persistAbstract(user);
        }

//        List<PersonalOnlive> pero = personalOnliveDao.findAllForOwner(this.getSessionUserId(),null);
//        for(int i=0;i<pero.size();i++){
//           if(pero.get(i).getSequence() == null){
//              if(i == 0) pero.get(i).setSequence(1);
//              else pero.get(i).setSequence(pero.get(i-1).getSequence()+1);
//              personalOnliveDao.persistAbstract(pero.get(i));
//           }
//        }

        PersonalOnliveHostSession personalOnliveHostSession = new PersonalOnliveHostSession();
        personalOnliveHostSession.initWithHostData(personalOnlive,user);
        XStream xstream = new XStream();
        xstream.alias("Session", PersonalOnliveHostSession.class);
        OutputStream output = new ByteArrayOutputStream();
        xstream.marshal(personalOnliveHostSession, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString(output.toString());
        this.setFlashPatch("flash/Broadcast_Host.swf");
        this.setEnteredRoom(true);
        this.setHost(true);
        this.setInviteFriendHref( getBasePath()+"/watchPersonalOnlive.html?personalOnlive.id="+personalOnlive.getId());
        //为关注自己的粉丝添加新鲜事件的记录，用UserMatters保存。
        for(UserFans uf : userFansDao.findAllFansForUser(user.getId(),null)){
            UserMatters userMatters = new UserMatters();
            userMatters.setUser(uf.getFan());
            userMatters.setPersonalOnlive(personalOnlive);
            userMatters.setCreateTime(Utils.getCurrentCalender());
            userMattersDao.persistAbstract(userMatters);

            //直播消息的推送
//            keeper.control.Controller.action(new NotifyUsers(user.getId()+"$"+user.getNickName()+"$"+user.getPic()+"$"+personalOnlive.getId()+"$"+userMatters.getId()),uf.getFan().getNickName()+"notify");//各个对象接收
        }
//        userFanses = userFansDao.findAllFansForUser(this.getSessionUserId(),null);
//        courses = courseDao.findLatest4Course(new Pagination(4));
//        hotestUsers = baseUserDao.findByFansNum(new Pagination(4));
        personalOnlives = personalOnliveDao.findOtherLivingOnline(this.getSessionUserId(),new Pagination(5));

        return SUCCESS;
    }

    @Action(value = "watchPersonalOnlive",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".startPersonalOnlive")})
    public String watchPersonalOnlive(){
        personalOnlive = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        personalOnlive.setNumOfAudience(personalOnlive.getNumOfAudience()+1);
        if(this.getSessionUserId() != null){
            user = baseUserDao.findById(this.getSessionUserId());
        }else {
            int annoyNum = personalOnlive.getAnonyNum()+1;
            personalOnlive.setAnonyNum(annoyNum);
            user = new BaseUser();
            String annoyName = this.getText("per.onlive.annoy",new String[]{annoyNum+""});
            user.setNickName(annoyName);
            user.setId(-1);
        }
        PersonalOnliveGuestSession personalOnliveGuestSession = new PersonalOnliveGuestSession();
        personalOnliveGuestSession.initWithGuestData(personalOnlive,user);
        XStream xstream = new XStream();
        xstream.alias("Session", PersonalOnliveGuestSession.class);
        OutputStream output = new ByteArrayOutputStream();
        xstream.marshal(personalOnliveGuestSession, new CompactWriter(new OutputStreamWriter(output)));
        this.setInitSeesionString(output.toString());
        this.setFlashPatch("flash/Broadcast_Guest.swf");
        this.setEnteredRoom(true);
        this.setInviteFriendHref( getBasePath()+"/watchPersonalOnlive.html?personalOnlive.id="+personalOnlive.getId());
        this.setEnteredVirtualRoom(true);

        //增加直播点击量
        personalOnlive.setClickRate(personalOnlive.getClickRate()+1);
        personalOnliveDao.persistAbstract(personalOnlive);

//        courses = courseDao.findLatest4Course(new Pagination(4));
//        hotestUsers = baseUserDao.findByFansNum(new Pagination(4));
        personalOnlives = personalOnliveDao.findOtherLivingOnline(this.getSessionUserId(),new Pagination(5));

        if(this.getSessionUserId()!=null){
            ValidUser validUser = new ValidUser();
            validUser.setUserId(this.getSessionUserId());
            validUser.setPersonalOnlive(personalOnliveDao.findById(this.getPersonalOnlive().getId()));
            validUserDao.persistAbstract(validUser);
        }

        return SUCCESS;
    }

    @Action(value = "updatePerOnliveFlag")   //更新心跳信号
    public void updatePerOnliveFlag(){
        personalOnlive = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        personalOnlive.setFlag(personalOnlive.getFlag()+180);   //每180秒更新一次
        personalOnlive.setFlagUpdateTime(Utils.getCurrentCalender());
        personalOnlive.setDuration(personalOnlive.getDuration()+3);
        personalOnliveDao.persistAbstract(personalOnlive);

    }

    @Action(value = "findPersonalOnlive",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".perLiveForUserBlog")})
    public String findPersonalOnlive(){
        personalOnlive = personalOnliveDao.findLatestOneForUser(user.getId(),new Pagination(1));
        return SUCCESS;
    }

    @Action(value = "perOnliveRecordStart")
    public void perOnliveRecordStart(){
        personalOnlive = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        personalOnlive.setHaveRecord(true);
        personalOnlive.setRecordTime(Utils.getCurrentCalender());
        personalOnliveDao.persistAbstract(personalOnlive);
    }

    @Action(value = "fansWatchPerOnliveControl",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "watchPersonalOnlive", "personalOnlive.id", "${personalOnlive.id}"})})
    public String fansWatchPerOnliveControl(){
        UserMatters  um = userMattersDao.findById(userMatters.getId());
        um.setViewed(true);
        userMattersDao.persistAbstract(um);
       return SUCCESS;
    }


    @Action(value = "personalVirtualRoomEmailInviteFriends")
    public void personalVirtualRoomEmailInviteFriends(){

        user = baseUserDao.findById(this.getSessionUserId());
        personalOnlive = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        String href = getBasePath()+"/watchPersonalOnlive.html?personalOnlive.id="+personalOnlive.getId();
        for(String email : emails){
            BaseUser _user = baseUserDao.findByEmail(email);
            String title = this.getText("personal.virtual.room.invite.friend.email.title",new String[]{user.getNickName(),personalOnlive.getOwner().getNickName()});
            String content = this.getText("personal.virtual.room.invite.friend.email.content",new String[]{
                    _user == null?email:_user.getNickName(),user.getNickName(),personalOnlive.getOwner().getNickName(),this.getInviteMessage(),href,href});
            EmailUtil.sendMail(email,title,content);
        }
    }

    @Action(value = "closePersonalOnliveState")
    public void closeBrowser(){
        personalOnlive = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        personalOnlive.setFlag(personalOnlive.getFlag() - 180);
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MINUTE,-5);
        personalOnlive.setFlagUpdateTime(calendar);
        personalOnliveDao.persistAbstract(personalOnlive);
    }


    @Action(value = "saveNumOfRegAudience")   //更新最高同时注册在线用户
    public void updateNumOfRegAudience(){
        PersonalOnlive po = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        if(po.getNumOfRegAudience() < this.getPersonalOnlive().getNumOfRegAudience()){
              po.setNumOfRegAudience(po.getNumOfRegAudience());
              personalOnliveDao.persistAbstract(po);
        }
    }

    @Action(value = "saveNumOfAudience")   //更新最高同时注册在线用户
    public void updateNumOfAudience(){
        PersonalOnlive po = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        if(po.getNumOfAudience() < this.getPersonalOnlive().getNumOfAudience()){
              po.setNumOfAudience(po.getNumOfAudience());
              personalOnliveDao.persistAbstract(po);
        }
    }

    @Action(value = "addPerOnliveTitle")   //更新直播的主题
    public void addPerOnliveTitle(){
        PersonalOnlive po = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        po.setTitle(personalOnlive.getTitle());
        personalOnliveDao.persistAbstract(po);
    }

    @Action(value = "storeOnliveLocation")
    public void storeOnliveLocation(){      //储存用户位置信息
        PersonalOnlive personalOnlive = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        personalOnlive.setAddress(this.getAddress());
        personalOnlive.setLatitude(this.getLatitude());
        personalOnlive.setLongitude(this.getLongitude());
        personalOnliveDao.persistAbstract(personalOnlive);

        BaseUser owner = baseUserDao.findById(personalOnlive.getOwner().getId());
        owner.setAddress(this.getAddress());
        owner.setLatitude(this.getLatitude());
        owner.setLongitude(this.getLongitude());
        baseUserDao.persistAbstract(owner);
    }
    @Action(value = "storeOldOnliveLocation")
    public void storeOldOnliveLocation(){      //采用上次的直播间位置信息
        PersonalOnlive personalOnlive = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        BaseUser owner = baseUserDao.findById(personalOnlive.getOwner().getId());

        personalOnlive.setAddress(owner.getAddress());
        personalOnlive.setLatitude(owner.getLatitude());
        personalOnlive.setLongitude(owner.getLongitude());
        personalOnliveDao.persistAbstract(personalOnlive);
    }

    @Action(value = "storePersonalOnliveAnnouncement")      //保存直播间公告
    public void storePersonalOnliveAnnouncement(){
        PersonalOnlive currentOnlive = this.getPersonalOnlive();
        personalOnlive = personalOnliveDao.findById(this.getPersonalOnlive().getId());
        personalOnlive.setAnnouncement(currentOnlive.getAnnouncement());
        personalOnliveDao.persistAbstract(personalOnlive);
    }

    @Action(value = "liveGoingList",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveGoingList")})
    public String showLiveGoingList(){
        personalOnlives = personalOnliveDao.findAllLivingOnline(pagination);
        hotestUsers = baseUserDao.findByFansNum(new Pagination(3));
        latestChannel = liveChannelDao.findLatest4Channel(new Pagination(4));
        liveTrailers = liveTrailerDao.findByPublishTime(new Pagination(13));
        return SUCCESS;
    }


    @Action(value = "hotOnLiveList",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".hotOnLiveList")})
    public String hotOnLiveList(){
        personalOnlives = personalOnliveDao.findHottestOnlive(pagination);
        hotestUsers = baseUserDao.findByFansNum(new Pagination(3));
        latestChannel = liveChannelDao.findLatest4Channel(new Pagination(4));
        liveTrailers = liveTrailerDao.findByPublishTime(new Pagination(13));
        return SUCCESS;
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

    public PersonalOnlive getPersonalOnlive() {
        return personalOnlive;
    }

    public void setPersonalOnlive(PersonalOnlive personalOnlive) {
        this.personalOnlive = personalOnlive;
    }

    public LiveChannelNewEventDao.PersonalOnliveDao getPersonalOnliveDao() {
        return personalOnliveDao;
    }

    public void setPersonalOnliveDao(LiveChannelNewEventDao.PersonalOnliveDao personalOnliveDao) {
        this.personalOnliveDao = personalOnliveDao;
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

    public Boolean getEnteredRoom() {
        return enteredRoom;
    }

    public void setEnteredRoom(Boolean enteredRoom) {
        this.enteredRoom = enteredRoom;
    }

    public UserFansDao getUserFansDao() {
        return userFansDao;
    }

    public void setUserFansDao(UserFansDao userFansDao) {
        this.userFansDao = userFansDao;
    }

    public LiveChannelDao.UserMattersDao getUserMattersDao() {
        return userMattersDao;
    }

    public void setUserMattersDao(LiveChannelDao.UserMattersDao userMattersDao) {
        this.userMattersDao = userMattersDao;
    }

    public UserMatters getUserMatters() {
        return userMatters;
    }

    public void setUserMatters(UserMatters userMatters) {
        this.userMatters = userMatters;
    }

    public List<UserFans> getUserFanses() {
        return userFanses;
    }

    public void setUserFanses(List<UserFans> userFanses) {
        this.userFanses = userFanses;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    public Boolean isExistCourses(){
        if(this.getCourses().size() == 0){
            return false;
        }
        return true;
    }

    public Boolean isExistOnlivingPer(){
        if(this.getPersonalOnlives().size() == 0){
            return false;
        }
        return true;
    }

    public List<BaseUser> getHotestUsers() {
         for(BaseUser teacher : hotestUsers){
             teacher.setUserFocused(false);
             if(this.getSessionUserId() != null && userFansDao.findByUserAndFans(teacher.getId(),this.getSessionUserId()) != null){
                 teacher.setUserFocused(true);
             }
         }
        return hotestUsers;
    }

    public void setHotestUsers(List<BaseUser> hotestUsers) {
        this.hotestUsers = hotestUsers;
    }

    public List<PersonalOnlive> getPersonalOnlives() {
        return personalOnlives;
    }

    public void setPersonalOnlives(List<PersonalOnlive> personalOnlives) {
        this.personalOnlives = personalOnlives;
    }

    public Integer getUserFansNum(){
       return this.getUserFanses().size();
    }

    public String getInviteFriendHref() {
        return inviteFriendHref;
    }

    public void setInviteFriendHref(String inviteFriendHref) {
        this.inviteFriendHref = inviteFriendHref;
    }

    public String getInviteMessage() {
        return inviteMessage;
    }

    public void setInviteMessage(String inviteMessage) {
        this.inviteMessage = inviteMessage;
    }

    public List<String> getEmails() {
        return emails;
    }

    public void setEmails(List<String> emails) {
        this.emails = emails;
    }

    public Boolean getHost() {
        return isHost;
    }

    public void setHost(Boolean host) {
        isHost = host;
    }

    public LiveChannelDao getLiveChannelDao() {
        return liveChannelDao;
    }

    public void setLiveChannelDao(LiveChannelDao liveChannelDao) {
        this.liveChannelDao = liveChannelDao;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public List<LiveChannel> getLatestChannel() {
        return latestChannel;
    }

    public void setLatestChannel(List<LiveChannel> latestChannel) {
        this.latestChannel = latestChannel;
    }
    public List<LiveTrailer> getLiveTrailers() {
        return liveTrailers;
    }

    public void setLiveTrailers(List<LiveTrailer> liveTrailers) {
        this.liveTrailers = liveTrailers;
    }

    public LiveTrailerDao getLiveTrailerDao() {
        return liveTrailerDao;
    }

    public void setLiveTrailerDao(LiveTrailerDao liveTrailerDao) {
        this.liveTrailerDao = liveTrailerDao;
    }

    public Boolean getEnteredVirtualRoom() {
        return enteredVirtualRoom;
    }

    public void setEnteredVirtualRoom(Boolean enteredVirtualRoom) {
        this.enteredVirtualRoom = enteredVirtualRoom;
    }

    public String getChatMessage() {
        return chatMessage;
    }

    public void setChatMessage(String chatMessage) {
        this.chatMessage = chatMessage;
    }

    public List<BaseUser> getRegAudiences() {
        return regAudiences;
    }

    public void setRegAudiences(List<BaseUser> regAudiences) {
        this.regAudiences = regAudiences;
    }

    public LiveTermCommentDao.ValidUserDao getValidUserDao() {
        return validUserDao;
    }

    public void setValidUserDao(LiveTermCommentDao.ValidUserDao validUserDao) {
        this.validUserDao = validUserDao;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }
}
