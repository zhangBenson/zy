package com.gogowise.action.org;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.dao.CourseEvaluationDao;
import com.gogowise.rep.org.OrgService;
import com.gogowise.rep.org.dao.OrgMaterialDao;
import com.gogowise.rep.org.dao.OrganizationCommentDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseEvaluation;
import com.gogowise.rep.course.enity.SeniorClassRoom;
import com.gogowise.rep.org.enity.OrgMaterial;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.org.enity.OrganizationComment;
import com.gogowise.rep.org.enity.OrganizationTeacher;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.MD5;
import com.gogowise.common.utils.Utils;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.HashMap;


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
    private List<OrgMaterial> orgMaterials = new ArrayList<OrgMaterial>();
    private OrgMaterial orgMaterial;
    private OrgMaterialDao orgMaterialDao;
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


    @Action(value = "schoolCenter", results = {@Result(name=SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".schoolCenter")})
    public String schoolCenter() {
        List<Organization> allOrgs = organizationDao.findLatestOrgs(null);
        Map<Character, List<Organization>> mapOrgs = new HashMap<Character, List<Organization> >();
        for (Organization org : allOrgs) {
            if (org.getSchoolName() == null || org.getSchoolName().equals(""))
                continue;
            char c = Character.toUpperCase(org.getSchoolName().trim().charAt(0));
            if ( c >= 'A' && c <= 'Z' ) {
                if (mapOrgs.containsKey(c)) {
                    List<Organization> tmp = mapOrgs.get(c);
                    tmp.add(org);
                    mapOrgs.put(c, tmp);
                }
                else {
                    List<Organization> tmpList = new ArrayList<Organization>();
                    tmpList.add(org);
                    mapOrgs.put(c, tmpList);
                }
            }
            else {
                c = '#';  // others
                if (mapOrgs.containsKey(c)) {
                    List<Organization> tmpList = mapOrgs.get(c);
                    tmpList.add(org);
                    mapOrgs.put(c, tmpList);
                }
                else {
                    List<Organization> tmpList = new ArrayList<Organization>();
                    tmpList.add(org);
                    mapOrgs.put(c, tmpList);
                }
            }
        }

        if (this.getSchoolPageShowType() != null ) {
            String range = "";
            switch (this.getSchoolPageShowType()) {
                case 0: // A-D
                    range = "ABCD";
                    break;
                case 1: // E-H
                    range = "EFGH";
                    break;
                case 2: // I-L
                    range =  "IJKL";
                    break;
                case 3: // M-P
                    range = "MNOP";
                    break;
                case 4: // Q-T
                    range =  "QRST";
                    break;
                case 5: //U-Z
                    range = "UVWXYZ";
                    break;
                case 6: // Other
                    range = "#";
                    break;
                default: // show all
                    range = "";
                    break;
            }
            if ( !range.equals("")) {
                if (this.organizations == null)
                    this.organizations = new ArrayList<>();
                else
                    this.organizations.clear();
                for (char c: range.toCharArray()) {
                    if (mapOrgs.containsKey(c)) {
                        this.organizations.addAll(mapOrgs.get(c));
                    }
                }
            }
            else {
                this.organizations =  allOrgs;
            }
        }
        else { // first time in schoolcenter page
            if (this.organizations == null)
                this.organizations = new ArrayList<>();
            else
                this.organizations.clear();
            String range = "ABCDEFGHIJKLMNOPQRSTUVWXYZ#";
            for (char c: range.toCharArray()) {
                if (mapOrgs.containsKey(c)) {
                    this.organizations.addAll(mapOrgs.get(c));
                }
            }
        }

        return SUCCESS;
    }


    @Action(value = "orgBlog",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgBlog")}
    )
    public String orgBlog() {
        Integer orgId = org.getId() == null ? 1 : org.getId();
        this.org = organizationDao.findById(orgId);

        latestCourse = courseDao.findLatestCourseByOrg(orgId, new Pagination(3));
        if (latestCourse != null && latestCourse.size() > 0)
            course = latestCourse.get(0);
        hotCourses = courseDao.findHotCoursesByOrg(orgId, new Pagination(4));

        Pagination page  = new Pagination(10);
        comments = organizationCommentDao.findOrgCommentByOrgId(orgId, page);

        this.setCommentsNum(comments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        hotTeachers = organizationDao.findHotTeacherByOrgId(orgId, new Pagination(4));
        latestTeachers = organizationDao.findLatestTeacherByOrgId(orgId, new Pagination(6));
        allTeachersForOrg = orgService.findAllTeachersForOrg(orgId);
        return SUCCESS;
    }

    @Action(value = "saveOrgComment",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgComments")})
    public String saveOrgComment() {
        if (comment != null && comment.getDescription() != null) {
                comment.setCommenter(baseUserDao.findById(this.getSessionUserId()));
                comment.setOrganization(organizationDao.findById(org.getId()));
                comment.setCreateDate(Utils.getCurrentCalender());
                Integer toFriendID = (Integer) ActionContext.getContext().getSession().get("toReplyerUserID");
                if( toFriendID != null){
                    BaseUser toFriend = baseUserDao.findById(toFriendID);
                    comment.setToFriend(toFriend);
                    ActionContext.getContext().getSession().remove("toReplyerUserID");
                }
                organizationCommentDao.persistAbstract(comment);
                Pagination page = new Pagination(commentsNum+1);
                comments = organizationCommentDao.findOrgCommentByOrgId(org.getId(), page);
                this.setCommentsNum(comments.size());
                if(page.getTotalSize() <= commentsNum){
                    this.setCommentsNumOverflow(true);
                }
        }
        return SUCCESS;
    }

    @Action(value = "moreOrgComments",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".orgComments")})
    public String moreOrgComments(){
        Pagination page = new Pagination(this.getCommentsNum()+Constants.DEFAULT_PAGE_OF_COMMENTS_INCREASED_SIZE);
        comments = organizationCommentDao.findOrgCommentByOrgId(this.getOrg().getId(),page);
        this.setCommentsNum(comments.size());
        if(page.getTotalSize() <= commentsNum){
            this.setCommentsNumOverflow(true);
        }
        return SUCCESS;
    }

    @Action(value = "deleteOrgComment")
    public void deleteOrgComment(){
        comment = organizationCommentDao.findById(this.getComment().getId());
        organizationCommentDao.delete(comment);
    }



    @Action(value = "initOrgLeague", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".go2FirstStep")})
    public String initOrgLeague() {
        this.org = organizationDao.findMyOrg(this.getSessionUserId());
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


    @Action(value = "saveSecStep", results = {
            @Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "initThirdStep"}),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".go2SecondStep")})
    public String saveSecStep() {
        BaseUser saveUser = baseUserDao.findById(this.responser.getId());
        saveUser.setUserName(responser.getUserName());
        saveUser.setSexy(responser.getSexy());
        saveUser.setTelphone(responser.getTelphone());
        saveUser.setCardId(responser.getCardId());
        saveUser.setBirthDay(responser.getBirthDay());

        if (StringUtils.isNotBlank(idCardUrl)) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + this.getIdCardUrl());
            String toPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/idCard/" + this.getIdCardUrl());

            Utils.replaceFile(srcPath, toPath);
            saveUser.setIdCardUrl(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/idCard/" + this.getIdCardUrl());
        }
        baseUserDao.persistAbstract(saveUser);
        this.responser = saveUser;
        return SUCCESS;
    }
     @Action(value = "saveSecStepTest")
    public void saveSecStepTest() throws Exception{

        BaseUser saveUser = baseUserDao.findByEmail(this.getSessionUserEmail());
        saveUser.setUserName(responser.getUserName());
        saveUser.setSexy(responser.getSexy());
        saveUser.setTelphone(responser.getTelphone());
        saveUser.setCardId(responser.getCardId());
        saveUser.setBirthDay(responser.getBirthDay());

        if (StringUtils.isNotBlank(idCardUrl)) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + this.getIdCardUrl());
            String toPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/idCard/" + this.getIdCardUrl());

            Utils.replaceFile(srcPath, toPath);
            saveUser.setIdCardUrl(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/idCard/" + this.getIdCardUrl());
        }
        baseUserDao.persistAbstract(saveUser);
        this.responser = saveUser;
         PrintWriter out = ServletActionContext.getResponse().getWriter();
         out.print("success");
         out.close();
    }

//    .quickReg
//    @Action(value = "initThirdStep", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".go2ThirdStep"),
//            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".go2FirstStep")})
    @Action(value = "initThirdStep", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".quickReg"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".go2FirstStep")})
    public String initThirdStep() {
        this.org = organizationDao.findMyOrg(this.getSessionUserId());
        if (org != null) return INPUT;
        this.org = this.organizationDao.findOngoingOrg(super.getSessionUserId());
        if (this.org == null) org = new Organization();
        return SUCCESS;
    }

    @Action(value = "identityOgrNameCheck")
    public void identityOgrNameCheck(){
        Organization school = organizationDao.findOrganizationByOrganizationName(organizationName);
        try {
            PrintWriter out = ServletActionContext.getResponse().getWriter();
            if(school==null){
                out.print("not exist");
            }else{
                out.print("exist");
            }
            out.close();
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }

    public void validateSaveThirdStepInfo() {
        if (this.getOrg() != null || this.getOrg().getSchoolName() != null) {
            Organization o = organizationDao.findOrganizationByOrganizationName(this.getOrg().getSchoolName());
            if (o != null && !o.getId().equals(this.getOrg().getId())) addFieldError("org.schoolName", "您填的组织名称已存在");
        }
    }

    @Action(value = "saveThirdStep", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "initForthStep"}),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".quickReg")})
    public String saveThirdStepInfo() {
        Organization saveOrg;
        if (this.getOrg().getId() != null) {
            saveOrg = organizationDao.findById(this.getOrg().getId());
            saveOrg.setSchoolName(this.getOrg().getSchoolName());
//            saveOrg.setDescription(this.getOrg().getDescription());
//            saveOrg.setDepositName(this.getOrg().getDepositName());
//            saveOrg.setDepositBankAccount(this.getOrg().getDepositBankAccount());
//            saveOrg.setMemberSize(this.getOrg().getMemberSize());
//            saveOrg.setMultipleOrg(this.getOrg().getMultipleOrg());
//            saveOrg.setContactName(this.getOrg().getContactName());
//            saveOrg.setTelPhone(this.getOrg().getTelPhone());
//            saveOrg.setCellPhone(this.getOrg().getCellPhone());
//            saveOrg.setBusinessAddress(this.getOrg().getBusinessAddress());
//            saveOrg.setZipCode(this.getOrg().getZipCode());
        } else {
            saveOrg = this.getOrg();
        }
        BaseUser rer = baseUserDao.findById(this.getSessionUserId());
        rer.setTelphone(this.getOrg().getResponsiblePerson().getTelphone());
        rer.setUserName(this.getOrg().getResponsiblePerson().getUserName());
        baseUserDao.persist(rer);

        saveOrg.setResponsiblePerson(rer);

        if (StringUtils.isNotBlank(this.getHidFile1())) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + this.getHidFile1());
            String toPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/orgLogo/" + this.getHidFile1());
            Utils.replaceFile(srcPath, toPath);
            saveOrg.setLogoUrl(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + Constants.ORG_LOGO_PATH + this.getHidFile1());
        }

        if (StringUtils.isNotBlank(this.getHidFile2())) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + this.getHidFile2());
            String toPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/orgBuLic/" + this.getHidFile2());
            Utils.replaceFile(srcPath, toPath);
            saveOrg.setBusinessLicenseUrl(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/orgBuLic/" + this.getHidFile2());
        }
        organizationDao.persistAbstract(saveOrg);
        org = saveOrg;
        return SUCCESS;
    }

    @Action(value = "saveThirdStepTest")
    public void saveThirdStepInfoTest() throws IOException{
        Organization saveOrg;
//        if (this.getOrg().getId() != null) {
            saveOrg = organizationDao.findMyOrg(this.getSessionUserId());
            saveOrg.setSchoolName(this.getOrg().getSchoolName());
            saveOrg.setDescription(this.getOrg().getDescription());
            saveOrg.setDepositName(this.getOrg().getDepositName());
            saveOrg.setDepositBankName(this.getOrg().getDepositBankName());
            saveOrg.setDepositBankAccount(this.getOrg().getDepositBankAccount());
            saveOrg.setMemberSize(this.getOrg().getMemberSize());
            saveOrg.setMultipleOrg(this.getOrg().getMultipleOrg());
//        } else {
//            saveOrg = this.getOrg();
//        }
        BaseUser rer = baseUserDao.findById(this.getSessionUserId());
//        rer.setTelphone(this.getOrg().getResponsiblePerson().getTelphone());
//        rer.setUserName(this.getOrg().getResponsiblePerson().getUserName());
//        baseUserDao.persist(rer);

        saveOrg.setResponsiblePerson(rer);

        if (StringUtils.isNotBlank(this.getHidFile1())) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + this.getHidFile1());
            String toPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/orgLogo/" + this.getHidFile1());
            Utils.replaceFile(srcPath, toPath);
            saveOrg.setLogoUrl(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + Constants.ORG_LOGO_PATH + this.getHidFile1());
        }

        if (StringUtils.isNotBlank(this.getHidFile2())) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + this.getHidFile2());
            String toPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/orgBuLic/" + this.getHidFile2());
            Utils.replaceFile(srcPath, toPath);
            saveOrg.setBusinessLicenseUrl(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/orgBuLic/" + this.getHidFile2());
        }
        organizationDao.persistAbstract(saveOrg);
        org = saveOrg;
         PrintWriter out = ServletActionContext.getResponse().getWriter();
         out.print("success");
         out.close();
    }


        @Action(value = "saveOrgInfo")
    public void saveOrgInfo() throws IOException{
        Organization saveOrg;
//        if (this.getOrg().getId() != null) {
            saveOrg = organizationDao.findMyOrg(this.getSessionUserId());
            saveOrg.setContactName(this.getOrg().getContactName());
            saveOrg.setTelPhone(this.getOrg().getTelPhone());
            saveOrg.setCellPhone(this.getOrg().getCellPhone());
            saveOrg.setBusinessAddress(this.getOrg().getBusinessAddress());
            saveOrg.setZipCode(this.getOrg().getZipCode());
//        } else {
//            saveOrg = this.getOrg();
//        }
        organizationDao.persistAbstract(saveOrg);
        org = saveOrg;
         PrintWriter out = ServletActionContext.getResponse().getWriter();
         out.print("success");
         out.close();
    }

    @Action(value = "initForthStep", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".quickRegPreview")})
    public String initForthStep() {
        this.org = this.organizationDao.findOngoingOrg(super.getSessionUserId());
        return SUCCESS;
    }

    @Action(value = "saveForthStep", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"})})
    public String saveForthStep() {
        Organization orgz = organizationDao.findById(this.getOrg().getId());
        String url = getBasePath() + "/initConfirmOrg.html?org.id=" + this.getOrg().getId() + "&confirmCode=" + MD5.endCode(this.getOrg().getId() + "" + orgz.getCreateDate().getTimeInMillis());
        String content = "点击该链接，查看待审批的组织<a href=\"" + url + "\">" + url + "</a>";
        EmailUtil.sendMail(Constants.ORG_CONFIRM_EMAIL, "组织机构申请", content);

        EmailUtil.sendMail(orgz.getResponsiblePerson().getEmail(), "组织机构申请正在进行中", "您好，你申请的" + orgz.getSchoolName() + "正在审核的过程中，请您耐心等待。");
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

    @Action(value="orgInfoUpdate",results = {@Result(name=SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".orgInfoUpdate")})
    public String orgInfoUpdate(){
        responser = baseUserDao.findById(this.getSessionUserId());
        org = organizationDao.findByResId(this.getSessionUserId());
        orgMaterials = orgMaterialDao.findByOrgId(null,org.getId());
        return SUCCESS;
    }

    @Action(value = "organizationMatter",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location=".organizationMatter")})
    public String organizationMatter(){
        this.setOperaType(Constants.OPERA_TYPE_FOR_ORG_MATTER);
        this.org =   organizationDao.findConfirmedOrg(this.getSessionUserId()) ;
        if (org != null){
            return SUCCESS;
        }
        this.org =  organizationDao.findByAuthTeacher(this.getSessionUserId());
        if (org != null){
            this.setOrgRoleType(OrganizationTeacher.ORG_ROLE_TYPE_AUTH);
            return SUCCESS;
        }
        return "myfirstPage";
    }

    @Action(value = "orgSaveResPerson",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".orgInfoUpdate")})
    public String orgSaveResPerson(){
        BaseUser existResposer = baseUserDao.findById(this.getSessionUserId());
        if (StringUtils.isNotBlank(responser.getIdCardUrl())) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + responser.getIdCardUrl());
            String toPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/idCard/" + responser.getIdCardUrl());

            Utils.replaceFile(srcPath, toPath);
            existResposer.setIdCardUrl(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/idCard/" + responser.getIdCardUrl());
        }else {
            existResposer.setIdCardUrl(Constants.DEFAULT_PERSON_IMAGE);
        }
        organizationDao.updateResposerInfo(existResposer,responser);
        responser = existResposer;
        org = organizationDao.findByResId(this.getSessionUserId());
        orgMaterials = orgMaterialDao.findByOrgId(null,org.getId());
        return SUCCESS;
    }

    @Action(value = "orgSaveOrgInfo",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".orgInfoUpdate")})
    public String orgSaveOrgInfo(){
        Organization oldOrg = organizationDao.findByResId(this.getSessionUserId());
        if (StringUtils.isNotBlank(org.getLogoUrl())) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + org.getLogoUrl());
            String toPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/orgLogo/" + org.getLogoUrl());

            Utils.replaceFile(srcPath, toPath);
            oldOrg.setLogoUrl(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/orgLogo/" + org.getLogoUrl());
        }else {
            oldOrg.setLogoUrl(Constants.DEFAULT_ORGANIZATION_IMAGE);
        }

        if (StringUtils.isNotBlank(org.getBusinessLicenseUrl())) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_FILE_PATH_TMP + "/" + org.getBusinessLicenseUrl());
            String toPath = ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/orgBuLic/" + org.getBusinessLicenseUrl());

            Utils.replaceFile(srcPath, toPath);
            oldOrg.setBusinessLicenseUrl(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + "/orgBuLic/" + org.getBusinessLicenseUrl());
        }else {
            oldOrg.setLogoUrl(Constants.DEFAULT_OTHER_IMAGE);
        }
        organizationDao.updateOrgInfo(oldOrg,org);
        responser = baseUserDao.findById(this.getSessionUserId());
        org = oldOrg;
        orgMaterials = orgMaterialDao.findByOrgId(null,org.getId());
        return SUCCESS;
    }

    @Action(value = "orgSaveContactInfo",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".orgInfoUpdate")})
    public String orgSaveContactInfo(){
        Organization oldOrg = organizationDao.findByResId(this.getSessionUserId());
        organizationDao.updateOrgContactInfo(oldOrg ,org);
        responser = baseUserDao.findById(this.getSessionUserId());
        org = oldOrg;
        orgMaterials = orgMaterialDao.findByOrgId(null,org.getId());
        return SUCCESS;
    }

    @Action(value = "saveOrgAdvertiseFile",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".orgInfoUpdate"),
                                                         @Result(name = INPUT,type = Constants.RESULT_NAME_TILES,location = ".orgInfoUpdate")})
    public String saveOrgAdvertiseFile(){
        org = organizationDao.findByResId(this.getSessionUserId());
        responser = baseUserDao.findById(this.getSessionUserId());
        String path = "/" + org.getId() + "/" + this.getUploadFileName();
        File resourceFile = new File(ServletActionContext.getServletContext().getRealPath(Constants.DOWNLOAD_ORG_RESOURCE_PAHT) + path);
        if (!resourceFile.getParentFile().exists()) {
            resourceFile.getParentFile().mkdirs();
        }
        Utils.copy(this.getUpload(), resourceFile);

        orgMaterial.setSourceTitle(this.getUploadFileName());
        orgMaterial.setProvideTime(Calendar.getInstance());
        orgMaterial.setProvider(baseUserDao.findById(this.getSessionUserId()));
        orgMaterial.setFullPath(ServletActionContext.getServletContext().getRealPath(Constants.DOWNLOAD_ORG_RESOURCE_PAHT) + path);
        orgMaterial.setOrganization(org);
        //TODO: need zhangZong add the size to File
        orgMaterialDao.persistAbstract(orgMaterial);
        orgMaterials = orgMaterialDao.findByOrgId(null,org.getId());
        return SUCCESS;
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

    public OrgService getOrgService () {
        return this.orgService;
    }

    public  void setOrgService (OrgService orgService) {
        this.orgService = orgService;
    }

    public Integer getOrgCourseNum(){
        return courseDao.findByOrg(this.getOrg().getId(),null).size();
    }
    public Integer getStudentsNum(){
        return getStudents().size();
    }
    public Integer getStudentsNumByOrgId (Integer orgId) {
        if (orgId == null || orgId < 0)
            return 0;
        List<BaseUser> students = new ArrayList<BaseUser>();
        for(Course c : courseDao.findByOrg(orgId, null)){
            for(SeniorClassRoom sc : c.getSeniorClassRooms()){
                Boolean exist = false;
                for (BaseUser user : students){
                    if(user.getId().equals(sc.getStudent().getId())) exist = true;
                }
                if(!exist){
                    students.add(sc.getStudent());
                }
            }
        }
        return students.size();
    }

    public Integer getBestCoursesNum(){
        return this.getHotCourses().size();
    }
    public List<BaseUser> getStudents() {
        List<BaseUser> students = new ArrayList<BaseUser>();
        for(Course c : courseDao.findByOrg(this.getOrg().getId(), null)){
            for(SeniorClassRoom sc : c.getSeniorClassRooms()){
                 Boolean exist = false;
                 for (BaseUser user : students){
                     if(user.getId().equals(sc.getStudent().getId())) exist = true;
                 }
                 if(!exist){
                     students.add(sc.getStudent());
                 }
            }
        }
        return students;
    }

    public List<BaseUser> getAllTeachersForOrg () {
        return this.allTeachersForOrg;
    }

    public void setAllTeachersForOrg (List<BaseUser> allTeachersForOrg) {
        this.allTeachersForOrg = allTeachersForOrg;
    }

    public Integer getAllTeachersNum () {
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
    public String getOrgCreateDate () {
        SimpleDateFormat df=new SimpleDateFormat("yyyy/MM/dd");
        return df.format(this.org.getCreateDate().getTime());
    }
    public  Course getCourse() {
        return this.course;
    }
    public void setCourse (Course course) {
        this.course = course;
    }
    public List<Organization> getOrganizations () {
        return this.organizations;
    }
    public void setOrganizations (List<Organization> organizations) {
        this.organizations = organizations;
    }

    public Integer getSchoolPageShowType () {
        return this.schoolPageShowType;
    }

    public void setSchoolPageShowType (Integer schoolPageShowType) {
        this.schoolPageShowType = schoolPageShowType;
    }
}
