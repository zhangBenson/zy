package com.gogowise.action.show;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.course.CourseDao;
import com.gogowise.rep.live.*;
import com.gogowise.rep.system.GoGoWiseAnnounceDao;
import com.gogowise.rep.system.MatterDao;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.user.UserFansDao;
import com.gogowise.domain.*;
import com.gogowise.domain.course.Course;
import com.gogowise.domain.live.*;
import com.gogowise.domain.system.GoGoWiseAnnounce;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.Utils;
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

public class ShowAction extends BasicAction {
    private MatterDao matterDao;
    private BaseUserDao baseUserDao;
    private BaseUser user;
    private List<Course> courses = new ArrayList<Course>();
    private CourseDao courseDao;
    private MyShow myShow;
    private MyShowDao myShowDao;
    private ShowTermsDao showTermsDao;
    private SeasonIncreasedShowFansDao seasonIncreasedShowFansDao;
    private ShowCommentDao showCommentDao;
    private ShowComment showComment;
    private List<ShowComment> showComments = new ArrayList<ShowComment>();
    private List<Advertisement> advertisements = new ArrayList<Advertisement>();
    private List<Integer> showWeekDays = new ArrayList<Integer>();
    private AdvertisementDao advertisementDao;
    private Advertisement advertisement;
    private Integer operaType;
    private String message;
    private List<String> emails = new ArrayList<String>();
    private String comments;
    private List<MyShow> myShows = new ArrayList<MyShow>();
    private Map<Integer, String> shows = new HashMap<Integer, String>();
    private Map<Integer,String> ads = new HashMap<Integer, String>();
    private List<MyShow> showsOnline = new ArrayList<MyShow>();
    private List<MyShow> newestShows = new ArrayList<MyShow>();
    private List<MyShow> hotestShows = new ArrayList<MyShow>();
    private List<MyShow> showsRange = new ArrayList<MyShow>();
    private List<Course> coursesForAds = new ArrayList<Course>();
    private Integer commentsNum;
    private Boolean commentsNumOverflow = false;
    private ShowFansDao showFansDao;
    private GoGoWiseAnnounceDao goGoWiseAnnounceDao;
    private List<GoGoWiseAnnounce> goGoWiseAnnounces = new ArrayList<GoGoWiseAnnounce>();
    private ShowNewEvent showNewEvent;
    private ShowNewEventDao showNewEventDao;
    private List<ShowNewEvent> showNewEvents = new ArrayList<ShowNewEvent>();
    private List<BaseUser> hottestUsers = new ArrayList<BaseUser>();
    private Pagination pagination = new Pagination();
    private UserFansDao userFansDao;

    @Action(value = "showMatters",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".showMatters")})
    public String showMatters() {
        this.setOperaType(Constants.OPERA_TYPE_FOR_SHOW_MATTER);
        return SUCCESS;
    }


    @Action(value = "showBlog",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".showBlog")}
    )
    public String showBlog() {
        myShow = myShowDao.findById(this.getMyShow().getId());
        List<Course> cs = courseDao.findLatest4Course(new Pagination(4));
        int adNum = myShow.getCurrentSeasonAcceptedAdvertisement().size();
        for(Advertisement ad : myShow.getCurrentSeasonAcceptedAdvertisement()){
              advertisements.add(ad);
        }
        for(Advertisement currAd : myShow.getNextSeasonAdvertisements()){
            if(adNum<4){
                advertisements.add(currAd);
                adNum ++;
            }
        }
        for(int i = 0; i<(cs.size()>4-adNum? 4-adNum:cs.size());i++){
            if(cs.get(i) != null){
                courses.add(cs.get(i));
            }
        }
        myShow.setTotalInviteNum((myShow.getTotalInviteNum()==null ?0:myShow.getTotalInviteNum())+1);
        myShowDao.persistAbstract(myShow);

         SeasonIncreasedShowFans sisf = seasonIncreasedShowFansDao.findByShowYearAndSeason(myShow.getId(),Utils.getCurrentCalender().get(Calendar.YEAR),Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
        if(sisf != null){
            sisf.setInviteNum(sisf.getInviteNum()+1);
            seasonIncreasedShowFansDao.persistAbstract(sisf);
        }else {
            SeasonIncreasedShowFans curr = new SeasonIncreasedShowFans();
            curr.setMyShow(myShow);
            curr.setYear(Utils.getCurrentCalender().get(Calendar.YEAR));
            curr.setSeason(Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
            curr.setInviteNum(1);
            seasonIncreasedShowFansDao.persistAbstract(curr);
        }
        Pagination page = new Pagination(10);
        showComments = showCommentDao.findByShow(myShow.getId(),page);
        this.setCommentsNum(showComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        return SUCCESS;
    }

    @Action(value = "showBlog2",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".showBlog2")}
    )
    public String showBlog2() {
        myShow = myShowDao.findById(this.getMyShow().getId());
        List<Course> cs = courseDao.findLatest4Course(new Pagination(4));
        int adNum = myShow.getCurrentSeasonAcceptedAdvertisement().size();
        for(Advertisement ad : myShow.getCurrentSeasonAcceptedAdvertisement()){
              advertisements.add(ad);
        }
        for(Advertisement currAd : myShow.getNextSeasonAdvertisements()){
            if(adNum<4){
                advertisements.add(currAd);
                adNum ++;
            }
        }
        for(int i = 0; i<(cs.size()>4-adNum? 4-adNum:cs.size());i++){
            if(cs.get(i) != null){
                courses.add(cs.get(i));
            }
        }
        myShow.setTotalInviteNum((myShow.getTotalInviteNum()==null ?0:myShow.getTotalInviteNum())+1);
        myShowDao.persistAbstract(myShow);

         SeasonIncreasedShowFans sisf = seasonIncreasedShowFansDao.findByShowYearAndSeason(myShow.getId(),Utils.getCurrentCalender().get(Calendar.YEAR),Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
        if(sisf != null){
            sisf.setInviteNum(sisf.getInviteNum()+1);
            seasonIncreasedShowFansDao.persistAbstract(sisf);
        }else {
            SeasonIncreasedShowFans curr = new SeasonIncreasedShowFans();
            curr.setMyShow(myShow);
            curr.setYear(Utils.getCurrentCalender().get(Calendar.YEAR));
            curr.setSeason(Utils.getSeasonOfYear(Utils.getCurrentCalender().get(Calendar.MONTH)));
            curr.setInviteNum(1);
            seasonIncreasedShowFansDao.persistAbstract(curr);
        }
        Pagination page = new Pagination(10);
        showComments = showCommentDao.findByShow(myShow.getId(),page);
        this.setCommentsNum(showComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        return SUCCESS;
    }

    @Action(value = "saveShowComment",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location =".showComment")})
    public String saveShowComment(){
        myShow = myShowDao.findById(this.getMyShow().getId());
        BaseUser commenter = baseUserDao.findById(this.getSessionUserId());
        showComment.setShow(myShow);
        showComment.setCommenter(commenter);
        showComment.setCommentTime(Utils.getCurrentCalender());
        Integer toFriendID = (Integer) ActionContext.getContext().getSession().get("toReplyerUserID");
        if( toFriendID != null){
            BaseUser toFriend = baseUserDao.findById(toFriendID);
            showComment.setFriend(toFriend);
            ActionContext.getContext().getSession().remove("toReplyerUserID");
        }
        myShowDao.persistAbstract(showComment);
        Pagination page = new Pagination(commentsNum+1);
        showComments = showCommentDao.findByShow(myShow.getId(),page);
        this.setCommentsNum(showComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        if(showComment.getFriend() == null && this.getSessionUserId() != myShow.getOwner().getId()){
            //第一次留言给博主信息
            Matter   matter =new Matter(Calendar.getInstance(),this.getSessionNickName()+(new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime())),Matter.MATTER_MYSHOW_MESSAGE,baseUserDao.findByEmail(this.getSessionUserEmail()),null,myShow.getOwner().getEmail(),null,null,myShow,null,false);
            matterDao.persistAbstract(matter);
            String href = "showBlog.html?myShow.id="+myShow.getId();
            String title = this.getText("show.blog.comment.title",new String[]{commenter.getNickName(),myShow.getName()});
            String content = this.getText("show.blog.comment.content",new String[]{
                    myShow.getOwner().getNickName(),
                    commenter.getNickName(),
                    myShow.getName(),
                    showComment.getContent(),
                    href,
                    href
            });
            EmailUtil.sendMail(myShow.getOwner().getEmail(),title,content);
        }else {
            if(showComment.getFriend() != null && showComment.getFriend().getId() != null){
                String href = "showBlog.html?myShow.id="+myShow.getId();
                String title = this.getText("show.blog.reply.comment.title",new String[]{commenter.getNickName(),myShow.getName()});
                String content = this.getText("show.blog.reply.comment.content",new String[]{
                        myShow.getOwner().getNickName(),
                        commenter.getNickName(),
                        myShow.getName(),
                        showComment.getContent(),
                        href,
                        href
                });
                Matter   matter =new Matter(Calendar.getInstance(),this.getSessionNickName()+(new SimpleDateFormat("yyyyddMMHHmmssms").format(Calendar.getInstance().getTime())),Matter.MATTER_MYSHOW_MESSAGE,baseUserDao.findByEmail(this.getSessionUserEmail()),null,myShow.getOwner().getEmail(),null,null,myShow,null,false);
                matterDao.persistAbstract(matter);
                EmailUtil.sendMail(myShow.getOwner().getEmail(),title,content);
            }
        }
        return SUCCESS;
    }

    @Action(value = "moreComments",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location =".showComment")})
    public String moreComments(){
        Pagination page = new Pagination(this.getCommentsNum()+Constants.DEFAULT_PAGE_OF_COMMENTS_INCREASED_SIZE);
        showComments = showCommentDao.findByShow(myShow.getId(),page);
        this.setCommentsNum(showComments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        return SUCCESS;
    }

    @Action(value = "deleteShowComment")
    public void deleteShowComment(){
        showComment = showCommentDao.findById(this.getShowComment().getId());
        showCommentDao.delete(showComment);
    }

    @Action(value = "putUserIDtoSession")
    public void putUserIDtoSession(){
        if(this.getUser().getId() != null){
          ActionContext.getContext().getSession().put("toReplyerUserID", user.getId());
        }
    }


    @Action(value = "initShowCreate",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initShowCreate")})
    public String initShowCreate() {
        return SUCCESS;
    }

    @Action(value = "saveShow",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myfirstPage"}),
                                           @Result(name = NONE, type = Constants.RESULT_NAME_TILES, location = ".initShowCreate"),
                                            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".initShowCreate")})
    public String saveShow(){
        if(myShow!=null && myShow.getDuration()!=null){
            user = baseUserDao.findById(this.getSessionUserId());
            this.setWeekDayForShow(myShow,showWeekDays);
            myShow.setName(myShow.getName()+"--"+user.getNickName());
            myShow.setOwner(user);
            myShow.setPublishTime(Utils.getCurrentCalender());
            if (StringUtils.isNotBlank(myShow.getLogoUrl())) {
                Utils.notReplaceFileFromTmp(Constants.UPLOAD_SHOW_PATH + "/" + getSessionUserId(), myShow.getLogoUrl());
                myShow.setLogoUrl(Constants.UPLOAD_SHOW_PATH + "/" + getSessionUserId()+"/"+myShow.getLogoUrl());
            }else{
                myShow.setLogoUrl(Constants.DEFAULT_SHOW_IMAGE);
            }
            myShowDao.persistAbstract(myShow);
            myShowDao.saveFirstShowTerm(myShow);
            return SUCCESS;
        }
        return NONE;
    }

    public void validateSaveShow(){
        String showName = myShow.getName()+"--"+this.getSessionNickName();
        List<MyShow> myShows = myShowDao.findByShowName(showName);
        if(myShows.size() > 0){
            addFieldError("myShow.name","对不起，该名字已经被其他秀注册过了");
        }
    }


    @Action(value = "showManageResult",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".showManageResult")})
    public String showManageResult() {
        myShows = myShowDao.findAllByUser(this.getSessionUserId(),null);
        return SUCCESS;
    }

    @Action(value = "myFollowing",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".myFollowing")})
    public String listMyFollowing() {
        myShows = myShowDao.findUserFocusedShows(this.getSessionUserId(),null);
        return SUCCESS;
    }

    @Action(value = "initShowManage",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".initShowManage")})
    public String initShowManage(){
        myShow = myShowDao.findById(this.getMyShow().getId());
        return SUCCESS;
    }

    @Action(value = "addShowHight",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".addShowHight")})
    public String addShowHight(){
        return SUCCESS;
    }

    @Action(value = "manageShowAd",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".manageShowAd")})
    public String manageShowAd(){
        myShows = myShowDao.findAllByUser(this.getSessionUserId(),null);
        return SUCCESS;
    }
    @Action(value = "initShowAds",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".initShowAds")})
    public String initShowAds(){
        myShow = myShowDao.findById(this.getMyShow().getId());
        return SUCCESS;
    }
    @Action(value = "showRangeBoard",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".showRangeBoard")})
    public String showRangeBoard(){
        myShows = myShowDao.findHotestShow(null);
        return SUCCESS;
    }
    @Action(value = "showAdBidList",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".showAdBidList")})
    public String showAdBidList(){
       myShow = myShowDao.findById(this.getMyShow().getId());
        return SUCCESS;
    }
    @Action(value = "initShowAdBid",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".showAdBid")})
    public String initShowAdBid(){
        List<Advertisement> advertisements = advertisementDao.findByProvider(this.getSessionUserId());
        for(Advertisement ad : advertisements){
            ads.put(ad.getId(),ad.getProductName());
        }
        if(!ads.isEmpty()){
            ads.put(-1,"其他");
        }
        return SUCCESS;
    }

    @Action(value = "manageShow",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myfirstPage"})})
    public String manageShow(){
        MyShow _myShow = myShowDao.findById(this.getMyShow().getId());
        this.setWeekDayForShow(myShow,showWeekDays);
        myShowDao.manageMyShow(_myShow, myShow);
        if (!myShow.getLogoUrl().equals(_myShow.getLogoUrl())) {
                Utils.notReplaceFileFromTmp(Constants.UPLOAD_SHOW_PATH + "/" + getSessionUserId(), myShow.getLogoUrl());
                _myShow.setLogoUrl(Constants.UPLOAD_SHOW_PATH + "/" + getSessionUserId()+"/"+myShow.getLogoUrl());
        }
        myShowDao.persistAbstract(_myShow);
        myShow = _myShow;
        return SUCCESS;
    }
    @Action(value = "recommendShow",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "showBlog", "myShow.id", "${myShow.id}"})})
    public String recommendShow(){
        myShow = myShowDao.findById(this.getMyShow().getId());
        String title = this.getText("show.blog.recommend.friend.email.title",new String[]{this.getSessionNickName(),myShow.getName()});
        Calendar showStartDate = (Calendar)myShow.getShowDate().clone();
        Calendar dateForEmail = Utils.changeBaseOnTimeZone4Action(showStartDate);
        DateFormat dateFormat = new SimpleDateFormat(this.getText("dateformat"));
        for(String email : emails){
            BaseUser _user = baseUserDao.findByEmail(email);
            String  href = getBasePath()+"/showBlog.html?myShow.id="+myShow.getId();
            String content = this.getText("show.blog.recommend.friend.email.content",new String[]{
                    _user == null ?email : _user.getNickName(),this.getSessionNickName(),myShow.getOwner().getNickName(),myShow.getName(),this.getText("myShow.label.type."+myShow.getType()),myShow.getDescription(),
                    dateFormat.format(dateForEmail.getTime()),href,href
            });
            EmailUtil.sendMail(email,title,content);
        }
        return SUCCESS;
    }

    @Action(value = "recommendShowAjax")
    public void recommendShowAjax(){
        myShow = myShowDao.findById(this.getMyShow().getId());
        String title = this.getText("show.recommend.friend.email.title",new String[]{this.getSessionNickName(),myShow.getName()});
        String  href = getBasePath()+"/showBlog.html?myShow.id="+myShow.getId();
        for(String email : emails){
             if(StringUtils.isNotBlank(email)){
                    BaseUser _user = baseUserDao.findByEmail(email);
                    String content = Constants.BIG_COURSE_ADVERTISE_EMAIL_CSS + this.getText("show.recommend.friend.email.content",new String[]{
                            _user == null ?email : _user.getNickName(),this.getSessionNickName(),myShow.getOwner().getNickName(),myShow.getName(),this.getComments(),href,href,email
                    });
                    EmailUtil.sendMail(email,title,content);
             }
        }
    }

    @Action(value = "quickBecomeFans",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myfirstPage"})})
    public String quickBecomeFans() throws Exception{
        myShow = myShowDao.findById(this.getMyShow().getId());
        message = myShowDao.saveFansForShow(this.getSessionUserId(),myShow);
        return SUCCESS;
    }

    @Action(value = "showSquare",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".showSquare")})
    public String showSquare(){
        showsOnline = myShowDao.findShowOnline(new Pagination(8));
        newestShows = myShowDao.findLatestShows(new Pagination(8));
        for(MyShow ms:newestShows){
            ms.setUserFocused(false);
            if(this.getSessionUserId() != null){
                ShowFans sf = showFansDao.findByUserAndShow(this.getSessionUserId(),ms.getId());
                if(sf != null){
                    ms.setUserFocused(true);
                }
            }
        }
        hotestShows = myShowDao.findByInviteNum(new Pagination(8));
        showsRange = myShowDao.findHotestShow(new Pagination((4)));
        coursesForAds = courseDao.findLatest4Course(new Pagination(3));
        goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(new Pagination(13));
        showNewEvents = showNewEventDao.findLatestNews(new Pagination(13));
        return SUCCESS;
    }
    @Action(value = "addShowEvent",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".addShowEvent")})
    public String addShowEvents(){
        return SUCCESS;
    }
    @Action(value = "showHotList",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".showHotList")})
    public String listHotShows(){
        pagination.setPageSize(5);
        hotestShows = myShowDao.findByInviteNum(pagination);
        hottestUsers = baseUserDao.findByFansNum(new Pagination(3));
        newestShows = myShowDao.findLatestShows(new Pagination(4));
        return SUCCESS;
    }
    @Action(value = "showNewList",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".showNewList")})
    public String listNewShows(){
        pagination.setPageSize(5);
        newestShows = myShowDao.findLatestShows(pagination);
        hottestUsers = baseUserDao.findByFansNum(new Pagination(3));
        hotestShows = myShowDao.findByInviteNum(new Pagination(4));
        return SUCCESS;
    }

    @Action(value = "saveShowNewEvent",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","showEventRead","showNewEvent.id","${showNewEvent.id}"})})
    public String saveShowNewEvent(){
        myShow = myShowDao.findById(this.getMyShow().getId());
        showNewEvent.setCreateTime(Utils.getCurrentCalender());
        showNewEvent.setMyShow(myShow);
        showNewEvent.setOwner(baseUserDao.findById(this.getSessionUserId()));
        showNewEventDao.persistAbstract(showNewEvent);
        return SUCCESS;
    }


     @Action(value = "showNewEventsManage",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".showNewEventsManage")})
     public String showNewEventsManage(){
        pagination.setPageSize(20);
        showNewEvents = showNewEventDao.findByShowID(this.getMyShow().getId(),pagination);
        return SUCCESS;
     }

    @Action(value = "deleteShowNewEvent")
    public void deleteCourseNewEvent(){
         showNewEvent = showNewEventDao.findById(this.getShowNewEvent().getId());
         showNewEventDao.delete(showNewEvent);
    }

    @Action(value = "initEditShowNewEvent",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".showNewEventsEdit")})
    public String initEditCourseNewEvent(){
        showNewEvent = showNewEventDao.findById(this.getShowNewEvent().getId());
        return SUCCESS;
    }

     @Action(value = "editShowNewEvent",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".showNewEventsManage")})
     public String editShowNewEvent(){
         ShowNewEvent sne = showNewEventDao.findById(this.getShowNewEvent().getId());
         sne.setTitle(showNewEvent.getTitle());
         sne.setContent(showNewEvent.getContent());
          if (StringUtils.isNotBlank(showNewEvent.getLogoUrl())  && !StringUtils.startsWithIgnoreCase(showNewEvent.getLogoUrl(),"upload/")) {
                Utils.notReplaceFileFromTmp(Constants.UPLOAD_SHOW_PATH + "/" + getSessionUserId(), showNewEvent.getLogoUrl());
                sne.setLogoUrl(Constants.UPLOAD_SHOW_PATH + "/" + getSessionUserId()+"/"+showNewEvent.getLogoUrl());
        }
        showNewEventDao.persistAbstract(sne);
        pagination.setPageSize(20);
        showNewEvents = showNewEventDao.findByShowID(sne.getMyShow().getId(),pagination);
        return SUCCESS;
     }






    private void setWeekDayForShow(MyShow myShow,List<Integer> showWeekDays){
        StringBuilder swd = new StringBuilder();
        for(int i=0; i<showWeekDays.size();i++){
            swd.append(showWeekDays.get(i).toString());
            if(i<showWeekDays.size()-1){
                swd.append(",");
            }
        }
        myShow.setDateOfWeek(swd.toString());
    }



    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public MyShow getMyShow() {
        return myShow;
    }

    public void setMyShow(MyShow myShow) {
        this.myShow = myShow;
    }

    public MyShowDao getMyShowDao() {
        return myShowDao;
    }

    public void setMyShowDao(MyShowDao myShowDao) {
        this.myShowDao = myShowDao;
    }

    public ShowTermsDao getShowTermsDao() {
        return showTermsDao;
    }

    public void setShowTermsDao(ShowTermsDao showTermsDao) {
        this.showTermsDao = showTermsDao;
    }

    public List<Integer> getShowWeekDays() {
        return showWeekDays;
    }

    public void setShowWeekDays(List<Integer> showWeekDays) {
        this.showWeekDays = showWeekDays;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public Integer getOperaType() {
        return operaType;
    }

    public void setOperaType(Integer operaType) {
        this.operaType = operaType;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<String> getEmails() {
        return emails;
    }

    public void setEmails(List<String> emails) {
        this.emails = emails;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public List<MyShow> getMyShows() {
        return myShows;
    }

    public void setMyShows(List<MyShow> myShows) {
        this.myShows = myShows;
    }

    public Map<Integer, String> getShows() {
        return shows;
    }

    public void setShows(Map<Integer, String> shows) {
        this.shows = shows;
    }

    public AdvertisementDao getAdvertisementDao() {
        return advertisementDao;
    }

    public void setAdvertisementDao(AdvertisementDao advertisementDao) {
        this.advertisementDao = advertisementDao;
    }

    public Advertisement getAdvertisement() {
        return advertisement;
    }

    public void setAdvertisement(Advertisement advertisement) {
        this.advertisement = advertisement;
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

    public SeasonIncreasedShowFansDao getSeasonIncreasedShowFansDao() {
        return seasonIncreasedShowFansDao;
    }

    public void setSeasonIncreasedShowFansDao(SeasonIncreasedShowFansDao seasonIncreasedShowFansDao) {
        this.seasonIncreasedShowFansDao = seasonIncreasedShowFansDao;
    }

    public List<Advertisement> getAdvertisements() {
        return advertisements;
    }

    public void setAdvertisements(List<Advertisement> advertisements) {
        this.advertisements = advertisements;
    }

    public Map<Integer, String> getAds() {
        return ads;
    }

    public void setAds(Map<Integer, String> ads) {
        this.ads = ads;
    }

    public Boolean isExistAds(){
        if(this.getAds().isEmpty()){
            return false;
        }
        return true;
    }

    public ShowCommentDao getShowCommentDao() {
        return showCommentDao;
    }

    public void setShowCommentDao(ShowCommentDao showCommentDao) {
        this.showCommentDao = showCommentDao;
    }

    public List<ShowComment> getShowComments() {
        return showComments;
    }

    public void setShowComments(List<ShowComment> showComments) {
        this.showComments = showComments;
    }

    public ShowComment getShowComment() {
        return showComment;
    }

    public void setShowComment(ShowComment showComment) {
        this.showComment = showComment;
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

    public MatterDao getMatterDao() {
        return matterDao;
    }

    public void setMatterDao(MatterDao matterDao) {
        this.matterDao = matterDao;
    }

    public List<MyShow> getShowsOnline() {
        return showsOnline;
    }

    public void setShowsOnline(List<MyShow> showsOnline) {
        this.showsOnline = showsOnline;
    }

    public List<MyShow> getNewestShows() {
        return newestShows;
    }

    public void setNewestShows(List<MyShow> newestShows) {
        this.newestShows = newestShows;
    }

    public List<MyShow> getHotestShows() {
        return hotestShows;
    }

    public void setHotestShows(List<MyShow> hotestShows) {
        this.hotestShows = hotestShows;
    }

    public List<MyShow> getShowsRange() {
        return showsRange;
    }

    public void setShowsRange(List<MyShow> showsRange) {
        this.showsRange = showsRange;
    }

    public List<Course> getCoursesForAds() {
        return coursesForAds;
    }

    public void setCoursesForAds(List<Course> coursesForAds) {
        this.coursesForAds = coursesForAds;
    }

    public ShowFansDao getShowFansDao() {
        return showFansDao;
    }

    public void setShowFansDao(ShowFansDao showFansDao) {
        this.showFansDao = showFansDao;
    }

    public GoGoWiseAnnounceDao getGoGoWiseAnnounceDao() {
        return goGoWiseAnnounceDao;
    }

    public void setGoGoWiseAnnounceDao(GoGoWiseAnnounceDao goGoWiseAnnounceDao) {
        this.goGoWiseAnnounceDao = goGoWiseAnnounceDao;
    }

    public List<GoGoWiseAnnounce> getGoGoWiseAnnounces() {
        return goGoWiseAnnounces;
    }

    public void setGoGoWiseAnnounces(List<GoGoWiseAnnounce> goGoWiseAnnounces) {
        this.goGoWiseAnnounces = goGoWiseAnnounces;
    }

    public ShowNewEvent getShowNewEvent() {

        return showNewEvent;
    }

    public void setShowNewEvent(ShowNewEvent showNewEvent) {
        this.showNewEvent = showNewEvent;
    }

    public ShowNewEventDao getShowNewEventDao() {
        return showNewEventDao;
    }

    public void setShowNewEventDao(ShowNewEventDao showNewEventDao) {
        this.showNewEventDao = showNewEventDao;
    }

    public List<ShowNewEvent> getShowNewEvents() {
        return showNewEvents;
    }

    public void setShowNewEvents(List<ShowNewEvent> showNewEvents) {
        this.showNewEvents = showNewEvents;
    }

    public Integer getShowFansNum(){
        int fansNum = 0;
        for(MyShow ms :myShows){
            fansNum = fansNum +ms.getFansNum();
        }
        return fansNum;
    }

    public Integer getShowTermsNum(){
        int termsNum = 0;
        for(MyShow ms : myShows){
            termsNum = termsNum +ms.getShowTermsNum();
        }
        return termsNum;
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

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public UserFansDao getUserFansDao() {
        return userFansDao;
    }

    public void setUserFansDao(UserFansDao userFansDao) {
        this.userFansDao = userFansDao;
    }
}