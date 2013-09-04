package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.course.MatterDao;
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

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-6-16
 * Time: 下午3:17
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class MattersAction extends BasicAction{
    private List<Matter> courseMessageMatters=new ArrayList<Matter>();
    private List<Matter> orgMeetingMatters=new ArrayList<Matter>();
    private List<Matter> courseRegisterMatters=new ArrayList<Matter>();
    private List<Matter> courseReservationMatters=new ArrayList<Matter>();
    private List<Matter> courseTeacherMatters=new ArrayList<Matter>();
    private List<Matter> courseInviteMatters=new ArrayList<Matter>();
    private List<Matter> interviewerMatters=new ArrayList<Matter>();
    private List<Matter> intervieweeMatters=new ArrayList<Matter>();
    private List<Matter> myShowMessageMatters=new ArrayList<Matter>();
    private List<Matter> orgMeetingHostManMatters=new ArrayList<Matter>();
    private List<Matter> courseStudentMatters=new ArrayList<Matter>();
    private List<Matter> courseResourceMatters=new ArrayList<Matter>();

    private List<Matter> courseStudentNoOrgMatters=new ArrayList<Matter>();
    private MatterDao matterDao;
    private Integer courseId;
    private Course course;
    private OrgMeeting orgMeeting;
    private BaseUserDao baseUserDao;
    private BaseUser user;
    private Matter matter;
    private CourseReservation courseReservation;
    private boolean accept;
    private CourseClass courseClass;
    private Interview interview;
    private Integer identityType;
    private MyShow myShow;


    @Action(value = "initMatters", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location =".matters")})

    public String init(){
        List<Matter> allMatters=matterDao.findByToEmail(this.getSessionUserEmail());

        for(Matter m:allMatters){
            if(m.getType()==Matter.MATTER_COURSE_MESSAGE){
                courseMessageMatters.add(m);
            } else if(m.getType()==Matter.MATTER_ORGMEETING){
                orgMeetingMatters.add(m);
            }else if(m.getType()==Matter.MATTER_COURSE_REGISTER){
                courseRegisterMatters.add(m);
            }else if(m.getType()==Matter.MATTER_COURSE_RESERVATION){
                courseReservationMatters.add(m);
            }else if(m.getType()==Matter.MATTER_COURSE_TEACHER){
                courseTeacherMatters.add(m);
            }else if(m.getType()==Matter.MATTER_COURSE_INVITE){
                courseInviteMatters.add(m);
            }else if(m.getType()==Matter.MATTER_INTERVIEW_INTERVIEWER){
                interviewerMatters.add(m);
            }else if(m.getType()==Matter.MATTER_INTERVIEW_INTERVIEWEE){
                intervieweeMatters.add(m);
            }else if(m.getType()==Matter.MATTER_MYSHOW_MESSAGE){
                myShowMessageMatters.add(m);
            }else if(m.getType()==Matter.MATTER_ORGMEETING_HOSTMAN){
                orgMeetingHostManMatters.add(m);
            }else if(m.getType()==Matter.MATTER_COURSE_STUDENT){
                courseStudentMatters.add(m);
            }else if(m.getType()==Matter.MATTER_COURSE_STUDENT_NO_ORG){
                courseStudentNoOrgMatters.add(m);
            }else if(m.getType()==Matter.MATTER_COURSE_RESOURCE){
                courseResourceMatters.add(m);
            }

        }
        return SUCCESS;
    }
    @Action(value = "matterHandler",
            results = {
                    @Result(name ="MATTER_COURSE_MESSAGE", type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "voaCourseBlog", "course.id", "${course.id}"}),
                    @Result(name="6",type=Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","orgMeetingEmailConfirm","orgMeeting.id","${orgMeeting.id}","email","${matter.email}","user.email","${user.email}"}),
                    @Result(name="8",type=Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","initInterviewIdentityConfirm","courseReservation.id","${courseReservation.id}","email","${matter.toEmail}","code","${matter.email}"}),
                    @Result(name="3",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","courseOnlineAudit","courseClass.id","${courseClass.id}","courseOnline","${accept}"}),
                    @Result(name="5",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","interviewEmailHandle","interview.id","${interview.id}","identityType","${identityType}","user.email","${user.email}"}),
                    @Result(name="4",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","showBlog","myShow.id","${myShow.id}"}),
                    @Result(name="MATTER_ORGMEETING_HOSTMAN",type=Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","orgMeetingEmailConfirm","orgMeeting.id","${orgMeeting.id}","orgMeeting.hostManEmail","${matter.email}","user.email","${user.email}"})

            }
    )

    public String matterHandler(){
        this.setMatterDone(matterDao.findById(this.getMatter().getId()));
        if(this.getMatter().getType()==1||this.getMatter().getId()==13){
            return "MATTER_COURSE_MESSAGE";
        }else if (this.getMatter().getType()==6){
            return "6";
        }else if (this.getMatter().getType()==7){
            return "MATTER_COURSE_MESSAGE";
        }else if (this.getMatter().getType()==8){
            matter=matterDao.findById(this.getMatter().getId());
            return "8";
        }else if(this.getMatter().getType()==3){
            courseClass=new CourseClass();
            courseClass.setId(Integer.parseInt(this.getMatter().getEmail()));
            this.setAccept(true);
            return "3";
        }else if(this.getMatter().getType()==5||this.getMatter().getType()==10){
            return "5";
        }else if(this.getMatter().getType()==4){
            return "4";
        }else if(this.getMatter().getType()==11){
            return "MATTER_ORGMEETING_HOSTMAN";
        }
        return "";

    }

    @Action(value = "ignoreMatter")
    public String ignoreMatter(){
        this.setMatterDone(matterDao.findById(this.getMatter().getId()));
        return SUCCESS;
    }

    @Action(value = "ignoreAllMatter")
    public String ignoreAllMatter(){
        List<Matter> matters = matterDao.findByToEmail(this.getSessionUserEmail());
        for(Matter m:matters){
            m.setDone(true);
            matterDao.persistAbstract(m);
        }
        return SUCCESS;
    }


    private void setMatterDone(Matter matterTemp){
        matterTemp.setDone(true);
        matterDao.persistAbstract(matterTemp);

    }


    public MatterDao getMatterDao() {
        return matterDao;
    }

    public void setMatterDao(MatterDao matterDao) {
        this.matterDao = matterDao;
    }

    public List<Matter> getCourseMessageMatters() {
        return courseMessageMatters;
    }

    public void setCourseMessageMatters(List<Matter> courseMessageMatters) {
        this.courseMessageMatters = courseMessageMatters;
    }


    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public List<Matter> getOrgMeetingMatters() {
        return orgMeetingMatters;
    }

    public void setOrgMeetingMatters(List<Matter> orgMeetingMatters) {
        this.orgMeetingMatters = orgMeetingMatters;
    }

    public OrgMeeting getOrgMeeting() {
        return orgMeeting;
    }

    public void setOrgMeeting(OrgMeeting orgMeeting) {
        this.orgMeeting = orgMeeting;
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

    public List<Matter> getCourseRegisterMatters() {
        return courseRegisterMatters;
    }

    public void setCourseRegisterMatters(List<Matter> courseRegisterMatters) {
        this.courseRegisterMatters = courseRegisterMatters;
    }

    public List<Matter> getCourseReservationMatters() {
        return courseReservationMatters;
    }

    public void setCourseReservationMatters(List<Matter> courseReservationMatters) {
        this.courseReservationMatters = courseReservationMatters;
    }

    public Matter getMatter() {
        return matter;
    }

    public void setMatter(Matter matter) {
        this.matter = matter;
    }

    public CourseReservation getCourseReservation() {
        return courseReservation;
    }

    public void setCourseReservation(CourseReservation courseReservation) {
        this.courseReservation = courseReservation;
    }

    public List<Matter> getCourseTeacherMatters() {
        return courseTeacherMatters;
    }

    public void setCourseTeacherMatters(List<Matter> courseTeacherMatters) {
        this.courseTeacherMatters = courseTeacherMatters;
    }

    public boolean isAccept() {
        return accept;
    }

    public void setAccept(boolean accept) {
        this.accept = accept;
    }

    public List<Matter> getCourseInviteMatters() {
        return courseInviteMatters;
    }

    public void setCourseInviteMatters(List<Matter> courseInviteMatters) {
        this.courseInviteMatters = courseInviteMatters;
    }

    public CourseClass getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(CourseClass courseClass) {
        this.courseClass = courseClass;
    }

    public List<Matter> getIntervieweeMatters() {
        return intervieweeMatters;
    }

    public void setIntervieweeMatters(List<Matter> intervieweeMatters) {
        this.intervieweeMatters = intervieweeMatters;
    }

    public List<Matter> getInterviewerMatters() {
        return interviewerMatters;
    }

    public void setInterviewerMatters(List<Matter> interviewerMatters) {
        this.interviewerMatters = interviewerMatters;
    }

    public Interview getInterview() {
        return interview;
    }

    public void setInterview(Interview interview) {
        this.interview = interview;
    }

    public Integer getIdentityType() {
        return identityType;
    }

    public void setIdentityType(Integer identityType) {
        this.identityType = identityType;
    }

    public List<Matter> getMyShowMessageMatters() {
        return myShowMessageMatters;
    }

    public void setMyShowMessageMatters(List<Matter> myShowMessageMatters) {
        this.myShowMessageMatters = myShowMessageMatters;
    }

    public MyShow getMyShow() {
        return myShow;
    }

    public void setMyShow(MyShow myShow) {
        this.myShow = myShow;
    }

    public List<Matter> getOrgMeetingHostManMatters() {
        return orgMeetingHostManMatters;
    }

    public void setOrgMeetingHostManMatters(List<Matter> orgMeetingHostManMatters) {
        this.orgMeetingHostManMatters = orgMeetingHostManMatters;
    }

    public List<Matter> getCourseStudentMatters() {
        return courseStudentMatters;
    }

    public void setCourseStudentMatters(List<Matter> courseStudentMatters) {
        this.courseStudentMatters = courseStudentMatters;
    }

    public List<Matter> getCourseStudentNoOrgMatters() {
        return courseStudentNoOrgMatters;
    }

    public void setCourseStudentNoOrgMatters(List<Matter> courseStudentNoOrgMatters) {
        this.courseStudentNoOrgMatters = courseStudentNoOrgMatters;
    }

    public List<Matter> getCourseResourceMatters() {
        return courseResourceMatters;
    }

    public void setCourseResourceMatters(List<Matter> courseResourceMatters) {
        this.courseResourceMatters = courseResourceMatters;
    }
}


