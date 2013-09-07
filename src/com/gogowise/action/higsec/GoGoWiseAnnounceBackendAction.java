package com.gogowise.action.higsec;

import com.gogowise.action.BasicAction;
import com.gogowise.repository.user.BaseUserDao;
import com.gogowise.repository.course.CourseNewEventDao;
import com.gogowise.repository.system.GoGoWiseAnnounceDao;
import com.gogowise.domain.course.CourseNewEvent;
import com.gogowise.domain.system.GoGoWiseAnnounce;
import com.gogowise.domain.Pagination;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class GoGoWiseAnnounceBackendAction extends BasicAction{
    private GoGoWiseAnnounce goGoWiseAnnounce;
    private GoGoWiseAnnounceDao goGoWiseAnnounceDao;
    private CourseNewEventDao courseNewEventDao;
    private List<GoGoWiseAnnounce> goGoWiseAnnounceList = new ArrayList();
    private List<CourseNewEvent> courseNewEvents = new ArrayList<CourseNewEvent>();
    private Pagination pagination = new Pagination(10);
    private BaseUserDao baseUserDao;

    @Action(value = "higSecAddAnnounceInit",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".higSecAddAnnounceInit")})
    public String addgogowsieAnnounceInit(){
        if(this.getGoGoWiseAnnounce() != null && this.getGoGoWiseAnnounce().getId() != null){
            goGoWiseAnnounce = goGoWiseAnnounceDao.findById(this.getGoGoWiseAnnounce().getId());
        }
        return SUCCESS;
    }

    @Action(value = "addGGWAnnounce",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "higSecGgwAnnounceList"})})
    public String addGGWAnnounce(){
        goGoWiseAnnounce.setPublishTime(Utils.getCurrentCalender());
        goGoWiseAnnounce.setOwner(baseUserDao.findById(this.getSessionUserId()));
        goGoWiseAnnounceDao.persistAbstract(goGoWiseAnnounce);
        return SUCCESS;
    }

    @Action(value = "higSecGgwAnnounceList",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".ggwAnnounceList")})
    public String ggwAnnounceList(){
         goGoWiseAnnounceList = goGoWiseAnnounceDao.findLatestAnnounce(pagination);
         return SUCCESS;
    }

    @Action(value = "deleteAnnounce",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "higSecGgwAnnounceList"})})
    public String deleteAnnounce(){
        goGoWiseAnnounce = goGoWiseAnnounceDao.findById(this.getGoGoWiseAnnounce().getId());
        goGoWiseAnnounceDao.delete(getGoGoWiseAnnounce());
        return SUCCESS;
    }

    public GoGoWiseAnnounce getGoGoWiseAnnounce() {
        return goGoWiseAnnounce;
    }

    public void setGoGoWiseAnnounce(GoGoWiseAnnounce goGoWiseAnnounce) {
        this.goGoWiseAnnounce = goGoWiseAnnounce;
    }

    public GoGoWiseAnnounceDao getGoGoWiseAnnounceDao() {
        return goGoWiseAnnounceDao;
    }

    public void setGoGoWiseAnnounceDao(GoGoWiseAnnounceDao goGoWiseAnnounceDao) {
        this.goGoWiseAnnounceDao = goGoWiseAnnounceDao;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public List<GoGoWiseAnnounce> getGoGoWiseAnnounceList() {
        return goGoWiseAnnounceList;
    }

    public void setGoGoWiseAnnounceList(List<GoGoWiseAnnounce> goGoWiseAnnounceList) {
        this.goGoWiseAnnounceList = goGoWiseAnnounceList;
    }

    public CourseNewEventDao getCourseNewEventDao() {
        return courseNewEventDao;
    }

    public void setCourseNewEventDao(CourseNewEventDao courseNewEventDao) {
        this.courseNewEventDao = courseNewEventDao;
    }

    public List<CourseNewEvent> getCourseNewEvents() {
        return courseNewEvents;
    }

    public void setCourseNewEvents(List<CourseNewEvent> courseNewEvents) {
        this.courseNewEvents = courseNewEvents;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
}
