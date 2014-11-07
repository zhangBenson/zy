<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/org/orgInfoUpdate_js.jsp" %>

<%@ page import="com.ckeditor.CKEditorConfig" %>

<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%
    CKEditorConfig settings = new CKEditorConfig();
    settings.addConfigValue("width", "500");
    settings.addConfigValue("height", "100");
    settings.addConfigValue("toolbar", "[[ 'Source', '-', 'Bold', 'Italic','-','Image','-','NumberedList','BulletedList','-','Outdent','Indent','-','JustifyLeft'," +
            "'JustifyCenter','JustifyRight','JustifyBlock','-','Link','Unlink','Anchor' ]]");
%>
<script src="js/jqueryTabs.js" type="text/javascript"></script>
<link href="css/org/orgInfoUpdate.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
    .wwgrp br {
        display: none;
    }

    .submit_btn {
        display: block;
        float: left;
        width: 122px;
        height: 31px;
        background: rgb(80, 80, 80);
        color: #FFF;
        font-size: 16px;
        box-shadow: 0px 1px 2px rgba(40, 160, 200, 0.3);
        border-radius: 4px;
        border: none;
        cursor: pointer;
    }

    .long_text_area {
        width: 600px;
        height: 80px;
        padding: 2px;
        border: #7CADC5 solid 1px;
        border-bottom: #B7D2DF solid 1px;
        border-right: #B7D2DF solid 1px;
    }

    .long_li {
        width: 700px;
    }
</style>
<div class="orgInfo_container">
<div class="testtab" id="testtab2">
<div id="tabtag2" class="tabtag">
    <ul class="tabtag_ul">
        <div class="left_bottom"></div>
        <li id="tabtag_1" class="cur"><s:text name="org.info.update.orgResInfo"/></li>
        <li id="tabtag_2"><s:text name="org.info.update.orgInfo"/></li>
        <li id="tabtag_3"><s:text name="org.info.update.orgContact"/></li>
        <%--<li id="tabtag_4"><s:text name="org.info.update.material"/></li>--%>
        <div class="right_bottom"></div>
    </ul>
</div>
<div id="tabcon2" class="tabcon">

<div id="tabtag_1con">
    <s:form action="saveSecStepTest" method="POST">
        <div class="tip_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param1"/></div>
        <ul class="principalMsg">
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param2"/></p>

                <p id="secondStepNameWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="responser.userName" id="secondStepName" cssClass="input_text_field"/>
                </div>
            </li>
            <li>
                <div class="option_tittle"></span><s:text name="orgInfoUpdate.param3"/></div>
                <div class="input_content">
                        <%--<input name="responser.sexy" id="secondStepRadiotrue" type="radio" value="true">--%>
                        <%--<label for="secondStepRadiotrue">男</label>--%>
                        <%--<input name="responser.sexy" id="secondStepRadiofalse"type="radio" value="false">--%>
                        <%--<label for="secondStepRadiofalse">女</label>--%>
                    <s:radio list="#{true:getText('orgInfoUpdate.param4'),false:getText('orgInfoUpdate.param5')}"
                             name="responser.sexy" cssClass="usersexy" listKey="key" listValue="value"/>
                </div>
            </li>
            <li>
                <p class="option_tittle"><s:text name="orgInfoUpdate.param6"/></p>

                <p id="secondStepBirthdayWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="responser.birthDay" value="" readonly="readonly" id="birday"
                                 cssClass="Wdatepicker input_text_field"/>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#birday").attr('value', '<s:date  name="responser.birthDay" format="%{getText('global.display.date')}"/>');
                        });
                    </script>
                </div>
            </li>
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param7"/></p>

                <p id="secondStepContactWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="responser.telphone" id="secondStepContact" cssClass="input_text_field"/>
                </div>
            </li>
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param8"/></p>

                <p id="secondStepIDWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="responser.cardId" id="secondStepID" cssClass="input_text_field"/>
                </div>
            </li>

            <li class="commit_modfication1">
                <span id="submit_msg1" class="_submit_msg"></span>
                <span><input type="button" class="submit_btn"
                             value="<s:text name="orgInfoUpdate.param10"/>"/></span>
            </li>
        </ul>
    </s:form>
</div>

<div id="tabtag_2con">
    <s:form action="saveThirdStepTest" method="POST">
        <div class="tip_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param1"/></div>
        <ul>
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param11"/></p>

                <p id="orgNameWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="org.schoolName" id="thirdStepName" cssClass="input_text_field"/>
                </div>
            </li>
            <li class="long_li" style="height:200px;">
                    <%--<p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param12"/></p>--%>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param12"/></p>
                <s:textarea name="org.description" cols="80" id="thirdStepOrgShuoming" cssClass="descArea" rows="15"/>
                <ckeditor:replace replace="thirdStepOrgShuoming" basePath="js/ckeditor/" config="<%=settings %>"/>
            </li>
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param13"/></p>

                <p id="bankNameWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="org.depositBankName" id="bankName" cssClass="input_text_field"/>
                </div>
            </li>
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param14"/></p>

                <p id="accountNameWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="org.depositName" id="thirdStepAccount" cssClass="input_text_field" type="text"/>
                </div>
            </li>
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param15"/></p>

                <p id="accountNoWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="org.depositBankAccount" id="thirdStepAccountNo" cssClass="input_text_field"
                                 type="text"/>
                </div>
            </li>
            <li class="orgScale">
                <div class="option_tittle"><s:text name="orgInfoUpdate.param16"/></div>
                <div class="input_content" style="width: 460px;">
                    <div id="wwgrp_orgForm_org_memberSize" class="wwgrp">
                        <div id="wwctrl_orgForm_org_memberSize" class="wwctrl">
                            <s:radio
                                    list="#{0:getText('orgleague.info.size1'),1:getText('orgleague.info.size2'),2:getText('orgleague.info.size3'),3:getText('orgleague.info.size4')}"
                                    name="org.memberSize" cssClass="usersexy" listKey="key" listValue="value"/>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="option_tittle"><s:text name="orgInfoUpdate.param17"/></div>
                <div id="wwgrp_orgForm_org_multipleOrg" class="wwgrp input_content">
                    <div id="wwctrl_orgForm_org_multipleOrg" class="wwctrl">
                        <s:radio
                                list="#{true:getText('orgInfoUpdate.param17.1'),false:getText('orgInfoUpdate.param17.2')}"
                                name="org.multipleOrg" cssClass="usersexy" listKey="key" listValue="value"/>
                    </div>
                </div>
            </li>
            <li class="fileUploadDiv">
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param18"/></p>

                <p id="fileupload2_FileWarn" class="input_msg"></p><br/>

                <div class="input_content">
                    <p class="img_div">
                        <img id="show_log_preview" src="<s:property value="org.logoUrl"/>" width="210px" height="90px"
                             onerror="javascript:this.src='images/nopic.jpg'"/>
                    </p>

                    <div class="file_upload">
                        <input type="button" class="submit_btn change_portrait" id="fileupload2"
                               value="<s:text name="onlive.message.update"/>"
                               href="imgProcess.html"/>
                    </div>
                    <p id="secondStepFileWarn" class="input_msg"></p>
                    <s:hidden name="org.logoUrl" id="crop_logo"/>
                </div>
            </li>
            <li class="fileUploadDiv">
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="title.org.banner"/></p>

                <p id="fileupload3_FileWarn" class="input_msg"></p><br/>

                <div class="input_content">
                    <p class="img_div"><img id="file3_preview_img" src="<s:property value="org.advUrl"/>"
                                            width="120px" height="90px"
                                            onerror="javascript:this.src='images/nopic.jpg'"/></p>

                    <p class="file_upload"><input type="file" name="upload" id="fileupload3"/></p>
                    <input type="hidden" name="org.advUrl" id="hidFile2"/>
                </div>
            </li>
            <li class="commit_modfication2">
                <span id="submit_msg2" class="_submit_msg"></span>
                <span><input type="button" class="submit_btn"
                             value="<s:text name="orgInfoUpdate.param10"/>"/></span>
            </li>

        </ul>
    </s:form>
</div>

<div id="tabtag_3con">
    <s:form action="orgSaveContactInfo" method="POST">
        <div class="tip_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param1"/></div>
        <ul>
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param20"/></p>

                <p id="thirdStepOfficerNameWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="org.contactName" id="thirdStepOfficerName" cssClass="input_text_field"/>
                </div>
            </li>
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param21"/></p>

                <p id="thirdStepfixedTelWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="org.telPhone" id="thirdStepfixedTel" cssClass="input_text_field"/>
                </div>
            </li>
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param22"/></p>

                <p id="thirdStepMobileWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="org.cellPhone" id="thirdStepMobile" cssClass="input_text_field"/>
                </div>
            </li>
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param23"/></p>

                <p id="thirdStepAddressWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="org.businessAddress" id="thirdStepAddress" cssClass="input_text_field"/>
                </div>
            </li>
            <li>
                <p class="option_tittle"><span style="color:red;">&nbsp;*&nbsp;</span><s:text name="orgInfoUpdate.param24"/></p>

                <p id="thirdStepPostCodeWarn" class="input_msg"></p>

                <div class="input_content">
                    <s:textfield name="org.zipCode" id="thirdStepPostCode" cssClass="input_text_field"/>
                </div>
            </li>
            <li class="commit_modfication3">
                <span id="submit_msg3" class="_submit_msg"></span>
                <span><input type="button" class="submit_btn"
                             value="<s:text name="orgInfoUpdate.param10"/>"/></span>
            </li>
        </ul>
    </s:form>
</div>
<div id="tabtag_4con" style="display:none;">
    <h3><s:text name="orgInfoUpdate.param25"/></h3>
    <s:form action="saveOrgAdvertiseFile" method="POST" enctype="multipart/form-data">
        <ul>
            <li><span class="tip_words"><s:text name="orgInfoUpdate.param26"/></span><input
                    type="file" name="upload"/></li>
            <li><span class="tip_words"><s:text name="orgInfoUpdate.param27"/></span><textarea
                    name="orgMaterial.description"
                    placeholder="<s:text name="orgInfoUpdate.param26.2"/>"></textarea></li>
            <li><s:submit cssClass="submit_material_btn" value="%{getText('orgInfoUpdate.param27.1')}"/></li>
        </ul>
    </s:form>
    <h3><s:text name="orgInfoUpdate.param28"/></h3>
    <table>
        <tr>
            <td width="100px;"><s:text name="orgInfoUpdate.param29"/></td>
            <td width="100px;"><s:text name="orgInfoUpdate.param30"/></td>
            <td width="150px;"><s:text name="orgInfoUpdate.param31"/></td>
            <td width="100px;"><s:text name="orgInfoUpdate.param32"/></td>
            <td width="200px;"><s:text name="orgInfoUpdate.param33"/></td>
            <td width="100px;"><s:text name="orgInfoUpdate.param34"/></td>
        </tr>
        <s:iterator value="orgMaterials">
            <tr>
                <td><s:property value="sourceTitle"/></td>
                <td><s:property value="provider.nickName"/></td>
                <td><s:date name="provideTime" format="%{getText('dateformat.forclass')}"/></td>
                <td>20M</td>
                <td><s:property value="description"/></td>
                <td><a href="orgMaterialDownload.html?orgMaterial.id=<s:property value="id"/>"><s:text name="orgInfoUpdate.param34"/></a></td>
            </tr>
        </s:iterator>
    </table>

</div>

</div>
</div>
</div>
