<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/virtualClass/virtualClass_js.jsp" %>
<link href="css/virtualClass/virtualVideoRoom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript" src="js/virtualVideoRoom.js"></script>

    <s:hidden value="fromHost" />

    <script language="JavaScript" type="text/javascript">
     function CreateRoom() {
           setframe();
           var url = window.location.href;
           var urlarr = url.split("/");
           urlarr[urlarr.length - 1] = "";
           url = urlarr.join("/");
           getGirlOjbect().CreateRoomComplete("<s:property value='initSeesionString' escape='false' />", "");
     }
     function CloseBrowser(){
          getGirlOjbect().closeBrowser();
          window.location.href="closeBrowser.html?roleType=<s:property value='roleType'/>";
     }
      function InRoom(){
              setframe();
               getGirlOjbect().InRoomComplete("<s:property value='initSeesionString' escape='false' />", "");
      }

       function RecordStart(OnliveID){
            $.post("channelTermRecordStart.html",{'channelTerms.id':OnliveID});
      }

    </script>
    <h2 style="color:#cc6600;"><s:property value="%{getText('onlive.virtual.room.head.title')}"/>：<s:property value="channelTerms.liveChannel.name"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <s:property value="%{getText('onlive.host.name')}"/>：<s:property value="channelTerms.host.nickName"/></h2>
    <div style="background-color:#EAEAEA; position: relative; z-index:1;">
        <iframe scrolling=no frameborder="0"  src="partyMessage.html" id="messages"  name="messages"  style="position:absolute;z-index:2;background-color:#FFF;top:355px;left:660px;*top:350px;*left:520px;width:300px; height:200px;*width:425px; *height:200px;margin: 0px;tapping:0px"></iframe>
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" name="Girl" width="1004" height="630" id="Girl" wmode="transparent" style="position:relative;z-index:3;" >
          <param name="movie" value="<s:property value="flashPatch"/>" />
          <param name="quality" value="high" />
          <param name="wmode" value="transparent" />
          <param name="allowFullScreen" value="true" />
            <embed src="<s:property value="flashPatch"/>" allowFullScreen="true" width="1004" height="730" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" name="Girl" id="GirlEmbed"></embed>
        </object>
    </div>
    <%--<div class="invite_btn_container">--%>
        <%--<a id="invite_students" href="#invite_student_container" title="<s:property value="%{getText('course.invite.tip.words')}"/>"><s:property value="%{getText('course.invite.friend')}"/></a>--%>
    <%--</div>--%>
    <%--<div class="report_btn_container">--%>
        <%--<a id="report_class" title="您可以点击此处举报该直播秀">举报该直播秀</a>--%>
    <%--</div>--%>
    <%--<div class="invite_student_container" id="invite_student_container">--%>
        <%--<s:form id="emailForm">--%>
            <%--<s:hidden name="courseClass.id"/>--%>
            <%--<s:hidden name="user.id" value="#session.userID"/>--%>
            <%--<div class="invite_student_inner">--%>

                <%--<p class="link_para"><span id="inviteFriendHref"><s:property value="inviteFriendHref"/></span></p>--%>

                <%--<p><span class="clip_link_btn" onclick="copyToClipboard();"><s:property value="%{getText('course.invite.link.copy')}"/></span></p>--%>

                <%--<p class="or_pragraph"><s:property value="%{getText('course.selection.or')}"/></p>--%>

                <%--<p class="leave_msg"><label><s:property value="%{getText('button.message')}"/></label><textarea id="invite_comments" name="inviteMessage"></textarea></p>--%>

                <%--<p class="email_list" id="invite_email_list">--%>
                    <%--<span><s:property value="%{getText('label.email.friend')}"/><label id="invite_add_email"><s:property value="%{getText('interview.add')}"/></label>&nbsp;&nbsp;<label id="invite_email_msg"></label><br/>--%>
                        <%--<input type="text" class="emails" onblur="checkInviteEmail(this);" name="emails"></span>--%>
                <%--</p>--%>

                <%--<p class="begin_invite"><label onclick="startInvite();"><s:property value="%{getText('course.invite.begin')}"/></label></p>--%>
            <%--</div>--%>
        <%--</s:form>--%>
    <%--</div>--%>
    <%--<div class="report_class_container" id="report_class_container">--%>
        <%--<s:form id="reportClassForm">--%>
            <%--<s:hidden name="courseClass.id"/>--%>
            <%--<s:hidden name="user.id" value="#session.userID"/>--%>
            <%--<div class="report_class_inner">--%>
                <%--<p class="report_leave_msg">举报留言</p>--%>
                <%--<p><textarea></textarea></p>--%>
                <%--<p><label id="report_class_btn" onclick="">举报该课程</label></p>--%>
            <%--</div>--%>
        <%--</s:form>--%>
    <%--</div>--%>

