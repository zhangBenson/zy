<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link href="css/orgLeague/<s:text name='orgleague.css.filename'/>" rel="stylesheet" type="text/css"/>
<style type="text/css">
    .wwgrp br {
        display: none;
    }

    .edit_btn {
        display: block;
        float: left;
        width: 122px;
        height: 31px;
        margin-top: 20px;
        line-height: 31px;
        text-align: center;
        background: rgb(80, 80, 80);
        color: #FFF;
        font-size: 16px;
        box-shadow: 0px 1px 2px rgba(40, 160, 200, 0.3);
        border-radius: 4px;
        border: none;
        cursor: pointer;
        text-decoration: none;
    }
</style>

<div id="orgLeagueDiv">
    <div id="orgCenterDiv">
        <div class="secondTipHead">
            <s:property value="message"/>
        </div>
        <s:form action="higSecOrgCreate" theme="css_xhtml" id="responserForm" enctype="multipart/form-data"
                validate="true"
                method="post">
            <s:hidden name="org.id"/>
            <ul class="principalMsg">
                <li class="long_li">
                    <div class="option_tittle">负责人email</div>
                    <p id="secondStepNameWarn" class="input_msg"></P>

                    <div class="input_content"><s:property value="org.responsiblePerson.email"/></div>
                </li>


                <li class="long_li">
                    <div class="option_tittle">组织名称</div>
                    <p id="secondStepContactWarn" class="input_msg"></P>

                    <div class="input_content"><s:property value="org.schoolName"/></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">负责人手机号码</div>
                    <p id="secondStepIDWarn" class="input_msg"></P>

                    <div class="input_content"><s:property value="org.cellPhone"/></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">二级域名</div>
                    <div class="input_content"><s:property value="org.secDomain"/></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">组织LOGO</div>
                    <div class="option_tittle">
                        <img class="courseimg" style="height: 60px;width: 80px" src="<s:property value="org.logoUrl" />"
                             onerror="javascript:this.src='images/nopic.jpg'"/>
                    </div>
                    <p id="secondStepFileWarn" class="input_msg"></P>
                    <s:hidden name="logoUrl" id="logoUrl"/>
                    <div id="fileQueue"></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">广告照片</div>
                    <div class="option_tittle">
                        <img class="courseimg" style="height: 60px;width: 120px" src="<s:property value="org.advUrl" />"
                             onerror="javascript:this.src='images/nopic.jpg'"/>
                    </div>
                    <p id="secondStepFileWarn" class="input_msg"></P>
                    <s:hidden name="advUrl" id="advUrl"/>
                    <div id="fileQueue"></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">描述</div>
                    <div class="input_content">
                            ${org.description}
                            <%--<s:property value="org.description"/>--%>
                    </div>
                </li>
                    <%--<li class="long_li" style="height: 100px">--%>
                    <%--</li>--%>
                <li class="long_li">
                    <s:a cssClass="edit_btn" action="higSecOrgCreateInit"><s:param name="org.id"
                                                                                   value="org.id"/> 编辑</s:a>
                    <s:a cssClass="edit_btn" action="higSecOrgCreateInit">增加新的组织</s:a>
                    <s:a cssClass="edit_btn" action="higSecOrgListView"> 返回组织列表</s:a>
                </li>


                    <%--<li class="short_li">--%>
                    <%--<div class="option_tittle">组织合同签署日期</div>--%>
                    <%--<p id="secondStepBirthdayWarn" class="input_msg"></p>--%>
                    <%--<div class="input_content"><s:date name="org.contractSignDate" format="%{getText('global.display.date')}" /></div>--%>
                    <%--</li>--%>
                    <%--<li class="long_li">--%>
                    <%--<div class="option_tittle">组织合同</div>--%>
                    <%--<div class="file_upload"><input type="file" name="fileupload" id="fileupload2" /></div>--%>
                    <%--<s:hidden name="idCardUrl" id="idCardUrl"/>--%>
                    <%--<div id="fileQueue"></div>--%>
                    <%--</li>--%>


                    <%--<li class="short_li">--%>
                    <%--<div class="option_tittle">语言</div>--%>
                    <%--<div class="input_content"><s:radio name="language" list="#{false:'中文',true:'英文'}"/></div>--%>
                    <%--</li>--%>


            </ul>

        </s:form>

    </div>
</div>

