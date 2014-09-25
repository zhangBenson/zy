package com.gogowise.action.search;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.SeniorClassRoom;
import com.gogowise.rep.org.dao.OrganizationCommentDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
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
public class SearchAction extends BasicAction {
    private CourseDao courseDao;
    private OrganizationDao organizationDao;
    private BaseUserDao baseUserDao;
    private OrganizationCommentDao organizationCommentDao;

    private List<Course> courses;
    private List<BaseUser> baseUsers;
    private List<Organization> organizations;
    private List<BaseUser> hottestTeachers;
    private List<Course> hottestCourses;
    private List<BaseUser> hottestBloggers;

    private Integer searchType;
    private Integer hotType;
    private String searchStr;
    private Pagination pagination = new Pagination(4);


    @Action(value = "search", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".search")})
    public String initSearch() {
        return SUCCESS;
    }

    @Action(value = "searchSchool", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".searchSchool")})
    public String searchSchool() throws Exception {
        pagination.setPageSize(5);
        organizations = organizationDao.searchOrgs(searchStr, pagination);
        return SUCCESS;
    }

    @Action(value = "searchAnswer", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".searchAnswer")})
    public String searchAnswer() throws Exception {
        pagination.setPageSize(5);
        courses = courseDao.searchCourses(searchStr, pagination);
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


    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    public List<BaseUser> getBaseUsers() {
        return baseUsers;
    }

    public void setBaseUsers(List<BaseUser> baseUsers) {
        this.baseUsers = baseUsers;
    }

    public List<Organization> getOrganizations() {
        return organizations;
    }

    public void setOrganizations(List<Organization> organizations) {
        this.organizations = organizations;
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

    public Integer getStudentsNumByOrgId(Integer orgId) {
        if (orgId == null || orgId < 0)
            return 0;
        List<BaseUser> students = new ArrayList<BaseUser>();
        for (Course c : courseDao.findByOrg(orgId, null)) {
            for (SeniorClassRoom sc : c.getSeniorClassRooms()) {
                Boolean exist = false;
                for (BaseUser user : students) {
                    if (user.getId().equals(sc.getStudent().getId())) exist = true;
                }
                if (!exist) {
                    students.add(sc.getStudent());
                }
            }
        }
        return students.size();
    }

    public OrganizationCommentDao getOrganizationCommentDao() {
        return this.organizationCommentDao;
    }

    public void setOrganizationCommentDao(OrganizationCommentDao organizationCommentDao) {
        this.organizationCommentDao = organizationCommentDao;
    }

    public String parseSchoolDescription(Integer orgId) {
        Organization org = organizationDao.findById(orgId);
        String orgDescription = org.getDescription();
        if (orgDescription == null || orgDescription.equals(""))
            return "";
        String text = Jsoup.parse(orgDescription).text();
        return text;
    }
}
