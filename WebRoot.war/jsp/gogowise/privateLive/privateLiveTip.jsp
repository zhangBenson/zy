<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/privateLive/privateLiveTip.css" rel="stylesheet"/>

<div id="prTipWrap" class="fl">
    <div id="tipHeader">
        <h3 class="h3_title"><s:property value="%{getText('private.tip1')}"/></h3>
    </div>

    <div id="tipContent" class="fl">
        <p><s:property value="%{getText('private.tip2')}"/></p>

        <p><s:property value="%{getText('private.tip3')}"/></p>
    </div>

    <ul id="tipOperate" class="fl">
        <li>
            <a href="createPrivateChannel.html" class="submit_btn_large"><s:property
                    value="%{getText('private.tip4')}"/></a>
        </li>
        <li>
            <a href="privateLiveCharge.html" class="submit_btn_large"><s:property
                    value="%{getText('private.tip5')}"/></a>
        </li>
    </ul>

    <s:if test="monitorAuthorizeToMe.size != 0">
        <div class="tipHeader fl">
            <h3 class="h3_title"><s:property value="%{getText('monitor.has.authored')}"/></h3>
        </div>

        <table>
            <tbody>
            <s:iterator value="monitorAuthorizeToMe">
                <tr>
                    <td><a href="userBlog.html?user.id=<s:property value="authorize.id"/>" target="_blank"><img
                            src="<s:property value="authorize.pic"/>"
                            alt="<s:property value="authorize.nickName"/>"/></a></td>
                    <td><a href="userBlog.html?user.id=<s:property value="authorize.id"/>" target="_blank"><s:property
                            value="%{getText('monitor.whose',{authorize.nickName})}"/></a></td>
                    <td>
                        <a href="openOtherPrivateChannel.html?otherUser.id=<s:property value="authorize.id"/>"><s:property
                                value="%{getText('shiyong.tips3')}"/></a></td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </s:if>
</div>