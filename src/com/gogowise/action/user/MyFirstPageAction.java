package com.gogowise.action.user;


import java.util.ArrayList;
import java.util.List;

import com.gogowise.rep.org.OrgService;
import com.gogowise.rep.user.UserService;
import com.gogowise.rep.user.enity.RoleType;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.system.MatterDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;

@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class MyFirstPageAction extends BasicAction {

    private List<Course> finishedCourse = new ArrayList<Course>();
    private List<Course> latestCourse = new ArrayList<Course>();
    private List<Organization> latestOrgs = new ArrayList<>();
    private OrganizationDao organizationDao;
    private Organization userOrganization;
    private CourseDao courseDao;
    private BaseUserDao baseUserDao;
    private Course todayCourse;
    private Course tomorrowCourse;
    private Course yesterdayCourse;
    private List<Course> hotCourse;
    private List<Course> userLikeCourse;
    private BaseUser baseUser;
    private Integer operaType;
    private Integer moreRequire = 0;
    private Integer matterCount = 0;

    private MatterDao matterDao;
    private List<BaseUser> hottestBlogers = new ArrayList<BaseUser>();
    private Integer currentPageSize;
    private Boolean numOverFlow = false;
    private Pagination pagination = new Pagination();

    @Autowired
    private OrgService orgService;
    @Autowired
    private UserService userService;

    @Action(value = "personalCenter",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".studentCenter")}
    )
    public String studentCenter() {
        latestOrgs = organizationDao.findLatestOrgs(new Pagination(3));
        userOrganization = orgService.findMyOrg(this.getSessionUserId());
        showUserCenter();

        latestCourse = courseDao.findMyCourseOfForcastClassForUserCenter(new Pagination(3), this.getSessionUserId(), RoleType.ROLE_TYPE_STUDENT);

        return SUCCESS;
    }

    @Action(value = "personalCenterFinished",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".studentCenterFinished")}
    )
    public String studentCenterFinished() {
        latestOrgs = organizationDao.findLatestOrgs(new Pagination(3));
        userOrganization = orgService.findMyOrg(this.getSessionUserId());
        showUserCenter();

        finishedCourse = courseDao.findFinishedCourseForUserCenter(new Pagination(3), this.getSessionUserId(), RoleType.ROLE_TYPE_STUDENT);
        return SUCCESS;
    }


    @Action(value = "myfirstPage",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".myGoGoWise"),
                    @Result(name = "studentCenter", type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "personalCenter"})}
    )
    public String showUserCenter() {
//        ActionContext.getContext().getSession().put("WW_TRANS_I18N_LOCALE", Locale.US);
        if (!userService.havePermission(this.getSessionUserId(), RoleType.TEACHER)) {
            return "studentCenter";
        }

        finishedCourse = courseDao.findFinishedCourseForUserCenter(new Pagination(3), this.getSessionUserId(), RoleType.ROLE_TYPE_TEACHER);
        //latestCourse = courseDao.findMyCourseOfForcastClassForUserCenter(new Pagination(3),this.getSessionUserId());
        latestCourse = courseDao.findMyCourseOfForcastClassForUserCenter(new Pagination(3), this.getSessionUserId(), RoleType.ROLE_TYPE_TEACHER);

        todayCourse = courseDao.findTodayCourse(this.getSessionUserId());
        tomorrowCourse = courseDao.findTomorrowCourse(this.getSessionUserId());
        yesterdayCourse = courseDao.findYesterdayCourse(this.getSessionUserId());

        hotCourse = courseDao.findLatest4Course(new Pagination(8));
        userLikeCourse = courseDao.findlatestCourses(new Pagination(4));

        this.baseUser = baseUserDao.findById(this.getSessionUserId());

        matterCount = matterDao.getMatterCount(this.getSessionUserEmail());
        return SUCCESS;
    }

    @Action(value = "error", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".error")})
    public String showErrorPage() {
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

    public Boolean isExistLatestCourse() {
        if (this.getLatestCourse().size() == 0) {
            return false;
        }
        return true;
    }

    public Integer getMoreRequire() {
        return moreRequire;
    }

    public void setMoreRequire(Integer moreRequire) {
        this.moreRequire = moreRequire;
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
        return hottestBlogers;
    }

    public void setHottestBlogers(List<BaseUser> hottestBlogers) {
        this.hottestBlogers = hottestBlogers;
    }

    public List<Organization> getLatestOrgs() {
        return latestOrgs;
    }

    public void setLatestOrgs(List<Organization> latestOrgs) {
        this.latestOrgs = latestOrgs;
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public Organization getUserOrganization() {
        return this.userOrganization;
    }

    public void setUserOrganization(Organization userOrganization) {
        this.userOrganization = userOrganization;
    }

    public List<Course> getFinishedCourse() {
        return finishedCourse;
    }

    public void setFinishedCourse(List<Course> finishedCourse) {
        this.finishedCourse = finishedCourse;
    }

    public Boolean isExistFinishedCourse() {
        if (this.getFinishedCourse().size() == 0) {
            return false;
        }
        return true;
    }
}
