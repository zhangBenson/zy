<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/privateLive/privateLiveCharge.css" rel="stylesheet"/>

<div id="prChargeWrap" class="fl">
    <div id="chargeHeader">
        <h3 class="h3_title"><s:property value="%{getText('privateLiveCharge.tip1')}"/></h3>
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

            <tr>
                <td>1</td>
                <td><s:property value="%{getText('confirmCharge.tip8')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip9')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip10')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip11')}"/></td>
            </tr>
            <tr>
                <td>2</td>
                <td><s:property value="%{getText('confirmCharge.tip12')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip13')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip14')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip15')}"/></td>
            </tr>
            <tr>
                <td>3</td>
                <td><s:property value="%{getText('confirmCharge.tip16')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip17')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip18')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip19')}"/></td>
            </tr>
            <tr>
                <td>4</td>
                <td><s:property value="%{getText('confirmCharge.tip20')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip21')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip22')}"/></td>
                <td><s:property value="%{getText('confirmCharge.tip23')}"/></td>
            </tr>
        </table>
    </div>

    <div id="chargeSelect" class="fl">
        <s:form action="initConfirmCharge">
                <h4><s:property value="%{getText('privateLiveCharge.tip2')}"/></h4>
                <s:select list="#{'1':'1','2':'2','3':'3','4':'4'}" headerKey="4" headerValue="4" cssClass="long_text_field" id="step2_course_type" name="userPrivateChannel.channelCombo"/>&nbsp;<s:property value="%{getText('privateLiveCharge.tip3')}"/> <br/><br/>
                <input type="text" name="comboNum" id="comboNum" />&nbsp;<s:property value="%{getText('privateLiveCharge.tip4')}"/>&nbsp;&nbsp;<span class="tip_words" id="comboNumMsg"></span><br/>
                <input type="submit" class="submit_btn_large" onclick="return checkInteger('comboNum','comboNumMsg');" value="<s:property value="%{getText('privateLiveCharge.tip5')}"/>" />
        </s:form>
    </div>
</div>