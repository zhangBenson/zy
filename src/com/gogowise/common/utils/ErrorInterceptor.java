package com.gogowise.common.utils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import org.apache.struts2.StrutsStatics;

import javax.servlet.http.HttpServletRequest;

/**
 * ErrorInterceptor
 *
 * @author 苑永志
 * @version 1.0
 * @since 2013年12月31日 17:19
 */
public class ErrorInterceptor implements Interceptor {
    private static Logger logger = LoggerFactory.getLogger(ErrorInterceptor.class);

    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        try {
            // 运行被拦截的Action,期间如果发生异常会被catch住
            return invocation.invoke();
        } catch (Exception e) {
            /**
             * 处理异常
             */
            String errorMsg = "出现错误信息，请查看日志！";
            //通过instanceof判断到底是什么异常类型
            if (e instanceof RuntimeException) {
                //未知的运行时异常
                RuntimeException re = (RuntimeException) e;
                //re.printStackTrace();
                errorMsg = re.getMessage();
            }

            //把自定义错误信息
            HttpServletRequest request = (HttpServletRequest) invocation
                    .getInvocationContext().get(StrutsStatics.HTTP_REQUEST);

            /**
             * 发送错误消息到页面
             */
            request.setAttribute("errorMsg", errorMsg);

            /**
             * 记录日志
             */
            logger.error(errorMsg,e);

            return "common_error";
        }
    }
}
