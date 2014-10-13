<%--<link href="css/orgLeague/orgLeague.css" rel="stylesheet" type="text/css"/>--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/orgLeague/<s:text name='orgleague.css.filename'/>" rel="stylesheet" type="text/css"/>
<link href="js/uploadify/uploadify.css" type="text/css" rel="stylesheet"/>
<%--<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>--%>
<%--<script type="text/javascript" src="js/uploadify/swfobject.js"></script>--%>
<script type="text/javascript" src=js/orgLeague.js></script>
<style type="text/css">
    #orgLeagueDiv #orgCenterDiv {
        height: 421px;
        width: 784px;
        padding-top: 25px;
        padding-right: 95px;
        padding-left: 70px;
    }

    .nameBF {
        float: left;
    }
</style>

<s:form action="saveThirdStep" theme="css_xhtml" id="orgForm" enctype="multipart/form-data" validate="true"
        method="post">
    <s:hidden name="org.id"/>
    <div id="orgLeagueDiv">
        <div id="orgCenterDiv"
             style="background-image: url(images/orgLeague/contentbg2.gif);background-repeat: no-repeat; height: 525px;">

            <p class="thirdHead"><s:text name="orgleague.info.provide"/></p>

            <div class="thirdLeft">
                <ul>
                    <li class="headTittle"><s:text name="orgleague.info.orgInfo"/></li>
                    <li>
                        <div class="nameBF">
                            <div class="option_tittle"><s:text name="orgleague.info.orgName"/></div>
                            <p id="orgNameWarn" style="color: red; display: inline;"></p></div>
                        <s:textfield id="thirdStepName" name="org.schoolName" cssClass="orgName"/>
                    </li>
                    <li class="orgShuoming">
                        <div class="nameBF">
                            <div class="option_tittle"><s:text name="orgleague.info.orgIntro"/></div>
                            <p id="orgShuomingWarn" style="color: red; display: inline;"></p></div>
                        <s:textarea id="thirdStepOrgShuoming" name="org.description" cssClass="descArea"/>
                    </li>
                    <li>
                        <div class="nameBF">
                            <div class="option_tittle"><s:property value="%{getText('orgleague.info.accountName')}"/></div>
                            <p id="accountNameWarn" style="color: red; display: inline;"></p></div>
                        <s:textfield id="thirdStepAccount" name="org.depositName" cssClass="inputField"/>
                    </li>
                    <li>
                        <div class="nameBF">
                            <div class="option_tittle"><s:property value="%{getText('orgleague.info.accountNo')}"/></div>
                            <p id="accountNoWarn" style="color: red; display: inline;"></p></div>
                        <s:textfield id="thirdStepAccountNo" cssClass="inputField" name="org.depositBankAccount"/>
                    </li>
                    <li class="orgScale">
                        <div class="nameBF">
                            <div class="option_tittle"><s:text name="orgleague.info.orgSize"/></div>
                            <div style="width: 290px"><s:radio name="org.memberSize"
                                                               list="#{0:getText('orgleague.info.size1'),1:getText('orgleague.info.size2'),2:getText('orgleague.info.size3'),3:getText('orgleague.info.size4'),4:getText('orgleague.info.size5'),5:getText('orgleague.info.size6')}"/></div>
                    </li>
                    <li>
                        <div class="nameBF">
                            <div class="option_tittle"><s:text name="orgleague.info.chain"/></div>
                                <s:radio name="org.multipleOrg"
                                         list="#{true:getText('lable.yesno.true'),false:getText('lable.yesno.false')}"/>
                    </li>
                    <li class="fileUploadDiv">
                        <div class="photoTitle">
                            <div class="option_tittle"><s:text name="orgleague.info.orgLogo"/></div>
                                <%--<s:file name="upload"/>--%>
                            <div class="file_upload"><s:file name="fileupload" id="fileupload1"/></div>
                            <div class="file_upload_msg1 input_msg"></div>
                                <s:hidden name="hidFile1" id="hidFile1"/>
                            <div id="fileQueue"></div>
                    </li>
                    <li class="fileUploadDiv">
                        <div class="photoTitle">
                            <div class="option_tittle"><s:property value="%{getText('orgleague.info.cetification')}"/></div>
                                <%--<s:file name="upload1"/>--%>
                            <div class="file_upload"><s:file name="fileupload2" id="fileupload2"/></div>
                            <div class="file_upload_msg2 input_msg"></div>
                                <s:hidden name="hidFile2" id="hidFile2"/>
                            <div id="fileQueue"></div>
                    </li>
                </ul>
            </div>
            <div class="thirdRight">
                <ul>
                    <li class="headTittle"><s:text name="orgleague.info.contactMethod"/></li>
                    <li>
                        <div class="nameBF">
                            <div class="option_tittle"><s:property value="%{getText('orgleague.info.officerName')}"/></div>
                            <p id="thirdStepOfficerNameWarn" style="color: red;display:inline;"></p></div>
                        <s:textfield id="thirdStepOfficerName" name="org.contactName"
                                     cssClass="contactName thirdRightInput"/>
                    </li>
                    <li>
                        <div class="nameBF">
                            <div class="option_tittle"><s:text name="orgleague.info.fixedTel"/></div>
                            <p id="thirdStepfixedTelWarn" style="color: red;display:inline;"></p></div>
                        <s:textfield id="thirdStepfixedTel" name="org.telPhone" cssClass="secondTel thirdRightInput"/>
                    </li>
                    <li>
                        <div class="nameBF">
                            <div class="option_tittle"><s:text name="orgleague.info.mobile"/></div>
                            <p id="thirdStepMobileWarn" style="color: red;display:inline;"></p></div>
                        <s:textfield id="thirdStepMobile" name="org.cellPhone" cssClass="thirdRightInput"/>
                    </li>
                    <li>
                        <div class="nameBF">
                            <div class="option_tittle"><s:text name="orgleague.info.address"/></div>
                            <p id="thirdStepAddressWarn" style="color: red;display:inline;"></p></div>
                        <s:textfield id="thirdStepAddress" name="org.businessAddress" cssClass="thirdRightInput"/>
                    </li>
                    <li>
                        <div class="nameBF">
                            <div class="option_tittle"><s:text name="orgleague.info.postCode"/></div>
                            <p id="thirdStepPostCodeWarn" style="color: red;display:inline;"></p></div>
                        <s:textfield id="thirdStepPostCode" name="org.zipCode" cssClass="thirdRightInput"/>
                    </li>
                    <li></li>
                    <li></li>
                </ul>
            </div>

            <div class="nextAndBack">
                <a href="initOrgSecSteps.html">
                    <div class="back" style="top:440px"></div>
                </a>
                <a>
                    <div class="next thirdStepNext" style="top:440px"></div>
                </a>
            </div>
            <ul class="orgStep" style="top:510px;">
                <li><s:text name="org.warmtip"/></li>
                <li><s:text name="orgleague.identity.confirm"/></li>
                <li class="third"><s:text name="orgleague.info.fill"/></li>
                <li><s:text name="orgleague.info.submit"/></li>
            </ul>
        </div>
    </div>
</s:form>
