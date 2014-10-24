package com.gogowise.action.org;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.MD5;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseEvaluation;
import com.gogowise.rep.course.enity.SeniorClassRoom;
import com.gogowise.rep.org.OrgService;
import com.gogowise.rep.org.dao.OrgMaterialDao;
import com.gogowise.rep.org.dao.OrganizationBaseUserDao;
import com.gogowise.rep.org.dao.OrganizationCommentDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.OrgMaterial;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.org.enity.OrganizationComment;
import com.gogowise.rep.user.UserService;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.RoleType;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "index", type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "index"})
})
public class OrganizationAction extends BasicAction {


    private CourseDao courseDao;

    private OrganizationDao organizationDao;
    private OrganizationCommentDao organizationCommentDao;
    private BaseUserDao baseUserDao;
    private List<OrgMaterial> orgMaterials = new ArrayList<>();
    private OrgMaterial orgMaterial;
    private OrgMaterialDao orgMaterialDao;

    @Autowired
    private OrgService orgService;

    private BaseUser responser;
    private File upload;
    private String uploadFileName;
    private File upload11;
    private String upload1FileName;
    private Organization org;
    private List<Organization> organizations;

    private String organizationName;
    private List<Course> latestCourse;
    private List<Course> moocs;
    private List<Course> privateCourses;
    private Course course;
    private List<Course> hotCourses;
    private List<CourseEvaluation> courseEvaluations;
    private List<OrganizationComment> comments;
    private OrganizationComment comment;

    private List<BaseUser> hotTeachers;
    private List<BaseUser> latestTeachers;
    private List<BaseUser> allTeachersForOrg;
    private String idCardUrl;
    private String hidFile1;
    private String hidFile2;
    private String confirmCode;
    private String actionName;
    private Integer operaType;
    private Integer orgRoleType;

    private Integer commentsNum;
    private Boolean commentsNumOverflow = false;

    private Integer schoolPageShowType; // 0: A-D, 1: E-H, 2: I-L, 3: M-P, 4:Q-T, 5: U-Z, 6: Other 7: Show all

    private BaseUserRoleTypeDao baseUserRoleTypeDao;
    private Pagination pagination = new Pagination();

    private OrganizationBaseUserDao organizationBaseUserDao;
    @Autowired
    private UserService userService;

    @Action(value = "schoolCenter", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".schoolCenter")})
    public String schoolCenter() {
        this.organizations = organizationDao.findLatestOrgs(pagination);
        return SUCCESS;
    }


    @Action(value = "orgBlog",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgBlog")}
    )
    public String orgBlog() {
        Integer orgId;
        if (StringUtils.isNotBlank(org.getSecDomain())) {
            this.org = this.organizationDao.findBySecDomain(org.getSecDomain());
        } else {
            orgId = org.getId() == null ? 1 : org.getId();
            this.org = organizationDao.findById(orgId);
        }
        orgId = org.getId();

        Integer userID = this.getSessionUserId();
        boolean idMember = userID != null && orgService.isMember(userID, orgId);

        if (idMember) {
            privateCourses = courseDao.findCoursesByOrgWithAccess(orgId, false, pagination);
        } else {
            privateCourses = new ArrayList<>();
        }

        latestCourse = courseDao.findLatestCourseByOrg(orgId, new Pagination(4));
        if (latestCourse != null && latestCourse.size() > 0)
            course = latestCourse.get(0);
        hotCourses = courseDao.findHotCoursesByOrg(orgId, new Pagination(6));
        moocs = courseDao.findMoocsByOrg(orgId, new Pagination(6));
        Pagination page = new Pagination(10);
        comments = organizationCommentDao.findOrgCommentByOrgId(orgId, page);

        this.setCommentsNum(comments.size());
        if (page.getTotalSize() <= commentsNum) {
            this.setCommentsNumOverflow(true);
        }
        /**
         hotTeachers = organizationDao.findHotTeacherByOrgId(orgId, new Pagination(4));
         latestTeachers = organizationDao.findLatestTeacherByOrgId(orgId, new Pagination(6));
         allTeachersForOrg = orgService.findAllTeachersForOrg(orgId);
         allTeachersForOrg = organizationBaseUserDao.findUsersByOrgIdAndRoleType(orgId, Constants.ROLE_TYPE_TEACHER,null);
         **/
        hotTeachers = organizationBaseUserDao.findUsersByOrgIdAndRoleType(orgId, RoleType.ROLE_TYPE_TEACHER, pagination);
        latestTeachers = organizationBaseUserDao.findLatestUsersByOrgIdAndRoleType(orgId, RoleType.ROLE_TYPE_TEACHER, pagination);
        allTeachersForOrg = hotTeachers;

        return SUCCESS;
    }

    @Action(value = "saveOrgComment", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgComments")})
    public String saveOrgComment() {
        if (comment != null && comment.getDescription() != null) {
            comment.setCommenter(baseUserDao.findById(this.getSessionUserId()));
            comment.setOrganization(organizationDao.findById(org.getId()));
            comment.setCreateDate(Utils.getCurrentCalender());
            Integer toFriendID = (Integer) ActionContext.getContext().getSession().get("toReplyerUserID");
            if (toFriendID != null) {
                BaseUser toFriend = baseUserDao.findById(toFriendID);
                comment.setToFriend(toFriend);
                ActionContext.getContext().getSession().remove("toReplyerUserID");
            }
            organizationCommentDao.persistAbstract(comment);
            Pagination page = new Pagination(commentsNum + 1);
            comments = organizationCommentDao.findOrgCommentByOrgId(org.getId(), page);
            this.setCommentsNum(comments.size());
            if (page.getTotalSize() <= commentsNum) {
                this.setCommentsNumOverflow(true);
            }
        }
        return SUCCESS;
    }

    @Action(value = "moreOrgComments", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgComments")})
    public String moreOrgComments() {
        Pagination page = new Pagination(this.getCommentsNum() + Constants.DEFAULT_PAGE_OF_COMMENTS_INCREASED_SIZE);
        comments = organizationCommentDao.findOrgCommentByOrgId(this.getOrg().getId(), page);
        this.setCommentsNum(comments.size());
        if (page.getTotalSize() <= commentsNum) {
            this.setCommentsNumOverflow(true);
        }
        return SUCCESS;
    }

    @Action(value = "deleteOrgComment")
    public void deleteOrgComment() {
        comment = organizationCommentDao.findById(this.getComment().getId());
        organizationCommentDao.delete(comment);
    }


    @Action(value = "initOrgLeague", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".go2FirstStep")})
    public String initOrgLeague() {
        this.org = orgService.findMyOrg(this.getSessionUserId());
        return SUCCESS;
    }

    @Action(value = "initOrgSecSteps", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".go2SecondStep")})
    public String initOrgSecSteps() {
        this.responser = baseUserDao.findById(super.getSessionUserId());
        return SUCCESS;
    }

    @Action(value = "quickReg", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".quickReg")})
    public String quickReg() {
        return SUCCESS;
    }

    @Action(value = "quickRegPreview", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".quickRegPreview")})
    public String quickRegPreview() {
        return SUCCESS;
    }


    @Action(value = "initConfirmOrg", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".quickRegPreview")})
    public String initConfirmOrg() {
        this.org = this.organizationDao.findById(this.getOrg().getId());
        if (StringUtils.isNotBlank(this.getConfirmCode()) && this.getConfirmCode().equals(MD5.endCode(this.getOrg().getId() + "" + org.getCreateDate().getTimeInMillis()))) {
            return SUCCESS;
        }
        return "index";
    }

    @Action(value = "orgInfoUpdate", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgInfoUpdate")})
    public String orgInfoUpdate() {
        responser = baseUserDao.findById(this.getSessionUserId());
        org = organizationDao.findByResId(this.getSessionUserId());
        orgMaterials = orgMaterialDao.findByOrgId(null, org.getId());
        return SUCCESS;
    }




    @Action(value = "orgAdminManage",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgAdminManage"),
                    @Result(name = ERROR, type = Constants.RESULT_NAME_TILES, location = ".noPermission")})
    public String orgAdminManage() {
        Integer userID = (Integer) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID);
        boolean havePermission = userService.havePermission(userID, "admin");

        if (!havePermission) return ERROR;

        organizations = this.organizationDao.findLatestOrgs(null);
        return SUCCESS;
    }

    @Action(value = "removeOrgConfirm",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "orgAdminManage"})})
    public String removeOrgConfirm() {
        if (this.getOrg().getId() != null) {
            Organization org = organizationDao.findById(this.getOrg().getId());

            if (org != null) {
                org.setIsDeleted(true);
                organizationDao.persistAbstract(org);
            }
        }

        return SUCCESS;
    }

    @Action(value = "orgMoreCourse",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgMoreCourse"),
                    @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".notExist")
            }
    )
    public String orgMoreCourse() {
        this.org = organizationDao.findById(this.getOrg().getId());
        pagination.setPageSize(8);
        this.latestCourse = this.courseDao.findLatestCourseByOrg(this.getOrg().getId(), pagination);
        return SUCCESS;
    }

    @Action(value = "orgMoreMooc",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgMoreMooc"),
                    @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".notExist")
            }
    )
    public String orgMoreMooc() {
        this.org = organizationDao.findById(this.getOrg().getId());
        pagination.setPageSize(8);
        this.moocs = courseDao.findMoocsByOrg(this.getOrg().getId(), pagination);
        return SUCCESS;
    }

    @Action(value = "orgMoreTeacher",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgMoreTeacher"),
                    @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".notExist")
            }
    )

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


    public OrganizationCommentDao getOrganizationCommentDao() {
        return organizationCommentDao;
    }

    public void setOrganizationCommentDao(OrganizationCommentDao organizationCommentDao) {
        this.organizationCommentDao = organizationCommentDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public BaseUser getResponser() {
        return responser;
    }

    public void setResponser(BaseUser responser) {
        this.responser = responser;
    }

    public Organization getOrg() {
        return org;
    }

    public void setOrg(Organization org) {
        this.org = org;
    }

    public List<Course> getLatestCourse() {
        return latestCourse;
    }

    public void setLatestCourse(List<Course> latestCourse) {
        this.latestCourse = latestCourse;
    }

    public List<Course> getHotCourses() {
        return hotCourses;
    }

    public void setHotCourses(List<Course> hotCourses) {
        this.hotCourses = hotCourses;
    }

    public List<CourseEvaluation> getCourseEvaluations() {
        return courseEvaluations;
    }

    public void setCourseEvaluations(List<CourseEvaluation> courseEvaluations) {
        this.courseEvaluations = courseEvaluations;
    }

    public List<OrganizationComment> getComments() {
        return comments;
    }

    public void setComments(List<OrganizationComment> comments) {
        this.comments = comments;
    }

    public OrganizationComment getComment() {
        return comment;
    }

    public void setComment(OrganizationComment comment) {
        this.comment = comment;
    }

    public List<BaseUser> getHotTeachers() {
        return hotTeachers;
    }

    public void setHotTeachers(List<BaseUser> hotTeachers) {
        this.hotTeachers = hotTeachers;
    }

    public List<BaseUser> getLatestTeachers() {
        return latestTeachers;
    }

    public void setLatestTeachers(List<BaseUser> latestTeachers) {
        this.latestTeachers = latestTeachers;
    }

    public String getIdCardUrl() {
        return idCardUrl;
    }

    public void setIdCardUrl(String idCardUrl) {
        this.idCardUrl = idCardUrl;
    }

    public String getHidFile1() {
        return hidFile1;
    }

    public void setHidFile1(String hidFile1) {
        this.hidFile1 = hidFile1;
    }

    public String getHidFile2() {
        return hidFile2;
    }

    public void setHidFile2(String hidFile2) {
        this.hidFile2 = hidFile2;
    }

    public String getConfirmCode() {
        return confirmCode;
    }

    public void setConfirmCode(String confirmCode) {
        this.confirmCode = confirmCode;
    }

    public String getActionName() {
        return actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public Integer getOperaType() {
        return operaType;
    }

    public void setOperaType(Integer operaType) {
        this.operaType = operaType;
    }

    public Integer getOrgRoleType() {
        return orgRoleType;
    }

    public void setOrgRoleType(Integer orgRoleType) {
        this.orgRoleType = orgRoleType;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public File getUpload11() {
        return upload11;
    }

    public void setUpload11(File upload11) {
        this.upload11 = upload11;
    }

    public String getUpload1FileName() {
        return upload1FileName;
    }

    public void setUpload1FileName(String upload1FileName) {
        this.upload1FileName = upload1FileName;
    }

    public List<OrgMaterial> getOrgMaterials() {
        return orgMaterials;
    }

    public void setOrgMaterials(List<OrgMaterial> orgMaterials) {
        this.orgMaterials = orgMaterials;
    }

    public OrgMaterial getOrgMaterial() {
        return orgMaterial;
    }

    public void setOrgMaterial(OrgMaterial orgMaterial) {
        this.orgMaterial = orgMaterial;
    }

    public OrgMaterialDao getOrgMaterialDao() {
        return orgMaterialDao;
    }

    public void setOrgMaterialDao(OrgMaterialDao orgMaterialDao) {
        this.orgMaterialDao = orgMaterialDao;
    }

    public Integer getOrgCourseNum() {
        return courseDao.findByOrg(this.getOrg().getId(), null).size();
    }

    public Integer getStudentsNum() {
        return getStudents().size();
    }

    public Integer getStudentsNumByOrgId(Integer orgId) {
        if (orgId == null || orgId < 0)
            return 0;
        List<BaseUser> students = new ArrayList<>();
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

    public Integer getBestCoursesNum() {
        return this.getHotCourses().size();
    }

    public List<BaseUser> getStudents() {
        List<BaseUser> students = new ArrayList<>();
        for (Course c : courseDao.findByOrg(this.getOrg().getId(), null)) {
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
        return students;
    }

    public List<BaseUser> getAllTeachersForOrg() {
        return this.allTeachersForOrg;
    }

    public void setAllTeachersForOrg(List<BaseUser> allTeachersForOrg) {
        this.allTeachersForOrg = allTeachersForOrg;
    }

    public Integer getAllTeachersNum() {
        if (allTeachersForOrg == null)
            return 0;
        return allTeachersForOrg.size();
    }


    public Integer getCommentsNum() {
        return commentsNum;
    }

    public void setCommentsNum(Integer commentsNum) {
        this.commentsNum = commentsNum;
    }

    public Boolean getCommentsNumOverflow() {
        return commentsNumOverflow;
    }

    public void setCommentsNumOverflow(Boolean commentsNumOverflow) {
        this.commentsNumOverflow = commentsNumOverflow;
    }

    public String getOrgCreateDate() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        return df.format(this.org.getCreateDate().getTime());
    }

    public Course getCourse() {
        return this.course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public List<Organization> getOrganizations() {
        return this.organizations;
    }

    public void setOrganizations(List<Organization> organizations) {
        this.organizations = organizations;
    }

    public Integer getSchoolPageShowType() {
        return this.schoolPageShowType;
    }

    public void setSchoolPageShowType(Integer schoolPageShowType) {
        this.schoolPageShowType = schoolPageShowType;
    }

    public String parseSchoolDescription(Integer orgId) {
        Organization org = organizationDao.findById(orgId);
        String orgDescription = org.getDescription();
        if (orgDescription == null || orgDescription.equals(""))
            return "";
        return Jsoup.parse(orgDescription).text();
    }

    public BaseUserRoleTypeDao getBaseUserRoleTypeDao() {
        return baseUserRoleTypeDao;
    }

    public void setBaseUserRoleTypeDao(BaseUserRoleTypeDao baseUserRoleTypeDao) {
        this.baseUserRoleTypeDao = baseUserRoleTypeDao;
    }

    public List<Course> getMoocs() {
        return moocs;
    }

    public void setMoocs(List<Course> moocs) {
        this.moocs = moocs;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public OrganizationBaseUserDao getOrganizationBaseUserDao() {
        return organizationBaseUserDao;
    }

    public void setOrganizationBaseUserDao(OrganizationBaseUserDao organizationBaseUserDao) {
        this.organizationBaseUserDao = organizationBaseUserDao;
    }

    public List<Course> getPrivateCourses() {
        return privateCourses;
    }

    public void setPrivateCourses(List<Course> privateCourses) {
        this.privateCourses = privateCourses;
    }
}
