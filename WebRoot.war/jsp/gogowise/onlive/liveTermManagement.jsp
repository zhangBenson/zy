<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/onlive/live_term_manage.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<style type="text/css">
    .tip_error {
        float: left;
        margin-right: 3px;
        background-image: url(../../images/input_msg_tip.png);
        background-position: 0px 0px;
        width: 16px;
        height: 16px;
    }

    .input_msg {
        color: #ff0000;
        font-size: 13px;
        font-weight: lighter;
        display: block;
        float: left;
        margin-top: 0px;
    }

    .tip_warn {
        float: left;
        margin-right: 3px;
        background-image: url(../../images/input_msg_tip.png);
        background-position: 0px -150px;
        width: 16px;
        height: 16px;
    }

    .tip_right {
        float: left;
        margin-right: 3px;
        background-image: url(../../images/input_msg_tip.png);
        background-position: 0px -250px;
        width: 16px;
        height: 16px;
    }
</style>

<div class="mf_1">
    <p id="sub_nav"><a href="initMyOnlive.html"><s:property value="%{getText('my.onlive')}"/></a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<s:property
            value="%{getText('management.the.terms.info')}"/></p>
</div>
<div class="ltm">
    <s:iterator value="liveChannel.channelTermses" status="idx">
        <div class="bg_top"></div>
        <div class="ltm_all">
            <p class="course_logo"><a href="liveTermBlog.html?channelTerms.id=<s:property value="id"/>"><img
                    src="<s:property value="logoUrl"/>"/></a></p>
            <h4><a href="javascript:;"><s:property value="name"/><s:property value="subTitle"/></a></h4>

            <p class="date"><s:date name="startTime" format="%{getText('dateformat.forclass')}"/></p>

            <p class="details cf">
                <span class="fl"><s:property value="%{getText('onlive.channel.introduction')}"/>：<s:property
                        value="description"/><s:property value="description"/></span>
            </p>

            <div class="time">
                <a class="manage_course add_highlight" href="javascript:;"><s:property
                        value="%{getText('term.add.titbits')}"/></a>
                <a class="manage_course manage_live_term" href="javascript:;"><s:property
                        value="%{getText('term.info.update')}"/></a>
            </div>


            <div class="highlight highlight<s:property value='#idx.index'/>">
                <form enctype="multipart/form-data" id="liveChannel_newEvent<s:property value="#idx.index"/>">
                    <input type="hidden" name="channelTerms.id" value="<s:property value="id"/>"/>

                    <div class="area">
                        <p>花絮标题</p>
                        <input type="text" name="liveChannelNewEvent.title"/>
                    </div>
                    <div class="area">
                        <p>请在这里添加花絮图片</p>

                        <div class="show_logo_input_msg input_msg"
                             id="channelEvent_msg<s:property value="#idx.index"/>"></div>
                        <img src="images/defaultImgs/onlive.jpg"
                             id="channelEvent_log_preview<s:property value="#idx.index"/>"/><br/>
                        <input type="file" name="upload"
                               id="channelEvent_logoUrl_upload<s:property value="#idx.index"/>"/>
                        <input type="hidden" name="liveChannelNewEvent.logoUrl"
                               id="channelNewEventLogo<s:property value="#idx.index"/>"/>
                    </div>
                    <div class="area">
                        <p><s:property value="%{getText('term.info.update.right.there')}"/><span
                                class="live_term_highlight_tip"></span></p>
                        <textarea name="liveChannelNewEvent.content"
                                  id="channelTerm<s:property value="#idx.index"/>"></textarea>
                    </div>
                    <div class="handle">
                        <a href="javascript:;" class="submit"
                           onclick="saveTitbits(<s:property value='#idx.index'/>);"><s:property
                                value="%{getText('term.info.save')}"/></a>
                        <a href="javascript:;" class="cancel"
                           onclick="closeHighlight(<s:property value='#idx.index'/>);"><s:property
                                value="%{getText('term.info.reset')}"/></a>
                    </div>
                </form>
            </div>
            <script type="text/javascript">

            </script>


            <div class="live_term_info live_term_info<s:property value="#idx.index"/>">
                <form id="termForm<s:property value="#idx.index"/>">
                    <s:hidden name="id" id="termsID"/>
                    <div class="lti_1 lti_0">
                        <p><s:property value="%{getText('onlive.channel.term.name')}"/><span id="live_term_title_tip"
                                                                                             class="live_term_tip"></span>
                        </p>
                        <s:textfield id="live_term_title" name="subTitle"/>
                    </div>
                    <div class="lti_2 lti_0">
                        <p><s:property value="%{getText('channel.term.des')}"/><span id="live_term_desc_tip"
                                                                                     class="live_term_tip"></span></p>
                        <s:textarea id="live_term_desc" name="description"/>
                    </div>
                    <div class="lti_3 lti_0">
                        <p><s:property value="%{getText('onlive.channel.term.logo')}"/><span
                                id="live_term_logo_tip<s:property value='#idx.index'/>" class="live_term_tip"></span>
                        </p>
                        <img id="live_term_logo_img<s:property value='#idx.index'/>"
                             src="<s:property value='logoUrl'/>"/>
                        <input type="file" class="" id="live_term_logo_upload<s:property value='#idx.index'/>"
                               name="upload"/>
                        <s:hidden id="live_term_logo_hidden" name="logoUrl"/>
                    </div>
                    <div class="lti_1 lti_0">
                        <p><s:property value="%{getText('onlive.host.name')}"/><span id="live_term_host_tip"
                                                                                     class="live_term_tip"></span></p>
                        <s:textfield id="live_term_title_hostEmail" name="hostEmail"
                                     onblur="checkNecessaryEmail(this,'live_term_host_tip');"/>
                    </div>
                    <div class="lti_1 lti_0">
                        <p><s:property value="%{getText('channel.term.contetant')}"/><a href="javascript:;"
                                                                                        class="player_add_btn add_btn"
                                                                                        id="player_add_btn<s:property value="#idx.index"/>"><s:property
                                value="%{getText('interview.add')}"/></a><span id="live_term_player_tip"
                                                                               class="live_term_tip"></span></p>
                            <%--<s:textfield id="live_term_title" name="contestants" onblur="checkUnnecessaryEmail(this,'live_term_player_tip');" value=""/>--%>
                    </div>
                    <div class="lti_1 lti_0">
                        <p><s:property value="%{getText('channel.term.guest')}"/><a href="javascript:;"
                                                                                    class="guest_add_btn add_btn"
                                                                                    id="guest_add_btn<s:property value="#idx.index"/>"><s:property
                                value="%{getText('interview.add')}"/></a><span id="live_term_guest_tip"
                                                                               class="live_term_tip"></span></p>
                            <%--<s:textfield id="live_term_title" name="guests" onblur="checkUnnecessaryEmail(this,'live_term_guest_tip');" value=""/>--%>
                    </div>
                    <div class="lti_4 lti_0">
                        <a href="#fancybox" class="handle_btn submit"
                           onclick="updateTermInfo(<s:property value='#idx.index'/>);"><s:property
                                value="%{getText('term.info.save')}"/></a>
                        <a href="javascript:;" class="handle_btn cancel"
                           onclick="closeTermInfo(<s:property value='#idx.index'/>);"><s:property
                                value="%{getText('term.info.reset')}"/></a>
                    </div>
                </form>
            </div>
        </div>
        <div class="bg_bottom"></div>
        <script type="text/javascript">
            $(document).ready(function () {
                <s:iterator value="contestants">
                $("#player_add_btn<s:property value="#idx.index"/>").parent().parent().append("<input type='text' value='<s:property value="memberEmail"/>' name='contestants' class='long_text_field onlive_host'  onblur='checkUnnecessaryEmail(this,\"live_term_player_tip\");' /><a href='javascript:;' class='del_btn' onclick='delPreAndMe(this,<s:property value="id"/>);'>" + "<s:text name='course.class.delete'/>" + "</a>");
                </s:iterator>
                <s:iterator value="guests">
                $("#guest_add_btn<s:property value="#idx.index"/>").parent().parent().append("<input type='text' value='<s:property value="memberEmail"/>' name='guests' class='long_text_field onlive_guest' onblur='checkUnnecessaryEmail(this,\"live_term_guest_tip\");' /><a href='javascript:;' class='del_btn' onclick='delPreAndMe(this,<s:property value="id"/>);'>" + "<s:text name='course.class.delete'/>" + "</a>");
                </s:iterator>
            });
        </script>
    </s:iterator>

</div>

<script type="text/javascript">
    var right_div = "<div class='tip_right'></div>";
    var warn_div = "<div class='tip_warn'></div>";
    var showLogoUploadSuccess = "上传成功";
    var words_on_uploadButton = "Browse";
    <s:iterator value="liveChannel.channelTermses" status="idx">
    $("#channelEvent_logoUrl_upload<s:property value="#idx.index"/>").uploadify({
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
        // 'fileDataName' : 'uploads',
        'folder': 'upload/file/tmp',
        'fileDesc': 'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
        'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
        onComplete: function (event, queueID, fileObj, response, data) {
            var jsonRep = $.parseJSON(response);
            var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
            document.getElementById('channelNewEventLogo<s:property value="#idx.index"/>').value = jsonRep.genFileName;
            $("#channelEvent_log_preview<s:property value="#idx.index"/>").attr("src", real_path);
            $("#channelEvent_msg<s:property value="#idx.index"/>").html(right_div + showLogoUploadSuccess);
        },
        onError: function (event, queueID, fileObj) {
            $(".show_logo_input_msg").html("file:" + fileObj.name + "upload failed");
        },
        onCancel: function (event, queueID, fileObj) {
            $(".show_logo_input_msg").html("cancel " + fileObj.name);
        },
        onUploadStart: function (event, queueID, fileObj) {
            $("#channelEvent_msg<s:property value="#idx.index"/>").html(warn_div + "开始上传");
        }
    });
    </s:iterator>
    $(function () {
        $(".add_highlight").bind("click", function () {
            $(this).parent().siblings("div.highlight").slideToggle();
        });
        $(".manage_live_term").bind("click", function () {
            $(this).parent().siblings("div.live_term_info").slideToggle();
        });

        $("#live_term_title").keyup(function () {
            changeWordNumber(this, $("#live_term_title_tip"), 50);
        }).focus(function () {
            $("#live_term_title_tip").html("");
        }).blur(function () {
            $("#live_term_title_tip").html("");
            checkNecessaryContent(this, "live_term_title_tip", "<s:text name='onlive.term.name.empty'/>");
        });
        $("#live_term_desc").keyup(function () {
            changeWordNumber(this, $("#live_term_desc_tip"), 200);
        }).focus(function () {
            $("#live_term_desc_tip").html("");
        }).blur(function () {
            $("#live_term_desc_tip").html("");
            checkNecessaryContent(this, "live_term_desc_tip", "<s:text name='onlive.term.name.empty'/>");
        });

        $(".player_add_btn").click(function () {
            $(this).parent().parent().append("<input type='text' name='contestants' class='long_text_field onlive_host'  onblur='checkUnnecessaryEmail(this,\"live_term_player_tip\");' /><a href='javascript:;' class='del_btn' onclick='delPreAndMe(this,0);'>" + "<s:text name='course.class.delete'/>" + "</a>");
        });
        $(".guest_add_btn").click(function () {
            $(this).parent().parent().append("<input type='text' name='guests' class='long_text_field onlive_guest' onblur='checkUnnecessaryEmail(this,\"live_term_guest_tip\");' /><a href='javascript:;' class='del_btn' onclick='delPreAndMe(this,0);'>" + "<s:text name='course.class.delete'/>" + "</a>");
        });

    });


    function checkNecessaryContent(obj, tipSpanId, emptyTip) {
        if ($(obj).val().replace(/(^\s*)|(\s*$)/g, "") == "") {
            $("#" + tipSpanId).html(emptyTip);
            return false;
        }
        return true;
    }
    function checkTime(obj, tipSpanId) {
        var timeStr = $(obj).val();
        var selectedTime = new Date(timeStr.replace(/-/g, '/'));
        if (timeStr == "") {
            $("#" + tipSpanId).html("<s:text name='onlive.term.time.empty'/>");
            return false;
        }
        else if (selectedTime <= new Date()) {
            $("#" + tipSpanId).html("<s:text name='onlive.term.time.litter.than.now'/>");
            return false;
        }
        return true;
    }
    function checkNecessaryEmail(obj, tipSpanId) {
        $("#" + tipSpanId).html("");
        var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
        var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
        if (email == "") {
            $("#" + tipSpanId).html("<s:text name='onlive.term.email.empty'/>");
            return false;
        }
        else if (!pattern.test(email)) {
            $("#" + tipSpanId).html("<s:text name='onlive.term.email.error'/>");
            return false;
        }
        return true;
    }
    function checkUnnecessaryEmail(obj, tipSpanId) {
        $("#" + tipSpanId).html("");
        var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
        var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
        if (email != "" && !pattern.test(email)) {
            $("#" + tipSpanId).html("<s:text name='onlive.term.email.error'/>");
        }
    }
    function delPreAndMe(obj, channelTermID) {
        if (channelTermID != null && channelTermID != 0) {
            $.post("deleteTermsMember.html", {'memberOfLiveChannel.id': channelTermID}, function (data) {
            });
        }
        $(obj).prev().remove();
        $(obj).remove();
    }

    function saveTitbits(messageID) {
        var formData = $("#liveChannel_newEvent" + messageID).serialize();
        //alert(formData);
        $.post("saveChannelNewEvent.html", formData);
        $.fancybox({
            content: "<s:text name='info.add.success'/>"
        });
        setTimeout("$.fancybox.close();", 2000);
    }
    function closeHighlight(index) {
        $(".highlight" + index).slideUp();
    }

    function updateTermInfo(formID) {
        var id = "#termForm" + formID;
        var vas = $(id).serialize();
        $.post("updateTermInfo.html", vas);
        $.fancybox({
            overlayShow: false,
            showCloseButton: false,
            content: "保存成功！"
        });
        window.setTimeout(function () {
            $.fancybox.close();
            $(".live_term_info" + formID).slideUp();
        }, 2000);

    }

    function closeTermInfo(formID) {
        $(".live_term_info" + formID).slideUp();
    }


</script>

