<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link type="text/css" rel="stylesheet" href="css/roomHeader.css">


<div id="header">
    <h1>
        <a href="index.html" target="_blank" title="<s:property value="%{getText('title.gogowise')}"/>"></a>
    </h1>

    <p class="words"><s:property value="%{getText('share.happy.share.knowlege')}"/></p>

    <s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']"/>
    <s:bean id="locales" name="com.gogowise.action.user.Locales">
        <s:param name="current"
                 value="#SESSION_LOCALE == null?locale:#SESSION_LOCALE"/>
    </s:bean>

    <s:if test="#session.email !=null">
        <p class="handle">
            <a href="userBlog.html?user.id=<s:property value="#session.userID"/>" target="_blank"
               class="nick"><s:property value="#session.nickName"/></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="myfirstPage.html" target="_blank"><s:property value="%{getText('usermenu.item.myhomepage')}"/></a>
            &nbsp;&nbsp;<strong>|</strong>&nbsp;&nbsp;
            <a href="initUpdate.html" target="_blank"><s:property
                    value="%{getText('account.item.accountsettings')}"/></a>
            &nbsp;&nbsp;<strong>|</strong>&nbsp;&nbsp;
            <a href="myGGWAccount.html" target="_blank"><s:property
                    value="%{getText('usermenu.item.zhibi.myAccount')}"/></a>
            &nbsp;&nbsp;<strong>|</strong>&nbsp;&nbsp;
            <a href="exitSystem.html"><s:property value="%{getText('href.logout')}"/></a>
        </p>
    </s:if>
    <s:else>
        <p class="handle">
            <a href="login.html" id="login_btn"><s:property value="%{getText('Login')}"/></a>
            &nbsp;&nbsp;<strong>|</strong>&nbsp;&nbsp;
            <a href="initReg.html" target="_blank"><s:property value="%{getText('user.info.identity.finish.reg')}"/></a>
        </p>
    </s:else>

</div>

<script type="text/javascript">
    $(function () {
        $("#login_btn").fancybox({
            "type": "iframe",
            "width": 350,
            "height": 270
        });
    });
</script>
