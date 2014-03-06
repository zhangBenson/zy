package com.gogowise.common.filter;

import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.dao.BaseUserRoleTypeDao;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Component
public class SecDomainFilter implements Filter {

    private Logger logger = LogManager.getLogger(this.getClass());

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
//        HttpSession session = request.getSession();
        String requestUrl = request.getServletPath();

        String secDomainString = getSecDomainString(request);
        if (StringUtils.isNotBlank(secDomainString) && StringUtils.endsWith(requestUrl, "index.jsp")
                && secDomainString.length() > 4
                ) {
            //orgBlog.html?org.id=1
            String disPatcherUrl = "/orgBlog.html?org.secDomain=" + secDomainString.trim();
            request.getRequestDispatcher(disPatcherUrl).forward(request, response);
        } else if (requestUrl.equalsIgnoreCase("/orgBlog.html") && request.getParameter("org.id") != null) {
            Integer orgId = Integer.parseInt(request.getParameter("org.id"));
            Organization organization = organizationDao.findById(orgId);
            if (organization != null && StringUtils.isNotBlank(organization.getSecDomain())) {
                response.sendRedirect("http://" + organization.getSecDomain() + ".gogowise.com");
            }
        }
//        else if (StringUtils.contains(".html") ) {
//
//        }


        arg2.doFilter(arg0, arg1);
    }

    private String getSecDomainString(HttpServletRequest request) {
        String[] domainParts = request.getServerName().split("\\.");
        for (int i = domainParts.length - 1; i >= 0; i--) {
            if ("gogowise".equals(domainParts[i])) {
                if (i == 0) {
                    return null;
                } else {
                    return domainParts[i - 1];
                }
            }
        }
        return null;
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
