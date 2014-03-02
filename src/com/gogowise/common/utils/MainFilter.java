package com.gogowise.common.utils;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.util.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class MainFilter implements Filter {

//    private static Logger logger = LogManager.getLogger(MainFilter.class);
    private static List<String> NEED_LOGIN = new ArrayList<String>();


    static {
        NEED_LOGIN.add("/myfirstPage.html");
        NEED_LOGIN.add("/openPrivateChannel.html");
        NEED_LOGIN.add("/myForcastClass.html");
        NEED_LOGIN.add("/openClassSession.html");
        NEED_LOGIN.add("/one2twoSession.html");
        NEED_LOGIN.add("/one2threeSession.html");
        NEED_LOGIN.add("/one2manySession.html");
        NEED_LOGIN.add("/saveComment.html");
        NEED_LOGIN.add("/saveCourseResource.html");
        NEED_LOGIN.add("/courseconfirm.html");
        NEED_LOGIN.add("/saveCourse.html");
        NEED_LOGIN.add("/courseRefund.html");
        NEED_LOGIN.add("/regCourseSystem.html");
        NEED_LOGIN.add("/maintenanceSearchResult.html");
        NEED_LOGIN.add("/initUpdate.html");
        NEED_LOGIN.add("/initOrgLeague.html");
        NEED_LOGIN.add("/initOrgCourseCreation.html");
        NEED_LOGIN.add("/createCourse.html");
        NEED_LOGIN.add("/orgMeetingEmailConfirm.html");
        NEED_LOGIN.add("/interviewEmailHandle.html");
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
        NEED_LOGIN.add("/saveShow.html");
        NEED_LOGIN.add("/recommendShow.html");
        NEED_LOGIN.add("/quickBecomeFans.html");
        NEED_LOGIN.add("/startShow.html");
        NEED_LOGIN.add("/showManageResult.html");
        NEED_LOGIN.add("/showMatters.html");
        NEED_LOGIN.add("/startOnLive.html");
        NEED_LOGIN.add("/createOnlive.html");
        NEED_LOGIN.add("/emailHandleForLiveChannelInvitation.html");
        NEED_LOGIN.add("/maintenanceOnlive.html");
        NEED_LOGIN.add("/manageLiveChannelAds.html");
        NEED_LOGIN.add("/saveAdvertiseForLive.html");
        NEED_LOGIN.add("/createLiveChannelAdBid.html");
        NEED_LOGIN.add("/startPersonalOnlive.html");
        NEED_LOGIN.add("/initShowCreate.html");
        NEED_LOGIN.add("/myGGWAccount.html");
        NEED_LOGIN.add("/initTransfer.html");
        NEED_LOGIN.add("/initConsumption.html");
        NEED_LOGIN.add("/addLiveGoingAnnouncement.html");
        NEED_LOGIN.add("/createCourseAllInOne.html");
        NEED_LOGIN.add("/openPrivateChannel.html");
        NEED_LOGIN.add("/createPrivateChannel.html");
        NEED_LOGIN.add("/openUserChannelResult.html");
        NEED_LOGIN.add("/personalCenter.html");
        NEED_LOGIN.add("/openVirtualClassRoom.html");
        NEED_LOGIN.add("/uploadMaterialWithJson.html");
        NEED_LOGIN.add("/uploadCourseMaterial.html");
        NEED_LOGIN.add("/courseAdminManage.html");
        NEED_LOGIN.add("/changePoster.html");
        NEED_LOGIN.add("/lecturerClass.html");
        NEED_LOGIN.add("/orgAdminManage.html");
        NEED_LOGIN.add("/studentClass.html");
        NEED_LOGIN.add("/manageTeachers.html");
        NEED_LOGIN.add("/manageStudents.html");
        NEED_LOGIN.add("/playerClass.html");
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) throws ServletException {
    }
    private static Logger logger = LogManager.getLogger(MainFilter.class.getName());
    public void doFilter(ServletRequest arg0, ServletResponse arg1,
                         FilterChain arg2) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) arg0;
        HttpServletResponse response = (HttpServletResponse) arg1;
        HttpSession session = request.getSession();
        request.setCharacterEncoding( "UTF-8");
        logger.info("---------------" + request.getServletPath() + "-----------------");

        String requestUrl = request.getServletPath();

        if(org.apache.commons.lang.StringUtils.contains(requestUrl,"/video/") && session.getAttribute(Constants.SESSION_USER_ID) != null){
            String fileName = requestUrl.substring(requestUrl.lastIndexOf("/"));
            int beginIndex = fileName.indexOf('_');
            int endIndex = fileName.lastIndexOf('_');
            String perOnliveID = fileName.substring(beginIndex+1,endIndex);

            Utils.notReplaceFileFromfms((Integer)session.getAttribute(Constants.SESSION_USER_ID),Integer.parseInt(perOnliveID));

        }
        for (String url : NEED_LOGIN) {
            if (StringUtils.startsWithIgnoreCase(requestUrl, url) && session.getAttribute(Constants.SESSION_USER_ID) == null) {
                response.sendRedirect("easyLogon.html?reDirectUrl="+request.getServletPath()+ "?" +  java.net.URLEncoder.encode(Utils.getEmptyString(request.getQueryString()),"utf-8"));
                return;
            }
        }
//        if ( StringUtils.startsWithIgnoreCase(requestUrl, "/higSec")
//                && (session.getAttribute(Constants.HIG_SEC_USER_EMAIL) ==null ||!"zlhades@hotmail.com".equalsIgnoreCase((String) session.getAttribute(Constants.HIG_SEC_USER_EMAIL)) )) {
//            response.sendRedirect("easyLogon.html");
//            return;
//        }
        arg2.doFilter(arg0, arg1);
    }



}
