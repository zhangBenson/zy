<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link href="js/uploadify/uploadify.css" type="text/css" rel="stylesheet"/>
<%--<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>--%>
<%--<script type="text/javascript" src="js/uploadify/swfobject.js"></script>--%>
<script type="text/javascript" src="js/orgLeague.js"></script>
<link href="css/orgLeague/<s:text name='orgleague.css.filename'/>" rel="stylesheet" type="text/css"/>
<style type="text/css">
    .wwgrp br {
        display: none;
    }
</style>

<div id="orgLeagueDiv">
    <div id="orgCenterDiv">
        <div class="secondTipHead">
            <span><s:property value="%{getText('orgleague.info.validate')}"/></span></div>
        <s:form action="saveSecStep" theme="simple" id="responserForm" enctype="multipart/form-data" validate="true"
                method="post">
            <s:hidden name="responser.id"/>
            <ul class="principalMsg">
                <li class="short_li">
                    <div class="option_tittle"><s:property value="%{getText('orgleague.info.name')}"/></div>
                    <p id="secondStepNameWarn" class="input_msg"></P>
                    <div class="input_content"><s:textfield cssClass="inputName" id="secondStepName" name="responser.userName"/></div>
                </li>
                <li class="short_li">
                    <div class="option_tittle"><s:property value="%{getText('orgleague.info.sex')}"/></div>
                    <div class="input_content"><s:radio name="responser.sexy" id="secondStepRadio" list="#{true:getText('lable.sex.true'),false:getText('lable.sex.false')}"/></div>
                </li>
                <li class="short_li">
                    <div class="option_tittle"><s:property value="%{getText('orgleague.info.birth')}"/></div>
                    <p id="secondStepBirthdayWarn" class="input_msg"></p>
                    <input type="hidden" value="<s:date name="responser.birthDay" format="%{getText('global.display.date')}" /> " id="hidValueBrd">
                    <script type="text/javascript">
                        $(document).ready(function () {
                            document.getElementById('birday').value = document.getElementById('hidValueBrd').value;
                        });
                    </script>
                    <div class="input_content"><s:textfield id="birday" readonly="true" cssClass="Wdatepicker inputName" name="responser.birthDay" value="%{getText('global.datetime',{responser.birthDay})}"/></div>
                </li>
                <li class="short_li">
                     <div class="option_tittle"><s:property value="%{getText('orgleague.info.contact')}"/></div>
                     <p id="secondStepContactWarn" class="input_msg"></P>
                     <div class="input_content"><s:textfield id="secondStepContact" cssClass="inputTel" name="responser.telphone"/></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle"><s:property value="%{getText('orgleague.info.id')}"/></div>
                    <p id="secondStepIDWarn" class="input_msg"></P>
                    <div class="input_content"><s:textfield id="secondStepID" cssClass="inputName" name="responser.cardId"/></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle"><s:property value="%{getText('orgleague.info.id.card')}"/></div>
                    <div class="file_upload"><input type="file" name="fileupload" id="fileupload" /></div>
                    <p id="secondStepFileWarn" class="input_msg"></P>
                    <s:hidden name="idCardUrl" id="idCardUrl"/>
                    <%--<img id="secondStepFile_browse" src="images/nopic.jpg"/>--%>
                    <div id="fileQueue"></div>
                </li>
            </ul>
            </s:form>
            <div class="nextAndBack">
                <a href="initOrgLeague.html">
                    <div class="back"></div>
                </a>
                <a>
                    <div class="next secondStepNext"></div>
                </a>
            </div>

            <ul class="orgStep">
                <li><s:property value="%{getText('org.warmtip')}"/></li>
                <li class=""><s:property value="%{getText('orgleague.identity.confirm')}"/></li>
                <li><s:property value="%{getText('orgleague.info.fill')}"/></li>
                <li><s:property value="%{getText('orgleague.info.submit')}"/></li>
            </ul>
    </div>
</div>


