package com.gogowise.action.privateChannel;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.finance.ConsumptionOrderDao;
import com.gogowise.dao.live.MonitorAuthorizeDao;
import com.gogowise.dao.live.PersonalOnliveDao;
import com.gogowise.dao.live.SubPrivateChannelDao;
import com.gogowise.dao.live.UserPrivateChannelDao;
import com.gogowise.dao.system.GoGoWiseAnnounceDao;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.user.UserAccountInfoDao;
import com.gogowise.domain.*;
import com.gogowise.utils.Constants;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class PrivateChannelAction extends BasicAction{
    private UserPrivateChannelDao userPrivateChannelDao;
    private SubPrivateChannelDao privateChannelDao;
    private BaseUserDao baseUserDao;
    private SubPrivateChannelDao subPrivateChannelDao;
    private ConsumptionOrderDao consumptionOrderDao;
    private UserAccountInfoDao userAccountInfoDao;
    private PersonalOnliveDao personalOnliveDao;
    private GoGoWiseAnnounceDao goGoWiseAnnounceDao;

    private BaseUser user;
    private UserPrivateChannel userPrivateChannel;
    private SubPrivateChannel subPrivateChannel;

    private Boolean uerChannelOpened = false;
    private Integer subChannelNum;  //子频道代号
    private Integer comboNum;//套餐数量
    private Double totalCharges;
    private Boolean chargeSuccess = true;

    private String flashPatch;
    private List<PersonalOnlive> hotOnlives = new ArrayList<PersonalOnlive>();
    private List<GoGoWiseAnnounce> goGoWiseAnnounces = new ArrayList<GoGoWiseAnnounce>();
    private List<MonitorAuthorize> monitorAuthorizeToMe;
    private List<MonitorAuthorize> meMonitorAuthorizeTo;
    private MonitorAuthorizeDao monitorAuthorizeDao;

    private List<BaseUser> authorizedUsers = new ArrayList<BaseUser>();


    private long validDays = 0;



    @Action(value = "updateSubChannelSignal")
    public void updateSubChannelSignal(){
            userPrivateChannel = userPrivateChannelDao.findByUser(baseUserDao.findById(this.getUser().getId()).getId());
            SubPrivateChannel spc = subPrivateChannelDao.findByUserChannelAndSubChannel(userPrivateChannel.getId(),this.getSubChannelNum());
            spc.setFlagUpdateTime(Calendar.getInstance());
            subPrivateChannelDao.persistAbstract(spc);
    }

    @Action(value = "privateLiveTip",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".privateLiveTip")})
    public String privateLiveTip(){
       return SUCCESS;
    }

    @Action(value="addPLFinishTime")
    public void addPLFinishTime(){
       userPrivateChannel=userPrivateChannelDao.findByUser(this.getUser().getId());
       SubPrivateChannel spc= subPrivateChannelDao.findByUserChannelAndSubChannel(userPrivateChannel.getId(),this.getSubChannelNum());
       Calendar calendar =Calendar.getInstance();
       calendar.add(Calendar.MINUTE,3);
       spc.setFlagUpdateTime(calendar);
       subPrivateChannelDao.persistAbstract(spc);
    }


    @Action(value = "updateSubChannelState")
    public void updateSubChannelState(){
            userPrivateChannel=userPrivateChannelDao.findByUser(this.getUser().getId());
            SubPrivateChannel spc= subPrivateChannelDao.findByUserChannelAndSubChannel(userPrivateChannel.getId(),this.getSubChannelNum());
            spc.setUsing(this.getSubPrivateChannel().getUsing());
            subPrivateChannelDao.persistAbstract(spc);
    }

    @Action(value = "myControlRoom",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".multiVideoRoomPrivate")})
    public String enterMultiVideoRoomPrivate(){
       this.setFlashPatch("flash/Monitor_AllinOne.swf");
       hotOnlives = personalOnliveDao.findHottestOnlive(new Pagination(4));
       goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(new Pagination(14));
       return SUCCESS;
    }


    @Action(value = "createPrivateChannel",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".openUserChannelResult")})
    public String createPrivateChannel(){

        BaseUser user = baseUserDao.findById(this.getSessionUserId());

        if(user.getOpenPrivateChannel() != null && user.getOpenPrivateChannel()){
            userPrivateChannel = userPrivateChannelDao.findByUser(user.getId());
            this.setUerChannelOpened(true);
        }else {
            userPrivateChannel = new UserPrivateChannel();
            user.setOpenPrivateChannel(true);
            baseUserDao.persistAbstract(user);
            userPrivateChannel.setUser(user);

            Calendar startTime = Calendar.getInstance();
            Calendar endTime = Calendar.getInstance();
            endTime.add(Calendar.YEAR,1);
            userPrivateChannel.setCreateTime(startTime);
            userPrivateChannel.setEndTime(endTime);

            userPrivateChannel.setOpen2User(false);
            userPrivateChannel.setChannelNum(3);
            userPrivateChannelDao.persist(userPrivateChannel);

            List<SubPrivateChannel> subPrivateChannels=new ArrayList<SubPrivateChannel>();
            for(int i=0;i<3;i++){
                SubPrivateChannel subPrivateChannelTemp1=new SubPrivateChannel();
                subPrivateChannelTemp1.setSubChannelNum(i);
                subPrivateChannelTemp1.setUsing(false);
                subPrivateChannelTemp1.setFlagUpdateTime(Calendar.getInstance());
                subPrivateChannelTemp1.setUserPrivateChannel(userPrivateChannel);
                subPrivateChannelTemp1.setOpenTime(Calendar.getInstance());
                subPrivateChannelTemp1.setName("子频道"+i);
                subPrivateChannelDao.persistAbstract(subPrivateChannelTemp1);
                subPrivateChannels.add(subPrivateChannelTemp1);
            }

           userPrivateChannel.setSubPrivateChannels(subPrivateChannels);
           userPrivateChannelDao.persist(userPrivateChannel);
           ActionContext.getContext().getSession().put(Constants.SESSION_USER_PRIVATE_CHANNEL_ID, userPrivateChannel.getId());
         }

        monitorAuthorizeToMe=monitorAuthorizeDao.findByAuthorizeTo(baseUserDao.findById(this.getSessionUserId()));
//        validDays = 365;
        return SUCCESS;
    }


    @Action(value = "openUserChannelResult",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".openUserChannelResult"),
                                                          @Result(name = "openTip",type = Constants.RESULT_NAME_TILES,location = ".privateLiveTip"),
                                                          @Result(name = "create",type = Constants.RESULT_CHAIN_ACTION,params = {"actionName","createPrivateChannel"})})
    public String openUserChannelResult(){
        monitorAuthorizeToMe=monitorAuthorizeDao.findByAuthorizeTo(baseUserDao.findById(this.getSessionUserId()));

        BaseUser user = baseUserDao.findById(this.getSessionUserId());
        if(!user.getOpenPrivateChannel()){
//            return "openTip";
            return "create";
        }
        userPrivateChannel = userPrivateChannelDao.findByUser(user.getId());
//        validDays = (userPrivateChannel.getEndTime().getTimeInMillis() - Calendar.getInstance().getTimeInMillis())/(1000*3600*24);
        return SUCCESS;
    }

    @Action(value = "monitorAuthority",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".monitorAuthority")})
    public String monitorAuthority(){
        BaseUser authorzie = baseUserDao.findById(this.getSessionUserId());
        meMonitorAuthorizeTo = monitorAuthorizeDao.findByAuthorize(authorzie);
        return SUCCESS;
    }



//    @Action(value = "closeSubChannel",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"})})
    @Action(value = "closeSubChannel")
    public void closeBrowser(){
        subPrivateChannel = subPrivateChannelDao.findById(this.getSubPrivateChannel().getId());
        subPrivateChannel.setUsing(false);
        subPrivateChannelDao.persistAbstract(subPrivateChannel);
//        return SUCCESS;
    }

    @Action(value = "privateLiveCharge",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".privateLiveCharge")})
    public String privateLiveCharge(){
        return SUCCESS;
    }

    @Action(value = "initConfirmCharge",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".initConfirmCharge")})
    public String initConfirmCharge(){
        Integer combo = this.getUserPrivateChannel().getChannelCombo();
        if(combo == 1)  this.setTotalCharges(19.5*comboNum);
        if(combo == 2)  this.setTotalCharges(58.0*comboNum);
        if(combo == 3)  this.setTotalCharges(106.0*comboNum);
        if(combo == 4)  this.setTotalCharges(196.0*comboNum);
        return SUCCESS;
    }

 @Action(value = "chargeSuccess",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".chargeSuccess"),
                                               @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".chargeSuccess")})
    public String chargeSuccess(){
        UserPrivateChannel upc = userPrivateChannelDao.findByUser(this.getSessionUserId());
        upc = dealWithChannel(upc,this.getUserPrivateChannel().getChannelCombo(),this.getComboNum());
        BaseUser zhiYuan = baseUserDao.findByEmail(Constants.ZHIBI_SYSTEM_EMAIL);    //转入知元对公账户
        consumptionOrderDao.transfer(upc.getUser(),zhiYuan,this.getTotalCharges(),Constants.TRANSFER_TYPE_OF_CHARGE_FOR_MCHANNEL);
        return SUCCESS;
    }

    public void validateChargeSuccess(){
        UserAccountInfo uai = userAccountInfoDao.findByUserId(this.getSessionUserId());
        if(uai.getAvailableZhiBi() != null && uai.getAvailableZhiBi() < this.getTotalCharges()){
            this.setChargeSuccess(false);
            addFieldError("", "");
            return;
        }

    }

    private UserPrivateChannel dealWithChannel(UserPrivateChannel upc,Integer channelCombo,Integer comboNum){

        if(upc != null){
             upc.setChannelState(UserPrivateChannel.STATE_OF_CHARGED);
             Calendar endTime = (Calendar)upc.getEndTime().clone();
             if(channelCombo == 1) endTime.add(Calendar.MONTH,1*comboNum);
             if(channelCombo == 2) endTime.add(Calendar.MONTH,3*comboNum);
             if(channelCombo == 3) endTime.add(Calendar.MONTH,6*comboNum);
             if(channelCombo == 4) endTime.add(Calendar.YEAR,1*comboNum);
             upc.setEndTime(endTime);
        }else {
            BaseUser user = baseUserDao.findById(this.getSessionUserId());
            user.setOpenPrivateChannel(true);
            baseUserDao.persistAbstract(user);
            upc = new UserPrivateChannel();
            upc.setUser(user);
            upc.setChannelState(UserPrivateChannel.STATE_OF_CHARGED);//设置当前状态为正式购买
            Calendar startTime = Calendar.getInstance();
            Calendar endTime = Calendar.getInstance();
            endTime.add(Calendar.MONTH,1);
            if(channelCombo == 1) endTime.add(Calendar.MONTH,1*comboNum);
            if(channelCombo == 2) endTime.add(Calendar.MONTH,3*comboNum);
            if(channelCombo == 3) endTime.add(Calendar.MONTH,6*comboNum);
            if(channelCombo == 4) endTime.add(Calendar.YEAR,1*comboNum);
            upc.setCreateTime(startTime);
            upc.setEndTime(endTime);
            upc.setOpen2User(false);
            upc.setChannelNum(3);

            ActionContext.getContext().getSession().put(Constants.SESSION_USER_PRIVATE_CHANNEL_ID, upc.getId());
        }
        userPrivateChannelDao.persist(upc);
        return upc;
    }






    public UserPrivateChannelDao getUserPrivateChannelDao() {
        return userPrivateChannelDao;
    }

    public void setUserPrivateChannelDao(UserPrivateChannelDao userPrivateChannelDao) {
        this.userPrivateChannelDao = userPrivateChannelDao;
    }

    public SubPrivateChannelDao getPrivateChannelDao() {
        return privateChannelDao;
    }

    public void setPrivateChannelDao(SubPrivateChannelDao privateChannelDao) {
        this.privateChannelDao = privateChannelDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public SubPrivateChannel getSubPrivateChannel() {
        return subPrivateChannel;
    }

    public void setSubPrivateChannel(SubPrivateChannel subPrivateChannel) {
        this.subPrivateChannel = subPrivateChannel;
    }

    public SubPrivateChannelDao getSubPrivateChannelDao() {
        return subPrivateChannelDao;
    }

    public void setSubPrivateChannelDao(SubPrivateChannelDao subPrivateChannelDao) {
        this.subPrivateChannelDao = subPrivateChannelDao;
    }

    public UserPrivateChannel getUserPrivateChannel() {
        return userPrivateChannel;
    }

    public void setUserPrivateChannel(UserPrivateChannel userPrivateChannel) {
        this.userPrivateChannel = userPrivateChannel;
    }

    public Boolean getUerChannelOpened() {
        return uerChannelOpened;
    }

    public void setUerChannelOpened(Boolean uerChannelOpened) {
        this.uerChannelOpened = uerChannelOpened;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public Integer getSubChannelNum() {
        return subChannelNum;
    }

    public void setSubChannelNum(Integer subChannelNum) {
        this.subChannelNum = subChannelNum;
    }

    public Integer getComboNum() {
        return comboNum;
    }

    public void setComboNum(Integer comboNum) {
        this.comboNum = comboNum;
    }

    public Double getTotalCharges() {
        return totalCharges;
    }

    public void setTotalCharges(Double totalCharges) {
        this.totalCharges = totalCharges;
    }

    public ConsumptionOrderDao getConsumptionOrderDao() {
        return consumptionOrderDao;
    }

    public void setConsumptionOrderDao(ConsumptionOrderDao consumptionOrderDao) {
        this.consumptionOrderDao = consumptionOrderDao;
    }

    public UserAccountInfoDao getUserAccountInfoDao() {
        return userAccountInfoDao;
    }

    public void setUserAccountInfoDao(UserAccountInfoDao userAccountInfoDao) {
        this.userAccountInfoDao = userAccountInfoDao;
    }

    public Boolean getChargeSuccess() {
        return chargeSuccess;
    }

    public void setChargeSuccess(Boolean chargeSuccess) {
        this.chargeSuccess = chargeSuccess;
    }

    public String getFlashPatch() {
        return flashPatch;
    }

    public void setFlashPatch(String flashPatch) {
        this.flashPatch = flashPatch;
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

    public List<MonitorAuthorize> getMonitorAuthorizeToMe() {
        return monitorAuthorizeToMe;
    }

    public void setMonitorAuthorizeToMe(List<MonitorAuthorize> monitorAuthorizeToMe) {
        this.monitorAuthorizeToMe = monitorAuthorizeToMe;
    }

    public List<MonitorAuthorize> getMeMonitorAuthorizeTo() {
        return meMonitorAuthorizeTo;
    }

    public void setMeMonitorAuthorizeTo(List<MonitorAuthorize> meMonitorAuthorizeTo) {
        this.meMonitorAuthorizeTo = meMonitorAuthorizeTo;
    }

    public MonitorAuthorizeDao getMonitorAuthorizeDao() {
        return monitorAuthorizeDao;
    }

    public void setMonitorAuthorizeDao(MonitorAuthorizeDao monitorAuthorizeDao) {
        this.monitorAuthorizeDao = monitorAuthorizeDao;
    }

    public List<BaseUser> getAuthorizedUsers() {
        return authorizedUsers;
    }

    public void setAuthorizedUsers(List<BaseUser> authorizedUsers) {
        this.authorizedUsers = authorizedUsers;
    }
}
