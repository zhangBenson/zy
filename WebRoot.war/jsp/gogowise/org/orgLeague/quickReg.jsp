<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/org/orgLeague_js.jsp" %>
<link href="js/uploadify/uploadify.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<%--<script type="text/javascript" src="js/orgLeague.js"></script>--%>
<link href="css/orgLeague/<s:text name='orgleague.css.filename'/>" rel="stylesheet" type="text/css"/>
<style type="text/css">
    .wwgrp br {
        display: none;
    }
</style>

<div id="orgLeagueDiv">
    <div id="orgCenterDiv">
        <div class="secondTipHead">
            <span><s:property value="%{getText('org.info.required')}"/></span></div>
        <s:form action="saveThirdStep" theme="simple" id="responserForm" enctype="multipart/form-data" validate="true"
                method="post">
            <s:hidden name="responser.id"/>
            <s:hidden name="org.id"/>
            <ul class="principalMsg">
                <li class="quick_long_li">
                    <div class="option_tittle"><s:property value="%{getText('name.of.person.in.change')}"/></div>
                    <p id="secondStepNameWarn" class="input_msg"></P>

                    <div class="input_content"><s:textfield cssClass="inputName" id="secondStepName"
                                                            name="org.responsiblePerson.userName"/></div>
                </li>
                <li class="quick_long_li">
                    <div class="option_tittle"><s:property value="%{getText('orgleague.info.orgName')}"/></div>
                    <p id="orgNameWarn" style="color: red; display: inline;"></p>
                    <s:textfield id="thirdStepName" name="org.schoolName" cssClass="inputName"/>
                </li>
                <li class="quick_long_li">
                    <div class="option_tittle"><s:property value="%{getText('orgleague.info.contact')}"/></div>
                    <p id="secondStepContactWarn" class="input_msg"></P>

                    <div class="input_content"><s:textfield id="secondStepContact" cssClass="inputTel"
                                                            name="org.responsiblePerson.telphone"/></div>
                </li>
                <li class="quick_long_li">
                    <div class="option_tittle"><s:property value="%{getText('orgleague.info.orgLogo')}"/></div>
                        <%--<s:file name="upload"/>--%>
                    <div class="file_upload"><s:file name="fileupload" id="fileupload1"/></div>
                    <div class="file_upload_msg1 input_msg"></div>
                    <s:hidden name="hidFile1" id="hidFile1"/>
                    <div id="fileQueue"></div>
                </li>
                <li class="quick_long_li">
                    <div class="option_tittle"><s:property value="%{getText('orgleague.info.cetification')}"/></div>
                        <%--<s:file name="upload1"/>--%>
                    <div class="file_upload"><s:file name="fileupload2" id="fileupload2"/></div>
                    <div class="file_upload_msg2 input_msg"></div>
                    <s:hidden name="hidFile2" id="hidFile2"/>
                    <div id="fileQueue"></div>
                </li>
            </ul>
        </s:form>
        <div class="nextAndBack">
            <a href="initOrgLeague.html">
                <div class="back"></div>
            </a>
            <a>
                <div class="next secondStepNext" onclick="return submitSecondStepForm();"></div>
            </a>
        </div>
        <ul class="orgStep">
            <li><s:property value="%{getText('org.warmtip')}"/></li>
            <%--<li><s:property value="%{getText('orgleague.identity.confirm')}"/></li>--%>
            <li class="third"><s:property value="%{getText('orgleague.info.fill')}"/></li>
            <li><s:property value="%{getText('orgleague.info.submit')}"/></li>
        </ul>
    </div>
</div>

<script type="text/javascript">

</script>


