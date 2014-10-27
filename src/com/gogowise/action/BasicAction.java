package com.gogowise.action;

import com.gogowise.common.config.ConfigConstants;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.user.enity.BaseUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;

public class BasicAction extends ActionSupport {
    //    public static final String BASIC_PACKAGE = "basic-package";
    public static final String BASE_NAME_SPACE = "/";
    public static final String RESULT_JSON = "json";
    public static String HOST_URL_APP;


    public static final String MY_FIRST_PAGE = "myfirstPage";
    public static final String PERSONAL_CENTER = "personalCenter";
    public static final String COMMON_ERROR = "common_error";

    private String errorMsg;

    private Pagination pagination = new Pagination();

    protected static Logger LOGGER = LogManager.getLogger(BasicAction.class);



    public void redirectToLogin() {

        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        HttpServletResponse response = (HttpServletResponse) ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
        try {
            response.sendRedirect("easyLogon.html?reDirectUrl=" + request.getServletPath() + "?" + java.net.URLEncoder.encode(Utils.getEmptyString(request.getQueryString()), "utf-8"));
        } catch (IOException e) {
            LOGGER.error("error in redirectToLogin : ", e);
        }
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
        if (ConfigConstants.SITE_NAME != null) {
            return HOST_URL_APP = "http://" + ConfigConstants.SITE_NAME;
        } else if (ActionContext.getContext() == null) {
            return "http://www.gogowise.com";
        }
        ActionContext ctx = ActionContext.getContext();
        HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
        //        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        if (basePath.contains("beta")) {
            HOST_URL_APP = "http://beta.gogowise.com";
        } else if (basePath.contains("localhost")) {
            HOST_URL_APP = "http://localhost:8080";
        } else if (basePath.contains("test")) {
            HOST_URL_APP = "http://test.gogowise.com";
        } else {
            HOST_URL_APP = "http://www.gogowise.com";
        }
        return HOST_URL_APP;
    }

    protected void setUserToSession(BaseUser user) {

        ActionContext.getContext().getSession().put(Constants.SESSION_USER_ID, user.getId());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_NICKNANE, user.getNickName());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_EMAIL, user.getEmail());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_LOGO_URL, user.getPic());
        ActionContext.getContext().getSession().put(Constants.SESSION_USER_FANSNUM, user.getFansNum() != null ? user.getFansNum() : 0);
    }

    protected String redirectToMyCenter(boolean isTeacher) {

        return isTeacher ? MY_FIRST_PAGE : PERSONAL_CENTER;
    }

    public Pagination getPagination() {

        return pagination;
    }

    public void setPagination(Pagination pagination) {

        this.pagination = pagination;
    }

    public void addActionErrorInfoWithKey(String messageKey) {

        this.addActionError(this.getText(messageKey));
    }

    public String getSecUid() {
//        return DESPlus.encode(this.getSessionUserId() + "");//TODO comments this for GMAE not done yet.
        return this.getSessionUserId() + "";
    }

    /**
     * TODO　remove when done I18N
     */
    @Deprecated
    public void setToEn() {
        ActionContext.getContext().getSession().put("WW_TRANS_I18N_LOCALE", new Locale("en", "US"));
        ActionContext.getContext().getSession().put("request_locale", new Locale("en", "US"));
        ActionContext.getContext().getSession().put("request_only_locale", new Locale("en", "US"));
        ActionContext.getContext().setLocale(new Locale("en", "US"));
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
