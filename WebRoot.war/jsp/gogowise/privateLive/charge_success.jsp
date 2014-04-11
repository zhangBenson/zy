<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link type="text/css" href="css/privateLive/privateLiveTip.css" rel="stylesheet"/>

<div id="prTipWrap" class="fl">
    <div id="tipHeader">
        <h3 class="h3_title"><s:property value="%{getText('chargeSuccess.tip1')}"/></h3>
    </div>

    <div id="tipContent" class="fl">
        <s:if test="chargeSuccess">
            <h3><s:property value="%{getText('chargeSuccess.tip2')}"/></h3>

            <p><s:property value="%{getText('chargeSuccess.tip3')}"/>&nbsp;<a class="submit_btn"
                                                                              href="initConsumption.html"><s:property
                    value="%{getText('chargeSuccess.tip4')}"/></a>&nbsp;<s:property
                    value="%{getText('chargeSuccess.tip5')}"/></p>

            <p><s:property value="%{getText('chargeSuccess.tip3')}"/>&nbsp;<a class="submit_btn"
                                                                              href="openPrivateChannel.html?userPrivateChannel.id=<s:property value="userPrivateChannel.id"/>"><s:property
                    value="%{getText('chargeSuccess.tip4')}"/></a>&nbsp;<s:property
                    value="%{getText('chargeSuccess.tip6')}"/></p>
        </s:if>
        <s:else>
            <h3><s:property value="%{getText('chargeSuccess.tip7')}"/></h3>

            <p><s:property value="%{getText('chargeSuccess.tip3')}"/>&nbsp;<a class="submit_btn"
                                                                              href="myGGWAccount.html"><s:property
                    value="%{getText('chargeSuccess.tip4')}"/></a>&nbsp;<s:property
                    value="%{getText('chargeSuccess.tip8')}"/></p>
        </s:else>
    </div>
</div>