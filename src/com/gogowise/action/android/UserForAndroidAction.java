package com.gogowise.action.android;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.android.AndroidFeedbackDao;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.domain.android_domain.AndroidFeedback;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.MD5;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Created by IntelliJ IDEA.
 * User: GGW
 * Date: 12-1-7
 * Time: 下午2:16
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
@Results({
        @Result(name = "json", type = "json")
})
public class UserForAndroidAction extends BasicAction {
    private static BaseUserDao baseUserDao;
    private Boolean userRight;
    private String  email;
    private String password;
    private BaseUser user;
    private String userExist;
    private String regEmail;
    private String regPassword;
    private String emailBoxUrl;
    private String nickName;
    private AndroidFeedback androidFeedback;
    private AndroidFeedbackDao androidFeedbackDao;
    private String androidFeedbackContent;



     @Action(value = "logon4android")
    public String logon() {
         BaseUser user = baseUserDao.findByEmail(getEmail());

          if(baseUserDao.logon(email, MD5.endCode(password))!=null){
             userRight=true;
             return "json";
          }else {
            userRight=false;
             return "json";
          }
    }

     @Action(value = "saveAndoidFeedback")
    public String saveAndoidFeedback() {
        androidFeedback=new AndroidFeedback();
        androidFeedback.setContent(this.getAndroidFeedbackContent());
        androidFeedback.setEmail(this.getEmail());
        androidFeedbackDao.saveAndroidFeedback(this.getAndroidFeedback());
        userExist="saved";
        return "json";
    }

    @Action(value = "reg4android")
    public String reg(){
        user=new BaseUser();
        user.setEmail(regEmail);
        user.setPassword(MD5.endCode(regPassword));
        user.setNickName(nickName);
        if(baseUserDao.findByEmail(user.getEmail()) != null) {
            userExist="email";
         return "json";
        }else if(baseUserDao.findByNickName(user.getNickName())!=null){
           userExist="nickName";
            return "json";
        }else {
            user.setLockedOut(true);
            Random random=new Random();
            String md5 = MD5.endCode(String.valueOf(System.currentTimeMillis()));
            user.setActiveCode(md5);
            baseUserDao.persistAbstract(user);
            sendEmail(user);
            this.emailBoxUrl = EmailUtil.getEmailBoxUrl(user.getEmail());
            return "json";
        }

    }

     public static void sendEmail(BaseUser user) {
        String avtiveUrl = getBasePath() + "/active.html?email=" + user.getEmail() + "&activeCode=" + user.getActiveCode();
        String recommedUrl = getBasePath() + "/index.html?id=" + user.getId();
        EmailUtil.sendMail(user.getEmail(), "邮箱验证", "" +
                "尊敬的用户[<b>" + user.getEmail() + "</b>]，您好！</p><p style='text-indent:2em;'>欢迎您加入知元网！</p><p style='text-indent:2em;'>知元网是全国首家致力于教学的互动性网络平台。无论您是老师，还是学生，我们都将竭诚为您服务！</p><p style='text-indent:2em;'>您目前还不是正式会员，请点击以下链接激活您的帐户：<a href='" + avtiveUrl + "' title='激活用户'>" + avtiveUrl + "</a>，谢谢！</p><p style='text-indent:2em;'>您还可以通过单击推荐链接：<a href='" + recommedUrl + "' title='向朋友推荐注册为会员'>" + recommedUrl + "</a>&nbsp;向您的亲人或朋友发出注册邀请函，介绍他成为本站会员，<span style='font:18px 黑体;'>如果邀请且被邀请者注册成功，将有机会获取本站额外赠送给您的知券！</span></p><p style='text-indent:2em;'>如果链接无法打开浏览器窗口，请直接复制上述地址到浏览器地址栏中打开。</p><p style='text-indent:2em;'>如果您不是[" + user.getEmail() + "]用户，请直接删除此邮件，因此给您带来的不便我们深感抱歉。</p><p style='text-indent:2em;'>本邮件为系统自动发送，不受理客户在线回复，如果您需要与我们联络，请使用客户服务信箱。</p><p style='text-indent:20em;font:12px 宋体;'><ul style='list-style:none;font:18px 黑体;'><li>祝：学业有成！</li><li>知元网络项目组</li><li>邮件发送日期：" + new SimpleDateFormat("yyyy年-MM月-dd日").format(new Date()) + "</li>", "text/html;charset=utf-8");

    }

    @JSON(serialize = false)
    public String getRegEmail() {
        return regEmail;
    }

    public void setRegEmail(String regEmail) {
        this.regEmail = regEmail;
    }
     @JSON(serialize = false)
    public String getRegPassword() {

        return regPassword;
    }

    public void setRegPassword(String regPassword) {
        this.regPassword = regPassword;
    }

    public String getUserExist() {
        return userExist;
    }

    public void setUserExist(String userExist) {
        this.userExist = userExist;
    }

    @JSON(serialize = false)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
     @JSON(serialize = false)
    public String getEmail() {

        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }



    public Boolean getUserRight() {
        return userRight;
    }

    public void setUserRight(Boolean userRight) {
        this.userRight = userRight;
    }
    @JSON(serialize = false)
    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }
     @JSON(serialize = false)
    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
      @JSON(serialize = false)
    public AndroidFeedback getAndroidFeedback() {
        return androidFeedback;
    }

    public void setAndroidFeedback(AndroidFeedback androidFeedback) {
        this.androidFeedback = androidFeedback;
    }
     @JSON(serialize = false)
    public AndroidFeedbackDao getAndroidFeedbackDao() {
        return androidFeedbackDao;
    }

    public void setAndroidFeedbackDao(AndroidFeedbackDao androidFeedbackDao) {
        this.androidFeedbackDao = androidFeedbackDao;
    }
     @JSON(serialize = false)
    public String getAndroidFeedbackContent() {
        return androidFeedbackContent;
    }

    public void setAndroidFeedbackContent(String androidFeedbackContent) {
        this.androidFeedbackContent = androidFeedbackContent;
    }
}
