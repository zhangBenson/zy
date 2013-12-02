package com.gogowise.action.higsec;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.user.BaseUserRoleTypeDao;
import com.gogowise.rep.org.OrganizationDao;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.MD5;
import com.gogowise.common.utils.Utils;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "index", type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "index"})
})
public class OrgForBackendAction extends BasicAction {


    private OrganizationDao organizationDao;
    private BaseUserDao baseUserDao;
    private BaseUserRoleTypeDao baseUserRoleTypeDao;



    private Organization org;
    private List<Organization> organizations;
    private String message;
    private Boolean language = false;

    private String logoUrl;
    private String contractUrl;
    private String confirmCode;

    private Boolean canReview = false;
    private Boolean canEdit = false;

    public void validateHigSecConfirmOrgByAdmin() {
        BaseUser admin = baseUserDao.findByEmail((String) ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL))  ;
        if (admin ==  null )   {
            addFieldError("org.responsiblePerson.email", "请先登录");
            return;
        }
        if (!baseUserRoleTypeDao.havePermission(admin.getId(),"orgReviewer")){
            addFieldError("org.responsiblePerson.email", "没权限");
        }

        Organization orgTemp = organizationDao.findOrganizationByOrganizationName(this.getOrg().getSchoolName()) ;
        if (orgTemp != null && !orgTemp.getId().equals(this.getOrg().getId()) ){
            addFieldError("org.schoolName", "组织名称已被注册");
        }
    }

    @Action(value = "higSecConfirmOrg", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".go2ForthStep")})
    public String higSecConfirmOrg() {
        if (this.getOrg().getId() != null) {
            org = organizationDao.findById(this.getOrg().getId());
            org.setConfirmed(true);
            organizationDao.persistAbstract(org);
            EmailUtil.sendMail(org.getResponsiblePerson().getEmail(), "组织机构已经通过审核", "您好，你申请的" + org.getSchoolName() + "已经通过审核。");
        }
        return SUCCESS;
    }

    @Action(value = "higSecRemoveConfirm", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "higSecOrgListView"}),
            @Result(name = INPUT, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "higSecOrgListView"})  })
    public String higSecRemoveConfirm() {
        if (this.getOrg().getId() != null) {
            org = organizationDao.findById(this.getOrg().getId());
            org.setConfirmed(false);
            org.setReviewer(baseUserDao.findByEmail((String) ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL))  );
            organizationDao.persistAbstract(org);
//            if(this.org.getResponsiblePerson().getPassword() == null ) {
//                sendOrgConfirmEamil(org);
//            } else {
//                sendOrgConfirmEmailForUserExist(org);
//            }
        }
        return SUCCESS;
    }

    @Action(value = "higSecConfirmOrgByAdmin", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "higSecOrgListView"}),
            @Result(name = INPUT, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "higSecOrgListView"})  })
    public String higSecConfirmOrgByAdmin() {
        if (this.getOrg().getId() != null) {
            org = organizationDao.findById(this.getOrg().getId());
            org.setConfirmed(true);
            org.setReviewer(baseUserDao.findByEmail((String) ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL))  );
            organizationDao.persistAbstract(org);
            if(this.org.getResponsiblePerson().getPassword() == null ) {
                sendOrgConfirmEamil(org);
            } else {
                sendOrgConfirmEmailForUserExist(org);
            }
        }
        return SUCCESS;
    }

    private void sendOrgConfirmEmailForUserExist(Organization org) {
        String href = getBasePath() + "/organizationMatter.html?user.email="+org.getResponsiblePerson().getEmail();
        EmailUtil.sendMail(org.getResponsiblePerson().getEmail(), this.getText("org.email.confirm.admin.title"),  this.getText("org.email.confirm.admin.body", new String[]{
                org.getResponsiblePerson().getEmail(),
                org.getSchoolName(),
                href

        }));



    }

    public void validateHigSecOrgCreate() {
        BaseUser admin = baseUserDao.findByEmail((String) ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL));
        if (admin == null) {
            addFieldError("org.responsiblePerson.email", "请先登录");
            return;
        }
        if (!baseUserRoleTypeDao.havePermission(admin.getId(), "orgCreator"))
            addFieldError("org.responsiblePerson.email", "没权限");

        Organization orgTemp = organizationDao.findOrganizationByOrganizationName(this.getOrg().getSchoolName());
        if (orgTemp != null && !orgTemp.getId().equals(this.getOrg().getId())) {
            addFieldError("org.schoolName", "组织名称已被注册");
        }

        BaseUser currUser = baseUserDao.findByEmail(this.getOrg().getResponsiblePerson().getEmail());
        if (currUser != null) {
            Organization userOrg = organizationDao.findMyOrg(currUser.getId());
            if (userOrg != null && !userOrg.getId().equals(this.getOrg().getId())) {
                addFieldError("org.responsiblePerson.email", "该用户以有组织，不能再加入组织");
            } else {
                Organization ongoingOrg = organizationDao.findOngoingOrg(currUser.getId());
                if (ongoingOrg != null && !ongoingOrg.getId().equals(this.getOrg().getId())) {
                    addFieldError("org.responsiblePerson.email", "该用户以正在申请组织，请重复申请");
                }
            }
        }


    }
    @Action(value = "higSecOrgCreationView", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".higSecOrgCreateView")})
    public String higSecOrgCreationView() {
        if (org != null && org.getId() != null) {
            this.org = organizationDao.findById(org.getId());
        } else {
            this.org =  organizationDao.findByResId(this.getSessionUserId());
        }
        return SUCCESS;
    }


    @Action(value = "higSecOrgCreate", results = {
            @Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "higSecOrgCreationView", "org.id","${org.id}"}),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".higSecOrgCreate")})
    public String higSecOrgCreate() {

        BaseUser baseUser = baseUserDao.findByEmail(this.getOrg().getResponsiblePerson().getEmail());
        if (baseUser == null) {
            baseUser = new BaseUser();
            baseUser.setEmail(this.getOrg().getResponsiblePerson().getEmail() );
            if (this.org.getResponsiblePerson().getNickName() != null) {
                baseUser.setNickName(this.org.getResponsiblePerson().getNickName());
            } else {
                baseUser.setNickName(this.org.getSchoolName());
            }
        }
        String activeCode = MD5.endCode(String.valueOf(System.currentTimeMillis()));
        baseUser.setActiveCode(activeCode);
        baseUserDao.persistAbstract(baseUser);



        Organization orgTmp = null;
        if (this.getOrg()!= null && this.getOrg().getId() != null)
            orgTmp = organizationDao.findById(this.getOrg().getId());

        Organization orgSaved;
        if (orgTmp !=  null){
            orgSaved = orgTmp;
            orgSaved.setCellPhone(this.org.getCellPhone());
            orgSaved.setSchoolName(this.org.getSchoolName());
            orgSaved.setContractSignDate(this.org.getContractSignDate());
            orgSaved.setDescription(this.org.getDescription());
        } else {
            orgSaved = this.org;
        }

        if (StringUtils.isNotBlank(this.getLogoUrl())) {
            Utils.replaceFileFromTmp(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + Constants.ORG_LOGO_PATH, this.getLogoUrl());
            orgSaved.setLogoUrl(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + Constants.ORG_LOGO_PATH + this.getLogoUrl());
        }else {
            orgSaved.setLogoUrl(Constants.DEFAULT_ORGANIZATION_IMAGE);
        }

        if (StringUtils.isNotBlank(this.getLogoUrl())) {
            Utils.replaceFileFromTmp(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + Constants.ORG_ADV_PATH, this.getLogoUrl());
            orgSaved.setAdvUrl(Constants.UPLOAD_USER_PATH + "/" + getSessionUserId() + Constants.ORG_ADV_PATH + this.getLogoUrl());
        }

        orgSaved.setResponsiblePerson(baseUser);
        orgSaved.setCreator( baseUserDao.findByEmail((String) ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL))  );
//        orgSaved.setConfirmed(true);

        organizationDao.persist(orgSaved);


        return SUCCESS;
    }

    private void sendOrgConfirmEamil(Organization orgSaved) {
        this.setMessage(this.getText("orgleague.save.successful"));
        String css = "<style type=\"text/css\">\n" +
                "#rvmDiv #logoDiv { background-image: url(http://www.gogowise.com/images/logo.jpg); background-repeat: no-repeat; height: 65px; margin-left: 45px; }\n" +
                "#rvmDiv #rvmcontentDiv ul .welcomeTittle { margin-left: 30px; }\n" +
                "#rvmDiv { float: left; width: 100%; font-family: \"微软雅黑\", \"宋体\", \"Lucida Sans Unicode\", \"Lucida Grande\", sans-serif; }\n" +
                "#logoDiv { float: left; width: 100%; }\n" +
                "#rvmcontentDiv { float: left; width: 100%; }\n" +
                "#rvmDiv #rvmcontentDiv ul li { list-style-type: none; }\n" +
                "#rvmDiv #rvmcontentDiv .orangeWords { color: rgb(255,155,55); }\n" +
                "#rvmDiv #rvmcontentDiv ul .lastWords { margin-top: 20px; }\n" +
                "</style>";
        String href = getBasePath() + "/initOrgBackEndUserConfirm.html?org.id="+orgSaved.getId()+"&user.email="+orgSaved.getResponsiblePerson().getEmail()+"&user.activeCode="+ orgSaved.getResponsiblePerson().getActiveCode();
        EmailUtil.sendMail( orgSaved.getResponsiblePerson().getEmail(), this.getText("org.back.end.high.sec.to.res.email.title"), css + this.getText("org.back.end.high.sec.to.res.email.content", new String[]{
                orgSaved.getResponsiblePerson().getEmail(),
                orgSaved.getSchoolName(),
                href,
                href,
                orgSaved.getResponsiblePerson().getEmail()

        }), "text/html;charset=utf-8");
    }

    @Action(value = "higSecOrgCreateInit", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".higSecOrgCreate")})
    public String higSecOrgCreateInit() {
        if (org != null && org.getId() != null) {
            this.org = organizationDao.findById(org.getId());
        } else {
            this.org =  organizationDao.findById(this.getSessionUserId());
        }
        return SUCCESS;
    }


    @Action(value = "higSecOrgListView", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".higSecOrgListView")})
    public String higSecOrgListView() {
        this.organizations = organizationDao.findOngoingForAdmin();
        BaseUser admin = baseUserDao.findByEmail((String) ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL))  ;
        this.canEdit = baseUserRoleTypeDao.havePermission(admin.getId(), "orgCreator") ;
        this.canReview = baseUserRoleTypeDao.havePermission(admin.getId(), "orgReviewer") ;
        return SUCCESS;
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

    public Organization getOrg() {
        return org;
    }

    public void setOrg(Organization org) {
        this.org = org;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Boolean getLanguage() {
        return language;
    }

    public void setLanguage(Boolean language) {
        this.language = language;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getContractUrl() {
        return contractUrl;
    }

    public void setContractUrl(String contractUrl) {
        this.contractUrl = contractUrl;
    }

    public String getConfirmCode() {
        return confirmCode;
    }

    public void setConfirmCode(String confirmCode) {
        this.confirmCode = confirmCode;
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

    public Boolean getCanReview() {
        return canReview;
    }

    public void setCanReview(Boolean canReview) {
        this.canReview = canReview;
    }

    public Boolean getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(Boolean canEdit) {
        this.canEdit = canEdit;
    }
}
