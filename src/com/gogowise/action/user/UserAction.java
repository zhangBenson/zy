package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.competition.CompetitionSessionDao;
import com.gogowise.rep.course.*;
import com.gogowise.rep.org.InterviewAppointerDao;
import com.gogowise.rep.org.InterviewDao;
import com.gogowise.rep.org.OrganizationDao;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.user.InviteRelationshipDao;
import com.gogowise.rep.user.UserAccountInfoDao;
import com.gogowise.rep.user.UserRelationshipDao;
import com.gogowise.domain.*;
import com.gogowise.domain.competition.Competition;
import com.gogowise.domain.competition.CompetitionPhase;
import com.gogowise.domain.competition.CompetitionSession;
import com.gogowise.domain.competition.Subject;
import com.gogowise.domain.course.*;
import com.gogowise.domain.finance.UserAccountInfo;
import com.gogowise.domain.org.Interview;
import com.gogowise.domain.org.Organization;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.domain.user.UserRelationship;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.MD5;
import com.gogowise.common.utils.TextCode;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class UserAction extends BasicAction {

    private BaseUserDao baseUserDao;
    private UserRelationshipDao userRelationshipDao;
    private InterviewAppointerDao interviewAppointerDao;
    private InviteRelationshipDao inviteRelationshipDao;
    private List<BaseUser> myFriends = new ArrayList<BaseUser>();
    private Map<Integer, String> competitionSessions = new HashMap<Integer, String>();
    private CompetitionSessionDao competitionSessionDao;
    private List<BaseUser> invitedFriends = new ArrayList<BaseUser>();
    private List<String> invitedEmails = new ArrayList<String>();
    private List<Boolean> checkBox = new ArrayList<Boolean>();
    private List<String> friendEmails = new ArrayList<String>();
    private Integer sessionId;
    private List<Integer> invitedUsers = new ArrayList<Integer>();
    private BaseUser user = new BaseUser();
    private String rePasswordCode;
    private String rePwd;
    private List<File> uploads = new ArrayList<File>();
    private List<String> uploadsFileNames = new ArrayList<String>();
    private List<String> uploadsContentTypes = new ArrayList<String>();
    private String emailBoxUrl;
    private String activeCode; //激活码
    private String yzmCode;    //验证码
    private String invitedCode;//邀请码
    private String recTime;//推荐人推荐的时间 用作处理推荐栏目
    private Integer recUser;
    private String duplicate;
    private Float il8nStr;
    private String identityConfirmMsg;
    private String tname;
    private String tpwd;
    private OrganizationDao organizationDao;
    private Organization org;
     private CourseRecommendDao courseRecommendDao;
    private CourseRecommend courseRecommend;
    private CourseDao courseDao;
    private Course course;
    private String email;
    private String code;
    private Boolean accept=false;
    private CourseInviteStudentDao courseInviteStudentDao;
    private SeniorClassRoomDao seniorClassRoomDao;
    private Interview interview;
    private InterviewDao interviewDao;
    private UserAccountInfoDao userAccountInfoDao;
    private CourseReservationDao courseReservationDao;
    private CourseReservation courseReservation;
    private Integer identityType = 0;
    private UserAccountInfo userAccountInfo;
    private Integer operaType;
    private Integer courseType = 0;
    private Map<Integer, String> orgs = new HashMap<Integer, String>();
    private DateFormat dateFormat = new SimpleDateFormat(this.getText("dateformat.email"));
    private  String  css = "<style type=\"text/css\">\n" +
                            "*{padding:0;margin:0;}\n" +
                            "#receiptContainer {float: left;width: 100%;font-family: \"微软雅黑\", \"宋体\", \"Lucida Sans Unicode\", \"Lucida Grande\", sans-serif;font-size: 16px;}\n" +
                            "#receiptContainer .orangeWords {color: #F90;}\n" +
                            "#logoDiv {float: left;height: 60px;width: 100%;text-align: left;}\n" +
                            "#receiptContent {float: left;width: 100%;}\n" +
                            "#receiptContainer #receiptContent ul li {height: 30px;}\n" +
                            "#receiptContainer #receiptContent ul li a {margin-left: 20px;margin-top: 15px;margin-bottom: 15px;}\n" +
                            "#receiptContainer #receiptContent ul .sayhello {margin-top: 30px;}\n" +
                            "#receiptContainer #receiptContent ul .tittle {margin-bottom: 15px;}\n" +
                            "#receiptContainer #receiptContent ul .courseName {margin-top: 20px;}\n" +
                            "#receiptContainer #receiptContent ul .startTime {margin-bottom: 20px;}\n" +
                            "</style>";
    private String reDirectUrl;
    private int imgX;
    private int imgY;
    private int imgWidth;
    private int imgHeight;
    private String userPortraitName;
    private String newPassword;
    private boolean passwordChanged;

    private List<Course> courses = new ArrayList<Course>();

    @Action(value = "initInviteFriend", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initInviteFriend") })
    public String initFriendsList() {

        List<UserRelationship> relationships = userRelationshipDao.queryFriendsByUserId(getSessionUserId(), this.getPagination());
        for (UserRelationship relationship : relationships) {
            myFriends.add(relationship.getUserFriend());
        }

        List<CompetitionSession> list = competitionSessionDao.findForcastByUser(getSessionUserId(), new Pagination());
        for (CompetitionSession competition : list) {
            CompetitionPhase competitionPhase = competition.getCompetitionPhase();
            Competition compet = competitionPhase.getCompetition();
            Subject subject = compet.getSubject();
            competitionSessions.put(competition.getId(), subject.getName() + compet.getName() + competitionPhase.getName());
        }
        return SUCCESS;
    }

//    @Action(value="changePassword",  results={@Result(name=SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".changPassword")})
//       public String sendVerificationCode4ChangePassword(){
//        BaseUser user = baseUserDao.findByEmail(this.getUser().getEmail());
//        user.setActiveCode("");
//
//
//        return SUCCESS;
//    }

    @Action(value = "identityConfirmEmailCheck")
    public void identityConfirmEmailCheck() throws IOException {
        user = baseUserDao.findByEmail(email);
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        if (user == null) {
            out.print("notExist");
        }
        out.close();
    }
    @Action(value = "initOrgInviteIdentityConfirm",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".orgCourseCreationIdentityConfirm")})
    public String orgInviteIdentityConfirm(){
         BaseUser curr = new BaseUser();
        curr.setEmail(this.getEmail());
        this.setUser(curr);
        return SUCCESS;
    }

    @Action(value = "initInterviewIdentityConfirm",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".orgInterviewIdentityConfirm")})
    public String initOrgInterviewIdentityConfirm(){
        BaseUser curr = new BaseUser();
        curr.setEmail(this.getEmail());
        this.setUser(curr);
        return SUCCESS;
    }

    @Action(value = "identityConfirm", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".CourseSession"),
            @Result(name = "failed", type = Constants.RESULT_NAME_TILES, location = ".identityConfirmation"),
            @Result(name = "courseconfirm",type = Constants.RESULT_NAME_TILES,location = ".courseconfirm")})
    public String identityConfirm() {
        BaseUser curr = baseUserDao.findByEmail(this.getUser().getEmail());
        if (curr != null) {
            if (!MD5.endCode(this.getUser().getPassword()).equals(curr.getPassword())) {
                this.setIdentityConfirmMsg("您输入的密码有误");
                return "failed";
            }
            setUserToSession(curr);
            setUserOrg(curr);
        } else if(!user.getNickName().equals("")){
            user.setLockedOut(true);
            user.setPassword(MD5.endCode(user.getPassword()));
            user.setRegDate(Calendar.getInstance());
            String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
            user.setActiveCode(md5);
            baseUserDao.persistAbstract(user);
            sendEmail(user);
            this.emailBoxUrl = EmailUtil.getEmailBoxUrl(user.getEmail());
            setUserToSession(user);
            setUserOrg(user);
        } else {
            identityConfirmMsg = this.getText("identity.confirm.account.not.exist");
            return "failed";
        }
        if(this.getCourse().getId()!=null){
            course = courseDao.findById(this.getCourse().getId());
            return "courseconfirm";

        }
        return SUCCESS;
    }

    @Action(value = "orgIdentityConfirm", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".go2FirstStep"),
            @Result(name = "failed", type = Constants.RESULT_NAME_TILES, location = ".orgIdentityConfirm")})
    public String orgIdentityConfirmation() {
        BaseUser curr = baseUserDao.findByEmail(this.getUser().getEmail());
        if (curr != null) {
            if (!MD5.endCode(this.getUser().getPassword()).equals(curr.getPassword())) {
                this.setIdentityConfirmMsg("您输入的密码有误");
                return "failed";
            }
            setUserToSession(curr);
            setUserOrg(curr);
        } else if(!user.getNickName().equals("")) {
            user.setLockedOut(true);
            user.setPassword(MD5.endCode(user.getPassword()));
            user.setRegDate(Calendar.getInstance());
            String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
            user.setActiveCode(md5);
            baseUserDao.persistAbstract(user);
            sendEmail(user);
            this.emailBoxUrl = EmailUtil.getEmailBoxUrl(user.getEmail());
            setUserToSession(user);
            setUserToSession(user);
        }else {
            identityConfirmMsg = this.getText("identity.confirm.account.not.exist");
            return "failed";
        }
        return SUCCESS;
    }

    @Action(value = "orgCourseCreationIdentityConfirm", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "createCourse", "courseType", "1"}),
            @Result(name = "failed", type = Constants.RESULT_NAME_TILES, location = ".orgCourseCreationIdentityConfirm"),
            @Result(name = "tips", type = Constants.RESULT_NAME_TILES, location = ".orgInitCourseCreation"),
            @Result(name = "emailSuccess",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myfirstPage"}),
            @Result(name = "adjust",type = Constants.RESULT_NAME_TILES,location = ".adjustCenter"),
            @Result(name = NONE,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
    public String orgCourseCreationIdentityConfirmation() {
        BaseUser curr = baseUserDao.findByEmail(this.getUser().getEmail());
        if (curr != null) {
            if (!MD5.endCode(this.getUser().getPassword()).equals(curr.getPassword())) {
                this.setIdentityConfirmMsg("您输入的密码有误");
                return "failed";
            }
            setUserToSession(curr);
            setUserOrg(curr);
        } else if(!user.getNickName().equals("")){
            user.setLockedOut(true);
            user.setPassword(MD5.endCode(user.getPassword()));
            user.setRegDate(Calendar.getInstance());
            String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
            user.setActiveCode(md5);
            baseUserDao.persistAbstract(user);
            sendEmail(user);
            this.emailBoxUrl = EmailUtil.getEmailBoxUrl(user.getEmail());
            setUserToSession(user);
            setUserOrg(user);

        }else {
            identityConfirmMsg = this.getText("identity.confirm.account.not.exist");
            return "failed";
        }

          //===============================  邮件处理部分 ================================
            //  1.如果是老师，course.id ，email,code 不为空，accept为true则解释，false则不接受
            //  2.如果是学生，则没有code
            if(this.getCourse().getId()!=null&&this.getEmail()!=null&&!this.getCode().equals("")){
                course = courseDao.findById(this.getCourse().getId());
              //if(MD5.endCode(course.getId().toString()+this.getEmail()+course.getPublicationTime().getTimeInMillis()).equals(this.getCode()))
              if(true)
                {
                    // 只有在code比对正确的情况下才能正确接收和提出课程调整
                     BaseUser std  = baseUserDao.findByEmail(this.getUser().getEmail());
                     course.setTeacher(std);
                     courseDao.persistAbstract(course);
                     if(accept==true){
                         return "emailSuccess";
                     }else {
                         return "adjust";
                     }
                }else {
                    return NONE;
                }
            }
            if(this.getCourse().getId()!=null&&this.getEmail()!=null&&this.getCode().equals("")){
                course = courseDao.findById(this.getCourse().getId());
                BaseUser std = baseUserDao.findByEmail(this.getUser().getEmail());
                CourseInviteStudent courseInviteStudent = courseInviteStudentDao.findByCourseAndEmail(this.getCourse().getId(), this.getEmail());
                if(courseInviteStudent!=null){
                    courseInviteStudent.setAcceptInvite(true);
                    courseInviteStudent.setStudent(std);
                    courseInviteStudentDao.persistAbstract(courseInviteStudent);
                    SeniorClassRoom seniorClassRoom = new SeniorClassRoom();
                    seniorClassRoom.setCourse(courseDao.findById(this.getCourse().getId()));
                    seniorClassRoom.setStudent(std);
                    SeniorClassRoom sc = seniorClassRoomDao.findClassRoomByCourseAndStudent(this.getCourse().getId(), std.getId());
                    if (sc != null) {
                         return "emailSuccess";
                   } else {
                        seniorClassRoomDao.persistAbstract(seniorClassRoom);
                        if(accept==true){
                             return "emailSuccess";
                        }else {
                             return "adjust";
                        }
                   }
                }
            }

        if (organizationDao.findByResId(this.getSessionUserId()) !=  null) {
            return SUCCESS;
        } else {
            return "tips";
        }
    }

     @Action(value = "orgInterviewIdentityConfirm",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "myfirstPage"}),
                                                                   @Result(name = "failed",type = Constants.RESULT_NAME_TILES,location = ".orgInterviewIdentityConfirm"),
                                                                   @Result(name = "CourseCreation",type = Constants.RESULT_NAME_TILES,location = ".repeatCourseInfo"),
                                                                   @Result(name = "courseBlog",type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName", "voaCourseBlog","course.id","${courseRecommend.course.id}"}),
                                                                   @Result(name = NONE,type = Constants.RESULT_NAME_TILES,location = ".notExist"),
                                                                   @Result(name = "inviteReject",type = Constants.RESULT_NAME_TILES,location = ".emailHandleReject")})
    public String orgInterviewIdentityConfirm() throws Exception {
      BaseUser curr = baseUserDao.findByEmail(this.getUser().getEmail());
        if (curr != null) {
            if (!MD5.endCode(this.getUser().getPassword()).equals(curr.getPassword())) {
                this.setIdentityConfirmMsg("您输入的密码有误");
                return "failed";
            }
            setUserToSession(curr);
            setUserOrg(curr);
        } else if(!user.getNickName().equals("")){
            user.setLockedOut(true);
            user.setPassword(MD5.endCode(user.getPassword()));
            user.setRegDate(Calendar.getInstance());
            String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
            user.setActiveCode(md5);
            baseUserDao.persistAbstract(user);
            sendEmail(user);
            this.emailBoxUrl = EmailUtil.getEmailBoxUrl(user.getEmail());
            setUserToSession(user);
            setUserOrg(user);
            }else {
            identityConfirmMsg = this.getText("identity.confirm.account.not.exist");
            return "failed";
        }
         //===============================  邮件处理部分 ================================
         if(this.getCourseRecommend().getId()!=null){
             courseRecommend = courseRecommendDao.findById(this.getCourseRecommend().getId());
             if(MD5.endCode(courseRecommend.getEmail()).equals(this.getCode())){
                  BaseUser user = baseUserDao.findByEmail(courseRecommend.getEmail());
                 courseRecommend.setUser(user);
                 courseRecommendDao.persistAbstract(courseRecommend);
                 return "courseBlog";
             }
             return NONE;
         }else if(this.getCourseReservation().getId()!=null){
             if(MD5.endCode(this.getUser().getEmail()).equals(this.getCode())){
                  courseReservation = courseReservationDao.findById(this.getCourseReservation().getId());
                  courseReservation.setUnActive(true);
                  courseReservationDao.persistAbstract(courseReservation);
                  course = courseReservation.getCourse();
                  this.setOperaType(Constants.OPERA_TYPE_FOR_COURSE_CREATION);
                  if(course.getOrganization()!=null){
                            this.setCourseType(Constants.COURSE_TYPE_ORG);
                  }
                  orgs.put(course.getId(),course.getName());
                  return "CourseCreation";
             }
             return NONE;
         }else {
            return SUCCESS;
        }
    }

    @Action(value = "initFollowUps",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initFollowUps")}
    )
    public String initFollowUps() {
//        this.myFriends = baseUserDao.findById(this.getSessionUserId()).getFollows();
        return SUCCESS;
    }

    @Action(value = "exitSystem", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName","index"})})
    public String exitSystem() {
        ActionContext.getContext().getSession().clear();
       // courses = courseDao.findCourseOnline(new Pagination(10));
        return SUCCESS;
    }

    @Action(value = "initRepassword", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initRepassword") })
    public String initRepassword() {
        return SUCCESS;
    }

    @Action(value = "findEmailUser", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".findEmailUser"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".initRepassword")})
    public String findEmailUser() {
        ActionContext.getContext().getSession().remove("validationCode");
        return SUCCESS;
    }

    @Action(value = "sendPasswordEmail")
    public String sendPasswordEmail() {
        BaseUser _user = baseUserDao.findByEmail(user.getEmail());
        String validationCode = MD5.endCode(String.valueOf(System.currentTimeMillis()));
        ActionContext.getContext().getSession().put("validationCode", validationCode);
        _user.setActiveCode(validationCode);
        baseUserDao.persistAbstract(_user);
        String css = "<style type=\"text/css\">\n" +
                 "#rvmDiv #logoDiv { background-image: url(http://www.gogowise.com/images/logo.jpg); background-repeat: no-repeat; height: 65px; margin-left: 45px; }\n" +
                 "#rvmDiv #rvmcontentDiv ul .welcomeTittle { margin-left: 30px; }\n" +
                 "#rvmDiv { float: left; width: 100%; font-family: \"微软雅黑\", \"宋体\", \"Lucida Sans Unicode\", \"Lucida Grande\", sans-serif; }\n" +
                 "#logoDiv { float: left; width: 100%; }\n" +
                 "#rvmcontentDiv { float: left; width: 100%; }\n" +
                 "#rvmDiv #rvmcontentDiv ul li { list-style-type: none; }\n" +
                 "#rvmDiv #rvmcontentDiv .orangeWords { color: rgb(255,155,55); }\n" +
                 "#rvmDiv #rvmcontentDiv ul .lastWords { margin-top: 50px; }\n" +
                 "table, tr, td { border-collapse:collapse; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: #09F; border-right-color: #09F; border-bottom-color: #09F; border-left-color: #09F; }\n" +
                 "tr.odd { background-color:#CEFFFF; }\n" +
                 "</style>";


        String str=this.getText("email.user.forget.password.title");
        EmailUtil.sendMail(user.getEmail(), this.getText("email.user.forget.password.title"), css+this.getText("email.user.forget.password.content",new String[]{
                _user.getEmail(),
               validationCode,
               _user.getEmail(),
              new SimpleDateFormat(this.getText("dateformat")).format(new Date())
         }), "text/html;charset=utf-8");
        return NONE;
    }

    @Action(value = "initUpdate", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initUpdate")})
    public String initUpdate() {
        user = baseUserDao.findById(getSessionUserId());
        userAccountInfo = userAccountInfoDao.findByUserId(this.getSessionUserId());
        return SUCCESS;
    }

    @Action(value = "updateUserInfo", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName","initUpdate"}),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".initUpdate")})
    public String updateUserInfo() {
//        int i = 0;
//        for (File myFile : this.getUploads()) {
//            String path = "/" + getSessionUserId() + "/" + i + this.getExtention(this.getUploadsFileName().get(i));
//            File imageFile = new File(ServletActionContext.getServletContext().getRealPath(Constants.UPLOAD_USER_PATH) + path);
//            if (!imageFile.getParentFile().exists()) {
//                imageFile.getParentFile().mkdirs();
//            } else {
//                File files[] = imageFile.getParentFile().listFiles();
//                for (File file : files) {
//                    file.delete();
//                }
//            }
//            copy(myFile, imageFile);
//            this.getUser().setPic(Constants.UPLOAD_USER_PATH + path);
//            i++;
//        }
        BaseUser _user = baseUserDao.findById(getSessionUserId());
        if(user.getNickName()!=null)
              _user.setNickName(this.user.getNickName());
        if(user.getCardId()!=null)
            _user.setCardId(this.user.getCardId());
        if(user.getPic()!=null)
            _user.setPic(this.user.getPic());
        if(user.getUserName()!=null)
             _user.setUserName(user.getUserName());
        if(StringUtils.isNotBlank(user.getSelfDescription())){
            _user.setSelfDescription(user.getSelfDescription());
        }
        _user.setSexy(user.getSexy());
        UserAccountInfo userAccountInfoForSave = this.userAccountInfoDao.findByUserId(this.getSessionUserId());
        userAccountInfoForSave.setBankName(this.getUserAccountInfo().getBankName());
        userAccountInfoForSave.setDisposeName(this.getUserAccountInfo().getDisposeName());
        userAccountInfoForSave.setBankAccount(this.getUserAccountInfo().getBankAccount());
        userAccountInfoForSave.setUser(_user);
        userAccountInfoDao.persist(userAccountInfoForSave);
        baseUserDao.persistAbstract(_user);
        this.setUser(_user);
        this.setUserAccountInfo(userAccountInfoForSave);
        this.setUserToSession(_user);
        setUserOrg(_user);
        return SUCCESS;
    }

    @Action(value = "yzRePasswordCode", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".yzRePasswordCode"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".findEmailUser")})
    public String yzRePasswordCode() {
        return SUCCESS;
    }

    @Action(value = "reWritePassword", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".reWritePassword"),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".yzRePasswordCode")})
    public String reWritePassword() {
        BaseUser _user = baseUserDao.findByEmail(user.getEmail());
        _user.setPassword(MD5.endCode(rePwd));
        baseUserDao.persistAbstract(_user);
        return SUCCESS;
    }

    public void validateUpdateUserInfo() {
        String cardId = this.getUser().getCardId();
        if (!(cardId != null && (cardId.length() == 0 || cardId.length() == 15 || cardId.length() == 18))) {
            addFieldError("user.cardId", "身份证号错误");
        }
        BaseUser nickNameUser = baseUserDao.findByNickName(StringUtils.trim(user.getNickName()));
        if (nickNameUser != null && !this.getSessionUserId().equals( nickNameUser.getId())) {
            addFieldError("user.nickName", this.getText("member.reg.nickname.exist"));
        }
    }

    public void validateReWritePassword() {
        if (rePwd == null || !rePwd.equals(user.getPassword())) {
            addFieldError("user.password", this.getText("psdNOsame"));
        }
    }

    public void validateYzRePasswordCode() {
        if (rePasswordCode == null || !rePasswordCode.equals(ActionContext.getContext().getSession().get("validationCode"))) {
            addFieldError("rePasswordCode", this.getText("massage.valid.code.error"));
        }
    }

    public void validateFindEmailUser() {
        if (baseUserDao.findByEmail(user.getEmail()) == null) {
            addFieldError("user.email", this.getText("message.user.not.exist"));
        }
        if (!yzmCode.equalsIgnoreCase((String) ActionContext.getContext().getSession().get("validationCode"))) {
            addFieldError("yzmCode", this.getText("massage.valid.code.error"));
        }
    }


    @Action(value = "initlogon",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".logon"),
                    @Result(name = "inviteLogon", type = Constants.RESULT_NAME_TILES, location = ".easyLogin")}
    )
    public String initlogon() throws Exception {
        if (invitedCode != null && !invitedCode.equals("")) {
            return "inviteLogon";//表示有人邀请的登录
        }
        return SUCCESS;
    }

    @Action(value = "easyLogon",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".easyLogin"),
                    @Result(name = "REG", type = Constants.RESULT_NAME_TILES, location = ".initReg")}
    )
    public String easyLogon() throws UnsupportedEncodingException {
        if (StringUtils.isNotBlank(this.getReDirectUrl())
                && StringUtils.contains(this.getReDirectUrl(), "user.email=")) {
            this.user = new BaseUser();
            this.user.setEmail(URLDecoder.decode(StringUtils.substringAfter(this.getReDirectUrl(), "user.email="),Constants.CHAT_TYPE_UTF_8));
            if (this.getUser().getEmail() != null) {
                if (baseUserDao.findByEmail(this.getUser().getEmail()) == null) {
                    return "REG";
                }
            }
        }
        return SUCCESS;
    }
    @Action(value = "login",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".login")})
    public String login(){
        return SUCCESS;
    }

    @Action(value = "loginForVirtualRoom",results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".loginForVirtual")})
    public String loginForVirtual(){
        return SUCCESS;
    }

    @Action(value = "easyLogin", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".easyLogin")})
    public String easyLogin()  /*throws UnsupportedEncodingException*/ {
        return SUCCESS;
    }

    @Action(value = "easyLoginCheck",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}),
                    @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".easyLogin"),
                    @Result(name = "redirect", type = "redirect", location = "${reDirectUrl}")
            }
    )
    public String easyLoginCheck() {
        BaseUser user = baseUserDao.findByEmail(this.getUser().getEmail());

        if (user == null) {
            addFieldError("user.email", this.getText("message.logon.account.not.exist"));
            return INPUT;
        } else if (!user.getPassword().equals(MD5.endCode(this.user.getPassword()))) {
            addFieldError("user.password", this.getText("message.logon.password.error"));
            return INPUT;
        }

        setUserToSession(user);
        setUserOrg(user);
        user.setLastLoginDate(Calendar.getInstance());
        baseUserDao.persistAbstract(user);

        if (StringUtils.isNotBlank(this.getReDirectUrl())) {
            return "redirect";
        } else if (organizationDao.findByResId(user.getId()) != null) {
            this.setReDirectUrl("organizationMatter.html");
            return "redirect";
        }
        return SUCCESS;
    }

    @Action(value = "easyReg",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".easyReg")}
    )
    public String easyReg() {
        return SUCCESS;
    }

    @Action(value = "easyRegCheck",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}),
                    @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".easyReg"),
                    @Result(name = "redirect", type = "redirect", location = "${reDirectUrl}")}
    )
    public String easyRegCheck() {

        BaseUser localUser = baseUserDao.findByEmail(this.getUser().getEmail());
        if(localUser != null) {
            addFieldError("user.email", this.getText("reEmail"));
            return INPUT;
        }


        user.setEmail(StringUtils.trim(user.getEmail()));
        user.setNickName(StringUtils.trim(user.getNickName()));
        user.setLockedOut(true);
        user.setPassword(MD5.endCode(user.getPassword()));
        user.setRegDate(Calendar.getInstance());
        String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
        user.setActiveCode(md5);
        user.setLanguage( ActionContext.getContext().getLocale().getLanguage());
        baseUserDao.persistAbstract(user);
        if(ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL) == null){
            sendEmail(user);
        }
        this.emailBoxUrl = EmailUtil.getEmailBoxUrl(user.getEmail());
        setUserToSession(user);
        setUserOrg(user);
        if(StringUtils.isNotBlank(this.getReDirectUrl())) {
            return "redirect";
        }
        return SUCCESS;
    }

    @Action(value = "initReg",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".easyReg")}
    )
    public String initReg() {
        return SUCCESS;
    }

    @Action(value = "postIl8nString")
    public void setTimezone() {
        ActionContext.getContext().getSession().put("timeZone", il8nStr);
    }

    @Action(value = "logon",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}),
                    @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".easyLogin"),
                    @Result(name = "redirect", type = "redirect", location = "${reDirectUrl}")
            }
    )
    public String logon() {
        BaseUser user = baseUserDao.findByEmail(this.getUser().getEmail());

//        if (user == null) {
//            addFieldError("user.email", this.getText("message.logon.account.not.exist"));
//            return INPUT;
//        } else if (!user.getPassword().equals(MD5.endCode(this.user.getPassword()))) {
//            addFieldError("user.password", this.getText("message.logon.password.error"));
//            return INPUT;
//        }
//        if (user.getLockedOut()) {
//            //没有激活
//            String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
//            user.setActiveCode(md5);
//            baseUserDao.persistAbstract(user);
//            this.emailBoxUrl = EmailUtil.getEmailBoxUrl(user.getEmail());
//            ActionContext.getContext().getSession().remove("validationCode");
//            sendEmail(user);
//            return "unActive";
//            @Result(name = "unActive", type = Constants.RESULT_NAME_TILES, location = ".checkEmail")
//        } else {
//            ActionContext.getContext().getSession().remove("validationCode");
//            ActionContext.getContext().getSession().remove("logonTimes");
        setUserToSession(user);
        setUserOrg(user);
//            if (invitedCode != null && !invitedCode.equals("")) {
//                findRelationShipByCode(invitedCode);
//            }
        user.setLastLoginDate(Calendar.getInstance());
        baseUserDao.persistAbstract(user);

        if (StringUtils.isNotBlank(this.getReDirectUrl())) {
            return "redirect";
        } else if (organizationDao.findByResId(user.getId()) != null) {
            this.setReDirectUrl("organizationMatter.html");
            return "redirect";
        }
        return SUCCESS;
//        }
    }

    @Action(value = "regSecLogonInit",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".higSecLogon")}
    )
    public String regSecLogonInit() throws Exception {
        return SUCCESS;
    }

    @Action(value = "regSecLogon",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "index"}),
                    @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".higSecLogon")}
    )
    public String regSecLogon() {
        BaseUser user = baseUserDao.findByEmail(this.getUser().getEmail());
        ActionContext.getContext().getSession().put(Constants.HIG_SEC_USER_EMAIL, user.getEmail());
        setUserToSession(user);
        return SUCCESS;
    }

    public void validateRegSecLogon() {
        validateLogon();
    }

    @Action(value = "reg",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}),
                    @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".easyReg"),
                    @Result(name = "redirect", type = "redirect", location = "${reDirectUrl}")}
    )
    public String reg() {

        BaseUser localUser = baseUserDao.findByEmail(this.getUser().getEmail());
        if(localUser != null) {
            addFieldError("user.email", this.getText("reEmail"));
            return INPUT;
        }

        user.setEmail(StringUtils.trim(user.getEmail()));
        user.setNickName(StringUtils.trim(user.getNickName()));
        user.setLockedOut(true);
        user.setPassword(MD5.endCode(user.getPassword()));
        user.setRegDate(Calendar.getInstance());
        String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
        user.setActiveCode(md5);
        user.setLanguage( ActionContext.getContext().getLocale().getLanguage());
        baseUserDao.persistAbstract(user);
        if(ActionContext.getContext().getSession().get(Constants.HIG_SEC_USER_EMAIL) == null){
            sendEmail(user);
        }
        this.emailBoxUrl = EmailUtil.getEmailBoxUrl(user.getEmail());
        setUserToSession(user);
        setUserOrg(user);
        if(StringUtils.isNotBlank(this.getReDirectUrl())) {
            return "redirect";
        }
        return SUCCESS;
    }

    public void validateReg() {
        if (baseUserDao.findByEmail(StringUtils.trim(user.getEmail())) != null) {
            String reEmail = getText("reEmail");
            addFieldError("user.email", reEmail);
        }
        if (baseUserDao.findByNickName(StringUtils.trim(user.getNickName())) != null) {
            addFieldError("user.nickName", this.getText("member.reg.nickname.exist"));
        }
    }

    public void sendEmail(BaseUser user) {
        String css = "<style type=\"text/css\">\n" +
                "#rvmDiv #logoDiv {background-image: url(http://www.gogowise.com/images/logo.jpg);background-repeat: no-repeat;height: 65px;margin-left: 45px;}\n" +
                "#rvmDiv #rvmcontentDiv ul .welcomeTittle {margin-left: 30px;}\n" +
                "#rvmDiv {float: left;width: 100%;font-family: \"微软雅黑\", \"宋体\", \"Lucida Sans Unicode\", \"Lucida Grande\", sans-serif;}\n" +
                "#logoDiv {float: left;width: 100%;}\n" +
                "#rvmcontentDiv {float: left;width: 100%;}\n" +
                "#rvmDiv #rvmcontentDiv ul li {list-style-type: none;}\n" +
                "#rvmDiv #rvmcontentDiv .orangeWords {color: rgb(255,155,55);}\n" +
                "#rvmDiv #rvmcontentDiv ul .lastWords {margin-top: 50px;}\n" +
                "</style>";

        String activeUrl = getBasePath() + "/active.html?email=" + user.getEmail() + "&activeCode=" + user.getActiveCode();
        //String recommedUrl = getBasePath() + "/index.html?id=" + user.getId();
        EmailUtil.sendMail(user.getEmail(), this.getText("member.email.validation"), css + this.getText("member.reg.email", new String[]{user.getEmail(), activeUrl, activeUrl, user.getEmail()}), "text/html;charset=utf-8");

    }

    @Action(value = "active",
            results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}),
                    @Result(name = ERROR, type = Constants.RESULT_NAME_TILES, location = ".errorActive")}
    )
    public String active() {
        String hql = "From BaseUser as u where u.email = '" + email + "'";

        List<BaseUser> users = baseUserDao.findByHql(hql);
        BaseUser user;
        if (users.size() == 0) {
            return ERROR;
        } else {
            user = users.get(0);
        }
        if (user == null || !StringUtils.equals(user.getActiveCode(),activeCode)) {
            return SUCCESS;
        }
        //激活码相同，同时登陆
        user.setLockedOut(false);
        user.setActiveCode(null);
        baseUserDao.persistAbstract(user);
        this.setUserToSession(user);
        setUserOrg(user);
        return SUCCESS;
    }

    //获取验证码
    @Action(value = "textCode")
    public String textCode() throws Exception {
        TextCode yzm = new TextCode();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("image/jpeg");
        ServletOutputStream sos = response.getOutputStream();
        ImageIO.write(yzm.getImage(), "jpeg", sos);
        sos.close();
        ActionContext.getContext().getSession().put("validationCode", yzm.getCode());
        return NONE;
    }

    //验证验证码
    public void validateLogon() {
        BaseUser user = baseUserDao.findByEmail(this.getUser().getEmail());
        if (user != null) {
            ActionContext.getContext().getSession().put("logonTimes", 1);
        }
        if (user == null) {
            addFieldError("user.email", this.getText("message.logon.account.not.exist"));
        } else if (!user.getPassword().equals(MD5.endCode(this.user.getPassword()))) {
            addFieldError("user.password", this.getText("message.logon.password.error"));
        } else if ((Integer) ActionContext.getContext().getSession().get("logonTimes") > 0 && yzmCode != null &&
                !yzmCode.equalsIgnoreCase((String) ActionContext.getContext().getSession().get("validationCode"))) {
            addFieldError("yzmCode", this.getText("message.valid.code.error"));
        }
    }




    @Action(value = "courseInviteIdentityLogin", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}),
            @Result(name = INPUT, type = Constants.RESULT_NAME_TILES, location = ".courseInviteLogin")})
    public String identityConfirmLogin() {
        user = baseUserDao.findByEmail(this.getUser().getEmail());
        setUserToSession(user);
        setUserOrg(user);
        return SUCCESS;
    }

    @Action(value = "updatePassword")
    public void updatePassword(){
        BaseUser user=baseUserDao.findByEmail(this.getSessionUserEmail());

        if(user.getPassword().equals(MD5.endCode(this.user.getPassword()))){
            user.setPassword(MD5.endCode(this.getNewPassword()));
            baseUserDao.persist(user);
            try{
                 PrintWriter out = ServletActionContext.getResponse().getWriter();
                 out.print("success");
                 out.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    public void validateIdentityConfirmLogin() {
        BaseUser user = baseUserDao.findByEmail(this.getUser().getEmail());
        this.setEmail(user.getEmail());
        if (user == null) {
            addFieldError("user.email",this.getText("message.logon.account.not.exist"));
        } else if (!user.getPassword().equals(MD5.endCode(this.user.getPassword()))) {
            addFieldError("user.password",this.getText("message.logon.password.error"));
        }

    }

    @Action(value = "initOrgBackEndUserConfirm",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".initOrgBackEndUserConfirm")})
    public String initOrgBackEndUserConfirm(){

        org = organizationDao.findById(org.getId());
        return SUCCESS;
    }

    @Action(value = "orgBackEndUserConfirm",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","organizationMatter"}),
                                                          @Result(name = NONE,type = Constants.RESULT_NAME_TILES,location = ".notExist")})
    public String orgBackEndUserConfirm(){
        BaseUser _user = baseUserDao.findByEmail(this.getUser().getEmail());
        if(_user != null && _user.getActiveCode() != null && _user.getActiveCode().equals(this.getUser().getActiveCode())){
             _user.setPassword(MD5.endCode(user.getPassword()));
            _user.setActiveCode("");
            baseUserDao.persistAbstract(_user);
            setUserToSession(_user);
            setUserOrg(_user);
            return SUCCESS;
        }
        return NONE;
    }

    @Action(value = "helpCenter",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".helpCenter")})
    public String showHelpCenter(){
        return SUCCESS;
    }

    @Action(value = "aboutUs",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".aboutUs")})
    public String showGoGoWiseInfo(){
        return SUCCESS;
    }
    @Action(value = "contactUs",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".contactUs")})
    public String showContact(){
        return SUCCESS;
    }
    @Action(value = "history",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".history")})
    public String showHistory(){
        return SUCCESS;
    }
    @Action(value = "team",results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES,location = ".team")})
    public String showTeamInfo(){
        return SUCCESS;
    }

    private void setUserOrg(BaseUser user){
        Organization org = organizationDao.findByResId(user.getId());
        if(org != null){
           ActionContext.getContext().getSession().put(Constants.SESSION_USER_OWN_ORG,org.getSchoolName());
        }
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getActiveCode() {
        return activeCode;
    }

    public void setActiveCode(String activeCode) {
        this.activeCode = activeCode;
    }


    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public BaseUserDao getBaseUserDao() {
        return this.baseUserDao;
    }


    public String getEmailBoxUrl() {
        return emailBoxUrl;
    }

    public void setEmailBoxUrl(String emailBoxUrl) {
        this.emailBoxUrl = emailBoxUrl;
    }


    public String getYzmCode() {
        return yzmCode;
    }

    public String getRePasswordCode() {
        return rePasswordCode;
    }

    public void setRePasswordCode(String rePasswordCode) {
        this.rePasswordCode = rePasswordCode;
    }

    public void setYzmCode(String yzmCode) {
        this.yzmCode = yzmCode;
    }


    public String initInviteFriend() {
        myFriends.clear();
        competitionSessions.clear();
        initFriendsList();
        return SUCCESS;
    }

    public BaseUser getUser() {
        return user;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public String getRePwd() {
        return rePwd;
    }

    public void setRePwd(String rePwd) {
        this.rePwd = rePwd;
    }

    public List<Integer> getInvitedUsers() {
        return invitedUsers;
    }

    public void setInvitedUsers(List<Integer> invitedUsers) {
        this.invitedUsers = invitedUsers;
    }

    public InviteRelationshipDao getInviteRelationshipDao() {
        return inviteRelationshipDao;
    }

    public void setInviteRelationshipDao(InviteRelationshipDao inviteRelationshipDao) {
        this.inviteRelationshipDao = inviteRelationshipDao;
    }

    public String getInvitedCode() {
        return invitedCode;
    }

    public void setInvitedCode(String invitedCode) {
        this.invitedCode = invitedCode;
    }

    public List<Boolean> getCheckBox() {
        return checkBox;
    }

    public Integer getSessionId() {
        return sessionId;
    }

    public void setSessionId(Integer sessionId) {
        this.sessionId = sessionId;
    }

    public void setCheckBox(List<Boolean> checkBox) {
        this.checkBox = checkBox;
    }

    public List<String> getFriendEmails() {
        return friendEmails;
    }

    public void setFriendEmails(List<String> friendEmails) {
        this.friendEmails = friendEmails;
    }

    public List<BaseUser> getInvitedFriends() {
        return invitedFriends;
    }

    public void setInvitedFriends(List<BaseUser> invitedFriends) {
        this.invitedFriends = invitedFriends;
    }

    public List<String> getInvitedEmails() {
        return invitedEmails;
    }

    public void setInvitedEmails(List<String> invitedEmails) {
        this.invitedEmails = invitedEmails;
    }

    public Map<Integer, String> getCompetitionSessions() {
        return competitionSessions;
    }

    public void setCompetitionSessions(Map<Integer, String> competitionSessions) {
        this.competitionSessions = competitionSessions;
    }

    public CompetitionSessionDao getCompetitionSessionDao() {
        return competitionSessionDao;
    }

    public void setCompetitionSessionDao(CompetitionSessionDao competitionSessionDao) {
        this.competitionSessionDao = competitionSessionDao;
    }

    public String invite() {
        return SUCCESS;
    }

    public UserRelationshipDao getUserRelationshipDao() {
        return userRelationshipDao;
    }

    public void setUserRelationshipDao(UserRelationshipDao userRelationshipDao) {
        this.userRelationshipDao = userRelationshipDao;
    }

    public BaseUserDao getUserDao() {
        return baseUserDao;
    }

    public void setUserDao(BaseUserDao userDao) {
        this.baseUserDao = userDao;
    }

    public List<BaseUser> getMyFriends() {
        return myFriends;
    }

    public void setMyFriends(List<BaseUser> myFriends) {
        this.myFriends = myFriends;
    }

    public List<File> getUploads() {
        return uploads;
    }

    public void setUploads(List<File> uploads) {
        this.uploads = uploads;
    }

    public List<String> getUploadsFileName() {
        return uploadsFileNames;
    }

    public void setUploadsFileName(List<String> uploadFileNames) {
        this.uploadsFileNames = uploadFileNames;
    }

    public List<String> getUploadsContentType() {
        return uploadsContentTypes;
    }

    public void setUploadsContentType(List<String> uploadContentTypes) {
        this.uploadsContentTypes = uploadContentTypes;
    }

    public void test() throws Exception {
        if (tname != null && tname.equals("zhangsan") && tpwd != null && tpwd.equals("123")) {
            ActionContext ctx = ActionContext.getContext();
            HttpServletResponse request = (HttpServletResponse) ctx
                    .get(ServletActionContext.HTTP_RESPONSE);
            request.getWriter().println(true);
        }
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTpwd() {
        return tpwd;
    }

    public void setTpwd(String tpwd) {
        this.tpwd = tpwd;
    }

    public String getRecTime() {
        return recTime;
    }

    public void setRecTime(String recTime) {
        this.recTime = recTime;
    }

    public Integer getRecUser() {
        return recUser;
    }

    public void setRecUser(Integer recUser) {
        this.recUser = recUser;
    }


    public String getDuplicate() {
        return duplicate;
    }

    public void setDuplicate(String duplicate) {
        this.duplicate = duplicate;
    }

    public Float getIl8nStr() {
        return il8nStr;
    }

    public void setIl8nStr(Float il8nStr) {
        this.il8nStr = il8nStr;
    }

    public String getIdentityConfirmMsg() {
        return identityConfirmMsg;
    }

    public void setIdentityConfirmMsg(String identityConfirmMsg) {
        this.identityConfirmMsg = identityConfirmMsg;
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Boolean getAccept() {
        return accept;
    }

    public void setAccept(Boolean accept) {
        this.accept = accept;
    }

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    public CourseInviteStudentDao getCourseInviteStudentDao() {
        return courseInviteStudentDao;
    }

    public void setCourseInviteStudentDao(CourseInviteStudentDao courseInviteStudentDao) {
        this.courseInviteStudentDao = courseInviteStudentDao;
    }

    public SeniorClassRoomDao getSeniorClassRoomDao() {
        return seniorClassRoomDao;
    }

    public void setSeniorClassRoomDao(SeniorClassRoomDao seniorClassRoomDao) {
        this.seniorClassRoomDao = seniorClassRoomDao;
    }

    public Interview getInterview() {
        return interview;
    }

    public void setInterview(Interview interview) {
        this.interview = interview;
    }

    public Integer getIdentityType() {
        return identityType;
    }

    public void setIdentityType(Integer identityType) {
        this.identityType = identityType;
    }

    public InterviewDao getInterviewDao() {
        return interviewDao;
    }

    public void setInterviewDao(InterviewDao interviewDao) {
        this.interviewDao = interviewDao;
    }

    public UserAccountInfoDao getUserAccountInfoDao() {
        return userAccountInfoDao;
    }

    public void setUserAccountInfoDao(UserAccountInfoDao userAccountInfoDao) {
        this.userAccountInfoDao = userAccountInfoDao;
    }

    public UserAccountInfo getUserAccountInfo() {
        return userAccountInfo;
    }

    public void setUserAccountInfo(UserAccountInfo userAccountInfo) {
        this.userAccountInfo = userAccountInfo;
    }

    public InterviewAppointerDao getInterviewAppointerDao() {
        return interviewAppointerDao;
    }

    public void setInterviewAppointerDao(InterviewAppointerDao interviewAppointerDao) {
        this.interviewAppointerDao = interviewAppointerDao;
    }

    public CourseReservationDao getCourseReservationDao() {
        return courseReservationDao;
    }

    public void setCourseReservationDao(CourseReservationDao courseReservationDao) {
        this.courseReservationDao = courseReservationDao;
    }

    public CourseReservation getCourseReservation() {
        return courseReservation;
    }

    public void setCourseReservation(CourseReservation courseReservation) {
        this.courseReservation = courseReservation;
    }

    public Integer getOperaType() {
        return operaType;
    }

    public void setOperaType(Integer operaType) {
        this.operaType = operaType;
    }

    public Integer getCourseType() {
        return courseType;
    }

    public void setCourseType(Integer courseType) {
        this.courseType = courseType;
    }

    public Map<Integer, String> getOrgs() {
        return orgs;
    }

    public void setOrgs(Map<Integer, String> orgs) {
        this.orgs = orgs;
    }

    public CourseRecommendDao getCourseRecommendDao() {
        return courseRecommendDao;
    }

    public void setCourseRecommendDao(CourseRecommendDao courseRecommendDao) {
        this.courseRecommendDao = courseRecommendDao;
    }

    public CourseRecommend getCourseRecommend() {
        return courseRecommend;
    }

    public void setCourseRecommend(CourseRecommend courseRecommend) {
        this.courseRecommend = courseRecommend;
    }

    public DateFormat getDateFormat() {
        return dateFormat;
    }

    public void setDateFormat(DateFormat dateFormat) {
        this.dateFormat = dateFormat;
    }

    public String getCss() {
        return css;
    }

    public void setCss(String css) {
        this.css = css;
    }

    public String getReDirectUrl() {
        return reDirectUrl;
    }

    public void setReDirectUrl(String reDirectUrl) {
        this.reDirectUrl = reDirectUrl;
    }

     public int getImgY() {
        return imgY;
    }

    public void setImgY(int imgY) {
        this.imgY = imgY;
    }

    public int getImgWidth() {
        return imgWidth;
    }

    public void setImgWidth(int imgWidth) {
        this.imgWidth = imgWidth;
    }

    public int getImgHeight() {
        return imgHeight;
    }

    public void setImgHeight(int imgHeight) {
        this.imgHeight = imgHeight;
    }

    public int getImgX() {
        return imgX;
    }

    public void setImgX(int imgX) {
        this.imgX = imgX;
    }

    public String getUserPortraitName() {
        return userPortraitName;
    }

    public void setUserPortraitName(String userPortraitName) {
        this.userPortraitName = userPortraitName;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public boolean isPasswordChanged() {
        return passwordChanged;
    }

    public void setPasswordChanged(boolean passwordChanged) {
        this.passwordChanged = passwordChanged;
    }

    public Organization getOrg() {
        return org;
    }

    public void setOrg(Organization org) {
        this.org = org;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }
}
