<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/virtualClass/personalVirtualRoom_js.jsp" %>
<%@ include file="/js/virtualClass/virtualClass_js.jsp" %>

<div class="room_cont">
    <s:hidden value="%{#session.userID}" id="hidSessionId"/>
    <div class="room_header">
        <div id="apDiv1"><img src="<s:property value="userPrivateChannel.user.pic"/>"
                              alt="<s:property value="userPrivateChannel.user.nickName"/>"/></div>
        <div class="user_msg">
            <h4><s:property value="userPrivateChannel.user.nickName"/></h4>
            <a href="javascript:;" class="focus"><s:property value="%{getText('onlive.focus.on')}"/></a>
        </div>
        <div class="user_nums">
            <%--<span class="out"><span class="orWord_large">20</span>&nbsp;课程</span>--%>
            <%--<span class="out"><span class="orWord_large">20</span>&nbsp;学生</span>--%>
            <span class="out"><span class="orWord_large"><s:property value="userFansNum"/></span>&nbsp;<s:property
                    value="%{getText('onlive.fensi')}"/></span>
        </div>
        <div class="room_effect">
            <%-- host端看看直播效果和推荐好友，guest端是推荐好友 --%>
            <s:if test="host">
                <a id="addLiveTitle" href="#add_live_title" target="_blank"><s:property
                        value="%{getText('gogowise.personalOnlive.title')}"/></a>
                <%--<a href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="personalOnlive.id"/>" target="_blank"><s:property value="%{getText('personal.onlive.host.watch.living')}"/></a>--%>
            </s:if>
            <%--<a id="guest_invite" href="#invite_student_container" target="_blank"><s:property value="%{getText('personal.onlive.recommend.friend')}"/></a>--%>
            <span class="out"><%--<s:property value="%{getText('personal.onlive.last.time')}"/>--%>&nbsp;<span
                    class="orWord_large" id="personalOnlive_duration">0</span>&nbsp;<s:property
                    value="%{getText('label.minute')}"/></span>
            <span class="out"><%--<s:property value="%{getText('personal.onlive.start.time')}"/>--%>&nbsp;<span
                    class="orWord_large"><s:date name="subPrivateChannel.openTime"
                                                 format="%{getText('dateformat.forclass')}"/></span></span>
        </div>
    </div>
    <div class="room_flash">
        <div class="flash_cont" style="position:relative;background: #ebebeb;height: auto;">

            <iframe scrolling="no" frameborder="0" src="partyMessage.html" id="messages" allowtransparency="true"
                    name="messages"
                    style="background:#fff;width:400px; height:255px;position:absolute;top:380px;left:505px;z-index:2;"></iframe>

            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                    codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                    name="Girl" width="860" height="650" id="Girl" wmode="transparent"
                    style="position:relative;z-index:3;">
                <param name="movie" value="<s:property value="flashPatch"/>"/>
                <param name="quality" value="high"/>
                <param name="wmode" value="transparent"/>
                <param name="allowFullScreen" value="true"/>
                <embed src="<s:property value="flashPatch"/>" allowFullScreen="true" width="860" height="650"
                       quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
                       type="application/x-shockwave-flash" wmode="transparent" name="Girl" id="GirlEmbed"></embed>
            </object>
        </div>

    </div>

    <%--<s:if test="existCourses">--%>
    <%--<div class="room_ad">--%>
    <%--<ul>--%>
    <%--<s:iterator value="courses">--%>
    <%--<li><a href="voaCourseBlog.html?course.id=<s:property value="id"/>" target="_blank"><img src="<s:property value="logoUrl"/>" width="50" height="50" alt="<s:property value="name"/>" /></a></li>--%>
    <%--</s:iterator>--%>
    <%--</ul>--%>
    <%--</div>--%>
    <%--</s:if>--%>
    <%-- Host端，下面为host的粉丝列表，Guest端，下面为最热个人博客 --%>


    <%--<s:if test="host">--%>
    <%--<div class="room_exp">--%>
    <%--<h3><s:property value="%{getText('personal.onlive.my.fans')}"/></h3>--%>
    <%--<ul>--%>
    <%--<s:iterator value="userFanses">--%>
    <%--<li><a href="userBlog.html?user.id=<s:property value="fan.id"/>" title="<s:property value="fan.nickName"/>"><img src="<s:property value="fan.pic"/>" alt="<s:property value="fan.nickName"/>" /><span title="<s:property value="fan.nickName"/>"><s:property value="fan.nickName"/></span></a></li>--%>
    <%--</s:iterator>--%>
    <%--</ul>--%>
    <%--</div>--%>
    <%--</s:if>--%>
    <%--<s:else>--%>
    <%--<div class="room_exp">--%>
    <%--<h3><s:property value="%{getText('personal.onlive.hotest.user.blog')}"/></h3>--%>
    <%--<ul>--%>
    <%--<s:iterator value="hotestUsers">--%>
    <%--<li><a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>" target="_blank"><img src="<s:property value="pic"/>" alt="<s:property value="nickName"/>" /><span title="<s:property value="nickName"/>"><s:property value="nickName"/></span></a></li>--%>
    <%--</s:iterator>--%>
    <%--</ul>--%>
    <%--</div>--%>
    <%--</s:else>--%>
    <%--<s:if test="existOnlivingPer">--%>
    <%--<div class="room_exp">--%>
    <%--<h3><s:property value="%{getText('other.onliving.personal.live')}"/></h3>--%>
    <%--<ul>--%>
    <%--<s:iterator value="personalOnlives">--%>
    <%--<li><a href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="id"/>" title="<s:property value="owner.nickName"/>" target="_blank"><img src="<s:property value="owner.pic"/>" alt="<s:property value="owner.nickName"/>"/><span title="<s:property value="owner.nickName"/>"><s:property value="owner.nickName"/></span></a></li>--%>
    <%--</s:iterator>--%>
    <%--</ul>--%>
    <%--</div>--%>
    <%--</s:if>--%>
</div>

<div style="display:none;">
    <div class="invite_student_container" id="invite_student_container">
        <s:form id="emailForm_personalOnlive">
            <s:hidden name="personalOnlive.id"/>
            <div class="invite_student_inner">

                <p class="link_para"><span id="inviteFriendHref"><s:property value="inviteFriendHref"/></span></p>

                <p><span class="clip_link_btn" onclick="copyToClipboard();"><s:property
                        value="%{getText('course.invite.link.copy')}"/></span></p>

                <p class="or_pragraph"><s:property value="%{getText('course.selection.or')}"/></p>

                <p class="leave_msg"><label><s:property value="%{getText('button.message')}"/></label><textarea
                        id="invite_comments" name="inviteMessage"></textarea></p>

                <p class="email_list" id="invite_email_list">
                    <span><s:property value="%{getText('label.email.friend')}"/><label id="invite_add_email"><s:property
                            value="%{getText('interview.add')}"/></label>&nbsp;&nbsp;<label
                            id="invite_email_msg"></label><br/>
                        <input type="text" class="emails" onblur="checkInviteEmail(this);" name="emails"></span>
                </p>

                <p class="begin_invite"><label onclick="inviteFriends();"><s:property
                        value="%{getText('course.invite.begin')}"/></label>&nbsp;&nbsp;&nbsp;<span id="inviteMessage"
                                                                                                   style="color: green;"></span>
                </p>
            </div>
        </s:form>
    </div>

    <div id="add_live_title">
        <input class="input1" type="text" placeholder="在这里添加主题" id="personalOnlive_name"/><br/>
        <span>温馨提示：一个精彩的直播主题能让您的直播在众多个人直播中脱颖而出，也会为您和您的粉丝在今后查看您的直播历史记录时提供更大的方便。如：长沙2012元旦橘子洲头烟火盛会</span><br/>
        <input class="input2" type="button" onclick="addPerOnliveName(<s:property value="personalOnlive.id"/>);"
               value="确定添加"/>

        <div id="addPerOnliveName_Msg"></div>
    </div>
</div>


</div>

<script type="text/javascript">
    var right_div = "<div class='tip_right'></div><span style='color: green;'>添加成功</span>";
    var currTime = 0;
    timeCount();
    function timeCount() {
        $("#personalOnlive_duration").html(currTime);
        currTime++;
        setTimeout("timeCount();", 60000);
    }

    $(function () {
        $('#addLiveTitle').fancybox();
        $('#guest_invite').fancybox();
    });

    function addPerOnliveName(onliveID) {
        var title = $("#personalOnlive_name").val();
        //  alert(onliveID+" :" + title);
        $.post("addPerOnliveTitle.html", {'personalOnlive.id': onliveID, 'personalOnlive.title': title});
        $("#addPerOnliveName_Msg").html(right_div)
        setTimeout("$.fancybox.close();", 3000);
    }
</script>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript" src="js/virtualVideoRoom.js"></script>
<link href="css/onlive/personal_virtual_room.css" rel="stylesheet" type="text/css"/>
<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
    function CreateRoom() {
        setframe();
        var url = window.location.href;
        var urlarr = url.split("/");
        urlarr[urlarr.length - 1] = "";
        url = urlarr.join("/");
        getGirlOjbect().CreateRoomComplete("<s:property value='initSeesionString' escape='false' />", "");
    }
    function CloseBrowser() {
        getGirlOjbect().closeBrowser();
        window.location.href = "closeSubChannel.html?subPrivateChannel.id=<s:property value='subPrivateChannel.id'/>";
    }
    function InRoom() {
        setframe();
        getGirlOjbect().InRoomComplete("<s:property value='initSeesionString' escape='false' />", "");
    }


    function RecordStart(OnliveID) {
        //   alert("RecordStart personalOnlive.id :"+OnliveID);
//            $.post("perOnliveRecordStart.html",{'personalOnlive.id':OnliveID});
    }

    function saveChatRecord(OnliveID, UserID, lastmessage) {
//         $.post("saveUserComments.html",{'comment.owner.id':UserID,'comment.description':lastmessage,'personalOnlive.id':OnliveID});
    }

    function getNumOfRegAudience(onliveID, number) {
//          $.post("saveNumOfRegAudience.html",{'personalOnlive.id':onliveID,'personalOnlive.numOfRegAudience':number});
    }
    function getNumOfAudience(onliveID, number) {
//          $.post("saveNumOfAudience.html",{'personalOnlive.id':onliveID,'personalOnlive.numOfAudience':number});
    }

</script>
