<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.ckeditor.CKEditorConfig" %>

<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%
    CKEditorConfig settings = new CKEditorConfig();
    settings.addConfigValue("width", "770");
    settings.addConfigValue("height", "100");
    settings.addConfigValue("toolbar", "[[ 'Source', '-', 'Bold', 'Italic','-','Image','-','NumberedList','BulletedList','-','Outdent','Indent','-','JustifyLeft'," +
            "'JustifyCenter','JustifyRight','JustifyBlock','-','Link','Unlink','Anchor' ]]");
%>

<link href="js/uploadify/uploadify.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<link href="css/orgLeague/<s:text name='orgleague.css.filename'/>" rel="stylesheet" type="text/css"/>
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
</style>


<div id="orgLeagueDiv">
    <div id="orgCenterDiv" style="height: 600px">
        <div class="">
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

                    <div class="input_content"><s:textfield cssClass="inputName" id="secondStepName"
                                                            name="org.responsiblePerson.email"/></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">组织名称</div>
                    <p id="secondStepContactWarn" class="input_msg"></P>

                    <div class="input_content"><s:textfield id="secondStepContact" cssClass="inputTel"
                                                            name="org.schoolName"/></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">负责人手机号码</div>
                    <p id="secondStepIDWarn" class="input_msg"></P>

                    <div class="input_content"><s:textfield id="secondStepID" cssClass="inputName"
                                                            name="org.cellPhone"/></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">组织二级域名(*大于五位)</div>
                    <p id="secondDomainWarn" class="input_msg"></P>

                    <div class="input_content"><s:textfield id="secondDomain" cssClass="inputName"
                                                            name="org.secDomain"/>.gogowise.com
                    </div>
                </li>

                <li class="long_li">
                    <div class="option_tittle">组织LOGO</div>
                        <%--<div class="file_upload"><input type="file" name="fileupload" id="fileupload1" /></div>--%>
                    <img id="show_log_preview" src="<s:property value="org.logoUrl" />" width="140" height="60"
                         onerror="javascript:this.src='images/nopic.jpg'"/>

                    <div class="file_upload">
                        <input type="button" class="submit_btn change_portrait" id="change_portrait"
                               value="<s:text name="common.modify"/>"
                               href="imgProcess.html"/>
                        <s:hidden name="org.logoUrl" id="crop_logo"/>
                    </div>
                    <p id="secondStepFileWarn" class="input_msg"></p>

                    <div id="fileQueue"></div>
                </li>
                <li class="long_li">
                    <div class="option_tittle">广告照片</div>
                    <img id="show_adv_preview" src="<s:property value="org.advUrl" />" width="140" height="60"
                         onerror="javascript:this.src='images/nopic.jpg'"/>

                    <div class="file_upload">
                        <input type="file" name="fileupload2" class="imgUpload" id="fileupload2"/>
                        <s:hidden name="org.advUrl" id="advUrl"/>
                    </div>
                    <p id="secondStepFileWarn2" class="input_msg"></P>



                    <div id="fileQueue2"></div>
                </li>

                <li class="long_li" style="height: 200px;">
                    <div class="option_tittle">描述</div>
                    <br/>
                    <br/>

                    <p id="secondDescWarn" class="input_msg"></P>
                    <s:textarea cols="80" id="editor1" name="org.description" rows="5"></s:textarea>
                    <ckeditor:replace replace="editor1" basePath="js/ckeditor/" config="<%=settings %>"/>
                </li>


                <li class="long_li">

                    <s:submit cssClass="submit_btn" value="提交" onclick="return checkEvent();"></s:submit>
                </li>
            </ul>

        </s:form>

    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(".imgUpload").uploadify({
            'uploader': 'js/uploadify/uploadify.swf',
            'script': 'utils/uploadFile.html',
            'cancelImg': 'js/uploadify/cancel.png',
            'queueID': 'fileQueue', //和存放队列的DIV的id一致
            'fileDataName': 'fileupload', //和以下input的name属性一致
            'auto': true, //是否自动开始
            'multi': false, //是否支持多文件上传
            'buttonText': "Browse", //按钮上的文字
            'simUploadLimit': 1, //一次同步上传的文件数目
            'sizeLimit': 2000000, //设置单个文件大小限制
            'queueSizeLimit': 1, //队列中同时存在的文件个数限制
            'fileDesc': 'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
            'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
            onComplete: function (event, queueID, fileObj, response, data) {
                var jsonRep = $.parseJSON(response)
                document.getElementById('advUrl').value = jsonRep.genFileName;
                $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
                $("#show_adv_preview").attr("src", "/upload/tmp/" + jsonRep.genFileName);
            },
            onError: function (event, queueID, fileObj) {
                alert("file:" + fileObj.name + "upload failed");
            },
            onCancel: function (event, queueID, fileObj) {
            },
            onUploadStart: function (event, queueID, fileObj) {
            }
        });

    });

    function checkEvent() {
        var r1 = checkEmpty('secondStepName', 'secondStepNameWarn', '负责人Email不能为空');
        var r2 = checkEmpty('secondStepContact', 'secondStepContactWarn', '组织名称不能为空');
        var r3 = checkEmpty('secondStepID', 'secondStepIDWarn', '负责人手机号码不能为空');
        var sdEmpty = checkEmpty('secondDomain', 'secondDomainWarn', '二级域名不能为空');
        var sdMinLength = false;
        if (sdEmpty) {
            sdMinLength = checkMinLength('secondDomain', 'secondDomainWarn', 5, '二级域名不能少于5位') && checkOnlyNumAndChar('secondDomain', 'secondDomainWarn', "二级域名只能数字和字母");
        }
        var r4 = true;
        $("#secondStepFileWarn").html("");
        if ($("#show_log_preview").attr("src").indexOf("images/nopic.jpg") > -1) {
            $("#secondStepFileWarn").html("请上传组织LOGO");
            r4 = false;
        }

        var r5 = true;
        $("#secondStepFileWarn2").html("");
        if ($("#show_adv_preview").attr("src").indexOf("images/nopic.jpg") > -1) {
            $("#secondStepFileWarn2").html("请上传组织广告图");
            r5 = false;
        }

        var ckeditor = CKEDITOR.instances.editor1;
        var eventContent = ckeditor.getData();

        var r6 = true;
        if (eventContent == "") {
            $("#secondDescWarn").html("请填写内容！");
            r6 = false;
        }

        var result = r1 && r2 && r3 && r4 && r5 && r6 && sdMinLength;

        if (!result) {
            moveToExact(50);
        }

        return result;
    }
</script>
