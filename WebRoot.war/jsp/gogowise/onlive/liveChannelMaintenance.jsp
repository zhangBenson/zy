<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/onlive/onlive_maintenance.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>

<div class="mf_1">
    <p id="sub_nav"><a href="initMyOnlive.html"><s:property value="%{getText('my.onlive')}"/></a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<span
            id="nav_title">如何才能让你的课程更吸引人？</span>（管理栏目信息）</p>
</div>

<div class="mf_2">
<s:form action="saveChannelTerms" method="POST" enctype="multipart/form-data">
    <s:hidden name="liveChannel.id"/>
    <ul>
    <li>
    <p class="title"><s:property value="%{getText('onlive.channel.name')}"/></p> </br>
    <p class="cont"><s:property value="liveChannel.name"/></p>
    </li>
    <li>
    <p class="title"><s:property value="%{getText('onlive.channel.description')}"/></p> </br>
    <p class="cont"><s:property value="liveChannel.description"/></p>
    </li>
    <li>
    <p class="title"><s:property value="%{getText('onlive.channel.term.name')}"/><span class="asterisk">*</span></p>
    <span class="tip_message" id="title_tip"></span>
    <s:textfield name="channelTerms.subTitle" cssClass="long_text_field" id="onlive_title"></s:textfield>
    </li>

    <li class="li_2">
    <p class="title"><s:property value="%{getText('onlive.channel.term.logo')}"/><span class="asterisk">*</span></p>
    <span class="tip_message" id="logo_tip"></span>
    <img src="images/defaultImgs/course.gif" id="logo_preview"/>
    <s:file id="onlive_logo" name="upload"></s:file>
    <s:hidden name="channelTerms.logoUrl" id="onlive_logo_hidden"/>
    </li>
    <li class="li_2">
    <p class="title"><s:property
        value="%{getText('onlive.channel.term.start.time')}"/><span class="asterisk">*</span></p>
    <span class="tip_message" id="time_tip"></span>
    <s:textfield cssClass="short_text_field WdateTime" name="channelTerms.startTime" id="onlive_time"/>
    </li>
    <li>
    <p class="title"><s:property value="%{getText('channel.term.des')}"/><span class="asterisk">*</span></p>
    <span class="tip_message" id="desp_tip"></span>
    <s:textarea name="channelTerms.description" cssClass="long_text_area" id="onlive_desp"/>
    </li>
    <li>
    <p class="title"><s:property value="%{getText('onlive.host.name')}"/><span class="asterisk">*</span></p>
    <span class="tip_message" id="host_tip"></span>
    <s:textfield name="channelTerms.hostEmail" cssClass="long_text_field" id="onlive_host"/>
    </li>
    <li>
    <p class="title"><s:property
        value="%{getText('channel.term.contetant')}"/></p><a class="add_btn" href="javascript:;"><s:property
        value="%{getText('interview.add')}"/></a>
    <span class="tip_message" id="player_tip"></span>
    <s:textfield name="contestants" cssClass="long_text_field" id="onlive_player"/>
    </li>
    <li>
    <p class="title"><s:property
        value="%{getText('channel.term.guest')}"/></p><a class="add_btn" href="javascript:;"><s:property
        value="%{getText('interview.add')}"/></a>
    <span class="tip_message" id="guest_tip"></span>
    <s:textfield name="guests" cssClass="long_text_field" id="onlive_guest"/>
    </li>
    </ul>
    <p class="btn_para"><s:submit cssClass="submit_btn" onclick="checkOnliveForm();"
                                  value="%{getText('onlive.channel.creation')}"/> </p>
    </div>

    <script type="text/javascript">
    $(function(){
    $("#onlive_type").keyup(function(){
    changeWordNumber(this,$("#type_tip"),50);
    }).focus(function(){
    $("#type_tip").html("");
    }).blur(function(){
    $("#type_tip").html("");
    });
    $("#onlive_title").keyup(function(){
    changeWordNumber(this,$("#title_tip"),50);
    }).focus(function(){
    $("#title_tip").html("");
    }).blur(function(){
    $("#title_tip").html("");
    checkNecessaryContent(this,"title_tip","<s:text name='onlive.term.name.empty'/>");
    });
    $("#onlive_time").focus(function(){
    $("#time_tip").html("");
    }).blur(function(){
    $("#time_tip").html("");
    checkTime(this,"time_tip");
    });
    $("#onlive_desp").keyup(function(){
    changeWordNumber(this,$("#desp_tip"),300);
    }).focus(function(){
    $("#desp_tip").html("");
    }).blur(function(){
    $("#desp_tip").html("");
    checkNecessaryContent(this,"desp_tip","<s:text name='onlive.term.intro.empty'/>");
    });
    $("#onlive_host").focus(function(){
    $("#host_tip").html("");
    }).blur(function(){
    $("#host_tip").html("");
    checkNecessaryEmail(this,"host_tip");
    });
    $("#onlive_player").focus(function(){
    $("#player_tip").html("");
    }).blur(function(){
    $("#player_tip").html("");
    checkUnnecessaryEmail(this,"player_tip");
    });
    $("#onlive_guest").focus(function(){
    $("#guest_tip").html("");
    }).blur(function(){
    $("#guest_tip").html("");
    checkUnnecessaryEmail(this,"guest_tip");
    });

    $("#onlive_logo").uploadify({
    /*注意前面需要书写path的代码*/
    'uploader':'js/uploadify/uploadify.swf',
    'script':'utils/uploadFile.html',
    'cancelImg':'js/uploadify/cancel.png',
    'queueID':'fileQueue1', //和存放队列的DIV的id一致
    'fileDataName':'fileupload', //和以下input的name属性一致
    'auto':true, //是否自动开始
    'multi':false, //是否支持多文件上传
    'buttonText':"Upload", //按钮上的文字
    'simUploadLimit':1, //一次同步上传的文件数目
    'sizeLimit':2000000, //设置单个文件大小限制
    'queueSizeLimit':1, //队列中同时存在的文件个数限制
    //'scriptData' : $("#userInfoForm").serialize(),
    // 'fileDataName' : 'uploads',
    'folder':'upload/file/tmp',
    'fileDesc':'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
    'fileExt':'*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
    onComplete:function (event, queueID, fileObj, response, data) {
    var jsonRep = $.parseJSON(response);
    var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
    document.getElementById('onlive_logo_hidden').value = jsonRep.genFileName;
    $("#logo_preview").attr("src", real_path);
    $("#logo_tip").html("<s:text name='image.logo.upload.success'/>");
    },
    onError:function (event, queueID, fileObj) {
    $("#logo_tip").html("file:" + fileObj.name + "upload failed");
    },
    onCancel:function (event, queueID, fileObj) {
    $("#logo_tip").html("cancel " + fileObj.name);
    },
    onUploadStart:function (event, queueID, fileObj) {
    $("#logo_tip").html("<s:text name='image.logo.start.upload'/>");
    }
    });
    });


    function checkNecessaryContent(obj,tipSpanId,emptyTip){
    if($(obj).val().replace(/(^\s*)|(\s*$)/g, "") == ""){
    $("#"+tipSpanId).html(emptyTip);
    return false;
    }
    return true;
    }
    function checkTime(obj,tipSpanId){
    var timeStr = $(obj).val();
    var selectedTime = new Date(timeStr.replace(/-/g,'/'));
    if(timeStr == ""){
    $("#"+tipSpanId).html("<s:text name='onlive.term.time.empty'/>");
    return false;
    }
    else if(selectedTime <= new Date()){
    $("#"+tipSpanId).html("<s:text name='onlive.term.time.litter.than.now'/>");
    return false;
    }
    return true;
    }
    function checkNecessaryEmail(obj,tipSpanId){
    var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
    var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
    if(email == ""){
    $("#"+tipSpanId).html("<s:text name='onlive.term.email.empty'/>");
    return false;
    }
    else if(!pattern.test(email)){
    $("#"+tipSpanId).html("<s:text name='onlive.term.email.error'/>");
    return false;
    }
    return true;
    }
    function checkUnnecessaryEmail(obj,tipSpanId){
    var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
    var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
    if(email != "" && !pattern.test(email)){
    $("#"+tipSpanId).html("<s:text name='onlive.term.email.error'/>");
    }
    }
    function checkOnliveForm(){
    var b1 = checkNecessaryContent($("#onlive_title"),"title_tip","<s:text name='onlive.term.name.empty'/>");
    var b2 = checkNecessaryContent($("#onlive_desp"),"desp_tip","<s:text name='onlive.term.intro.empty'/>");
    var b3 = checkTime($("#onlive_time"),"time_tip");
    var b4 = checkNecessaryEmail($("#onlive_host"),"host_tip");
    var b5 = checkNecessaryContent($("#onlive_logo_hidden"),"logo_tip","<s:text name='onlive.term.logo.empty'/>");

    return b1&&b2&&b3&&b4&&b5;
    }
    </script>