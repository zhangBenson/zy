package com.gogowise.action;

import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.MD5;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.live.UserPrivateChannelDao;
import com.gogowise.rep.live.enity.UserPrivateChannel;
import com.gogowise.rep.user.enity.BaseUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
public class BasicAction extends ActionSupport {
    public static final String BASIC_PACKAGE = "basic-package";
    public static final String BASE_NAME_SPACE = "/";
    public static final String RESULT_JSON = "json";
    public static  String HOST_URL_APP;
    private Pagination pagination = new Pagination();
    private UserPrivateChannelDao userPrivateChannelDao;


    protected static Logger logger = LogManager.getLogger(BasicAction.class.getName());

    protected String getExtention(String fileName) {
        int pos = fileName.lastIndexOf(".");
        return fileName.substring(pos);
    }

    protected void setPassToMD5(BaseUser user) {
        user.setPassword(MD5.endCode(user.getPassword()));
    }

    protected Integer getSessionUserId() {

        if (ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID) != null)
            return (Integer) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID);
        return null;
    }

    protected String getSessionNickName() {
        return (String) ActionContext.getContext().getSession().get(Constants.SESSION_USER_NICKNANE);
    }

    protected String getSessionUserEmail() {
        return (String) ActionContext.getContext().getSession().get(Constants.SESSION_USER_EMAIL);
    }

    public static String getBasePath() {
        if (HOST_URL_APP != null) {
            return HOST_URL_APP;
        }
        if (ActionContext.getContext() == null) {
            return "http://www.gogowise.com";
        }
        ActionContext ctx = ActionContext.getContext();
        HttpServletRequest request = (HttpServletRequest) ctx
                .get(ServletActionContext.HTTP_REQUEST);
//        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName()
                + ":" + request.getServerPort();
        if (basePath.contains("beta")) {
            HOST_URL_APP = "http://beta.gogowise.com";
        } else if (basePath.contains("localhost")) {
            HOST_URL_APP = "http://localhost:8080";
        } else if (basePath.contains("test")) {
            HOST_URL_APP = "http://test.gogowise.com";
        }else {
            HOST_URL_APP = "http://www.gogowise.com";
        }
        return HOST_URL_APP;
    }

    protected void setUserToSession(BaseUser user) {
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_ID, user.getId());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_NICKNANE, user.getNickName());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_EMAIL, user.getEmail());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_LOGO_URL, user.getPic());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_FANSNUM,user.getFansNum() != null?user.getFansNum():0);

        if(user.getOpenPrivateChannel() != null && user.getOpenPrivateChannel()){
             UserPrivateChannel userPrivateChannel = userPrivateChannelDao.findByUser(user.getId());
            if(userPrivateChannel != null)
                ActionContext.getContext().getSession().put(Constants.SESSION_USER_PRIVATE_CHANNEL_ID,userPrivateChannel.getId());
        }
    }


    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public static String getEmptyString(String s) {
           return  s== null ? "": s;
    }
    public static Integer getEmptyInteger(Integer s) {
           return  s == null ? 0: s;
    }

    public UserPrivateChannelDao getUserPrivateChannelDao() {
        return userPrivateChannelDao;
    }

    public void setUserPrivateChannelDao(UserPrivateChannelDao userPrivateChannelDao) {
        this.userPrivateChannelDao = userPrivateChannelDao;
    }
}
