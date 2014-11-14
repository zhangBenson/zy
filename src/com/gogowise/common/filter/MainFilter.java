package com.gogowise.common.filter;

import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.EmailUtil;
import com.gogowise.common.utils.Utils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
public class MainFilter implements Filter {

    private static Logger logger = LogManager.getLogger(MainFilter.class.getName());
    //    private static Logger logger = LogManager.getLogger(MainFilter.class);
    private static List<String> NEED_LOGIN = new ArrayList<>();


    static {
        NEED_LOGIN.add("/myfirstPage.html");
        NEED_LOGIN.add("/myForcastClass.html");
        NEED_LOGIN.add("/saveComment.html");
        NEED_LOGIN.add("/courseconfirm.html");
        NEED_LOGIN.add("/saveCourse.html");
        NEED_LOGIN.add("/courseRefund.html");
        NEED_LOGIN.add("/regCourseSystem.html");
        NEED_LOGIN.add("/maintenanceSearchResult.html");
        NEED_LOGIN.add("/initUpdate.html");
        NEED_LOGIN.add("/initOrgCourseCreation.html");
        NEED_LOGIN.add("/createCourse.html");
        NEED_LOGIN.add("/emailHandleForCourseCreation.html");
        NEED_LOGIN.add("/startSupervision.html");
        NEED_LOGIN.add("/myAgeCourses.html");
        NEED_LOGIN.add("/organizationMatter.html");
        NEED_LOGIN.add("/initCourseconfirm.html");
        NEED_LOGIN.add("/orgSaveResPerson.html");
        NEED_LOGIN.add("/orgInfoUpdate.html");
        NEED_LOGIN.add("/orgSaveOrgInfo.html");
        NEED_LOGIN.add("/orgSaveContactInfo.html");
        NEED_LOGIN.add("/saveOrgAdvertiseFile.html");
        NEED_LOGIN.add("/orgMaterialDownload.html");
        NEED_LOGIN.add("/livingClass.html");
        NEED_LOGIN.add("/showManageResult.html");
        NEED_LOGIN.add("/showMatters.html");
        NEED_LOGIN.add("/initShowCreate.html");
        NEED_LOGIN.add("/myGGWAccount.html");
        NEED_LOGIN.add("/initTransfer.html");
        NEED_LOGIN.add("/initConsumption.html");
        NEED_LOGIN.add("/createCourseAllInOne.html");
        NEED_LOGIN.add("/personalCenter.html");
        NEED_LOGIN.add("/openVirtualClassRoom.html");
        NEED_LOGIN.add("/uploadMaterialWithJson.html");
        NEED_LOGIN.add("/uploadCourseMaterial.html");
        NEED_LOGIN.add("/courseAdminManage.html");
        NEED_LOGIN.add("/changePoster.html");
        NEED_LOGIN.add("/lecturerClass.html");
        NEED_LOGIN.add("/studentClass.html");
        NEED_LOGIN.add("/manageTeachers.html");
        NEED_LOGIN.add("/manageStudents.html");
//        NEED_LOGIN.add("/playerClass.html");
        NEED_LOGIN.add("/manageOrgUsers.html");
        NEED_LOGIN.add("/designGame.html");

    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest arg0, ServletResponse arg1,
                         FilterChain arg2) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) arg0;
        HttpServletResponse response = (HttpServletResponse) arg1;
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        logger.info("-----" + Utils.getFullUrl(request) + "----");

        String requestUrl = request.getServletPath();
        try {

            for (String url : NEED_LOGIN) {
                if (StringUtils.startsWithIgnoreCase(requestUrl, url) && session.getAttribute(Constants.SESSION_USER_ID) == null) {
                    response.sendRedirect("easyLogon.html?reDirectUrl=" + request.getServletPath() + "?" + java.net.URLEncoder.encode(Utils.getEmptyString(request.getQueryString()), "utf-8"));
                    return;
                }
            }

            arg2.doFilter(arg0, arg1);


        } catch (Throwable e) {
            logger.error("error==:", e);
            EmailUtil.sendMail("zlhades@hotmail.com", "myErrorInfo", Utils.getFullUrl(request) + "\t" + Utils.getExceptionDetails(e));
            response.sendRedirect("/chucuola.htm");
        }
    }


}
