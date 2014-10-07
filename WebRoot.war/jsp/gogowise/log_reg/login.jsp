<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link href="css/log_reg.css" rel="stylesheet"/>

<div class="lr_container">
    <%--<div class="lr_top fl">--%>
    <%--<a href="index.html">--%>
    <%--<img src="images/gogowise_logo_big_darkblue_error.png"/>--%>
    <%--</a>--%>
    <%--<span><s:text name="share.happy.share.knowlege"/></span>--%>
    <%--</div>--%>
    <div class="lr_left fl">
        <a href="javascript:;" class="stand_out"><s:text name="button.log.in"/></a> <br/>
        <a href="initReg.html"><s:text name="user.info.identity.finish.reg"/></a>
    </div>
    <div class="lr_right fr">
        <s:form validate="true" theme="css_xhtml" method="post" action="logon">
            <s:hidden name="reDirectUrl" id="reDirectUrl"/>

            <div class="item_wrap">
                <div class="option_title"><s:text name="email"/></div>
                &nbsp;&nbsp;
                <span id="log_email_tip" class="tip_words">*</span>
                <s:textfield cssClass="textfield" name="user.email"/>
                <span class="email_img"></span>
            </div>


            <div class="item_wrap">
                <div class="option_title"><s:text name="password"/></div>
                &nbsp;&nbsp;
                <span id="log_pwd_tip" class="tip_words">*</span>
                <s:password cssClass="textfield" name="user.password"/>
                <span class="pwd_img"></span>
            </div>

            <div class="submit item_wrap">
                <div class="forget">
                    <a href="initRepassword.html"><s:text name="link.forget.pwd"/>？</a>
                </div>
                <input type="submit" class="subBtn" value="<s:text name="button.log.in"/>"/>
            </div>

        </s:form>
    </div>
</div>
