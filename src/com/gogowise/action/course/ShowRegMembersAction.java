package com.gogowise.action.course;


import com.gogowise.action.BasicAction;
import com.gogowise.dao.course.CourseDao;
import com.gogowise.dao.live.LiveChannelNewEventDao;
import com.gogowise.domain.*;
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
public class ShowRegMembersAction extends BasicAction {

    private  CourseDao courseDao;
    private Course course;
    private MyShow myShow;
    private LiveChannelNewEventDao.MyShowDao myShowDao;
    private  List<BaseUser> regs = new ArrayList<BaseUser>();

    private Pagination pagination = new Pagination(20);

    @Action(value = "showRegMembers", results = {@Result(name = SUCCESS, location ="/jsp/gogowise/course/showRegMember.jsp" )})
    public String showRegMembers() {

        if(this.getMyShow() != null && this.getMyShow().getId()!=null){
            myShow = myShowDao.findById(this.getMyShow().getId());
            for(ShowFans showFans : myShow.getShowFanses()){
                regs.add(showFans.getFan());
            }
        }else {
            if(this.getCourse()!=null && this.getCourse().getId() != null){
                regs = courseDao.findRegUser(course.getId(), pagination);
            }
        }
        return SUCCESS;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public List<BaseUser> getRegs() {
        return regs;
    }

    public void setRegs(List<BaseUser> regs) {
        this.regs = regs;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public MyShow getMyShow() {
        return myShow;
    }

    public void setMyShow(MyShow myShow) {
        this.myShow = myShow;
    }

    public LiveChannelNewEventDao.MyShowDao getMyShowDao() {
        return myShowDao;
    }

    public void setMyShowDao(LiveChannelNewEventDao.MyShowDao myShowDao) {
        this.myShowDao = myShowDao;
    }
}
