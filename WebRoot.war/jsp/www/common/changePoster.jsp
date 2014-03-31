<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ page import="com.ckeditor.CKEditorConfig" %>

<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%
    CKEditorConfig settings = new CKEditorConfig();
    settings.addConfigValue("width","770");
    settings.addConfigValue("height","100");
    settings.addConfigValue("toolbar","[[ 'Source', '-', 'Bold', 'Italic','-','Image','-','NumberedList','BulletedList','-','Outdent','Indent','-','JustifyLeft',"+
            "'JustifyCenter','JustifyRight','JustifyBlock','-','Link','Unlink','Anchor' ]]");
%>

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
            'script':'utils/uploadFileWithOutZoom.html',
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
                document.getElementById('posterAddress1').value = jsonRep.genFileName;
                $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
                //alert(jsonRep.genFileName);
                document.getElementById('warning1').innerHTML = jsonRep.genFileName;
                var real_path = fileObj.filePath.replace(fileObj.name,jsonRep.genFileName);
                $("#show_log_preview1").attr("src",real_path);
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
            'script':'utils/uploadFileWithOutZoom.html',
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
                document.getElementById('posterAddress2').value = jsonRep.genFileName;
                $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
                //alert(jsonRep.genFileName);
                document.getElementById('warning2').innerHTML = jsonRep.genFileName;
                var real_path = fileObj.filePath.replace(fileObj.name,jsonRep.genFileName);
                $("#show_log_preview2").attr("src",real_path);
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

        $("#fileupload3").uploadify({
            'uploader':'js/uploadify/uploadify.swf',
            'script':'utils/uploadFileWithOutZoom.html',
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
                document.getElementById('posterAddress3').value = jsonRep.genFileName;
                $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
                //alert(jsonRep.genFileName);
                document.getElementById('warning3').innerHTML = jsonRep.genFileName;
                var real_path = fileObj.filePath.replace(fileObj.name,jsonRep.genFileName);
                $("#show_log_preview3").attr("src",real_path);
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

        $("#fileupload4").uploadify({
            'uploader':'js/uploadify/uploadify.swf',
            'script':'utils/uploadFileWithOutZoom.html',
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
                document.getElementById('posterAddress4').value = jsonRep.genFileName;
                $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
                //alert(jsonRep.genFileName);
                document.getElementById('warning4').innerHTML = jsonRep.genFileName;

                var real_path = fileObj.filePath.replace(fileObj.name,jsonRep.genFileName);
                $("#show_log_preview4").attr("src",real_path);
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

<div class="container">
    <div id="orgCenterDiv" style="height: 500px" >
        <div class="" ><s:property value="message"/></div>
        <s:form action="savePoster" theme="css_xhtml" id="responserForm" enctype="multipart/form-data" validate="true" method="post">

            <ul class="principalMsg">

                <li class="long_li">
                    <div class="option_tittle">Poster 1</div>
                    <img id="show_log_preview1"/>
                    <div class="file_upload">
                        <%--<input type="button" class="submit_btn" id="change_portrait" value="<s:property value="%{getText('onlive.message.update')}"/>" href="posterImageProcess.html" />--%>
                        <div class="file_upload"><input type="file" name="fileupload" id="fileupload1" /></div>
                    </div>
                    <p id="warning1" class="input_msg"></P>
                    <s:hidden name="posterAddress1" id="posterAddress1"/>
                    <div id="fileQueue"></div>
                </li>

                <br/>
                <br/>
                <li class="long_li" style="height: 100px;">
                    <div class="option_tittle">
                        Poster 1 Link:<s:textfield name="posterLink1" cssStyle="width: 500px"/>
                    </div>
                    <%--<br/>--%>
                     <%--<div class="input_content"><s:textarea cssClass="long_text_area"  name="posterLink1"/></div>--%>
                </li>

                <%----------------------------------poster 2---------------------------%>
                <li class="long_li">
                    <div class="option_tittle">Poster 2</div>
                    <img id="show_log_preview2"/>
                    <div class="file_upload">
                            <%--<input type="button" class="submit_btn" id="change_portrait" value="<s:property value="%{getText('onlive.message.update')}"/>" href="posterImageProcess.html" />--%>
                        <div class="file_upload"><input type="file" name="fileupload" id="fileupload2" /></div>
                    </div>
                    <p id="warning2" class="input_msg"></P>
                    <s:hidden name="posterAddress2" id="posterAddress2"/>
                    <%--<div id="fileQueue"></div>--%>
                </li>

                <br/>
                <br/>
                <li class="long_li" style="height: 100px;">
                    <div class="option_tittle">
                        Poster 2 Link:<s:textfield name="posterLink2" cssStyle="width: 500px"/>
                    </div>
                <%--<div class="option_tittle">Poster 2 Link:</div>--%>
                    <%--<br/>--%>
                    <%--<div class="input_content"><s:textarea cssClass="long_text_area"  name="posterLink2"/></div>--%>
                </li>

                <%----------------------------------poster 3---------------------------%>
                <li class="long_li">
                    <div class="option_tittle">Poster 3</div>
                    <img id="show_log_preview3" />
                    <div class="file_upload">
                            <%--<input type="button" class="submit_btn" id="change_portrait" value="<s:property value="%{getText('onlive.message.update')}"/>" href="posterImageProcess.html" />--%>
                        <div class="file_upload"><input type="file" name="fileupload" id="fileupload3" /></div>
                    </div>
                    <p id="warning3" class="input_msg"></P>
                    <s:hidden name="posterAddress3" id="posterAddress3"/>
                    <div id="fileQueue"></div>
                </li>

                <br/>
                <br/>
                <li class="long_li" style="height: 100px;">
                    <div class="option_tittle">
                        Poster 3 Link:<s:textfield name="posterLink3" cssStyle="width: 500px"/>
                    </div>
                <%--<div class="option_tittle">Poster 3 Link:</div>--%>
                    <%--<br/>--%>
                    <%--<div class="input_content"><s:textarea cssClass="long_text_area"  name="posterLink3"/></div>--%>
                </li>

                <%----------------------------------poster 4---------------------------%>
                <li class="long_li">
                    <div class="option_tittle">Poster 4</div>
                    <img id="show_log_preview4"/>
                    <div class="file_upload">
                            <%--<input type="button" class="submit_btn" id="change_portrait" value="<s:property value="%{getText('onlive.message.update')}"/>" href="posterImageProcess.html" />--%>
                        <div class="file_upload"><input type="file" name="fileupload" id="fileupload4" /></div>
                    </div>
                    <p id="warning4" class="input_msg"></P>
                    <s:hidden name="posterAddress4" id="posterAddress4"/>
                    <div id="fileQueue"></div>
                </li>

                <br/>
                <br/>
                <li class="long_li" style="height: 50px;">
                    <div class="option_tittle">
                        Poster 4 Link:<s:textfield name="posterLink4" cssStyle="width: 500px"/>
                    </div>
                <%--<div class="option_tittle">Poster 4 Link:</div>--%>
                    <%--<br/>--%>
                    <%--<div class="input_content"><s:textarea cssClass="long_text_area"  name="posterLink4"/></div>--%>
                </li>


                <li class="long_li">
                    <s:submit cssClass="submit_btn" value="提交" onclick="return checkEvent();" ></s:submit>
                </li>
            </ul>

        </s:form>

    </div>
</div>
<script type="text/javascript">
    function checkEvent(){

        var ckeditor = CKEDITOR.instances.editor1;
        var eventContent = ckeditor.getData();

        var flag;
        if(eventContent == "") {
            alert("请填写内容！");
            flag = false;
        }
        else {
            flag = true;
        }
        return flag;
    }

    $("#change_portrait").fancybox({
        type:'iframe',
        width:720,
        height:490
    });

</script>