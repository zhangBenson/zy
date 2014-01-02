package com.gogowise.action.search;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.live.LiveChannelDao;
import com.gogowise.rep.live.MyShowDao;
import com.gogowise.rep.org.dao.OrgFansDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.live.UserFansDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.live.enity.LiveChannel;
import com.gogowise.rep.live.enity.MyShow;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.common.utils.Constants;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;


/**
 * Created by GoGoWise
 * User: GGW
 * Date: 12-4-30
 * Time: 下午6:08
 * To change this template use File | Settings | File Templates.
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class SearchAction extends BasicAction{
    private CourseDao courseDao;
    private OrganizationDao organizationDao;
    private BaseUserDao baseUserDao;
    private MyShowDao myShowDao;
    private LiveChannelDao liveChannelDao;
    private UserFansDao userFansDao;
    private OrgFansDao orgFansDao;

    private List<Course> courses;
    private List<BaseUser> baseUsers;
    private List<Organization> organizations;
    private List<MyShow> myShows;
    private List<LiveChannel> liveChannels;
    private List<BaseUser> hottestTeachers;
    private List<Course> hottestCourses;
    private List<BaseUser> hottestBloggers;

    private Integer searchType;
    private  Integer hotType;
    private String searchStr;
    private Pagination pagination = new Pagination(4);

    @Action(value = "search", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".search")})
    public String initSearch() {
        return SUCCESS;
    }

    @Action(value = "searchAnswer",results = { @Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".searchAnswer")})
    public String searchAnswer() throws Exception{
        pagination.setPageSize(9);
        courses = courseDao.searchCourses(searchStr ,pagination);
        return SUCCESS;
    }
    @Action(value = "searchResult",results = { @Result(name = "all", type = Constants.RESULT_NAME_TILES, location = ".search"),
                                                 @Result(name = "member", type = Constants.RESULT_NAME_TILES, location = ".searchMemberList"),
                                                 @Result(name = "org", type = Constants.RESULT_NAME_TILES, location = ".searchOrgList"),
                                                 @Result(name = "course", type = Constants.RESULT_NAME_TILES, location = ".searchCourseList"),
                                                 @Result(name = "show", type = Constants.RESULT_NAME_TILES, location = ".searchShowList"),
                                                 @Result(name = "liveChannel", type = Constants.RESULT_NAME_TILES, location = ".searchLiveList")})
    public String search() throws Exception{

        hottestTeachers = baseUserDao.findHottestTeacher(pagination);
        hottestCourses = courseDao.findHotCourses(pagination);

       if(this.getSearchType().equals(Constants.SEARCH_TYPE_ALL)){
           pagination.setPageSize(3);
           baseUsers = baseUserDao.searchUsers(searchStr ,pagination);
           organizations = organizationDao.searchOrgs(searchStr ,pagination);
           courses = courseDao.searchCourses(searchStr ,pagination);
           myShows = myShowDao.searchShows(searchStr ,pagination);
           liveChannels = liveChannelDao.searchLiveChannels(searchStr,pagination);
           return "all";
       }else if(this.getSearchType().equals(Constants.SEARCH_TYPE_MEMBER)){
           pagination.setPageSize(9);
           baseUsers = baseUserDao.searchUsers(searchStr ,pagination);
           return "member";
       }else if(this.getSearchType().equals(Constants.SEARCH_TYPE_ORG)){
           pagination.setPageSize(9);
           organizations = organizationDao.searchOrgs(searchStr ,pagination);
           return "org";
       }else if(this.getSearchType().equals(Constants.SEARCH_TYPE_COURSE)){
           pagination.setPageSize(9);
           courses = courseDao.searchCourses(searchStr ,pagination);
           return "course";
       }else if(this.getSearchType().equals(Constants.SEARCH_TYPE_SHOW)){
           pagination.setPageSize(9);
           myShows = myShowDao.searchShows(searchStr ,pagination);
           return "show";
       }else{
           pagination.setPageSize(9);
           liveChannels = liveChannelDao.searchLiveChannels(searchStr,pagination);
           return "liveChannel";
       }
    }

    @Action(value = "teacherHotList",results = {@Result(name=SUCCESS,type=Constants.RESULT_NAME_TILES,location = ".teacherHotList")})
    public String listHottestTeachers(){
        this.setHotType(Constants.HOT_TYPE_TEACHER);
        pagination.setPageSize(10);
        baseUsers = baseUserDao.findHottestTeacher(pagination);
        hottestBloggers = baseUserDao.findByFansNum(new Pagination(3));

        hottestCourses = courseDao.findHotCourses(new Pagination(4));
        return SUCCESS;
    }

    @Action(value = "bloggerHotList",results = {@Result(name=SUCCESS,type=Constants.RESULT_NAME_TILES,location = ".bloggerHotList")})
    public String listHottestBloggers(){
        this.setHotType(Constants.HOT_TYPE_BLOGGER);
        pagination.setPageSize(10);
        baseUsers = baseUserDao.findByFansNum(pagination);
        hottestBloggers = baseUserDao.findHottestTeacher(new Pagination(3));

        hottestCourses = courseDao.findHotCourses(new Pagination(4));
        return SUCCESS;
    }


    public Integer getSearchType() {
        return searchType;
    }

    public void setSearchType(Integer searchType) {
        this.searchType = searchType;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public MyShowDao getMyShowDao() {
        return myShowDao;
    }

    public void setMyShowDao(MyShowDao myShowDao) {
        this.myShowDao = myShowDao;
    }

    public LiveChannelDao getLiveChannelDao() {
        return liveChannelDao;
    }

    public void setLiveChannelDao(LiveChannelDao liveChannelDao) {
        this.liveChannelDao = liveChannelDao;
    }

    public OrgFansDao getOrgFansDao() {
        return orgFansDao;
    }

    public void setOrgFansDao(OrgFansDao orgFansDao) {
        this.orgFansDao = orgFansDao;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    public List<BaseUser> getBaseUsers() {
        for(BaseUser user : baseUsers){
            user.setUserFocused(false);
             if(this.getSessionUserId() != null && userFansDao.findByUserAndFans(user.getId(),this.getSessionUserId()) != null){
                user.setUserFocused(true);
            }
        }
        return baseUsers;
    }

    public void setBaseUsers(List<BaseUser> baseUsers) {
        this.baseUsers = baseUsers;
    }

    public List<Organization> getOrganizations() {
        for(Organization org : organizations){
            org.setUserFocused(false);
            if(this.getSessionUserId() != null && orgFansDao.findByOrgAndUser(org.getId(),this.getSessionUserId()) != null){
                org.setUserFocused(true);
            }
        }
        return organizations;
    }

    public void setOrganizations(List<Organization> organizations) {
        this.organizations = organizations;
    }

    public List<MyShow> getMyShows() {
        return myShows;
    }

    public void setMyShows(List<MyShow> myShows) {
        this.myShows = myShows;
    }

    public List<LiveChannel> getLiveChannels() {
        return liveChannels;
    }

    public void setLiveChannels(List<LiveChannel> liveChannels) {
        this.liveChannels = liveChannels;
    }

    public List<BaseUser> getHottestTeachers() {
        return hottestTeachers;
    }

    public void setHottestTeachers(List<BaseUser> hottestTeachers) {
        this.hottestTeachers = hottestTeachers;
    }

    public String getSearchStr() {
        return searchStr;
    }

    public void setSearchStr(String searchStr) {
        this.searchStr = searchStr;
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

    public List<Course> getHottestCourses() {
        return hottestCourses;
    }

    public void setHottestCourses(List<Course> hottestCourses) {
        this.hottestCourses = hottestCourses;
    }

    public List<BaseUser> getHottestBloggers() {
        return hottestBloggers;
    }

    public void setHottestBloggers(List<BaseUser> hottestBloggers) {
        this.hottestBloggers = hottestBloggers;
    }

    public Integer getHotType() {
        return hotType;
    }

    public void setHotType(Integer hotType) {
        this.hotType = hotType;
    }
}
