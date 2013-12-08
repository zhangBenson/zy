package com.gogowise.common.utils;

import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import com.gogowise.rep.org.dao.OrganizationDao;
import org.springframework.util.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: Jun 21, 2009
 * Time: 3:29:14 PM
 * To change this template use File | Settings | File Templates.
 */
public class OrgSecFilter implements Filter {


    private BaseUserDao baseUserDao;

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


        if ( StringUtils.startsWithIgnoreCase(requestUrl, "/higSec")
                && (session.getAttribute(Constants.HIG_SEC_USER_EMAIL) ==null ||!baseUserRoleTypeDao.havePermission(baseUserDao.findByEmail((String) session.getAttribute(Constants.HIG_SEC_USER_EMAIL)).getId(), "admin") )) {
            response.sendRedirect("easyLogon.html");
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
}
