package com.gogowise.action.user;

import com.gogowise.action.BasicAction;
import com.gogowise.dao.competition.CompetitionDaoImpl;
import com.gogowise.dao.user.BaseUserDao;
import com.gogowise.dao.competition.CompetitionSessionDao;
import com.gogowise.dao.user.InviteRelationshipDao;
import com.gogowise.domain.BaseUser;
import com.gogowise.domain.InviteRelationship;
import com.gogowise.utils.Constants;
import com.gogowise.utils.EmailUtil;
import com.gogowise.utils.MD5;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class InviteAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = 8298811288458899213L;
    private static final String REGEX = "^([a-z0-9A-Z]+[-_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
    private InviteRelationshipDao inviteRelationshipDao;
    private List<String> friendEmails = new ArrayList<String>();
    private CompetitionDaoImpl.SingUpDao singUpDao;
    private BaseUserDao baseUserDao;
    private List<Boolean> checkBox = new ArrayList<Boolean>();
    private CompetitionSessionDao competitionSessionDao;
    private Integer sessionId;
    private List<Integer> invitedUsers = new ArrayList<Integer>();

    @Action(value = "addFriend", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "initFriendsList"})})
    public String addFriend() {
        BaseUser hostUser = singUpDao.findUserById(getSessionUserId());
        for (String _email : friendEmails) {
            if (_email != null && !_email.equals("") && _email.matches(REGEX)) {
                BaseUser _user = singUpDao.findUserByEmail(_email);
                if (_user != null) {
                    inviteRelationshipDao.addFriend(getSessionUserId(), _user.getId());
                } else {
                    String invitedCode = MD5.endCode(String.valueOf(System.currentTimeMillis()));
                    sendAddFriendEmail(hostUser.getEmail(), _email, invitedCode);
                    inviteRelationshipDao.addUnknownFriends(getSessionUserId(), invitedCode);
                }
            }
        }
        return SUCCESS;
    }

    private void sendAddFriendEmail(String host, String email, String invitedCode) {
        String title = "知元网 邀请好友";
        String logonUrl = getBasePath() + "/easyLogon.html?invitedCode=" + invitedCode;

        String regUrl = getBasePath() + "/initReg.html?invitedCode=" + invitedCode;
        String content = "<table width=\"680\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr> <td align=\"center\" valign=\"middle\"><br />" +
                "    <br /></td> </tr>  <tr>  <td><p>尊敬的用户<span id=\"username\">" + email + "</span>，您好！</p>" +
                "    <p>用户<span id=\"username\">" + host + "</span>邀请您成为他的好友。如果您是会员同意请点击<span id=\"username\">" + logonUrl + "登录</span>，如果您还是不会员<span id=\"username\">" + regUrl + "</span>请点击此链接进行注册。 </p>" +
                "    <p>知元网是全国首家致力于教学的互动性网络平台。无论您是老师，还是学生，我们都将竭诚为您服务！</p>" +
                "    <p>如果您不是<span id=\"useremail\">" + email + "</span>用户，请直接删除此邮件，因此给您带来的不便我们深感抱歉。</p>" +
                "    <p>本邮件为系统自动发送，不受理客户在线回复，如果您需要与我们联络，请使用客户服务信箱。</p>" +
                "    <p>祝：学业有成！</p><div align=\"right\">" +
                "    <p>知元网络项目组</p>  <p>邮件发送日期：<span id=\"datetime\">" + new SimpleDateFormat("yyyy年-MM月-dd日").format(Calendar.getInstance().getTime()) + "</span></p></div></td>" +
                "  </tr>" +
                "</table>";
        EmailUtil.sendMail(email, title, content, "text/html;charset=utf-8");
    }

    @Action(value = "inviteFriends", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}) })
    public String inviteFriends() {
        BaseUser user = singUpDao.findUserById(getSessionUserId());
        String invitedCode = MD5.endCode(String.valueOf(System.currentTimeMillis()));
        String competitionUrl = getBasePath() + "/initReg.html?invitedCode=" + invitedCode;    //节目链接
        String regUrl = getBasePath() + "/initReg.html?invitedCode=" + invitedCode;  //非会员的链接
        StringBuilder content1 = new StringBuilder("<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\" /><title>无标题文档</title><style type=\"text/css\">" +
                " <!--body{ font-family:\"微软雅黑\", \"宋体\";} span{ background-color:#CCCCCC;} -->" +
                " </style></head><body><table width=\"680\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td align=\"center\" valign=\"middle\"><br /><br /></td>" +
                "  </tr><tr><td><p>尊敬的用户<span id=\"username\">");
        StringBuilder content2 = new StringBuilder("</span>，您好！</p><p>您的朋友<span id=\"username\">").append(user.getEmail()).append("</span>，邀请您观看他（她）的节目，请点击以下链接直接观看节目<span id=\"username\"><a href=\"" + competitionUrl + "\">" + competitionUrl + "</a></span>。或者点击链接成为我们的会员<span id=\"username\"><a href=\"" + regUrl + "\">" + regUrl + "</a></span>如果链接无法打开浏览器窗口，请直接复制上述地址到浏览器地址栏中打开。 </p>" +
                "    <p>知元网是全国首家致力于教学的互动性网络平台。无论您是老师，还是学生，我们都将竭诚为您服务！</p>\n" +
                "    <p>如果链接无法打开浏览器窗口，请直接复制上述地址到浏览器地址栏中打开。</p><p>如果您不是<span id=\"useremail\">");
        StringBuilder content3 = new StringBuilder("</span>用户，请直接删除此邮件，因此给您带来的不便我们深感抱歉。</p><p>本邮件为系统自动发送，不受理客户在线回复，如果您需要与我们联络，请使用客户服务信箱。</p>" +
                "    <p>祝：学业有成！</p><div align=\"right\"><p>知元网络项目组</p><p>邮件发送日期：<span id=\"datetime\">" + new SimpleDateFormat("yyyy年-MM月-dd日").format(Calendar.getInstance().getTime()) + "&nbsp;&nbsp;&nbsp;</span></p></div></td>  </tr></table></body>");

        String title = "知元网节目邀请";
        int size = checkBox.size();

        //给好友发送邀请
        for (int index = 0; index < size; index++) {
            if (checkBox.get(index)) {
                BaseUser eUser = singUpDao.findUserById(invitedUsers.get(index));//取不到数据
                if (!inviteRelationshipDao.isAlreadyInvite(getSessionUserId(), eUser.getId())) {
                    inviteRelationshipDao.inviteUser(user, eUser, competitionSessionDao.findById(sessionId));
                    inviteRelationshipDao.addFriend(getSessionUserId(), eUser.getId());
                }
            }
        }
        size = friendEmails.size();
        for (int index = 0; index < size; index++) {
            String _email = friendEmails.get(index);
            BaseUser _user = singUpDao.findUserByEmail(_email);
            if (_email != null && !_email.equals("")
                    && _email.matches(REGEX)) {
                if (_user == null || !inviteRelationshipDao.isAlreadyInvite(getSessionUserId(), singUpDao.findUserByEmail(_email).getId())) {
                    //if the user is not exist or we not invited
                    content1.append(_email).append(content2).append(_email).append(content3);
                    EmailUtil.sendMail(_email, title, content1.toString(), "text/html;charset=utf-8");
                    InviteRelationship relationship = new InviteRelationship();
                    relationship.setInviter(user);
                    relationship.setInviteder(null);
                    relationship.setInvitedCode(invitedCode);
                    relationship.setCompetitionSessionId(competitionSessionDao.findById(sessionId));
                    inviteRelationshipDao.save(relationship);
                }
            }
        }
        return SUCCESS;
    }

    @Action(value = "initRecomend", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".initRecomond") })
    public String initRecomond() {
        friendEmails.clear();
        return SUCCESS;
    }
    @Action(value = "recomondFriends", results = {@Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "myfirstPage"}) })
    public String recomondFriends() {
        //这里是推荐会员 不加为好友
        BaseUser user = singUpDao.findUserById(getSessionUserId());
        long time = System.currentTimeMillis();
        String invitedCode = MD5.endCode(String.valueOf(time));
        String regUrl = getBasePath() + "/initReg.html?invitedCode=" + invitedCode + "&recTime=" + time + "&recUser=?" + user.getId();  //非会员的链接
        StringBuilder content1 = new StringBuilder("<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\" /><title>无标题文档</title><style type=\"text/css\">" +
                " <!--body{ font-family:\"微软雅黑\", \"宋体\";} span{ background-color:#CCCCCC;} -->" +
                " </style></head><body><table width=\"680\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td align=\"center\" valign=\"middle\"><br /><br /></td>" +
                "  </tr><tr><td><p>尊敬的用户<span id=\"username\">");
        StringBuilder content2 = new StringBuilder("</span>，您好！</p><p>您的朋友<span id=\"username\">").append(user.getEmail()).append("</span>，邀请您参与知元网，请点击链接成为我们的会员<span id=\"username\"><a href=\"" + regUrl + "\">" + regUrl + "</a></span>如果链接无法打开浏览器窗口，请直接复制上述地址到浏览器地址栏中打开。 </p>" +
                "    <p>知元网是全国首家致力于教学的互动性网络平台。无论您是老师，还是学生，我们都将竭诚为您服务！</p>\n" +
                "    <p>如果链接无法打开浏览器窗口，请直接复制上述地址到浏览器地址栏中打开。</p><p>如果您不是<span id=\"useremail\">");
        StringBuilder content3 = new StringBuilder("</span>用户，请直接删除此邮件，因此给您带来的不便我们深感抱歉。</p><p>本邮件为系统自动发送，不受理客户在线回复，如果您需要与我们联络，请使用客户服务信箱。</p>" +
                "    <p>祝：学业有成！</p><div align=\"right\"><p>知元网络项目组</p><p>邮件发送日期：<span id=\"datetime\">" + new SimpleDateFormat("yyyy年-MM月-dd日").format(Calendar.getInstance().getTime()) + "&nbsp;&nbsp;&nbsp;</span></p></div></td>  </tr></table></body>");

        String title = "知元网推荐注册";
        for (String _email : friendEmails) {
            BaseUser _user = singUpDao.findUserByEmail(_email);                   //根据查找是否已经是知元用户
            if (_email != null && !_email.equals("")
                    && _email.matches(REGEX)) {
                if (_user == null) {
                    //if the user is not exist
                    content1.append(_email).append(content2).append(_email).append(content3);
                    EmailUtil.sendMail(_email, title, content1.toString(), "text/html;charset=utf-8");
                }
            }
        }
        return SUCCESS;
    }

    public List<Boolean> getCheckBox() {
        return checkBox;
    }

    public void setCheckBox(List<Boolean> checkBox) {
        this.checkBox = checkBox;
    }

    public CompetitionSessionDao getCompetitionSessionDao() {
        return competitionSessionDao;
    }

    public void setCompetitionSessionDao(CompetitionSessionDao competitionSessionDao) {
        this.competitionSessionDao = competitionSessionDao;
    }

    public Integer getSessionId() {
        return sessionId;
    }

    public void setSessionId(Integer sessionId) {
        this.sessionId = sessionId;
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

    public List<String> getFriendEmails() {
        return friendEmails;
    }

    public void setFriendEmails(List<String> friendEmails) {
        this.friendEmails = friendEmails;
    }

    public CompetitionDaoImpl.SingUpDao getSingUpDao() {
        return singUpDao;
    }

    public void setSingUpDao(CompetitionDaoImpl.SingUpDao singUpDao) {
        this.singUpDao = singUpDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
}
