package com.gogowise.action;

import com.gogowise.common.utils.Constants;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import com.gogowise.rep.user.enity.BaseUser;
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

@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({@Result(name = "success", type = "tiles", location = ".index")})
public class IndexAction extends BasicAction {

    private BaseUserDao baseUserDao;
    private OrganizationDao organizationDao;
    private CourseDao courseDao;
    private BaseUser baseUser;
    private List<Course> courses;
    private List<Course> moocCourses;
    private Pagination pagination = new Pagination(3);

    private List<Organization> organizations = new ArrayList<>();

    private BaseUserRoleTypeDao baseUserRoleTypeDao;

    String logInfo = "";
    private String language;
    /**
     *
     */
    private static final long serialVersionUID = -2512666132359957051L;

    @Action(value = "deployBeta", results = {@Result(name = SUCCESS, type = "tiles", location = ".listAllContent")})
    public String deployBeta() throws Exception {

        String filePath = "deploy.bat";
        String realPath = ServletActionContext.getServletContext().getRealPath(filePath);
        String cmd = "cmd /c start " + realPath;
        Runtime.getRuntime().exec(cmd);
        return SUCCESS;
    }

    @Action(value = "viewLog", results = {@Result(name = SUCCESS, type = "tiles", location = ".listAllContent")})
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
            String line;
            StringBuilder sb = new StringBuilder((int) f.length());
            while ((line = br.readLine()) != null) {
                sb.append(lineBreak).append(line).append(lineBreak1);
            }
            ret = sb.toString();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (Exception e) {
                    e.printStackTrace();
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

    @Action(value = "index", results = {@Result(name = SUCCESS, type = "tiles", location = ".index")})
    public String index() {

        //        if("en_US".equals(language)){
        setToEn();
        //        }
        pagination.setPageSize(10);
        //courses = courseDao.findNonMoocCourses(pagination);
        courses = courseDao.findlatestCourses(pagination);
        //moocCourses = courseDao.findMoocCourses(pagination);
        organizations = organizationDao.findLatestOrgs(new Pagination(8));
        return SUCCESS;
    }

    @Action(value = "getMoreCourse", results = {@Result(name = SUCCESS, type = "tiles", location = ".indexMoreCourse")})
    public String getMoreCourse() {

        pagination.setPageSize(10);
        courses = courseDao.findlatestCourses(pagination);
        moocCourses = courseDao.findMoocCourses(pagination);
        organizations = organizationDao.findLatestOrgs(new Pagination(8));
        return SUCCESS;
    }


    @Action(value = "FAQ", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".FAQ")})
    public String FAQ() {

        return SUCCESS;
    }


    public Integer getCoursesNum() {

        return this.getCourses().size();
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

    public List<Course> getMoocCourses() {

        return moocCourses;
    }

    public void setMoocCourses(List<Course> moocCourses) {

        this.moocCourses = moocCourses;
    }

    public Pagination getPagination() {

        return pagination;
    }

    public void setPagination(Pagination pagination) {

        this.pagination = pagination;
    }

    public List<Organization> getOrganizations() {

        return organizations;
    }

    public void setOrganizations(List<Organization> organizations) {

        this.organizations = organizations;
    }

    public BaseUserRoleTypeDao getBaseUserRoleTypeDao() {

        return baseUserRoleTypeDao;
    }

    public void setBaseUserRoleTypeDao(BaseUserRoleTypeDao baseUserRoleTypeDao) {

        this.baseUserRoleTypeDao = baseUserRoleTypeDao;
    }


}
