package com.gogowise.common.utils;

import com.gogowise.action.BasicAction;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import org.apache.struts2.StrutsStatics;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class ErrorInterceptor implements Interceptor {
    private static final Logger logger = LoggerFactory.getLogger(ErrorInterceptor.class);
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        try {
            return invocation.invoke();
        } catch (Exception e) {
            try {
                sessionFactory.getCurrentSession().getTransaction().rollback();
            } catch (Exception ex) {
                logger.error("roll back failed");
            }
            HttpServletResponse response = (HttpServletResponse) invocation
                    .getInvocationContext().get(StrutsStatics.HTTP_RESPONSE);
            HttpServletRequest request = (HttpServletRequest) invocation
                    .getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
            String detailError = Utils.getFullUrl(request) + "\t" + Utils.getExceptionDetails(e);
            request.setAttribute("errorMsg", detailError);
            logger.error("error==:" + Utils.getFullUrl(request), e);
            EmailUtil.sendMail("zlhades@hotmail.com", "myErrorInfo", detailError);
//            response.sendRedirect("/chucuola.htm");
            return BasicAction.COMMON_ERROR;
        }
    }
}
