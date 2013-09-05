package com.gogowise.action.user;


import com.gogowise.action.BasicAction;
import com.gogowise.dao.course.BrowsedCourseDao;
import com.gogowise.dao.course.CourseDao;
import com.gogowise.dao.live.LiveChannelDao;
import com.gogowise.dao.live.MyShowDao;
import com.gogowise.dao.live.PersonalOnliveDao;
import com.gogowise.dao.org.InterviewAppointerDao;
import com.gogowise.dao.org.InterviewDao;
import com.gogowise.dao.org.OrgMeetingDao;
import com.gogowise.dao.system.MatterDao;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.user.UserFansDao;
import com.gogowise.domain.*;
import com.gogowise.utils.Constants;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class MyFirstPageAction  extends BasicAction {

    private List<Course> latestCourse = new ArrayList<Course>();

    private CourseDao courseDao;
    private BaseUserDao baseUserDao;
    private InterviewDao interviewDao;
    private BrowsedCourseDao browsedCourseDao;
    private OrgMeetingDao orgMeetingDao;
    private LiveChannelDao liveChannelDao;
    private List<OrgMeeting> orgMeetings = new ArrayList<OrgMeeting>();
    private List<Interview> interviews = new ArrayList<Interview>();
    private List<InterviewAppointer> interviewAppointers = new ArrayList<InterviewAppointer>();
    private InterviewAppointerDao interviewAppointerDao;
    private Course todayCourse;
    private Course tomorrowCourse;
    private Course yesterdayCourse;
    private List<Course> hotCourse;
    private List<Course> userLikeCourse;
    private List<BrowsedCourse> browsedCourses = new ArrayList<BrowsedCourse>();
    private List<LiveChannel> liveChannels = new ArrayList<LiveChannel>();
    private BaseUser baseUser;
     private Integer operaType;
    private Integer moreRequire = 0;
    private MyShowDao myShowDao;
    private List<MyShow> myShows = new ArrayList<MyShow>();
    private Integer matterCount=0;

    private MatterDao matterDao;
    private UserFansDao userFansDao;
    private List<UserFans> userFanses = new ArrayList<UserFans>();
    private PersonalOnliveDao personalOnliveDao;
    private List<BaseUser> hottestBlogers = new ArrayList<BaseUser>();
    private Integer currentPageSize;
    private Boolean numOverFlow = false;
    private Pagination pagination = new Pagination();


//    @Action(value = "myfirstPage",
//            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".myfirstPage")}
//    )
//    public String myFirstPage() {
////        ActionContext.getContext().getSession().put("WW_TRANS_I18N_LOCALE", Locale.US);
//        latestCourse = courseDao.findMyCourseOfForcastClassForUserCenter(new Pagination(3),this.getSessionUserId());
//
//        todayCourse = courseDao.findTodayCourse(this.getSessionUserId());
//        tomorrowCourse = courseDao.findTomorrowCourse(this.getSessionUserId());
//        yesterdayCourse = courseDao.findYesterdayCourse(this.getSessionUserId());
//        if(moreRequire.equals(Constants.MY_FIRST_PAGE_INTERVIEW_MORE)){
//               interviews =interviewDao.findByUser(this.getSessionUserId(),null);
//        }else  {
//               interviews =interviewDao.findByUser(this.getSessionUserId(),new Pagination(3));
//        }
//        if(moreRequire.equals(Constants.MY_FIRST_PAGE_MEETING_MORE)){
//                orgMeetings = orgMeetingDao.findForUserCenter(null,this.getSessionUserId());
//        }else {
//               orgMeetings = orgMeetingDao.findForUserCenter(new Pagination(3),this.getSessionUserId());
//        }
//        myShows = myShowDao.findByUser(this.getSessionUserId(),new Pagination(3));
//        liveChannels = liveChannelDao.findByUserID(this.getSessionUserId(),new Pagination(5));
//        for(LiveChannel lc : liveChannels){
//             lc.setUserType(1);
//             for(OnliveFollower onf :lc.getOnliveFollowers()){
//                 if(onf.getFollower().getId().equals(this.getSessionUserId())){
//                     lc.setUserType(Constants.MEMBER_TYPE_OF_FANS);
//                     break;
//                 }
//             }
//        }
//        hotCourse = courseDao.findHotCourses(new Pagination(6));
//        userLikeCourse = courseDao.findlatestCourses(new Pagination(3));
//
//        this.baseUser = baseUserDao.findById(this.getSessionUserId());
//        this.browsedCourses = browsedCourseDao.findByUserId(this.getSessionUserId());
//
//        Pagination userFansPage = new Pagination(6);
//        userFanses = userFansDao.findUsersAsFans(this.getSessionUserId(),userFansPage);
//        this.setCurrentPageSize(userFanses.size());
//        if(userFansPage.getTotalSize() == userFanses.size()){
//            this.setNumOverFlow(true);
//        }
//
//        matterCount=matterDao.getMatterCount(this.getSessionUserEmail());
//        return SUCCESS;
//    }

    @Action(value = "myfirstPage",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".myGoGoWise")}
    )
    public String showUserCenter() {
//        ActionContext.getContext().getSession().put("WW_TRANS_I18N_LOCALE", Locale.US);
        latestCourse = courseDao.findMyCourseOfForcastClassForUserCenter(new Pagination(3),this.getSessionUserId());

        todayCourse = courseDao.findTodayCourse(this.getSessionUserId());
        tomorrowCourse = courseDao.findTomorrowCourse(this.getSessionUserId());
        yesterdayCourse = courseDao.findYesterdayCourse(this.getSessionUserId());
        if(moreRequire.equals(Constants.MY_FIRST_PAGE_INTERVIEW_MORE)){
               interviews =interviewDao.findByUser(this.getSessionUserId(),null);
        }else  {
               interviews =interviewDao.findByUser(this.getSessionUserId(),new Pagination(3));
        }
        if(moreRequire.equals(Constants.MY_FIRST_PAGE_MEETING_MORE)){
                orgMeetings = orgMeetingDao.findForUserCenter(null,this.getSessionUserId());
        }else {
               orgMeetings = orgMeetingDao.findForUserCenter(new Pagination(3),this.getSessionUserId());
        }
        myShows = myShowDao.findByUser(this.getSessionUserId(),new Pagination(3));
        liveChannels = liveChannelDao.findByUserID(this.getSessionUserId(),new Pagination(5));
        for(LiveChannel lc : liveChannels){
             lc.setUserType(1);
             for(OnliveFollower onf :lc.getOnliveFollowers()){
                 if(onf.getFollower().getId().equals(this.getSessionUserId())){
                     lc.setUserType(Constants.MEMBER_TYPE_OF_FANS);
                     break;
                 }
             }
        }
        hotCourse = courseDao.findLatest4Course(new Pagination(8));
        userLikeCourse = courseDao.findlatestCourses(new Pagination(4));

        this.baseUser = baseUserDao.findById(this.getSessionUserId());
        this.browsedCourses = browsedCourseDao.findByUserId(this.getSessionUserId());

        Pagination userFansPage = new Pagination(6);
        userFanses = userFansDao.findUsersAsFans(this.getSessionUserId(),userFansPage);
        this.setCurrentPageSize(userFanses.size());
        if(userFansPage.getTotalSize() >= userFanses.size()){
            this.setNumOverFlow(true);
        }

        matterCount=matterDao.getMatterCount(this.getSessionUserEmail());
        return SUCCESS;
    }

    @Action(value = "getMoreConcernUserFans",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".moreUserFans")})
    public String getMoreConcernUserFans(){
        Pagination userFansPage = new Pagination(this.getCurrentPageSize()+6);
        userFanses = userFansDao.findUsersAsFans(this.getSessionUserId(),pagination);
        this.setCurrentPageSize(userFanses.size());
        if(userFansPage.getTotalSize() == userFanses.size()){
            this.setNumOverFlow(true);
        }
        return SUCCESS;
    }

    @Action(value = "followedUserList",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".followedUserList")})
    public String followedUserList(){

        userFanses = userFansDao.findUsersAsFans(this.getSessionUserId(),pagination);
        hottestBlogers = baseUserDao.findByFansNum(new Pagination(4));
        hotCourse = courseDao.findLatest4Course(new Pagination(4));
        return SUCCESS;
    }

    @Action(value = "error",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".error")})
    public String showErrorPage(){
        return SUCCESS;
    }



    public List<Course> getLatestCourse() {
        return latestCourse;
    }

    public void setLatestCourse(List<Course> latestCourse) {
        this.latestCourse = latestCourse;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public Course getTodayCourse() {
        return todayCourse;
    }

    public void setTodayCourse(Course todayCourse) {
        this.todayCourse = todayCourse;
    }

    public Course getTomorrowCourse() {
        return tomorrowCourse;
    }

    public void setTomorrowCourse(Course tomorrowCourse) {
        this.tomorrowCourse = tomorrowCourse;
    }

    public Course getYesterdayCourse() {
        return yesterdayCourse;
    }

    public void setYesterdayCourse(Course yesterdayCourse) {
        this.yesterdayCourse = yesterdayCourse;
    }

    public BaseUser getBaseUser() {
        return baseUser;
    }

    public void setBaseUser(BaseUser baseUser) {
        this.baseUser = baseUser;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public List<Course> getHotCourse() {
        return hotCourse;
    }

    public void setHotCourse(List<Course> hotCourse) {
        this.hotCourse = hotCourse;
    }

    public List<Course> getUserLikeCourse() {
        return userLikeCourse;
    }

    public void setUserLikeCourse(List<Course> userLikeCourse) {
        this.userLikeCourse = userLikeCourse;
    }

    public Integer getOperaType() {
        return operaType;
    }

    public void setOperaType(Integer operaType) {
        this.operaType = operaType;
    }

    public List<Interview> getInterviews() {
        return interviews;
    }

    public void setInterviews(List<Interview> interviews) {
        this.interviews = interviews;
    }

    public InterviewDao getInterviewDao() {
        return interviewDao;
    }

    public void setInterviewDao(InterviewDao interviewDao) {
        this.interviewDao = interviewDao;
    }

    public List<InterviewAppointer> getInterviewAppointers() {
        return interviewAppointers;
    }

    public void setInterviewAppointers(List<InterviewAppointer> interviewAppointers) {
        this.interviewAppointers = interviewAppointers;
    }

    public InterviewAppointerDao getInterviewAppointerDao() {
        return interviewAppointerDao;
    }

    public void setInterviewAppointerDao(InterviewAppointerDao interviewAppointerDao) {
        this.interviewAppointerDao = interviewAppointerDao;
    }

    public Boolean isExistInterview(){
       if(this.getInterviews().size()==0){
          return false;
       }
      return true ;
    }

     public Boolean isExistLatestCourse(){
       if(this.getLatestCourse().size()==0){
          return false;
       }
      return true ;
    }

    public Boolean isExistMeeting(){
        if(this.getOrgMeetings().size()==0){
            return false;
        }
        return true;
    }

    public Boolean isExistShow(){
        if(this.getMyShows().size() == 0){
            return false;
        }
        return true;
    }

    public Boolean isExistLiveChannel(){
        if(this.getLiveChannels().size() == 0){
            return false;
        }
        return true;
    }

    public Boolean isExistUserFanses(){
        if(this.getUserFanses().size() == 0){
            return false;
        }
        return true;
    }

    public Integer getUserFansNum(){
        return this.getUserFanses().size();
    }

    public BrowsedCourseDao getBrowsedCourseDao() {
        return browsedCourseDao;
    }

    public void setBrowsedCourseDao(BrowsedCourseDao browsedCourseDao) {
        this.browsedCourseDao = browsedCourseDao;
    }

    public List<BrowsedCourse> getBrowsedCourses() {
        return browsedCourses;
    }

    public void setBrowsedCourses(List<BrowsedCourse> browsedCourses) {
        this.browsedCourses = browsedCourses;
    }

    public OrgMeetingDao getOrgMeetingDao() {
        return orgMeetingDao;
    }

    public void setOrgMeetingDao(OrgMeetingDao orgMeetingDao) {
        this.orgMeetingDao = orgMeetingDao;
    }

    public List<OrgMeeting> getOrgMeetings() {
        return orgMeetings;
    }

    public void setOrgMeetings(List<OrgMeeting> orgMeetings) {
        this.orgMeetings = orgMeetings;
    }

    public Integer getMoreRequire() {
        return moreRequire;
    }

    public void setMoreRequire(Integer moreRequire) {
        this.moreRequire = moreRequire;
    }

    public MyShowDao getMyShowDao() {
        return myShowDao;
    }

    public void setMyShowDao(MyShowDao myShowDao) {
        this.myShowDao = myShowDao;
    }

    public List<MyShow> getMyShows() {
        return myShows;
    }

    public void setMyShows(List<MyShow> myShows) {
        this.myShows = myShows;
    }

    public MatterDao getMatterDao() {
        return matterDao;
    }

    public void setMatterDao(MatterDao matterDao) {
        this.matterDao = matterDao;
    }

    public Integer getMatterCount() {
        return matterCount;
    }

    public void setMatterCount(Integer matterCount) {
        this.matterCount = matterCount;
    }

    public LiveChannelDao getLiveChannelDao() {
        return liveChannelDao;
    }

    public void setLiveChannelDao(LiveChannelDao liveChannelDao) {
        this.liveChannelDao = liveChannelDao;
    }

    public List<LiveChannel> getLiveChannels() {
        return liveChannels;
    }

    public void setLiveChannels(List<LiveChannel> liveChannels) {
        this.liveChannels = liveChannels;
    }

    public UserFansDao getUserFansDao() {
        return userFansDao;
    }

    public void setUserFansDao(UserFansDao userFansDao) {
        this.userFansDao = userFansDao;
    }

    public List<UserFans> getUserFanses() {
        List<UserFans> ufs1 = new ArrayList<UserFans>();
        List<UserFans> ufs2 = new ArrayList<UserFans>();
        for(UserFans uf : userFanses){
            uf.setUserLiving(false);
            PersonalOnlive po = personalOnliveDao.findOnlivingByUser(uf.getUser().getId());
            if(po != null){
                uf.setUserLiving(true);
                uf.setPersonalOnliveID(po.getId());
                ufs1.add(uf);
            } else {
                ufs2.add(uf);
            }
        }
        for(UserFans uf : ufs2){
               ufs1.add(uf);
        }

        return ufs1;
    }

    public void setUserFanses(List<UserFans> userFanses) {
        this.userFanses = userFanses;
    }

    public PersonalOnliveDao getPersonalOnliveDao() {
        return personalOnliveDao;
    }

    public void setPersonalOnliveDao(PersonalOnliveDao personalOnliveDao) {
        this.personalOnliveDao = personalOnliveDao;
    }

    public Integer getCurrentPageSize() {
        return currentPageSize;
    }

    public void setCurrentPageSize(Integer currentPageSize) {
        this.currentPageSize = currentPageSize;
    }

    public Boolean getNumOverFlow() {
        return numOverFlow;
    }

    public void setNumOverFlow(Boolean numOverFlow) {
        this.numOverFlow = numOverFlow;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public List<BaseUser> getHottestBlogers() {
        for(BaseUser user : hottestBlogers){
            user.setUserFocused(false);
            if(this.getSessionUserId()!= null && userFansDao.findByUserAndFans(user.getId(),this.getSessionUserId()) != null){
               user.setUserFocused(true);
            }
        }
        return hottestBlogers;
    }

    public void setHottestBlogers(List<BaseUser> hottestBlogers) {
        this.hottestBlogers = hottestBlogers;
    }
}
