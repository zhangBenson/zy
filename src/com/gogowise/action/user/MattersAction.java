package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.system.dao.MatterDao;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseClass;
import com.gogowise.rep.system.enity.Matter;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.common.utils.Constants;
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
    private List<Matter> courseMessageMatters = new ArrayList<>();
    private List<Matter> courseRegisterMatters = new ArrayList<>();
    private List<Matter> courseTeacherMatters = new ArrayList<>();
    private List<Matter> courseInviteMatters = new ArrayList<>();
    private List<Matter> courseStudentMatters = new ArrayList<>();
    private List<Matter> courseResourceMatters = new ArrayList<>();

    private List<Matter> courseStudentNoOrgMatters=new ArrayList<Matter>();
    private MatterDao matterDao;
    private Integer courseId;
    private Course course;
    private BaseUserDao baseUserDao;
    private BaseUser user;
    private Matter matter;
    private boolean accept;
    private CourseClass courseClass;
    private Integer identityType;


    @Action(value = "initMatters", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location =".matters")})

    public String init(){
        List<Matter> allMatters=matterDao.findByToEmail(this.getSessionUserEmail());

        for(Matter m:allMatters){
            if(m.getType()==Matter.MATTER_COURSE_MESSAGE){
                courseMessageMatters.add(m);
            } else if (m.getType() == Matter.MATTER_COURSE_REGISTER) {
                courseRegisterMatters.add(m);
            }else if(m.getType()==Matter.MATTER_COURSE_TEACHER){
                courseTeacherMatters.add(m);
            }else if(m.getType()==Matter.MATTER_COURSE_INVITE){
                courseInviteMatters.add(m);
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
                    @Result(name="3",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","courseOnlineAudit","courseClass.id","${courseClass.id}","courseOnline","${accept}"}),
                    @Result(name="4",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","showBlog","myShow.id","${myShow.id}"}),

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

    public Matter getMatter() {
        return matter;
    }

    public void setMatter(Matter matter) {
        this.matter = matter;
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

    public Integer getIdentityType() {
        return identityType;
    }

    public void setIdentityType(Integer identityType) {
        this.identityType = identityType;
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


