<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<link href="js/uploadify/uploadify.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<link href="css/orgLeague/<s:text name='orgleague.css.filename'/>" rel="stylesheet" type="text/css"/>
<style type="text/css">
    .wwgrp br {
        display: none;
    }
    .submit_btn{
        display: block;
        float:left;
        width:122px;
        height:31px;
        background: rgb(80,80,80);
        color:#FFF;
        font-size: 16px;
        box-shadow: 0px 1px 2px rgba(40,160,200,0.3);
        border-radius: 4px;
        border: none;
        cursor: pointer;
    }
    .long_text_area{
        width:600px;
        height:80px;
        padding:2px;
        border: #7CADC5 solid 1px;
        border-bottom: #B7D2DF solid 1px;
        border-right: #B7D2DF solid 1px;
    }
</style>
<script type="text/javascript"  >
    var uploading = false;
    var words_on_uploadButton = "Browse";
$(document).ready(function () {
    $("#fileupload1").uploadify({
        'uploader':'js/uploadify/uploadify.swf',
        'script':'utils/uploadFile.html',
        'cancelImg':'js/uploadify/cancel.png',
        'queueID':'fileQueue', //和存放队列的DIV的id一致
        'fileDataName':'fileupload', //和以下input的name属性一致
        'auto':true, //是否自动开始
        'multi':false, //是否支持多文件上传
        'buttonText':words_on_uploadButton, //按钮上的文字
        'simUploadLimit':1, //一次同步上传的文件数目
        'sizeLimit':2000000, //设置单个文件大小限制
        'queueSizeLimit':1, //队列中同时存在的文件个数限制
        'fileDesc':'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
        'fileExt':'*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
        onComplete:function (event, queueID, fileObj, response, data) {
            uploading = false;
            var jsonRep = $.parseJSON(response)
            document.getElementById('logoUrl').value = jsonRep.genFileName;
            $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
        },
        onError:function (event, queueID, fileObj) {
            alert("file:" + fileObj.name + "upload failed");
        },
        onCancel:function (event, queueID, fileObj) {
        },
        onUploadStart:function (event, queueID, fileObj) {
            uploading = true;
        }
    });

    $("#fileupload2").uploadify({
        'uploader':'js/uploadify/uploadify.swf',
        'script':'utils/uploadFile.html',
        'cancelImg':'js/uploadify/cancel.png',
        'queueID':'fileQueue', //和存放队列的DIV的id一致
        'fileDataName':'fileupload', //和以下input的name属性一致
        'auto':true, //是否自动开始
        'multi':false, //是否支持多文件上传
        'buttonText':words_on_uploadButton, //按钮上的文字
        'simUploadLimit':1, //一次同步上传的文件数目
        'sizeLimit':2000000, //设置单个文件大小限制
        'queueSizeLimit':1, //队列中同时存在的文件个数限制
        'fileDesc':'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
        'fileExt':'*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
        onComplete:function (event, queueID, fileObj, response, data) {
            uploading = false;
            var jsonRep = $.parseJSON(response)
            document.getElementById('advUrl').value = jsonRep.genFileName;
            $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
        },
        onError:function (event, queueID, fileObj) {
            alert("file:" + fileObj.name + "upload failed");
        },
        onCancel:function (event, queueID, fileObj) {
        },
        onUploadStart:function (event, queueID, fileObj) {
            uploading = true;
        }
    });


});

</script>

<div id="orgLeagueDiv">
    <div id="orgCenterDiv" style="height: 500px" >
        <div class="" >
            <s:property value="message"/>
    </div>
        <s:form action="higSecOrgCreate" theme="css_xhtml" id="responserForm" enctype="multipart/form-data" validate="true"
                method="post">
            <s:hidden name="org.id"/>
            <ul class="principalMsg">
                <li class="long_li">
                    <div class="option_tittle">负责人email</div>
                    <p id="secondStepNameWarn" class="input_msg"></P>
                    <div class="input_content"><s:textfield cssClass="inputName" id="secondStepName" name="org.responsiblePerson.email"/></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">组织名称</div>
                    <p id="secondStepContactWarn" class="input_msg"></P>
                    <div class="input_content"><s:textfield id="secondStepContact" cssClass="inputTel" name="org.schoolName"/></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">负责人手机号码</div>
                    <p id="secondStepIDWarn" class="input_msg"></P>
                    <div class="input_content"><s:textfield id="secondStepID" cssClass="inputName" name="org.cellPhone"/></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">组织LOGO</div>
                    <div class="file_upload"><input type="file" name="fileupload" id="fileupload1" /></div>
                    <p id="secondStepFileWarn" class="input_msg"></P>
                    <s:hidden name="logoUrl" id="logoUrl"/>
                    <div id="fileQueue"></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">广告照片</div>
                    <div class="file_upload"><input type="file" name="fileupload2" id="fileupload2" /></div>
                    <p id="secondStepFileWarn" class="input_msg"></P>
                    <s:hidden name="advUrl" id="advUrl"/>
                    <div id="fileQueue"></div>
                </li>

                <li class="long_li">
                    <div class="option_tittle">描述</div>
                    <div class="input_content"><s:textarea cssClass="long_text_area" id="step2_course_intro" name="org.description"/></div>
                </li>
                <%--<li class="short_li">--%>
                    <%--<div class="option_tittle">组织合同签署日期</div>--%>
                    <%--<p id="secondStepBirthdayWarn" class="input_msg"></p>--%>
                    <%--<input type="hidden" value="<s:date name="org.contractSignDate" format="%{getText('global.display.date')}" /> " id="hidValueBrd">--%>
                    <%--<script type="text/javascript">--%>
                        <%--$(document).ready(function () {--%>
                            <%--document.getElementById('birday').value = document.getElementById('hidValueBrd').value;--%>
                        <%--});--%>
                    <%--</script>--%>
                    <%--<div class="input_content"><s:textfield id="birday" readonly="true" cssClass="Wdatepicker inputName" name="org.contractSignDate" value="%{getText('global.datetime',{org.contractSignDate})}"/></div>--%>
                <%--</li>--%>
                <%--<li class="long_li">--%>
                    <%--<div class="option_tittle">组织合同</div>--%>
                    <%--<div class="file_upload"><input type="file" name="fileupload" id="fileupload2" /></div>--%>
                    <%--<s:hidden name="idCardUrl" id="idCardUrl"/>--%>
                    <%--<div id="fileQueue"></div>--%>
                <%--</li>--%>
                <li class="long_li" style="height: 100px">
                </li>
                <li class="long_li">
                      <s:submit cssClass="submit_btn" value="提交" ></s:submit>
                </li>

            </ul>
        </s:form>

    </div>
</div>

