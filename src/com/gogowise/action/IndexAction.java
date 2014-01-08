package com.gogowise.action;

import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.live.LiveChannelDao;
import com.gogowise.rep.live.MyShowDao;
import com.gogowise.rep.live.PersonalOnliveDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.live.enity.LiveChannel;
import com.gogowise.rep.live.enity.MyShow;
import com.gogowise.rep.live.enity.PersonalOnlive;
import com.gogowise.rep.user.enity.BaseUser;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "input", location = "/jsp/gogowise/list.jsp"),
        @Result(name = "success", type = "tiles", location = ".index")
})
public class IndexAction extends BasicAction {




    private BaseUserDao baseUserDao;
    private OrganizationDao organizationDao;
    private PersonalOnliveDao personalOnliveDao;
    private LiveChannelDao liveChannelDao;
    private CourseDao courseDao;
    private MyShowDao myShowDao;
    private BaseUser baseUser;
    private List<Course> courses;
    private List<MyShow> myShows;
    private List<PersonalOnlive> personalOnlives;
    private List<PersonalOnlive> hottestOnlives;
    private List<LiveChannel> liveChannels;
    private Pagination pagination = new Pagination(3);


    private List<Organization> organizations = new ArrayList<>();



    String logInfo = "";
    private String language;
    /**
     *
     */
    private static final long serialVersionUID = -2512666132359957051L;



    @Action(value = "listAllContent",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".listAllContent")}
    )
    public String listAllContent() throws Exception {
        return SUCCESS;
    }

    @Action(value = "deployBeta",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".listAllContent")}
    )
    public String deployBeta() throws Exception {
        String filePath = "deploy.bat";
        String realPath = ServletActionContext.getServletContext().getRealPath(filePath);
        String cmd = "cmd /c start " + realPath;
        Process ps = Runtime.getRuntime().exec(cmd);
        return SUCCESS;
    }

    @Action(value = "viewLog",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".listAllContent")}
    )
    public String viewLog() throws Exception {
        logInfo = loadLog("D:\\dev\\WorkSpace\\gogowise\\log\\buildLog.txt");
        return SUCCESS;
    }

    public static String loadLog(String filePath) throws IOException {

        String lineBreak = "<tr><td>";
        String lineBreak1 = "</td></tr>";
        File f = new File(filePath);
        BufferedReader br = null;
        String ret = null;
        try {
            br = new BufferedReader(new FileReader(f));
            String line = null;
            StringBuffer sb = new StringBuffer((int) f.length());
            while ((line = br.readLine()) != null) {
                sb.append(lineBreak).append(line).append(lineBreak1);
            }
            ret = sb.toString();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (Exception e) {
                }
            }
        }
        return ret;
    }

    public String getLogInfo() {
        return logInfo;
    }

    public void setLogInfo(String logInfo) {
        this.logInfo = logInfo;
    }


    @Action(value = "index",
            results = {@Result(name = SUCCESS, type = "tiles", location = ".index")}
    )
    public String index() {
//        if("en_US".equals(language)){
            ActionContext.getContext().getSession().put("WW_TRANS_I18N_LOCALE",new Locale("en","US"));
            ActionContext.getContext().getSession().put("request_locale",new Locale("en","US"));
            ActionContext.getContext().getSession().put("request_only_locale",new Locale("en","US"));
            ActionContext.getContext().setLocale(new Locale("en","US"));
//        }
        courses = courseDao.findlatestCourses(pagination);
        organizations = organizationDao.findLatestOrgs(new Pagination(8));
        return SUCCESS;
    }

    public Integer getPersonalOnlivesNum(){
        return this.getPersonalOnlives().size();
    }

    public Integer getCoursesNum(){
        return this.getCourses().size();
    }

    public Integer getShowsNum(){
        return this.getMyShows().size();
    }

    public Integer getLiveChannelsNum(){
        return this.getLiveChannels().size();
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
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
    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
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

    public List<PersonalOnlive> getPersonalOnlives() {
        return personalOnlives;
    }

    public void setPersonalOnlives(List<PersonalOnlive> personalOnlives) {
        this.personalOnlives = personalOnlives;
    }

    public List<LiveChannel> getLiveChannels() {
        return liveChannels;
    }

    public void setLiveChannels(List<LiveChannel> liveChannels) {
        this.liveChannels = liveChannels;
    }

    public PersonalOnliveDao getPersonalOnliveDao() {
        return personalOnliveDao;
    }

    public void setPersonalOnliveDao(PersonalOnliveDao personalOnliveDao) {
        this.personalOnliveDao = personalOnliveDao;
    }

    public LiveChannelDao getLiveChannelDao() {
        return liveChannelDao;
    }

    public void setLiveChannelDao(LiveChannelDao liveChannelDao) {
        this.liveChannelDao = liveChannelDao;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public List<PersonalOnlive> getHottestOnlives() {
        return hottestOnlives;
    }

    public void setHottestOnlives(List<PersonalOnlive> hottestOnlives) {
        this.hottestOnlives = hottestOnlives;
    }

    public List<Organization> getOrganizations() {
        return organizations;
    }

    public void setOrganizations(List<Organization> organizations) {
        this.organizations = organizations;
    }
}
