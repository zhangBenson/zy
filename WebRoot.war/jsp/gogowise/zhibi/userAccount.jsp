<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link href="css/zhibi/zhibi.css" rel="stylesheet" type="text/css"/>
<link href="css/zhibi/account.css" rel="stylesheet" type="text/css"/>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="stand_out">
            <a href="myGGWAccount.html"><s:property value="%{getText('usermenu.item.zhibi.myAccount')}"/></a>
        </li>
        <li class="">
            <a href="#"><s:property value="%{getText('usermenu.item.zhibi.fulfilment')}"/></a>
        </li>
        <li class="">
            <a href="initTransfer.html"><s:property value="%{getText('usermenu.item.zhibi.change')}"/></a>
        </li>
        <li class="">
            <a href="initConsumption.html"><s:property value="%{getText('usermenu.item.zhibi.query')}"/></a>
        </li>
        <li class="">
            <a href="javascript:;"><s:property value="%{getText('usermenu.item.zhibi.to.cash')}"/></a>
        </li>
    </ul>
</div>

<div class="account">
    <table>
        <tr><th><s:property value="%{getText('gogowise.zhibi.account')}"/></th><th><s:property value="%{getText('menber.reg.nickName')}"/></th><th><s:property value="%{getText('gogowise.zhibi.type')}"/></th><th><s:property value="%{getText('gogowise.zhibi.curr.left')}"/></th><th><s:property value="%{getText('gogowise.zhibi.available.left')}"/></th></tr>
        <tr><td><s:property value="#session.email"/></td><td><s:property value="#session.nickName"/></td><td><s:property value="%{getText('course.consumptionType.true')}"/></td><td><s:property value="userAccountInfo.zhiBi"/></td><td><s:property value="userAccountInfo.availableZhiBi"/></td></tr>
    </table>
</div>