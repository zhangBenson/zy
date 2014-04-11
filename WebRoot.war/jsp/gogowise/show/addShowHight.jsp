<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<link href="css/show/showCreate.css" rel="stylesheet" type="text/css"/>
<style>
    .highlight {
        float: left;
        width: 810px;
        color: rgb(43, 43, 43);
        padding-left: 30px;
    }

    .highlight .dir {
        width: 100%;
        float: left;
        margin: 20px 0px 20px 0px;
    }

    .highlight .dir a {
        color: #004276;
        font-size: 14px;
    }

    .highlight .dir a:hover {
        text-decoration: underline;
    }

    .highlight .dir i {
        margin: 0 6px;
        font-size: 14px;
    }

    .highlight .area {
        float: left;
        width: 600px;
    }

    .highlight .area p {
        width: 600px;
    }

    .highlight .area input {
        width: 180px;
        height: 26px;
        line-height: 26px;
        padding-left: 2px;
        margin-top: 10px;
        margin-bottom: 10px;
        border: 1px solid #dadada;
    }

    .highlight .area textarea {
        width: 500px;
        height: 70px;
        margin-top: 10px;
        font-size: 12px;
        padding: 2px;
        border: 1px solid #dadada;
        border-radius: 3px;
    }

    .highlight .handle {
        float: left;
        width: 600px;
        padding-top: 10px;
    }

    .highlight .handle a {
        float: left;
        display: inline;
        width: 60px;
        height: 24px;
        border: none;
        color: rgb(85, 85, 85);
        margin-right: 20px;
        text-align: center;
        line-height: 24px;
        text-decoration: none;
        border-radius: 3px;
    }

    .highlight a.submit {
        background: #f90;
        border: 1px solid #ebebeb;
    }

    .highlight a.cancel {
        background: #dadada;
        border: 1px solid #ebebeb;
    }
</style>

<div class="highlight">
    <div class="dir">
        <p class="create_content_title">
            <s:property value="%{getText('personal.show.management')}"/>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                href="addShowHight.html">添加个人秀新鲜事</a>
        </p>
    </div>

    <s:form action="saveShowNewEvent" id="show_newEvent_form" enctype="multipart/form-data" method="post">
        <s:hidden name="myShow.id"/>
        <div class="area">
            <p>花絮标题</p>

            <div style="color: red;" id="showNewEvent_title_msg"></div>
            <input type="text" css="highlight_file" name="showNewEvent.title" id="showNewEvent_title"/>
        </div>
        <div class="area">
            <p>请在这里添加花絮图片</p>

            <div class="show_logo_input_msg input_msg"></div>
            <div class="option_content">
                <img src="images/nopic.jpg" id="show_log_preview"/><br/>
                <input type="file" name="upload" id="show_showLogo_upload"/>
            </div>
            <s:hidden id="show_showLogo" cssClass="long_text_field" name="showNewEvent.logoUrl"/>
        </div>
        <div class="area">
            <p>花絮内容<span class="live_term_highlight_tip"></span></p>

            <div style="color: red;" id="showNewEvent_content_msg"></div>
            <textarea name="showNewEvent.content" id="showNewEvent_content"></textarea>
        </div>
        <div class="handle">
            <a href="javascript:;" class="submit" onclick=" return saveTitbits();"><s:property
                    value="%{getText('term.info.save')}"/></a>
                <%--<a href="javascript:;" class="cancel" onclick="closeHighlight();"><s:property value="%{getText('term.info.reset')}"/></a>--%>
        </div>
    </s:form>
</div>


<script type="text/javascript">
    var warn_div = "<div class='tip_warn'></div>";
    var error_div = "<div class='tip_error'></div>";
    var right_div = "<div class='tip_right'></div>";
    var showLogoUploadSuccess = "上传成功";
    var words_on_uploadButton = "Browse";

    $(document).ready(function () {
        $("#showNewEvent_title").blur(function () {
            var title = $("#showNewEvent_title").val().replace(/(^\s*)|(\s*$)/g, "");
            if (title.length == 0) {
                $("#showNewEvent_title_msg").html(error_div + "标题不能为空");
            } else {
                $("#showNewEvent_title_msg").html(right_div);
                $("#showNewEvent_title").attr('value', title);

            }

        });
        $("#showNewEvent_content").blur(function () {
            var content = $("#showNewEvent_content").val().replace(/(^\s*)|(\s*$)/g, "");
            if (content.length == 0) {
                $("#showNewEvent_content_msg").html(error_div + "主要内容不能为空");
            } else {
                $("#showNewEvent_content_msg").html(right_div);
                $("#showNewEvent_content").attr('value', title);
            }

        });
    });


    function saveTitbits() {

        $("#show_newEvent_form").submit();
    }

    $("#show_showLogo_upload").uploadify({
        /*注意前面需要书写path的代码*/
        'uploader': 'js/uploadify/uploadify.swf',
        'script': 'utils/uploadFile.html',
        'cancelImg': 'js/uploadify/cancel.png',
        'queueID': 'fileQueue1', //和存放队列的DIV的id一致
        'fileDataName': 'fileupload', //和以下input的name属性一致
        'auto': true, //是否自动开始
        'multi': false, //是否支持多文件上传
        'buttonText': words_on_uploadButton, //按钮上的文字
        'simUploadLimit': 1, //一次同步上传的文件数目
        'sizeLimit': 2000000, //设置单个文件大小限制
        'queueSizeLimit': 1, //队列中同时存在的文件个数限制
        //'scriptData'     : $("#userInfoForm").serialize(),
//            'fileDataName' : 'uploads',
        'folder': 'upload/file/tmp',
        'fileDesc': 'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
        'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
        onComplete: function (event, queueID, fileObj, response, data) {
            var jsonRep = $.parseJSON(response);
            var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
            document.getElementById('show_showLogo').value = jsonRep.genFileName;
            $("#show_log_preview").attr("src", real_path);
            $(".show_logo_input_msg").html(right_div + showLogoUploadSuccess);
        },
        onError: function (event, queueID, fileObj) {
            $(".show_logo_input_msg").html("file:" + fileObj.name + "upload failed");
        },
        onCancel: function (event, queueID, fileObj) {
            $(".show_logo_input_msg").html("cancel " + fileObj.name);
        },
        onUploadStart: function (event, queueID, fileObj) {
            $(".show_logo_input_msg").html(warn_div + "开始上传");
        }
    });
</script>