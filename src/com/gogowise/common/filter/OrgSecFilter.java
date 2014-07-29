package com.gogowise.common.filter;

import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.course.CourseService;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.org.OrgService;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.user.UserService;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@Component
public class OrgSecFilter implements Filter {


    private BaseUserDao baseUserDao;
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private CourseDao   courseDao;
    @Autowired
    private ClassDao classDao;
    public void destroy() {
    }

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    private OrganizationDao organizationDao;
    private BaseUserRoleTypeDao baseUserRoleTypeDao;

    public void doFilter(ServletRequest arg0, ServletResponse arg1,
                         FilterChain arg2) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) arg0;
        HttpServletResponse response = (HttpServletResponse) arg1;
        HttpSession session = request.getSession();
        String requestUrl = request.getServletPath();


        if (StringUtils.startsWithIgnoreCase(requestUrl, "/higSec")
                && (session.getAttribute(Constants.HIG_SEC_USER_EMAIL) == null || !userService.havePermission(baseUserDao.findByEmail((String) session.getAttribute(Constants.HIG_SEC_USER_EMAIL)).getId(), "admin"))) {
            response.sendRedirect("easyLogon.html");
            return;
        }

        //判断是否有权限访问该页面，private Course
        boolean hasNoAccess = false;

        if ( StringUtils.startsWithIgnoreCase(requestUrl, "/voaCourseBlog") ||
             StringUtils.startsWithIgnoreCase(requestUrl, "/playerClass") )
        {
            Integer courseID = null;

            if( StringUtils.startsWithIgnoreCase(requestUrl, "/playerClass") )
            {
                Integer courseClassID = Integer.valueOf( request.getParameter("courseClass.id") );
                courseID = classDao.findById(courseClassID).getCourse().getId();
            }
            else
            {
                courseID = Integer.valueOf( request.getParameter("course.id") );
            }

            Boolean isPublic = courseDao.findById(courseID).getIsPublic();

            if( session.getAttribute(Constants.SESSION_USER_ID) == null ){
                if( isPublic != null && !isPublic ){
                    hasNoAccess = true;
                }
            }else{
                Integer userID   = (Integer)session.getAttribute(Constants.SESSION_USER_ID);
                if( !courseService.hasAccessToPrivateCourse(userID, courseID) ){
                    hasNoAccess = true;
                }
            }
        }

        if( hasNoAccess == true )
        {
            if( session.getAttribute(Constants.SESSION_USER_ID) == null ){
                response.sendRedirect("easyLogon.html?reDirectUrl="+request.getServletPath()+ "?" +  java.net.URLEncoder.encode(Utils.getEmptyString(request.getQueryString()),"utf-8"));
            }
            else {
                response.sendRedirect("noPermission.html");
            }
            return;
        }



        arg2.doFilter(arg0, arg1);
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

    public BaseUserRoleTypeDao getBaseUserRoleTypeDao() {
        return baseUserRoleTypeDao;
    }

    public void setBaseUserRoleTypeDao(BaseUserRoleTypeDao baseUserRoleTypeDao) {
        this.baseUserRoleTypeDao = baseUserRoleTypeDao;
    }

    public ClassDao getClassDao() {
        return classDao;
    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }
}
