package com.gogowise.action.news;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.course.CourseDao;
import com.gogowise.dao.course.CourseNewEventDao;
import com.gogowise.dao.live.*;
import com.gogowise.dao.system.GoGoWiseAnnounceDao;
import com.gogowise.domain.*;
import com.gogowise.utils.Constants;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class NewsReadAction extends BasicAction{
    private GoGoWiseAnnounceDao goGoWiseAnnounceDao;
    private CourseNewEventDao courseNewEventDao;
    private ShowNewEventDao showNewEventDao;
    private LiveChannelNewEventDao liveChannelNewEventDao;
    private CourseDao courseDao;
    private LiveChannelDao liveChannelDao;
    private LiveTrailerDao liveTrailerDao;
    private PersonalOnliveDao personalOnliveDao;

    private List<GoGoWiseAnnounce> goGoWiseAnnounces;
    private List<CourseNewEvent> courseNewEvents;
    private List<ShowNewEvent> showNewEvents;
    private List<LiveChannelNewEvent> liveChannelNewEvents;
    private List<Course> courses;
    private List<LiveChannel> liveChannels;
    private List<LiveTrailer> liveTrailers;

    private GoGoWiseAnnounce goGoWiseAnnounce;
    private CourseNewEvent courseNewEvent;
    private ShowNewEvent showNewEvent;
    private LiveChannelNewEvent liveChannelNewEvent;
    private LiveTrailer liveTrailer;
    private Pagination pagination = new Pagination(10);

    private PersonalOnlive  personalOnlive;

    @Action(value = "announceRead",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".announceRead")})
    public String announceRead(){
        goGoWiseAnnounce = goGoWiseAnnounceDao.findById(this.getGoGoWiseAnnounce().getId());
        goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(pagination);
        courseNewEvents = courseNewEventDao.findLatestTenEvents(pagination);
        showNewEvents = showNewEventDao.findLatestNews(pagination);
        liveChannelNewEvents = liveChannelNewEventDao.findLatestNews(pagination);
        liveTrailers = liveTrailerDao.findByPublishTime(pagination);
        courses = courseDao.findLatest4Course(new Pagination(4));
        liveChannels = liveChannelDao.findOwnTermsRecord(new Pagination(4));

        return SUCCESS;
    }

    @Action(value = "courseEventRead",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".courseEventRead")})
    public String courseEventRead(){
        courseNewEvent = courseNewEventDao.findById(this.getCourseNewEvent().getId());
//        courseNewEvent.setContent(parse(courseNewEvent.getContent()));
        goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(pagination);
        courseNewEvents = courseNewEventDao.findLatestTenEvents(pagination);
        showNewEvents = showNewEventDao.findLatestNews(pagination);
        liveChannelNewEvents = liveChannelNewEventDao.findLatestNews(pagination);
        liveTrailers = liveTrailerDao.findByPublishTime(pagination);
        courses = courseDao.findLatest4Course(new Pagination(4));
        liveChannels = liveChannelDao.findOwnTermsRecord(new Pagination(4));
        return SUCCESS;
    }

    @Action(value = "showEventRead",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".showEventRead")})
    public String showEventRead(){
        showNewEvent = showNewEventDao.findById(this.getShowNewEvent().getId());
        goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(pagination);
        courseNewEvents = courseNewEventDao.findLatestTenEvents(pagination);
        showNewEvents = showNewEventDao.findLatestNews(pagination);
        liveChannelNewEvents = liveChannelNewEventDao.findLatestNews(pagination);
        liveTrailers = liveTrailerDao.findByPublishTime(pagination);
        courses = courseDao.findLatest4Course(new Pagination(4));
        liveChannels = liveChannelDao.findOwnTermsRecord(new Pagination(4));
        return SUCCESS;
    }

     @Action(value = "liveChannelEventRead",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveChannelEventRead")})
    public String liveChannelEventRead(){
        liveChannelNewEvent = liveChannelNewEventDao.findById(this.getLiveChannelNewEvent().getId());
        goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(pagination);
        courseNewEvents = courseNewEventDao.findLatestTenEvents(pagination);
        showNewEvents = showNewEventDao.findLatestNews(pagination);
        liveChannelNewEvents = liveChannelNewEventDao.findLatestNews(pagination);
        liveTrailers = liveTrailerDao.findByPublishTime(pagination);
        courses = courseDao.findLatest4Course(new Pagination(4));
        liveChannels = liveChannelDao.findOwnTermsRecord(new Pagination(4));
        return SUCCESS;
    }

      @Action(value = "liveTrailerRead",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".liveTrailerRead")})
    public String liveTrailerRead(){
        liveTrailer = liveTrailerDao.findById(this.getLiveTrailer().getId());
        goGoWiseAnnounces = goGoWiseAnnounceDao.findLatestAnnounce(pagination);
        courseNewEvents = courseNewEventDao.findLatestTenEvents(pagination);
        showNewEvents = showNewEventDao.findLatestNews(pagination);
        liveChannelNewEvents = liveChannelNewEventDao.findLatestNews(pagination);
        liveTrailers = liveTrailerDao.findByPublishTime(pagination);
        courses = courseDao.findLatest4Course(new Pagination(4));
        liveChannels = liveChannelDao.findOwnTermsRecord(new Pagination(4));

        personalOnlive = personalOnliveDao.findOnlivingByUser(liveTrailer.getOwner().getId());

        return SUCCESS;
    }


    public GoGoWiseAnnounceDao getGoGoWiseAnnounceDao() {
        return goGoWiseAnnounceDao;
    }

    public void setGoGoWiseAnnounceDao(GoGoWiseAnnounceDao goGoWiseAnnounceDao) {
        this.goGoWiseAnnounceDao = goGoWiseAnnounceDao;
    }

    public CourseNewEventDao getCourseNewEventDao() {
        return courseNewEventDao;
    }

    public void setCourseNewEventDao(CourseNewEventDao courseNewEventDao) {
        this.courseNewEventDao = courseNewEventDao;
    }

    public ShowNewEventDao getShowNewEventDao() {
        return showNewEventDao;
    }

    public void setShowNewEventDao(ShowNewEventDao showNewEventDao) {
        this.showNewEventDao = showNewEventDao;
    }

    public LiveChannelNewEventDao getLiveChannelNewEventDao() {
        return liveChannelNewEventDao;
    }

    public void setLiveChannelNewEventDao(LiveChannelNewEventDao liveChannelNewEventDao) {
        this.liveChannelNewEventDao = liveChannelNewEventDao;
    }

    public List<GoGoWiseAnnounce> getGoGoWiseAnnounces() {
        return goGoWiseAnnounces;
    }

    public void setGoGoWiseAnnounces(List<GoGoWiseAnnounce> goGoWiseAnnounces) {
        this.goGoWiseAnnounces = goGoWiseAnnounces;
    }

    public List<CourseNewEvent> getCourseNewEvents() {
        return courseNewEvents;
    }

    public void setCourseNewEvents(List<CourseNewEvent> courseNewEvents) {
        this.courseNewEvents = courseNewEvents;
    }

    public List<ShowNewEvent> getShowNewEvents() {
        return showNewEvents;
    }

    public void setShowNewEvents(List<ShowNewEvent> showNewEvents) {
        this.showNewEvents = showNewEvents;
    }

    public List<LiveChannelNewEvent> getLiveChannelNewEvents() {
        return liveChannelNewEvents;
    }

    public void setLiveChannelNewEvents(List<LiveChannelNewEvent> liveChannelNewEvents) {
        this.liveChannelNewEvents = liveChannelNewEvents;
    }

    public GoGoWiseAnnounce getGoGoWiseAnnounce() {
        return goGoWiseAnnounce;
    }

    public void setGoGoWiseAnnounce(GoGoWiseAnnounce goGoWiseAnnounce) {
        this.goGoWiseAnnounce = goGoWiseAnnounce;
    }

    public CourseNewEvent getCourseNewEvent() {
        return courseNewEvent;
    }

    public void setCourseNewEvent(CourseNewEvent courseNewEvent) {
        this.courseNewEvent = courseNewEvent;
    }

    public ShowNewEvent getShowNewEvent() {
        return showNewEvent;
    }

    public void setShowNewEvent(ShowNewEvent showNewEvent) {
        this.showNewEvent = showNewEvent;
    }

    public LiveChannelNewEvent getLiveChannelNewEvent() {
        return liveChannelNewEvent;
    }

    public void setLiveChannelNewEvent(LiveChannelNewEvent liveChannelNewEvent) {
        this.liveChannelNewEvent = liveChannelNewEvent;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public LiveChannelDao getLiveChannelDao() {
        return liveChannelDao;
    }

    public void setLiveChannelDao(LiveChannelDao liveChannelDao) {
        this.liveChannelDao = liveChannelDao;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    public List<LiveChannel> getLiveChannels() {
        return liveChannels;
    }

    public void setLiveChannels(List<LiveChannel> liveChannels) {
        this.liveChannels = liveChannels;
    }

    public LiveTrailerDao getLiveTrailerDao() {
        return liveTrailerDao;
    }

    public void setLiveTrailerDao(LiveTrailerDao liveTrailerDao) {
        this.liveTrailerDao = liveTrailerDao;
    }

    public List<LiveTrailer> getLiveTrailers() {
        return liveTrailers;
    }

    public void setLiveTrailers(List<LiveTrailer> liveTrailers) {
        this.liveTrailers = liveTrailers;
    }

    public LiveTrailer getLiveTrailer() {
        return liveTrailer;
    }

    public void setLiveTrailer(LiveTrailer liveTrailer) {
        this.liveTrailer = liveTrailer;
    }

    public PersonalOnlive getPersonalOnlive() {
        return personalOnlive;
    }

    public void setPersonalOnlive(PersonalOnlive personalOnlive) {
        this.personalOnlive = personalOnlive;
    }

    public PersonalOnliveDao getPersonalOnliveDao() {
        return personalOnliveDao;
    }

    public void setPersonalOnliveDao(PersonalOnliveDao personalOnliveDao) {
        this.personalOnliveDao = personalOnliveDao;
    }
}
