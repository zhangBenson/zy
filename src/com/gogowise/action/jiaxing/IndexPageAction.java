package com.gogowise.action.jiaxing;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.org.dao.OrganizationBaseUserDao;
import com.gogowise.rep.org.enity.OrganizationBaseUser;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.RoleType;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class IndexPageAction extends BasicAction {


    private List<Course> courses = new ArrayList<>();
    private List<Course> records = new ArrayList<>();
    private List<BaseUser> teachers = new ArrayList<>();
    private Pagination pagination = new Pagination(8);
    private BaseUser teacher = new BaseUser();
    private OrganizationBaseUser orgTeacher = new OrganizationBaseUser();


    @Autowired
    private CourseDao courseDao;
    @Autowired
    private BaseUserDao baseUserDao;
    @Autowired
    private OrganizationBaseUserDao organizationBaseUserDao;

    private Integer courseType     = -1;
    private Integer studentAgeType = -1;

    private String searchStr;

    @Action(value = "index", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.index")})
    public String index() {

        setLocale();
        courses = courseDao.findForecastCourse(new Pagination(4));
        records = courseDao.findRecordCourse(new Pagination(7));
        teachers = organizationBaseUserDao.findLatestUsersByRoleType(RoleType.ROLE_TYPE_TEACHER, new Pagination(4));

        return SUCCESS;
    }

    @Action(value = "searchCourse", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = "jiaxing.db")})
    public String searchAnswer() throws Exception {
        pagination.setPageSize(8);
        courses = courseDao.searchCourses(searchStr, pagination);
        return SUCCESS;
    }

    @Action(value = "zbClass", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.zb")})
    public String zbClass() {
        pagination.setPageSize(8);
        courses = courseDao.findForecastCourse(pagination);

        if( -1 != courseType ){
            courses = courseDao.findForecastCourseByCourseType(courseType,pagination);
        }
        if( -1 != studentAgeType){
            courses = courseDao.findForecastCourseByStudentAgeType(studentAgeType,pagination);
        }

        return SUCCESS;
    }

    @Action(value = "dbClass", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.db")})
    public String dbClass() {
        pagination.setPageSize(8);
        courses = courseDao.findRecordCourse(pagination);

        if( -1 != courseType ){
            courses = courseDao.findRecordCourseByCourseType(pagination,courseType);
        }
        if( -1 != studentAgeType){
            courses = courseDao.findRecordCourseByStudentAgeType(pagination,studentAgeType);
        }

        return SUCCESS;
    }

    @Action(value = "msList", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.msList")})
    public String msList() {


        records = courseDao.findRecordCourse(new Pagination(6));

        if ((-1 == studentAgeType && -1 == courseType) || (1 == studentAgeType || 2 == studentAgeType || 3 == studentAgeType || 2 == courseType)) {
            pagination.setPageSize(4);
            teachers = organizationBaseUserDao.findLatestUsersByRoleType(RoleType.ROLE_TYPE_TEACHER, pagination);
        }

        return SUCCESS;
    }

    @Action(value = "msVideo", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.msVideo")})
    public String msVideo() {
        teacher = baseUserDao.findById(teacher.getId());
        pagination.setPageSize(8);
        records = courseDao.findRecordCourseByTeacher(pagination, teacher.getId());
        return SUCCESS;
    }

    @Action(value = "msInfo", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.msInfo")})
    public String msInfo() {
        teacher = baseUserDao.findById(teacher.getId());
        OrganizationBaseUser organizationBaseUser = organizationBaseUserDao.findMyOrgByUserIdAndRole(teacher.getId(), RoleType.ROLE_TYPE_TEACHER);
        if (organizationBaseUser != null) {
            orgTeacher = organizationBaseUser;
        }
        records = courseDao.findRecordCourseByTeacher(new Pagination(8), teacher.getId());
        return SUCCESS;
    }

    @Action(value = "newsInfo", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.newsInfo")})
    public String newsInfo() {
        records = courseDao.findRecordCourse(new Pagination(4));
        return SUCCESS;
    }

    @Action(value = "news", results = {@Result(name = SUCCESS, type = "tiles", location = "jiaxing.news")})
    public String news() {
        records = courseDao.findRecordCourse(new Pagination(4));
        return SUCCESS;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public List<Course> getRecords() {
        return records;
    }

    public List<BaseUser> getTeachers() {
        return teachers;
    }

    @Override
    public Pagination getPagination() {
        return pagination;
    }

    @Override
    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public BaseUser getTeacher() {
        return teacher;
    }

    public void setTeacher(BaseUser teacher) {
        this.teacher = teacher;
    }

    public OrganizationBaseUserDao getOrganizationBaseUserDao() {
        return organizationBaseUserDao;
    }

    public void setOrganizationBaseUserDao(OrganizationBaseUserDao organizationBaseUserDao) {
        this.organizationBaseUserDao = organizationBaseUserDao;
    }

    public OrganizationBaseUser getOrgTeacher() {
        return orgTeacher;
    }

    public void setOrgTeacher(OrganizationBaseUser orgTeacher) {
        this.orgTeacher = orgTeacher;
    }

    public Integer getCourseType() {
        return courseType;
    }

    public void setCourseType(Integer courseType) {
        this.courseType = courseType;
    }

    public Integer getStudentAgeType() {
        return studentAgeType;
    }

    public void setStudentAgeType(Integer studentAgeType) {
        this.studentAgeType = studentAgeType;
    }

    public String getSearchStr() {
        return searchStr;
    }

    public void setSearchStr(String searchStr) {
        this.searchStr = searchStr;
    }
}
