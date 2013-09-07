package com.gogowise.action.competition;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.user.InviteRelationshipDao;
import com.gogowise.dao.competition.SingUpDao;
import com.gogowise.domain.*;
import com.gogowise.domain.competition.Competition;
import com.gogowise.domain.competition.CompetitionSession;
import com.gogowise.domain.competition.SingUpInfo;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.domain.user.Comments;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.util.*;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class SingUpAction extends BasicAction {


    /**
     *
     */
    private static final long serialVersionUID = 1174060748546146233L;

    private SingUpDao singUpDao;
    private InviteRelationshipDao inviteRelationshipDao;

    private SingUpInfo singUpInfo;
    private List<File> uploads = new ArrayList<File>();
    private List<String> uploadFileNames = new ArrayList<String>();
    private List<String> uploadContentTypes = new ArrayList<String>();
    private List<SingUpInfo> singUpInfos;
    private Map<String, String> competitionSession = new HashMap<String, String>();
    private Competition competition;
    private Integer type;
    private boolean haveUserInfo = false;
    private boolean showCompetitionSessionList = true;
    private String duplicate;
    private CompetitionSession cs;
    private Integer sessionId;
    public List<CompetitionSession> sessionAge = new ArrayList<CompetitionSession>();
    public List<CompetitionSession> sessionForcast = new ArrayList<CompetitionSession>();
    public List<CompetitionSession> sessionList = new ArrayList<CompetitionSession>();
    public List<Comments> commentList = new ArrayList<Comments>();
    private Comments comments;
    private BaseUser user;
    private String emailBoxUrl;


    private Pagination pagination = new Pagination();


    //注册


    @SkipValidation
    public String init() throws Exception {

        setIdForUser();
        Integer tempUserId = singUpInfo.getUser().getId();
        if (tempUserId != null && tempUserId > 0) {
            singUpInfo = singUpDao.findSingUpInfoByUserId(tempUserId);
            if (singUpInfo == null) {
                BaseUser bs = singUpDao.findUserById(tempUserId);
                if (bs != null) {
                    this.singUpInfo = new SingUpInfo();
                    this.singUpInfo.setUser(bs);
                    this.haveUserInfo = true;
                }
            } else {
                haveUserInfo = true;
            }
        } else if (this.getSingUpInfo().getId() != null && this.getSingUpInfo().getId() > 0) {
            this.singUpInfo = singUpDao.findById(this.getSingUpInfo().getId());
            this.haveUserInfo = true;
            this.showCompetitionSessionList = false;
        }
        initCompetition();
        return SUCCESS;
    }

    private void initCompetition() {
        if (this.competition == null) {
            showCompetitionSessionList = false;
            return;
        }
        this.competition = singUpDao.findCompetitionById(this.competition.getId());
        this.competitionSession = singUpDao.findSessionByTypeForSelector(this.competition.getId(), this.type);
        Set<String> set = competitionSession.keySet();
        Long time = System.currentTimeMillis();
        Object[] array = set.toArray();
        for (int i = 0; i < set.size(); i++) {
            CompetitionSession _session = singUpDao.findSessionById(Integer.valueOf((String) array[i]));
            Double _time = _session.getDate().getTime() + (_session.getStartTime() * 60 * 60 * 1000);
            if (time > _time) {
                competitionSession.remove((String) array[i]);
            }
        }

    }

    private void setIdForUser() {
        if (this.singUpInfo == null) {
            this.singUpInfo = new SingUpInfo();
        }
        if (singUpInfo.getUser() == null) {
            singUpInfo.setUser(new BaseUser());
        }
        singUpInfo.getUser().setId(super.getSessionUserId());
    }


    @SkipValidation
    public String list() {
        singUpInfos = new ArrayList<SingUpInfo>();
        if (this.getSingUpInfo() == null) {
            singUpInfos = singUpDao.findByPage(pagination);
        } else if (singUpInfo.getUser() != null && singUpInfo.getUser().getId() != 0) {
            singUpInfos.add(singUpDao.findSingUpInfoByUserId(singUpInfo.getUser().getId()));
        } else {
            singUpInfos = singUpDao.findByExample(this.getSingUpInfo());
        }

        return SUCCESS;
    }

    @SkipValidation
    public String blog() throws Exception {      //个人博客

        this.singUpInfo = singUpDao.findById(this.getSingUpInfo().getId());  //获得个人信息
        Integer userId = singUpInfo.getUser().getId();
        Pagination page = new Pagination();
        page.setPageSize(8);

        List<CompetitionSession> sessions = singUpDao.findAgeByUser(userId, page);
        for (int i = 0; i < 8 && i < sessions.size(); i++) {
            sessionAge.add(sessions.get(i));       //我做过的视频
        }

        List<CompetitionSession> sessions2 = singUpDao.findForcastByUser(userId, page);
        for (int i = 0; i < 8 && i < sessions2.size(); i++) {
            sessionForcast.add(sessions2.get(i));   //我的即将开播的节目
        }

        this.commentList = singUpDao.listAllComments(userId);
        return SUCCESS;
    }

    public String competitionAge() {
        this.sessionAge = singUpDao.findAgeByUser(super.getSessionUserId(), this.getPagination());
        return SUCCESS;
    }

    public String competitionOngoing() {
        this.sessionList = singUpDao.findOngoing(this.getPagination());
        return SUCCESS;
    }

    public String competitionForcast() {
        this.sessionList = singUpDao.findForcast(this.getPagination());
        return SUCCESS;
    }


    public String saveBlog() throws Exception {
        this.singUpInfo = singUpDao.findById(this.getSingUpInfo().getId());//从jsp获得singUpInfo.id
        this.getComments().setTo(this.getSingUpInfo().getUser()); //指定信息的被留言人
        if (super.getSessionUserId() != null) {
            BaseUser owner = new BaseUser();
            owner.setId(super.getSessionUserId());
            this.getComments().setOwner(owner);//指定信息的留言人
        }
        this.getComments().setCreateDate(Calendar.getInstance());
        singUpDao.saveComments(this.getComments());
        return SUCCESS;
    }


//    public String saveSingUp() throws Exception {
//        int i = 0;
//        for (File myFile : this.getUpload()) {
//            String path = "/" + this.getSingUpInfo().getUser().getId() + "/" + i + this.getExtention(this.getUploadFileName().get(i));
//            File imageFile = new File(ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH) + path);
//            if (!imageFile.getParentFile().exists()) {
//                imageFile.getParentFile().mkdirs();
//            } else {
//                File files[] = imageFile.getParentFile().listFiles();
//                for (int j = 0; j < files.length; j++) {
//                    files[j].delete();
//                }
//            }
//            copy(myFile, imageFile);
//            this.singUpInfo.getUser().setPic(Constants.UPLOAD_USER_PATH + path);
//            i++;
//        }
//
//        if (!StringUtils.isBlank(this.getSingUpInfo().getUser().getPassword())) {
//            this.setPassToMD5(this.getSingUpInfo().getUser());
//        }
////        Integer singUpId = this.singUpInfo.getId();
//        this.singUpInfo.getUser().setActiveCode(MD5.endCode(String.valueOf(System.currentTimeMillis())));
//        singUpDao.persistAll(this.getSingUpInfo());
//
//        if (this.showCompetitionSessionList) {
//            SingerAllocation sa = cs.getFirstAvailable();
//            sa.setSingUpInfo(this.getSingUpInfo());
//            singUpDao.persistAllocation(sa);
//        }
//        this.emailBoxUrl = EmailUtil.getEmailBoxUrl(this.singUpInfo.getUser().getEmail());
//        if (singUpDao.findUserById(this.singUpInfo.getUser().getId()).getLockedOut()) {
//            UserAction.sendEmail(this.singUpInfo.getUser());
//            return "checkEmail";
//        }
//        return SUCCESS;
//    }

    public void validateSaveSingUp() {
        // <field name="singUpInfo.user.nickName">
//        <field-validator type="requiredstring">
//            <message>昵称是必填的</message>
//        </field-validator>
//    </field>
        initCompetition();
        if (this.singUpInfo.getId() == null || this.singUpInfo.getId() == 0) {
            String password = this.getSingUpInfo().getUser().getPassword();
            if (!this.haveUserInfo && !this.getDuplicate().equals(password)) {
                addFieldError("password", "两次密码不一致");
            }
            if (!this.haveUserInfo && singUpDao.findSingUpInfoByEmail(this.getSingUpInfo().getUser().getEmail()) != null) {
                addFieldError("email", "EMIAL已存在，请使用其他的EMAIL注册");
            }

        }
        if (this.isShowCompetitionSessionList() && this.getSessionId() != null) {
            cs = singUpDao.findSessionById(this.getSessionId());
            if (cs.isFull()) {
                addFieldError("competion", "您报名的场次以满，请选择其他场次");
            }
            if (this.getSingUpInfo().getUser().getId() != null && singUpDao.isAllocationByUserId(this.getSingUpInfo().getUser().getId(), this.getCompetition().getId())) {
                addFieldError("competion", "您以报名");
            }
        }


    }


    //======================================Get and Set method =============================================

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }


    public InviteRelationshipDao getInviteRelationshipDao() {
        return inviteRelationshipDao;
    }

    public void setInviteRelationshipDao(InviteRelationshipDao inviteRelationshipDao) {
        this.inviteRelationshipDao = inviteRelationshipDao;
    }

    public CompetitionSession getCs() {
        return cs;
    }

    public void setCs(CompetitionSession cs) {
        this.cs = cs;
    }

    public Integer getSessionId() {
        return sessionId;
    }

    public void setSessionId(Integer sessionId) {
        this.sessionId = sessionId;
    }

    public List<SingUpInfo> getSingUpInfos() {
        return singUpInfos;
    }

    public void setSingUpInfos(List<SingUpInfo> singUpInfos) {
        this.singUpInfos = singUpInfos;
    }

    public SingUpDao getSingUpDao() {
        return singUpDao;
    }

    public void setSingUpDao(SingUpDao singUpDao) {
        this.singUpDao = singUpDao;
    }

    public SingUpInfo getSingUpInfo() {
        return singUpInfo;
    }

    public void setSingUpInfo(SingUpInfo singUpInfo) {
        this.singUpInfo = singUpInfo;
    }


    public List<File> getUpload() {
        return this.uploads;
    }

    public void setUpload(List<File> uploads) {
        this.uploads = uploads;
    }

    public List<String> getUploadFileName() {
        return this.uploadFileNames;
    }

    public void setUploadFileName(List<String> uploadFileNames) {
        this.uploadFileNames = uploadFileNames;
    }

    public List<String> getUploadContentType() {
        return this.uploadContentTypes;
    }

    public void setUploadContentType(List<String> contentTypes) {
        this.uploadContentTypes = contentTypes;
    }

    public Map<String, String> getCompetitionSession() {
        return competitionSession;
    }

    public void setCompetitionSession(Map<String, String> competitionSession) {
        this.competitionSession = competitionSession;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public boolean isHaveUserInfo() {
        return haveUserInfo;
    }

    public void setHaveUserInfo(boolean haveUserInfo) {
        this.haveUserInfo = haveUserInfo;
    }

    public String getDuplicate() {
        return duplicate;
    }

    public void setDuplicate(String duplicate) {
        this.duplicate = duplicate;
    }

    public List<CompetitionSession> getSessionAge() {
        return sessionAge;
    }

    public void setSessionAge(List<CompetitionSession> sessionAge) {
        this.sessionAge = sessionAge;
    }

    public List<CompetitionSession> getSessionForcast() {
        return sessionForcast;
    }

    public void setSessionForcast(List<CompetitionSession> sessionForcast) {
        this.sessionForcast = sessionForcast;
    }

    public List<Comments> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comments> commentList) {
        this.commentList = commentList;
    }

    public Comments getComments() {
        return comments;
    }

    public void setComments(Comments comments) {
        this.comments = comments;
    }

    public List<CompetitionSession> getSessionList() {
        return sessionList;
    }

    public void setSessionList(List<CompetitionSession> sessionList) {
        this.sessionList = sessionList;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public boolean isShowCompetitionSessionList() {
        return showCompetitionSessionList;
    }

    public void setShowCompetitionSessionList(boolean showCompetitionSessionList) {
        this.showCompetitionSessionList = showCompetitionSessionList;
    }


}
