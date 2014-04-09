<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/privateLive/privateLiveCharge.css" rel="stylesheet"/>

<div id="prChargeWrap" class="fl">
    <div id="chargeHeader">
        <h3 class="h3_title"><s:property value="%{getText('confirmCharge.tip1')}"/></h3>
    </div>

    <div id="chargePackage" class="fl">
        <h4><s:property value="%{getText('confirmCharge.tip2')}"/></h4>
        <table cellpadding="0" cellspacing="0">
            <tr class="title">
                <th><s:property value="%{getText('confirmCharge.tip3')}"/></th>
                <th><s:property value="%{getText('confirmCharge.tip4')}"/></th>
                <th><s:property value="%{getText('confirmCharge.tip5')}"/></th>
                <th><s:property value="%{getText('confirmCharge.tip6')}"/></th>
                <th><s:property value="%{getText('confirmCharge.tip7')}"/></th>
            </tr>

            <s:if test="userPrivateChannel.channelCombo == 1">
                <tr>
                    <td>1</td>
                    <td><s:property value="%{getText('confirmCharge.tip8')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip9')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip10')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip11')}"/></td>
                </tr>
            </s:if>
            <s:if test="userPrivateChannel.channelCombo == 2">
                <tr>
                    <td>2</td>
                    <td><s:property value="%{getText('confirmCharge.tip12')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip13')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip14')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip15')}"/></td>
                </tr>
            </s:if>
            <s:if test="userPrivateChannel.channelCombo == 3">
                <tr>
                    <td>3</td>
                    <td><s:property value="%{getText('confirmCharge.tip16')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip17')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip18')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip19')}"/></td>
                </tr>
            </s:if>
            <s:if test="userPrivateChannel.channelCombo == 4">
                <tr>
                    <td>4</td>
                    <td><s:property value="%{getText('confirmCharge.tip20')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip21')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip22')}"/></td>
                    <td><s:property value="%{getText('confirmCharge.tip23')}"/></td>
                </tr>
            </s:if>
        </table>
    </div>

    <div id="chargeSelect" class="fl">
        <s:form action="chargeSuccess">
            <s:hidden name="userPrivateChannel.channelCombo"/>
            <s:hidden name="comboNum"/>
            <s:hidden name="totalCharges"/>
            <s:property value="%{getText('confirmCharge.tip24')}"/><s:property value="comboNum"/><br/>
            <br/>
            <br/>
            <s:property value="%{getText('confirmCharge.tip25')}"/><s:property value="totalCharges"/> &nbsp;&nbsp;
            <s:property
                    value="%{getText('confirmCharge.tip26')}"/> &nbsp;&nbsp;&nbsp;<a href="myGGWAccount.html"><s:property
                value="%{getText('confirmCharge.tip27')}"/></a> <br/><br/>
            <input type="submit" class="submit_btn_large"
                   value="<s:property value="%{getText('confirmCharge.tip28')}"/>"/>
        </s:form>
    </div>
</div>