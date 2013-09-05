package com.gogowise.action.onlive;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.course.CourseDao;
import com.gogowise.dao.live.*;
import com.gogowise.dao.org.OrganizationDao;
import com.gogowise.dao.system.GoGoWiseAnnounceDao;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.user.UserFansDao;
import com.gogowise.domain.*;
import com.gogowise.utils.Constants;
import com.gogowise.utils.EmailUtil;
import com.gogowise.utils.Utils;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class LiveChannelAction extends BasicAction{
    private LiveChannelDao liveChannelDao;
    private LiveChannel liveChannel;
    private List<LiveChannel> liveChannels;
    private BaseUser user;
    private BaseUserDao baseUserDao;
    private MemberOfLiveChannelDao memberOfLiveChannelDao;
    private Integer operaType;
    private OrganizationDao organizationDao;
    private List<String> contestants;
    private List<String> guests;
    private Boolean host;
    private ChannelTermsDao channelTermsDao;
    private ChannelTerms channelTerms;
    private Boolean createChannelTerm;
    private OnliveFollowerDao onliveFollowerDao;
    private OnliveFollower onliveFollower;
    private LiveTermComment liveTermComment;
    private LiveTermCommentDao liveTermCommentDao;
    private List<LiveTermComment> liveTermComments = new ArrayList<LiveTermComment>();
    private Integer commentsNum;
    private Boolean commentsNumOverflow = false;
    private List<LiveChannel> liveChannelsToHost = new ArrayList<LiveChannel>();
    private MemberOfLiveChannel memberOfLiveChannel;
    private SeasonIncreasedOnliveFansDao seasonIncreasedOnliveFansDao;
    private AdvertisementForLiveDao advertisementForLiveDao;
    private Map<Integer,String> ads = new HashMap<Integer, String>();
    private Boolean focused = false;
    private List<AdvertisementForLive> advertisementForLives = new ArrayList<AdvertisementForLive>();
    private List<Course> courses = new ArrayList<Course>();
    private CourseDao courseDao;
    private List<LiveChannel> liveChannelsOnline = new ArrayList<LiveChannel>();
    private List<PersonalOnlive> onlivings = new ArrayList<PersonalOnlive>();
    private List<LiveChannel> hotestLiveChannels = new ArrayList<LiveChannel>();
    private List<PersonalOnlive> onliveStars = new ArrayList<PersonalOnlive>();
    private List<Course> coursesForAds = new ArrayList<Course>();
    private Pagination pagination =new Pagination(8);
    private List<GoGoWiseAnnounce> goGoWiseAnnounces = new ArrayList<GoGoWiseAnnounce>();
    private GoGoWiseAnnounceDao goGoWiseAnnounceDao;
    private PersonalOnliveDao personalOnliveDao;
    private UserFansDao userFansDao;
    private LiveChannelNewEventDao liveChannelNewEventDao;
    private List<LiveChannelNewEvent> liveChannelNewEvents = new ArrayList<LiveChannelNewEvent>();
    private List<LiveChannelComment> liveChannelComments = new ArrayList<LiveChannelComment>();
    private LiveChannelCommentDao liveChannelCommentDao;
    private LiveChannelComment liveChannelComment;
    private List<OnliveFollower> onliveFollowers = new ArrayList<OnliveFollower>();
    private List<String> emails = new ArrayList<String>();
    private String comments;
    private List<BaseUser> hottestUsers = new ArrayList<BaseUser>();
    private List<LiveChannel> latestChannel = new ArrayList<LiveChannel>();
    private LiveChannelNewEvent liveChannelNewEvent;
    private List<LiveTrailer> liveTrailers = new ArrayList<LiveTrailer>();
    private LiveTrailerDao liveTrailerDao;

    @Action(value="liveSquare",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveSquare")})
    public String initLiveSquare(){
        liveChannelsOnline = liveChannelDao.findForcastChannel(pagination);

        onlivings = personalOnliveDao.findAllLivingOnline(pagination);
        for(PersonalOnlive po : onlivings){
            po.getOwner().setUserFocused(false);
            if(this.getSessionUserId() != null){
                   if(userFansDao.findByUserAndFans(po.getOwner().getId(),this.getSessionUserId()) != null) po.getOwner().setUserFocused(true);
            }
        }

        hotestLiveChannels = liveChannelDao.findAllForBidding(pagination);
        for(LiveChannel lc :hotestLiveChannels){
           lc.setUserType(1);
           if(this.getSessionUserId() != null){
               if(this.getSessionUserId().equals(lc.getCreator().getId())) lc.setUserType(Constants.MEMBER_TYPE_OF_FANS);
               else if(onliveFollowerDao.findByLiveAndUser(lc.getId(),this.getSessionUserId()) != null) lc.setUserType(Constants.MEMBER_TYPE_OF_FANS);
           }
        }

        onliveStars = personalOnliveDao.findByLiveTimes(pagination);
        for(PersonalOnlive po : onliveStars){
            po.getOwner().setUserFocused(false);
            if(this.getSessionUserId() != null){
                   if(userFansDao.findByUserAndFans(po.getOwner().getId(),this.getSessionUserId()) != null) po.getOwner().setUserFocused(true);
            }
        }
        coursesForAds = courseDao.findLatest4Course(new Pagination(4));
       // goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(new Pagination(10));
        liveTrailers = liveTrailerDao.findByPublishTime(new Pagination(13));
        liveChannelNewEvents = liveChannelNewEventDao.findLatestNews(new Pagination(13));
        return SUCCESS;
    }
    @Action(value="addLiveEvent",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".addLiveEvent")})
    public String addLiveEvents(){
        return SUCCESS;
    }

     @Action(value="saveLiveEvent",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,
             params = {"actionName","liveChannelEventRead","liveChannelNewEvent.id","${liveChannelNewEvent.id}"})})
    public String saveLiveEvent(){
         liveChannel = liveChannelDao.findById(this.getLiveChannel().getId());
         liveChannelNewEvent.setCreateTime(Calendar.getInstance());
         liveChannelNewEvent.setLiveChannel(liveChannel);
         liveChannelNewEvent.setOwner(baseUserDao.findById(this.getSessionUserId()));
         liveChannelNewEventDao.persist(liveChannelNewEvent);
        return SUCCESS;
    }

    @Action(value="liveHotList",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveHotList")})
    public String showHotLive(){
        pagination.setPageSize(5);
        hotestLiveChannels = liveChannelDao.findAllForBidding(pagination);
        hottestUsers = baseUserDao.findByFansNum(new Pagination(3));
        latestChannel = liveChannelDao.findLatest4Channel(new Pagination(4));
        return SUCCESS;
    }
    @Action(value="liveNewList",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveNewList")})
    public String showNewLive(){
        pagination.setPageSize(5);
        latestChannel = liveChannelDao.findLatest4Channel(pagination);
        hottestUsers = baseUserDao.findByFansNum(new Pagination(3));
        hotestLiveChannels = liveChannelDao.findAllForBidding(new Pagination(4));
        return SUCCESS;
    }

    @Action(value="initMyOnlive",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".myOnlive")})
    public String initMyOnlive(){
        liveChannels = liveChannelDao.findMyChannelByID(this.getSessionUserId(),pagination);
        this.setOperaType(Constants.OPERA_TYPE_FOR_ONLIVE_MATTER);
        return SUCCESS;
    }
    @Action(value="listParticipatingChannel",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".myParticipatingChannel")})
    public String listParticipatingChannel(){
        liveChannels = liveChannelDao.findUserRegChannel(this.getSessionUserId(), pagination);
        return SUCCESS;
    }
    @Action(value="listFollowingChannel",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".myFollowingChannel")})
    public String listFollowingChannel(){
        liveChannels = liveChannelDao.findUserFollowed(this.getSessionUserId(),pagination);
        return SUCCESS;
    }

    @Action(value="createOnlive",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".onliveCreate")})
    public String createOnlive(){
        this.setOperaType(Constants.OPERA_TYPE_FOR_ONLIVE_MATTER);
        return SUCCESS;
    }
    @Action(value="createLiveTerm",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveTermCreate")})
    public String createLiveTerm(){
        this.setOperaType(Constants.OPERA_TYPE_FOR_ONLIVE_MATTER);
        return SUCCESS;
    }
    @Action(value="maintenanceOnlive",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveTermCreate")})
    public String maintenanceOnlive(){
        liveChannel = liveChannelDao.findById(liveChannel.getId());
        channelTerms = new ChannelTerms();
        channelTerms.setHostEmail(this.getSessionUserEmail());
        this.setOperaType(Constants.OPERA_TYPE_FOR_ONLIVE_MATTER);
        return SUCCESS;
    }

     @Action(value="initLiveChannelManagement",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveChannelManagement")})
     public String liveChannelManagement(){
         liveChannel = liveChannelDao.findById(liveChannel.getId());
         this.setOperaType(Constants.OPERA_TYPE_FOR_ONLIVE_MATTER);
         return SUCCESS;
     }
     @Action(value="manageLiveTerm",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveTermManagement")})
     public String manageLiveTerm(){
         liveChannel = liveChannelDao.findById(this.getLiveChannel().getId());
         this.setOperaType(Constants.OPERA_TYPE_FOR_ONLIVE_MATTER);
         return SUCCESS;
     }

    @Action(value = "liveChannelManage",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "initMyOnlive"})})
    public String liveChannelManage(){
        LiveChannel existChannel = liveChannelDao.findById(this.getLiveChannel().getId());
        if(StringUtils.isNotBlank(liveChannel.getName())) existChannel.setName(getEmptyString(liveChannel.getName()));
        if(StringUtils.isNotBlank(liveChannel.getLogoUrl()) && !liveChannel.getLogoUrl().equals(existChannel.getLogoUrl())){
            Utils.notReplaceFileFromTmp(Constants.UPLOAD_ONLIVE_PATH + "/" + getSessionUserId(), liveChannel.getLogoUrl());
            existChannel.setLogoUrl(Constants.UPLOAD_ONLIVE_PATH + "/" + getSessionUserId()+"/"+liveChannel.getLogoUrl());
        }
        if(StringUtils.isNotBlank(liveChannel.getDescription())) existChannel.setDescription(getEmptyString(liveChannel.getDescription()));
        liveChannelDao.persistAbstract(existChannel);
        return SUCCESS;
    }
    @Action(value = "manageLiveChannelAds",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveChannelAdManage")})
    public String manageLiveChannelAds(){
        liveChannels = liveChannelDao.findByUserID(this.getSessionUserId(), pagination);
        return SUCCESS;
    }

     @Action(value = "initLiveChannelAds",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveChannelAdManage")})
    public String initLiveChannelAds(){
        liveChannel = liveChannelDao.findById(this.getLiveChannel().getId());
        return SUCCESS;
    }


    @Action(value = "rangeLiveChannel",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveChannelRangeBoard")})
    public String rangeLiveChannel(){
        liveChannels = liveChannelDao.findAllForBidding(pagination);
        return SUCCESS;
    }

    @Action(value = "listLiveChannelAdBid",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveChannelAdBidList")})
    public String listLiveChannelAdBid(){
        liveChannel = liveChannelDao.findById(this.getLiveChannel().getId());
        return SUCCESS;
    }

    @Action(value = "createLiveChannelAdBid",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveChannelAdBidCreation")})
    public String createLiveChannelAdBid(){
        List<AdvertisementForLive> advertisementForLives = advertisementForLiveDao.findByProvider(this.getSessionUserId());
        for(AdvertisementForLive ad :advertisementForLives){
            ads.put(ad.getId(),ad.getProductName());
        }
         if(!ads.isEmpty()){
            ads.put(-1,"其他");
        }
        return SUCCESS;
    }

    @Action(value = "saveLiveChannel",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "initMyOnlive"}),
                                                    @Result(name = "createTerms",type = Constants.RESULT_NAME_TILES,location = ".liveTermCreate")})
    public String saveLiveChannel(){
        liveChannel.setCreator(baseUserDao.findById(this.getSessionUserId()));
        if (StringUtils.isNotBlank(liveChannel.getLogoUrl())) {
            Utils.notReplaceFileFromTmp(Constants.UPLOAD_ONLIVE_PATH + "/" + getSessionUserId(), liveChannel.getLogoUrl());
            liveChannel.setLogoUrl(Constants.UPLOAD_ONLIVE_PATH + "/" + getSessionUserId()+"/"+liveChannel.getLogoUrl());
        }else{
            liveChannel.setLogoUrl(Constants.DEFAULT_ONLIVE_IMAGE);
        }
        Organization org = organizationDao.findByResId(this.getSessionUserId());
        if(org != null) liveChannel.setOrganization(org);
        liveChannel.setCreateTime(Utils.getCurrentCalender());
        liveChannelDao.persistAbstract(liveChannel);

        if(this.getCreateChannelTerm()){
            channelTerms = new ChannelTerms();
            this.getChannelTerms().setHostEmail(this.getSessionUserEmail());
            this.getChannelTerms().setSubTitle(liveChannel.getName());
            return "createTerms" ;
        }
        return SUCCESS;
    }

    @Action(value = "saveChannelTerms",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "initMyOnlive"}),
                                                     @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".liveTermCreate")})
    public String saveChannelTerms(){
        if (StringUtils.isNotBlank(channelTerms.getLogoUrl())) {
            Utils.notReplaceFileFromTmp(Constants.UPLOAD_ONLIVE_TERM_PATH + "/" + getSessionUserId(), channelTerms.getLogoUrl());
            channelTerms.setLogoUrl(Constants.UPLOAD_ONLIVE_TERM_PATH + "/" + getSessionUserId()+"/"+channelTerms.getLogoUrl());
        }else{
            channelTerms.setLogoUrl(Constants.DEFAULT_ONLIVE_IMAGE);
        }
        BaseUser host = baseUserDao.findByEmail(channelTerms.getHostEmail());
        if(host != null){
            channelTerms.setHost(host);
        }
        channelTerms.setLiveChannel(liveChannelDao.findById(this.getLiveChannel().getId()));
        channelTermsDao.persistAbstract(channelTerms);
        for(String contestant : contestants){ //处理选手  ，存入相应的email和type
            if(StringUtils.isNotBlank(contestant) && memberOfLiveChannelDao.findByChannelTermAndEmail(channelTerms.getId(),contestant) == null){
                MemberOfLiveChannel memberOfLiveChannel = new MemberOfLiveChannel();
                memberOfLiveChannel.setChannelTerms(channelTerms);
                memberOfLiveChannel.setType(Constants.MEMBER_TYPE_OF_CONTESTANT);
                memberOfLiveChannel.setMemberEmail(contestant);
                memberOfLiveChannelDao.persistAbstract(memberOfLiveChannel);
                channelTerms.getMemberOfLiveChannels().add(memberOfLiveChannel);
            }
        }
        for(String guest : guests){   //处理嘉宾 ，存入相应的email和type
            if(StringUtils.isNotBlank(guest) && memberOfLiveChannelDao.findByChannelTermAndEmail(channelTerms.getId(),guest) == null){
                MemberOfLiveChannel memberOfLiveChannel = new MemberOfLiveChannel();
                memberOfLiveChannel.setChannelTerms(channelTerms);
                memberOfLiveChannel.setType(Constants.MEMBER_TYPE_OF_QUEST);
                memberOfLiveChannel.setMemberEmail(guest);
                memberOfLiveChannelDao.persistAbstract(memberOfLiveChannel);
                channelTerms.getMemberOfLiveChannels().add(memberOfLiveChannel);
            }
        }
        sendEmailForChannel(channelTerms,channelTerms.getLiveChannel().getOrganization());
        sendEmail2ChannelFollower(channelTerms);
        return SUCCESS;
    }

    public void validateSaveChannelTerms(){
        for(String contestantEmail : this.getContestants()){
            if(contestantEmail.equals(channelTerms.getHostEmail())){
                addFieldError("channelTerms.hostEmail","节目选手不能与主持人重复");
                return ;
            }
            for(String guestEmail : this.getGuests()){
                if(guestEmail.equals(channelTerms.getHostEmail())){
                    addFieldError("channelTerms.hostEmail","节目嘉宾不能与主持人重复");
                    return ;
                }
                if(guestEmail.equals(contestantEmail)){
                    addFieldError("channelTerms.hostEmail","节目选手与节目嘉宾不能重复");
                    return ;
                }
            }
        }
    }


    @Action(value = "resetOnLiveCurrentID")
    public void resetOnLiveCurrentID(){
        ChannelTerms existChannelTerm = channelTermsDao.findById(this.getChannelTerms().getId());
        existChannelTerm.setCurrentID(this.getChannelTerms().getCurrentID());
        liveChannelDao.persistAbstract(existChannelTerm);
    }

    @Action(value="multiLiveChannel",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".multiLiveChannel")})
    public String multiLiveChannel(){
        liveChannels = liveChannelDao.findAllOwnFutureTermsChannel(new Pagination(10));
        if(this.getSessionUserId() != null) setUserTypeForChannels(liveChannels,this.getSessionUserId());
        return SUCCESS;
    }
    @Action(value="liveChannelBlog",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveChannelBlog")})
    public String liveChannelBlog(){
        liveChannel  = liveChannelDao.findById(this.getLiveChannel().getId());
        //留言部分
        Pagination page = new Pagination(10);
        liveChannelComments = liveChannelCommentDao.findByChannelID(liveChannel.getId(),page);
        this.setCommentsNum(liveChannelComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }

        onliveFollowers = onliveFollowerDao.findByOnlive(liveChannel.getId(), pagination);
        liveChannelNewEvents = liveChannelNewEventDao.findLatestNews(pagination);
        liveChannels = liveChannelDao.findAllForBidding(new Pagination(4));

        //判断此用户是否关注了该栏目
        if(this.getSessionUserId() != null){
             OnliveFollower off = onliveFollowerDao.findByLiveAndUser(liveChannel.getId(),this.getSessionUserId());
             if(off != null) this.setFocused(true);
        }
        return SUCCESS;
    }
    @Action(value="liveTermBlog",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveTermBlog")})
    public String liveTermBlog(){
        channelTerms  = channelTermsDao.findById(this.getChannelTerms().getId());
        Pagination page = new Pagination(10);
        liveTermComments = liveTermCommentDao.findByTermsID(channelTerms.getId(),page);
        if(channelTerms.getHost() != null) liveChannelsToHost = liveChannelDao.findByTermHost(channelTerms.getHost().getId(),null);
        this.setCommentsNum(liveTermComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        liveChannels = liveChannelDao.findOtherLatest4Channel(channelTerms.getLiveChannel().getId(),new Pagination(4));

        if(this.getSessionUserId() != null){
             OnliveFollower off = onliveFollowerDao.findByLiveAndUser(this.getChannelTerms().getLiveChannel().getId(),this.getSessionUserId());
             if(off != null)
                 this.setFocused(true);
        }

        List<Course> cs = courseDao.findLatest4Course(new Pagination(4));
        int adNum = channelTerms.getLiveChannel().getThisSeasonAd().size();
        for(AdvertisementForLive ad : channelTerms.getLiveChannel().getThisSeasonAd()){
            advertisementForLives.add(ad);
        }
        for(AdvertisementForLive ad : channelTerms.getLiveChannel().getNextSeasonAd()){
            if(advertisementForLives.size() < 4){
                advertisementForLives.add(ad);
                adNum  ++ ;
            }
        }
        for(int i = 0; i<(cs.size()>4-adNum? 4-adNum:cs.size());i++){
            if(cs.get(i) != null){
                courses.add(cs.get(i));
            }
        }

        channelTerms.getLiveChannel().setTotalInviteNum(channelTerms.getLiveChannel().getTotalInviteNum() == null ? 1 : channelTerms.getLiveChannel().getTotalInviteNum() + 1);      //用户进入一次博客 栏目访问量加1
        liveChannelDao.persistAbstract(channelTerms.getLiveChannel());

        SeasonIncreasedOnliveFans siof = seasonIncreasedOnliveFansDao.findByLiveAndCalendar(channelTerms.getLiveChannel().getId(),Utils.getCurrentCalender().get(Calendar.YEAR),Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
        if(siof == null){    //用户进一次博客，当前季度用户访问量加1
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


    @Action(value = "emailHandleForLiveChannelInvitation",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myfirstPage"}),
                                                                           @Result(name = NONE,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
    public String emailHandleForLiveChannelInvitation(){
        channelTerms = channelTermsDao.findById(this.getChannelTerms().getId());
        if(this.getHost()!=null && this.getHost() == true){
             if(this.getUser().getEmail().equals(channelTerms.getHostEmail())){
                 BaseUser host = baseUserDao.findByEmail(this.getUser().getEmail());
                 channelTerms.setHost(host);
                 channelTermsDao.persistAbstract(channelTerms);
             }else {
                 return NONE;
             }

        }else if(this.getHost() != null && this.getHost() == false) {
            MemberOfLiveChannel mlc = memberOfLiveChannelDao.findByChannelTermAndEmail(channelTerms.getId(),user.getEmail());
            if(mlc!=null){
                if(mlc.getMember() == null || mlc.getAcceptInvite() == false){
                   mlc.setMember(baseUserDao.findByEmail(user.getEmail()));
                   mlc.setAcceptInvite(true);
                   memberOfLiveChannelDao.persistAbstract(mlc);
                }
            }else {
                return NONE;
            }

        }else {
            return NONE;
        }
        return SUCCESS;
    }

    @Action(value = "addUser2LiveFollower")
    public void addUser2LiveFollower(){
        OnliveFollower of = onliveFollowerDao.findByLiveAndUser(this.getLiveChannel().getId(), this.getSessionUserId());
        liveChannel = liveChannelDao.findById(this.getLiveChannel().getId());
        if(of == null){
            OnliveFollower onliveFollower = new OnliveFollower();
            onliveFollower.setLiveChannel(liveChannel);
            onliveFollower.setFollower(baseUserDao.findById(this.getSessionUserId()));
            onliveFollower.setFollowTime(Utils.getCurrentCalender());
            onliveFollowerDao.persistAbstract(onliveFollower);
        }

        SeasonIncreasedOnliveFans siof = seasonIncreasedOnliveFansDao.findByLiveAndCalendar(liveChannel.getId(),Utils.getCurrentCalender().get(Calendar.YEAR),Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
        if(siof == null){    //用户进一次博客，当前季度用户访问量加1
               SeasonIncreasedOnliveFans curr = new SeasonIncreasedOnliveFans();
               curr.setLiveChannel(liveChannel);
               curr.setFocusTime(Utils.getCurrentCalender());
               curr.setYear(Utils.getCurrentCalender().get(Calendar.YEAR));
               curr.setSeason(Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
               curr.setFansNum(1);
               seasonIncreasedOnliveFansDao.persistAbstract(curr);
        }else {
               siof.setFansNum(siof.getFansNum()+1);
               seasonIncreasedOnliveFansDao.persistAbstract(siof);
        }

    }

     @Action(value = "saveTitbits")
     public void saveTitbits(){
         ChannelTerms ct = channelTermsDao.findById(this.getChannelTerms().getId());
         ct.setTitbits(this.getChannelTerms().getTitbits());
         channelTermsDao.persistAbstract(ct);
     }

    @Action(value = "saveLiveTermComment",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveTermComment")})
    public String saveLiveTermComment(){
        channelTerms = channelTermsDao.findById(channelTerms.getId());
        BaseUser commenter = baseUserDao.findById(this.getSessionUserId());
        liveTermComment.setChannelTerms(channelTerms);
        liveTermComment.setCommenter(commenter);
        liveTermComment.setCommentTime(Utils.getCurrentCalender());
        Integer toFriendID = (Integer) ActionContext.getContext().getSession().get("toReplyerUserID");
        if( toFriendID != null){
            BaseUser toFriend = baseUserDao.findById(toFriendID);
            liveTermComment.setToFriend(toFriend);
            ActionContext.getContext().getSession().remove("toReplyerUserID");
            sendEmailForReply(channelTerms,commenter,toFriend,liveTermComment.getContent());
        }else {
             sendEmailForComment(channelTerms,commenter,liveTermComment.getContent());
        }
        liveTermCommentDao.persistAbstract(liveTermComment);

        Pagination page = new Pagination(commentsNum+1);
        liveTermComments = liveTermCommentDao.findByTermsID(channelTerms.getId(), page);
        this.setCommentsNum(liveTermComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        return SUCCESS;
    }
    @Action(value = "saveLiveChannelComment",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveChannelComment")})
    public String saveLiveChannelComment(){
        liveChannel = liveChannelDao.findById(liveChannel.getId());
        BaseUser commenter = baseUserDao.findById(this.getSessionUserId());
        liveChannelComment.setLiveChannel(liveChannel);
        liveChannelComment.setCommenter(commenter);
        liveChannelComment.setCommentTime(Utils.getCurrentCalender());
        Integer toFriendID = (Integer) ActionContext.getContext().getSession().get("toReplyerUserID");
        if( toFriendID != null){
            BaseUser toFriend = baseUserDao.findById(toFriendID);
            liveChannelComment.setToFriend(toFriend);
            ActionContext.getContext().getSession().remove("toReplyerUserID");
         //  sendEmailForReply(channelTerms,commenter,toFriend,liveTermComment.getContent());
        }
        liveChannelCommentDao.persistAbstract(liveChannelComment);

        Pagination page = new Pagination(commentsNum+1);
        liveChannelComments = liveChannelCommentDao.findByChannelID(liveChannel.getId(), page);
        this.setCommentsNum(liveChannelComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        return SUCCESS;
    }


    @Action(value = "moreLiveTermsComments",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveTermComment")})
    public String moreLiveTermsComments(){
        Pagination page = new Pagination(this.getCommentsNum()+Constants.DEFAULT_PAGE_OF_COMMENTS_INCREASED_SIZE);
        liveTermComments = liveTermCommentDao.findByTermsID(channelTerms.getId(), page);
        this.setCommentsNum(liveTermComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        return SUCCESS;
    }

     @Action(value = "moreLiveChannelComments",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveChannelComment")})
     public String moreLiveChannelComments(){
         Pagination page = new Pagination(this.getCommentsNum()+Constants.DEFAULT_PAGE_OF_COMMENTS_INCREASED_SIZE);
         liveChannelComments = liveChannelCommentDao.findByChannelID(this.getLiveChannel().getId(),page);
         this.setCommentsNum(liveTermComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
         return SUCCESS;
     }
//
//     @Action(value = "liveGoingList",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveGoingList")})
//     public String showLiveGoingList(){
//         return SUCCESS;
//     }

     @Action(value = "addLiveGoingAnnouncement",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".addLiveGoingAnnouncement")})
     public String addLiveAnnouncement(){
         return SUCCESS;
     }



    private void sendEmailForReply(ChannelTerms channelTerms, BaseUser commenter,BaseUser toFriend, String message){
         String href = getBasePath() + "/liveTermBlog.html?channelTerms.id="+channelTerms.getId();
         String title = this.getText("channelTerm.blog.reply.comment.title",new String[]{commenter.getNickName(),channelTerms.getSubTitle()});
         String content = this.getText("channelTerm.blog.reply.comment.content",new String[]{toFriend.getNickName(),commenter.getNickName(),channelTerms.getSubTitle(),message,href,href});
         EmailUtil.sendMail(toFriend.getEmail(),title,content);
    }

    private void sendEmailForComment(ChannelTerms channelTerms,BaseUser commenter,String message){
         String href = getBasePath() + "/liveTermBlog.html?channelTerms.id="+channelTerms.getId();
         String title = this.getText("channelTerm.blog.reply.comment.title",new String[]{commenter.getNickName(),channelTerms.getSubTitle()});
         String content = this.getText("channelTerm.blog.reply.comment.content",new String[]{channelTerms.getHost().getNickName(),commenter.getNickName(),channelTerms.getSubTitle(),message,href,href});
         EmailUtil.sendMail(channelTerms.getHost().getEmail(),title,content);
    }



    @Action(value = "deleteLiveTermComment")
    public void deleteLiveTermComment(){
        liveTermComment = liveTermCommentDao.findById(this.getLiveTermComment().getId());
        liveTermCommentDao.delete(liveTermComment);
    }

    @Action(value = "deleteLiveChannelComment")
    public void deleteLiveChannelComment(){
        liveChannelComment = liveChannelCommentDao.findById(this.getLiveChannelComment().getId());
        liveChannelCommentDao.delete(liveChannelComment);
    }

    @Action(value = "deleteTermsMember")
    public void deleteTermsMember(){
         memberOfLiveChannel = memberOfLiveChannelDao.findById(this.getMemberOfLiveChannel().getId());
        if(memberOfLiveChannel != null) {
            memberOfLiveChannelDao.delete(memberOfLiveChannel);
        }
    }

    @Action(value = "channelTermRecordStart")
    public void channelTermRecordStart(){
        channelTerms = channelTermsDao.findById(this.getChannelTerms().getId());
        channelTerms.setHaveRecord(true);
        channelTerms.setRecordTime(Utils.getCurrentCalender());
        channelTermsDao.persistAbstract(channelTerms);
    }


    @Action(value = "recommendLiveChannelAjax")
    public void recommendShowAjax(){
        liveChannel = liveChannelDao.findById(this.getLiveChannel().getId());
        String title = this.getText("onlive.recommend.friend.email.title",new String[]{this.getSessionNickName(),liveChannel.getName()});
        String  href = getBasePath()+"/liveChannelBlog.html?liveChannel.id="+liveChannel.getId();
        for(String email : emails){
            if(StringUtils.isNotBlank(email)){
                BaseUser _user = baseUserDao.findByEmail(email);
                String content = Constants.BIG_COURSE_ADVERTISE_EMAIL_CSS + this.getText("onlive.recommend.friend.email.content",new String[]{
                        _user == null ?email : _user.getNickName(),this.getSessionNickName(),liveChannel.getCreator().getNickName(),liveChannel.getName(),this.getComments(),href,href,email
                });
                EmailUtil.sendMail(email,title,content);
            }

        }

    }


    private void sendEmailForChannel(ChannelTerms channelTerms , Organization org){
       if(!channelTerms.getHostEmail().equals(this.getSessionUserEmail())){      //email to the host
           String hostEmailTitle = this.getText("liveChannel.email.to.host.title",new String[]{this.getSessionNickName(),channelTerms.getLiveChannel().getName()});
           BaseUser _host = baseUserDao.findByEmail(channelTerms.getHostEmail());
           String hostEmailHead = this.getText("liveChannel.email.head ",new String[]{_host == null?channelTerms.getHostEmail():_host.getNickName()});
           String hostEmailContent;
           if(org == null) hostEmailContent = this.getText("liveChannel.email.to.host.main.content.personal",new String[]{this.getSessionNickName(),channelTerms.getLiveChannel().getName()});
           else  hostEmailContent = this.getText("liveChannel.email.to.host.main.content.org",new String[]{this.getSessionNickName(),channelTerms.getLiveChannel().getName(),org.getSchoolName()});
           String href = getBasePath() + "/emailHandleForLiveChannelInvitation.html?host=true&channelTerms.id="+channelTerms.getId()+"&user.email="+channelTerms.getHostEmail();
           String hostEmailBottom = this.getText("liveChannel.email.bottom",new String[]{href,href});
           EmailUtil.sendMail(channelTerms.getHostEmail(),hostEmailTitle,hostEmailHead+hostEmailContent+hostEmailBottom);
       }
       for(MemberOfLiveChannel memberOfLiveChannel : channelTerms.getMemberOfLiveChannels()){     //email to the another member of live
           String memberEmailTitle;
           BaseUser _member = baseUserDao.findByEmail(memberOfLiveChannel.getMemberEmail());
           String memberEmailHead =  this.getText("liveChannel.email.head",new String[]{_member == null ? memberOfLiveChannel.getMemberEmail():_member.getNickName()});
           String memberEmailContent;
           if(memberOfLiveChannel.getType().equals(Constants.MEMBER_TYPE_OF_CONTESTANT)) {
                  memberEmailTitle = this.getText("liveChannel.email.to.contestant.title",new String[]{this.getSessionNickName(),channelTerms.getLiveChannel().getName()});
                  if(org == null) memberEmailContent = this.getText("liveChannel.email.to.contestant.main.content.personal",new String[]{this.getSessionNickName(),channelTerms.getLiveChannel().getName()});
                  else  memberEmailContent = this.getText("liveChannel.email.to.contestant.main.content.org",new String[]{this.getSessionNickName(),org.getSchoolName(),channelTerms.getLiveChannel().getName()});
           }else {
                  memberEmailTitle = this.getText("liveChannel.email.to.guest.title",new String[]{this.getSessionNickName(),channelTerms.getLiveChannel().getName()});
                  if(org == null) memberEmailContent = this.getText("liveChannel.email.to.guest.main.content.personal",new String[]{this.getSessionNickName(),channelTerms.getLiveChannel().getName()});
                  else  memberEmailContent = this.getText("liveChannel.email.to.guest.main.content.org",new String[]{this.getSessionNickName(),org.getSchoolName(),channelTerms.getLiveChannel().getName()});
           }
           String href = getBasePath()+ "/emailHandleForLiveChannelInvitation.html?host=false&channelTerms.id="+channelTerms.getId()+"&user.email="+memberOfLiveChannel.getMemberEmail();
           String memberEmailBottom = this.getText("liveChannel.email.bottom",new String[]{href,href});
           EmailUtil.sendMail(memberOfLiveChannel.getMemberEmail(),memberEmailTitle,memberEmailHead+memberEmailContent+memberEmailBottom);
       }
    }

    private void sendEmail2ChannelFollower(ChannelTerms channelTerms){

        DateFormat dateFormat = new SimpleDateFormat(this.getText("dateformat.forclass"));
        String logo = getBasePath() + "/"+ channelTerms.getLogoUrl();
        Calendar startTime = (Calendar)channelTerms.getStartTime().clone();
        startTime.add(Calendar.HOUR_OF_DAY,8);
        String href = getBasePath() + "/liveChannelBlog.html?liveChannel.id="+channelTerms.getLiveChannel().getId();
        String[] args = new String[]{logo,channelTerms.getLiveChannel().getName(),channelTerms.getSubTitle(),dateFormat.format(startTime.getTime()),channelTerms.getLiveChannel().getName(),href};
        String title = this.getText("liveChannel.create.terms.email.to.fans.title",new String[]{channelTerms.getLiveChannel().getName()});
        String content = this.getText("liveChannel.create.terms.email.to.fans.content",args);
        for(OnliveFollower onf : channelTerms.getLiveChannel().getOnliveFollowers()){
              EmailUtil.sendMail(onf.getFollower().getEmail(),title,content);
        }


    }

    private void setUserTypeForChannels(List<LiveChannel> liveChannels,Integer userID){
        for(LiveChannel lc : liveChannels){
            lc.setUserType(1);
            for(OnliveFollower onf :lc.getOnliveFollowers()){
                 if(onf.getFollower().getId().equals(userID)){
                     lc.setUserType(Constants.MEMBER_TYPE_OF_FANS);
                     break;
                 }
             }
        }
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

    public List<LiveChannel> getLiveChannels() {
        return liveChannels;
    }

    public void setLiveChannels(List<LiveChannel> liveChannels) {
        this.liveChannels = liveChannels;
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

    public MemberOfLiveChannelDao getMemberOfLiveChannelDao() {
        return memberOfLiveChannelDao;
    }

    public void setMemberOfLiveChannelDao(MemberOfLiveChannelDao memberOfLiveChannelDao) {
        this.memberOfLiveChannelDao = memberOfLiveChannelDao;
    }
     public Integer getOperaType() {
        return operaType;
    }

    public void setOperaType(Integer operaType) {
        this.operaType = operaType;
    }

    public List<String> getContestants() {
        return contestants;
    }

    public void setContestants(List<String> contestants) {
        this.contestants = contestants;
    }

    public List<String> getGuests() {
        return guests;
    }

    public void setGuests(List<String> guests) {
        this.guests = guests;
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public Boolean getHost() {
        return host;
    }

    public void setHost(Boolean host) {
        this.host = host;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public Integer getTotalNumOfLiveChannels(){
        return this.getLiveChannels().size();
    }

    public Integer getTotalNumOfChannelTerms(){
        int totalNum = 0;
        for(LiveChannel lc : liveChannels){
           totalNum  = totalNum +lc.getChannelTermses().size();
        }
        return totalNum;
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

    public Boolean getCreateChannelTerm() {
        return createChannelTerm;
    }

    public void setCreateChannelTerm(Boolean createChannelTerm) {
        this.createChannelTerm = createChannelTerm;
    }

    public Integer getTotalNumOfViewOnlive(){
        int total = 0;
        for(LiveChannel lc : this.getLiveChannels()){
            for(ChannelTerms ct : lc.getChannelTermses())    {
                total = total +(ct.getViewTheOnliveNum() == null?0:ct.getViewTheOnliveNum());
            }
        }
        return total;
    }

    public Integer getTotalNumOfViewVideo(){
        int total = 0;
        for(LiveChannel lc : this.getLiveChannels()){
             for(ChannelTerms ct : lc.getChannelTermses())    {
                total = total +(ct.getViewTheVideoNum() == null?0:ct.getViewTheVideoNum());
            }
        }
        return total;
    }

    public OnliveFollowerDao getOnliveFollowerDao() {
        return onliveFollowerDao;
    }

    public void setOnliveFollowerDao(OnliveFollowerDao onliveFollowerDao) {
        this.onliveFollowerDao = onliveFollowerDao;
    }

    public OnliveFollower getOnliveFollower() {
        return onliveFollower;
    }

    public void setOnliveFollower(OnliveFollower onliveFollower) {
        this.onliveFollower = onliveFollower;
    }

    public LiveTermComment getLiveTermComment() {
        return liveTermComment;
    }

    public void setLiveTermComment(LiveTermComment liveTermComment) {
        this.liveTermComment = liveTermComment;
    }

    public LiveTermCommentDao getLiveTermCommentDao() {
        return liveTermCommentDao;
    }

    public void setLiveTermCommentDao(LiveTermCommentDao liveTermCommentDao) {
        this.liveTermCommentDao = liveTermCommentDao;
    }

    public Integer getCommentsNum() {
        return commentsNum;
    }

    public void setCommentsNum(Integer commentsNum) {
        this.commentsNum = commentsNum;
    }

    public Boolean getCommentsNumOverflow() {
        return commentsNumOverflow;
    }

    public void setCommentsNumOverflow(Boolean commentsNumOverflow) {
        this.commentsNumOverflow = commentsNumOverflow;
    }

    public List<LiveTermComment> getLiveTermComments() {
        return liveTermComments;
    }

    public void setLiveTermComments(List<LiveTermComment> liveTermComments) {
        this.liveTermComments = liveTermComments;
    }

    public Integer getLiveChannelFollowersNum(){
        return this.getChannelTerms().getLiveChannel().getOnliveFollowers().size();
    }

    public List<LiveChannel> getLiveChannelsToHost() {
        return liveChannelsToHost;
    }

    public void setLiveChannelsToHost(List<LiveChannel> liveChannelsToHost) {
        this.liveChannelsToHost = liveChannelsToHost;
    }
    public Boolean isExistHostChannel(){
         if(this.getLiveChannelsToHost().size() == 0) return false;
        return true ;
    }
    public Integer getHostChannelNum(){
        return this.getLiveChannelsToHost().size();
    }

    public MemberOfLiveChannel getMemberOfLiveChannel() {
        return memberOfLiveChannel;
    }

    public void setMemberOfLiveChannel(MemberOfLiveChannel memberOfLiveChannel) {
        this.memberOfLiveChannel = memberOfLiveChannel;
    }

    public SeasonIncreasedOnliveFansDao getSeasonIncreasedOnliveFansDao() {
        return seasonIncreasedOnliveFansDao;
    }

    public void setSeasonIncreasedOnliveFansDao(SeasonIncreasedOnliveFansDao seasonIncreasedOnliveFansDao) {
        this.seasonIncreasedOnliveFansDao = seasonIncreasedOnliveFansDao;
    }

    public Map<Integer, String> getAds() {
        return ads;
    }

    public void setAds(Map<Integer, String> ads) {
        this.ads = ads;
    }

    public AdvertisementForLiveDao getAdvertisementForLiveDao() {
        return advertisementForLiveDao;
    }

    public void setAdvertisementForLiveDao(AdvertisementForLiveDao advertisementForLiveDao) {
        this.advertisementForLiveDao = advertisementForLiveDao;
    }

    public Boolean isExistAds(){
        if(this.getAds().isEmpty()){
            return false;
        }
        return true;
    }

    public Boolean getFocused() {
        return focused;
    }

    public void setFocused(Boolean focused) {
        this.focused = focused;
    }

    public List<AdvertisementForLive> getAdvertisementForLives() {
        return advertisementForLives;
    }

    public void setAdvertisementForLives(List<AdvertisementForLive> advertisementForLives) {
        this.advertisementForLives = advertisementForLives;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public List<LiveChannel> getLiveChannelsOnline() {
        return liveChannelsOnline;
    }

    public void setLiveChannelsOnline(List<LiveChannel> liveChannelsOnline) {
        this.liveChannelsOnline = liveChannelsOnline;
    }

    public List<LiveChannel> getHotestLiveChannels() {
        return hotestLiveChannels;
    }

    public void setHotestLiveChannels(List<LiveChannel> hotestLiveChannels) {
        this.hotestLiveChannels = hotestLiveChannels;
    }

    public List<PersonalOnlive> getOnliveStars() {
        return onliveStars;
    }

    public void setOnliveStars(List<PersonalOnlive> onliveStars) {
        this.onliveStars = onliveStars;
    }

    public List<Course> getCoursesForAds() {
        return coursesForAds;
    }

    public void setCoursesForAds(List<Course> coursesForAds) {
        this.coursesForAds = coursesForAds;
    }

    public List<GoGoWiseAnnounce> getGoGoWiseAnnounces() {
        return goGoWiseAnnounces;
    }

    public void setGoGoWiseAnnounces(List<GoGoWiseAnnounce> goGoWiseAnnounces) {
        this.goGoWiseAnnounces = goGoWiseAnnounces;
    }

    public GoGoWiseAnnounceDao getGoGoWiseAnnounceDao() {
        return goGoWiseAnnounceDao;
    }

    public void setGoGoWiseAnnounceDao(GoGoWiseAnnounceDao goGoWiseAnnounceDao) {
        this.goGoWiseAnnounceDao = goGoWiseAnnounceDao;
    }

    public PersonalOnliveDao getPersonalOnliveDao() {
        return personalOnliveDao;
    }

    public void setPersonalOnliveDao(PersonalOnliveDao personalOnliveDao) {
        this.personalOnliveDao = personalOnliveDao;
    }

    public UserFansDao getUserFansDao() {
        return userFansDao;
    }

    public void setUserFansDao(UserFansDao userFansDao) {
        this.userFansDao = userFansDao;
    }

    public LiveChannelNewEventDao getLiveChannelNewEventDao() {
        return liveChannelNewEventDao;
    }

    public void setLiveChannelNewEventDao(LiveChannelNewEventDao liveChannelNewEventDao) {
        this.liveChannelNewEventDao = liveChannelNewEventDao;
    }

    public List<LiveChannelNewEvent> getLiveChannelNewEvents() {
        return liveChannelNewEvents;
    }

    public void setLiveChannelNewEvents(List<LiveChannelNewEvent> liveChannelNewEvents) {
        this.liveChannelNewEvents = liveChannelNewEvents;
    }

    public List<LiveChannelComment> getLiveChannelComments() {
        return liveChannelComments;
    }

    public void setLiveChannelComments(List<LiveChannelComment> liveChannelComments) {
        this.liveChannelComments = liveChannelComments;
    }

    public LiveChannelCommentDao getLiveChannelCommentDao() {
        return liveChannelCommentDao;
    }

    public void setLiveChannelCommentDao(LiveChannelCommentDao liveChannelCommentDao) {
        this.liveChannelCommentDao = liveChannelCommentDao;
    }

    public LiveChannelComment getLiveChannelComment() {
        return liveChannelComment;
    }

    public void setLiveChannelComment(LiveChannelComment liveChannelComment) {
        this.liveChannelComment = liveChannelComment;
    }

    public List<OnliveFollower> getOnliveFollowers() {
        return onliveFollowers;
    }

    public void setOnliveFollowers(List<OnliveFollower> onliveFollowers) {
        this.onliveFollowers = onliveFollowers;
    }

    public List<PersonalOnlive> getOnlivings() {
        return onlivings;
    }

    public void setOnlivings(List<PersonalOnlive> onlivings) {
        this.onlivings = onlivings;
    }

    public Boolean isExistOnlivings(){
        if(this.getOnlivings().size() == 0) return false;
        return true;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public List<String> getEmails() {
        return emails;
    }

    public void setEmails(List<String> emails) {
        this.emails = emails;
    }
    public List<BaseUser> getHottestUsers() {
           for(BaseUser teacher : hottestUsers){
             teacher.setUserFocused(false);
             if(this.getSessionUserId() != null && userFansDao.findByUserAndFans(teacher.getId(),this.getSessionUserId()) != null){
                 teacher.setUserFocused(true);
             }
         }
         return hottestUsers;
     }

     public void setHottestUsers(List<BaseUser> hottestUsers) {
         this.hottestUsers = hottestUsers;
     }

    public List<LiveChannel> getLatestChannel() {
        return latestChannel;
    }

    public void setLatestChannel(List<LiveChannel> latestChannel) {
        this.latestChannel = latestChannel;
    }

    public LiveChannelNewEvent getLiveChannelNewEvent() {
        return liveChannelNewEvent;
    }

    public void setLiveChannelNewEvent(LiveChannelNewEvent liveChannelNewEvent) {
        this.liveChannelNewEvent = liveChannelNewEvent;
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
}
