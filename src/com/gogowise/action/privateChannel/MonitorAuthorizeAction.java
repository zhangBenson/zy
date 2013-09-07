package com.gogowise.action.privateChannel;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.user.BaseUserDao;
import com.gogowise.rep.live.MonitorAuthorizeDao;
import com.gogowise.rep.live.UserPrivateChannelDao;
import com.gogowise.domain.user.BaseUser;
import com.gogowise.domain.live.MonitorAuthorize;
import com.gogowise.domain.live.UserPrivateChannel;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.PrintWriter;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-12-7
 * Time: 上午10:57
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class MonitorAuthorizeAction extends BasicAction{
    private MonitorAuthorize monitorAuthorize;
    private MonitorAuthorizeDao monitorAuthorizeDao;
    private BaseUser baseUser;
    private BaseUserDao baseUserDao;
    private UserPrivateChannel userPrivateChannel;
    private UserPrivateChannelDao userPrivateChannelDao;
    private List<String> authorityToEmails;

    private BaseUser authorizeTo;
    private String reDirectUrl;

    @Action(value = "monitorAuthorizeToOther")
    public void monitorAuthorizeToOther() {
        String css = "<style type=\"text/css\">\n" +
                    "#container {width: 100%;float: left;padding: 0px;margin: 0px 100px;background: #FFF;}\n" +
                    "#logo {height: 60px;width: 100%;padding-bottom: 5px;border-bottom: 1px solid #999;float: left;}\n" +
                    "#sayhello {font-weight: lighter;}\n" +
                    "#content {float: left;width: 100%;border-bottom: 1px solid #999;font-weight: lighter;}\n" +
                    "#footer {float: left;width: 100%;}\n" +
                    ".wordtype{color:#cc6600;}\n" +
                    "</style>";
        BaseUser authorize = baseUserDao.findById(this.getSessionUserId());
        for(String email:authorityToEmails){
            MonitorAuthorize ma = monitorAuthorizeDao.findByAuthorizeAndAuthorizeToEamil(authorize, email);
            if(ma == null){
                MonitorAuthorize temp=new MonitorAuthorize();
                temp.setMonitorAuthorizeToEmail(email);
                temp.setAuthorize(authorize);
                monitorAuthorizeDao.persistAbstract(temp);
            }
            String hrefAccept = getBasePath()+"/emailHandlerFormonitorAuthorize.html?baseUser.id="+this.getSessionUserId()+"&monitorAuthorize.accept=true&monitorAuthorize.monitorAuthorizeToEmail="+email;
            String rejectAccept = getBasePath()+"/emailHandlerFormonitorAuthorize.html?baseUser.id="+this.getSessionUserId()+"&monitorAuthorize.accept=false&monitorAuthorize.monitorAuthorizeToEmail="+email;

            EmailUtil.sendMail(email,
                this.getText("authorization.title",new String[]{authorize.getNickName()}),
                css + this.getText("authorization.email.cont", new String[]{
                        authorize.getNickName(),
                        authorize.getEmail(),
                        hrefAccept,rejectAccept,
                        hrefAccept,rejectAccept,
                        email}
                ),
                "text/html;charset=utf-8"
            );
        }

        BaseUser baseUser=baseUserDao.findByEmail(this.getSessionUserEmail());
        if(userPrivateChannelDao.findByUser(baseUser.getId())!=null){

        }
    }

    @Action(value="emailHandlerFormonitorAuthorize",results = {
            @Result(name = SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "openUserChannelResult"}),
            @Result(name = "index", type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "index"}),
            @Result(name = "reg",type= Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","initReg","reDirectUrl", "${reDirectUrl}"}),
            @Result(name = "login",type= Constants.RESULT_NAME_REDIRECT_ACTION,params = {"actionName","easyLogon","reDirectUrl", "${reDirectUrl}"})
    })
    public String emailHandlerFormonitorAuthorize() {
       //baseUser.id2&accept=true&?+monitorAuthorize.email=chengwang1988@126.com
       //monitorAuthorizeDao.findByAuthorizeTo()

       String authorizeToEmail = this.getMonitorAuthorize().getMonitorAuthorizeToEmail();
       boolean accepted = this.getMonitorAuthorize().getAccept();

       if(!accepted){
           BaseUser authorize = baseUserDao.findById(this.getBaseUser().getId());
           monitorAuthorizeDao.cancelAuthorize(authorize,authorizeToEmail);
           return "index";
       }

       BaseUser authorizeTo = baseUserDao.findByEmail(authorizeToEmail);


        String reDirectUrl = getBasePath()+"/emailHandlerFormonitorAuthorize.html?monitorAuthorize.accept=true&monitorAuthorize.monitorAuthorizeToEmail="+authorizeToEmail;
        this.setReDirectUrl(reDirectUrl);
        if(authorizeTo == null){
            return "reg";
        }
        if(this.getSessionUserId() == null){
            return "login";
        }

       MonitorAuthorize temp=monitorAuthorizeDao.findByAuthorizeToEamil(authorizeToEmail);
       temp.setAccept(accepted);
       temp.setAuthorizeTo(authorizeTo);
       monitorAuthorizeDao.persistAbstract(temp);
       return SUCCESS;
    }

    @Action(value = "cancelAuthority")
    public void cancelAuthority() throws Exception{
        BaseUser authorize = baseUserDao.findById(this.getSessionUserId());
        BaseUser authorizeTo = baseUserDao.findById(this.getAuthorizeTo().getId());
        boolean result = monitorAuthorizeDao.cancelAuthorize(authorize,authorizeTo);

        PrintWriter out = ServletActionContext.getResponse().getWriter();
        if(result){
            out.println("success");
        }else{
            out.println("fail");
        }
    }



    public List<String> getAuthorityToEmails() {
        return authorityToEmails;
    }

    public void setAuthorityToEmails(List<String> authorityToEmails) {
        this.authorityToEmails = authorityToEmails;
    }

    public MonitorAuthorize getMonitorAuthorize() {
        return monitorAuthorize;
    }

    public void setMonitorAuthorize(MonitorAuthorize monitorAuthorize) {
        this.monitorAuthorize = monitorAuthorize;
    }

    public MonitorAuthorizeDao getMonitorAuthorizeDao() {
        return monitorAuthorizeDao;
    }

    public void setMonitorAuthorizeDao(MonitorAuthorizeDao monitorAuthorizeDao) {
        this.monitorAuthorizeDao = monitorAuthorizeDao;
    }

    public BaseUser getBaseUser() {
        return baseUser;
    }

    public void setBaseUser(BaseUser baseUser) {
        this.baseUser = baseUser;
    }

    public UserPrivateChannel getUserPrivateChannel() {
        return userPrivateChannel;
    }

    public void setUserPrivateChannel(UserPrivateChannel userPrivateChannel) {
        this.userPrivateChannel = userPrivateChannel;
    }

    public UserPrivateChannelDao getUserPrivateChannelDao() {
        return userPrivateChannelDao;
    }

    public void setUserPrivateChannelDao(UserPrivateChannelDao userPrivateChannelDao) {
        this.userPrivateChannelDao = userPrivateChannelDao;
    }

    public BaseUserDao getBaseUserDao() {
        return baseUserDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public BaseUser getAuthorizeTo() {
        return authorizeTo;
    }

    public void setAuthorizeTo(BaseUser authorizeTo) {
        this.authorizeTo = authorizeTo;
    }

    public String getReDirectUrl() {
        return reDirectUrl;
    }

    public void setReDirectUrl(String reDirectUrl) {
        this.reDirectUrl = reDirectUrl;
    }
}
