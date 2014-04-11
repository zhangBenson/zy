<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/onlive/onlive_create.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="">
            <a href="initMyOnlive.html"><s:property value="%{getText('my.onlive')}"/></a>
        </li>
        <li class="">
            <a href="listParticipatingChannel.html"><s:property
                    value="%{getText('usermenu.item.my.partispate.channel')}"/></a>
        </li>
        <li class="">
            <a href="listFollowingChannel.html"><s:property value="%{getText('usermenu.item.my.focused.channel')}"/></a>
        </li>
        <li class="stand_out">
            <a href="createOnlive.html"><s:property value="%{getText('onlive.creation')}"/></a>
        </li>
        <li class="">
            <a href="rangeLiveChannel.html"><s:property value="%{getText('onlive.channel.range')}"/></a>
        </li>
    </ul>
</div>

<div class="mf_2">
    <s:form action="saveLiveChannel" method="POST" enctype="multipart/form-data">
        <s:hidden name="createChannelTerm" value="false" id="createChannelTerm"/>
        <p class="tip_para"><s:property value="%{getText('onlive.important.content.first')}"/><span
                class="asterisk"> * </span><s:property value="%{getText('onlive.important.content.second')}"/></p>
        <ul>
            <li>
                <p class="title"><s:property value="%{getText('onlive.channel.name')}"/><span class="asterisk">*</span>
                </p>
                <span class="tip_message" id="title_tip"></span>
                <s:textfield cssClass="long_text_field" name="liveChannel.name" id="onlive_title"></s:textfield>
            </li>
            <li class="li_2">
                <p class="title"><s:property value="%{getText('onlive.channel.first.logo')}"/><span
                        class="asterisk">*</span></p>
                <span class="tip_message" id="logo_tip"></span>
                <img src="images/defaultImgs/course.gif" id="logo_preview"/>
                <s:file id="onlive_logo" name="upload"></s:file>
                <s:hidden name="liveChannel.logoUrl" id="onlive_logo_hidden"/>
            </li>
            <li>
                <p class="title"><s:property value="%{getText('onlive.channel.description')}"/><span
                        class="asterisk">*</span></p>
                <span class="tip_message" id="desp_tip"></span>
                <s:textarea cssClass="long_text_area" name="liveChannel.description" id="onlive_desp"></s:textarea>
            </li>
        </ul>
        <p class="btn_para"><s:submit cssClass="submit_btn" onclick="return checkOnliveForm();"
                                      value="%{getText('create.a.new.channel')}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <s:submit cssClass="submit_btn" onclick="return checkOnliveFormForCreateChannel();"
                      value="%{getText('create.new.channel.and.new.a.term')}"/>
        </p>
    </s:form>
</div>

<script type="text/javascript">
    $(function () {
        $("#onlive_title").keyup(function () {
            changeWordNumber(this, $("#title_tip"), 50);
        }).focus(function () {
            $("#title_tip").html("");
        }).blur(function () {
            $("#title_tip").html("");
            checkNecessaryContent(this, "title_tip", "<s:text name='onlive.channel.name.empty'/>");
        });

        $("#onlive_desp").keyup(function () {
            changeWordNumber(this, $("#desp_tip"), 300);
        }).focus(function () {
            $("#desp_tip").html("");
        }).blur(function () {
            $("#desp_tip").html("");
            checkNecessaryContent(this, "desp_tip", "<s:text name='onlive.channel.intro.empty'/>");
        });
        $("#onlive_logo").uploadify({
            /*注意前面需要书写path的代码*/
            'uploader': 'js/uploadify/uploadify.swf',
            'script': 'utils/uploadFile.html',
            'cancelImg': 'js/uploadify/cancel.png',
            'queueID': 'fileQueue1', //和存放队列的DIV的id一致
            'fileDataName': 'fileupload', //和以下input的name属性一致
            'auto': true, //是否自动开始
            'multi': false, //是否支持多文件上传
            'buttonText': "Upload", //按钮上的文字
            'simUploadLimit': 1, //一次同步上传的文件数目
            'sizeLimit': 2000000, //设置单个文件大小限制
            'queueSizeLimit': 1, //队列中同时存在的文件个数限制
            //'scriptData'     : $("#userInfoForm").serialize(),
            //'fileDataName' : 'uploads',
            'folder': 'upload/file/tmp',
            'fileDesc': 'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
            'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
            onComplete: function (event, queueID, fileObj, response, data) {
                var jsonRep = $.parseJSON(response);
                var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
                document.getElementById('onlive_logo_hidden').value = jsonRep.genFileName;
                $("#logo_preview").attr("src", real_path);
                $("#logo_tip").html("<s:text name='image.logo.upload.success'/>");
            },
            onError: function (event, queueID, fileObj) {
                $("#logo_tip").html("file:" + fileObj.name + "upload failed");
            },
            onCancel: function (event, queueID, fileObj) {
                $("#logo_tip").html("cancel " + fileObj.name);
            },
            onUploadStart: function (event, queueID, fileObj) {
                $("#logo_tip").html("<s:text name='image.logo.start.upload'/>");
            }
        });
    });
    function checkNecessaryContent(obj, tipSpanId, emptyTip) {
        if ($(obj).val().replace(/(^\s*)|(\s*$)/g, "") == "") {
            $("#" + tipSpanId).html(emptyTip);
            return false;
        }
        return true;
    }
    function checkUnnecessaryEmail(obj, tipSpanId) {
        var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
        var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
        if (email != "" && !pattern.test(email)) {
            $("#" + tipSpanId).html("<s:text name='onlive.term.email.error'/>");
        }
    }
    function checkOnliveForm() {
        var b1 = checkNecessaryContent($("#onlive_title"), "title_tip", "<s:text name='onlive.channel.name.empty'/>");
        var b2 = checkNecessaryContent($("#onlive_desp"), "desp_tip", "<s:text name='onlive.channel.intro.empty'/>");
        var b3 = checkNecessaryContent($("#onlive_logo_hidden"), "logo_tip", "<s:text name='onlive.channel.logo.empty'/>");
        return b1 && b2 && b3;
    }
    function checkOnliveFormForCreateChannel() {
        var b1 = checkNecessaryContent($("#onlive_title"), "title_tip", "<s:text name='onlive.channel.name.empty'/>");
        var b2 = checkNecessaryContent($("#onlive_desp"), "desp_tip", "<s:text name='onlive.channel.intro.empty'/>");
        var b3 = checkNecessaryContent($("#onlive_logo_hidden"), "logo_tip", "<s:text name='onlive.channel.logo.empty'/>");
        $("#createChannelTerm").attr('value', true);
        return b1 && b2 && b3;
    }
</script>