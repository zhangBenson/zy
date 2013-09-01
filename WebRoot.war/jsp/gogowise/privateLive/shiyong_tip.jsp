<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/privateLive/privateLiveTip.css" rel="stylesheet"/>

<div id="prTipWrap" class="fl">
    <div id="tipHeader" class="tipHeader fl">
        <h3 class="h3_title"><s:property value="%{getText('shiyong.title')}"/></h3>
    </div>

    <div id="tipContent" class="fl">
        <p><s:property value="%{getText('shiyong.tips2')}"/></p>
        <%--<p>--%>
            <%--<s:if test="validDays > 0">--%>
                <%--<s:property value="%{getText('shiyong.tips')}"/><s:property value="validDays"/><s:property value="%{getText('course.time.day')}"/>--%>
            <%--</s:if>--%>
            <%--<s:else>--%>
                <%--<s:property value="%{getText('shiyong.tips1')}"/>--%>
            <table>
                <tr><th><s:property value="%{getText('eye.home.monitor')}"/></th><th><s:property value="%{getText('eye.comp.monitor')}"/></th><th><s:property value="%{getText('eye.shop.monitor')}"/></th></tr>
                <tr><td><s:property value="%{getText('eye.home.monitor.care')}"/></td><td><s:property value="%{getText('eye.comp.monitor.improve')}"/></td><td><s:property value="%{getText('eye.shop.monitor.out')}"/></td></tr>
            </table>
        <%--</p>--%>
    </div>

    <ul id="tipOperate" class="fl">
        <%--<s:if test="validDays > 0">--%>
        <li>
            <a href="openPrivateChannel.html" class="submit_btn_large"><s:property value="%{getText('shiyong.tips3')}"/></a>
        </li>
        <li>
            <a href="monitorAuthority.html" class="submit_btn_large"><s:property value="%{getText('monitor.authority')}"/></a>
        </li>
        <%--</s:if>--%>
        <%--<li>--%>
            <%--<a href="privateLiveCharge.html" class="submit_btn_large"><s:property value="%{getText('control.room.charge')}"/></a>--%>
        <%--</li>--%>
    </ul>

    <s:if test="monitorAuthorizeToMe.size != 0">
        <div class="tipHeader fl">
            <h3 class="h3_title"><s:property value="%{getText('monitor.has.authored')}"/></h3>
        </div>

        <table>
            <tbody>
              <s:iterator value="monitorAuthorizeToMe">
                <tr>
                    <td><a href="userBlog.html?user.id=<s:property value="authorize.id"/>" target="_blank"><img src="<s:property value="authorize.pic"/>" alt="<s:property value="authorize.nickName"/>"/></a></td>
                    <td><a href="userBlog.html?user.id=<s:property value="authorize.id"/>" target="_blank"><s:property value="%{getText('monitor.whose',{authorize.nickName})}"/></a></td>
                    <td><a href="openOtherPrivateChannel.html?otherUser.id=<s:property value="authorize.id"/>"><s:property value="%{getText('shiyong.tips3')}"/></a></td>
                </tr>
               </s:iterator>
            </tbody>
        </table>
    </s:if>

</div>