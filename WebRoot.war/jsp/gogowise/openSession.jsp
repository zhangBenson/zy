<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/virtualClass/virtualClass_js.jsp" %>
<link href="css/virtualClass/virtualVideoRoom.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript" src="js/virtualVideoRoom.js"></script>
<s:form>
    <s:hidden value="fromHost"/>

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
            window.location.href = "closeBrowser.html?roleType=<s:property value='roleType'/>";
        }
        function InRoom() {
            setframe();
            getGirlOjbect().InRoomComplete("<s:property value='initSeesionString' escape='false' />", "");
        }

        <s:if test="roleType==1">
        $(document).ready(function () {
            $(document).countdown({
                date: '<s:date name="courseClass.date" format="%{getText('date.formate.firstpage.course.startdate')}"/>',
                onChange: function (event, timer) {
                },
                onComplete: function (event) {
                    getGirlOjbect().classRing();
                },
                leadingZero: true,
                direction: "down"
            });
        });
        $(document).ready(function () {
            $(document).countdown({
                date: '<s:date name="courseClass.finishDate" format="%{getText('date.formate.firstpage.course.startdate')}"/>',
                onChange: function (event, timer) {
                },
                onComplete: function (event) {
                    getGirlOjbect().classRing();
                },
                leadingZero: true,
                direction: "down"
            });
        });
        </s:if>

    </script>

    <div class="course_msg">
        <div class="course_title">
            <s:a action="voaCourseBlog" target="_blank"><s:param name="course.id"
                                                                 value="courseClass.course.id"/><s:property
                    value="courseClass.course.name"/></s:a>
            <span>(<s:if test="courseClass.course.personalTeacher!=null">
                <s:if test="courseClass.course.teachingNum==1"><s:property
                        value="%{getText('label.tutor.1to1')}"/></s:if>
                <s:if test="courseClass.course.teachingNum==2"><s:property
                        value="%{getText('label.tutor.1to2')}"/></s:if>
                <s:if test="courseClass.course.teachingNum==3"><s:property
                        value="%{getText('label.tutor.1to3')}"/></s:if>
                <s:if test="courseClass.course.teachingNum==4"><s:property
                        value="%{getText('label.tutor.1to4')}"/></s:if>
            </s:if>
            <s:else>
                <s:if test="courseClass.course.opened"><s:property
                        value="%{getText('label.online.class.public')}"/></s:if>
                <s:else>
                    <s:if test="courseClass.course.teachingNum==1"><s:text name="label.tutor.1to1"/></s:if>
                    <s:if test="courseClass.course.teachingNum==2"><s:text name="label.tutor.1to2"/></s:if>
                    <s:if test="courseClass.course.teachingNum==3"><s:text name="label.tutor.1to4"/></s:if>
                </s:else>
            </s:else>)</span>
        </div>
        <div class="teacher_name">
            <s:text name="label.forcast.lecturer"/>：
            <s:a action="userBlog" target="_blank"><s:param name="user.id"
                                                            value="courseClass.course.teacher.id"/><s:property
                    value="courseClass.course.teacher.nickName"/></s:a>
        </div>
        <div class="operate">
            <a id="invite_students" class="submit_btn" href="#invite_student_container"
               title="<s:text name="course.invite.tip.words"/>"><s:property
                    value="%{getText('course.invite.friend')}"/></a>
        </div>
    </div>

    <div class="flash_wrap">
        <iframe scrolling=no frameborder="0" src="partyMessage.html" allowtransparency="true" id="messages"
                name="messages"
                style="background:#fff;width:430px; height:200px;position:absolute;top:355px;left:485px;z-index:2;"></iframe>

        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                name="Girl" width="1004" height="630" id="Girl" wmode="transparent" class="flash_obj">
            <param name="movie" value="<s:property value="flashPatch"/>"/>
            <param name="quality" value="high"/>
            <param name="wmode" value="transparent"/>
            <param name="allowFullScreen" value="true"/>
            <embed src="<s:property value="flashPatch"/>" allowFullScreen="true" allowtransparency="true" width="1004"
                   height="630" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
                   type="application/x-shockwave-flash" wmode="transparent" name="Girl" id="GirlEmbed"></embed>
        </object>
    </div>

    <div class="invite_student_container" id="invite_student_container">
        <s:form id="emailForm">
            <s:hidden name="courseClass.id"/>
            <s:hidden name="user.id" value="#session.userID"/>
            <div class="invite_student_inner">

                <p class="link_para"><span id="inviteFriendHref"><s:property value="inviteFriendHref"/></span></p>

                <p><span class="clip_link_btn" onclick="copyToClipboard();"><s:property
                        value="%{getText('course.invite.link.copy')}"/></span></p>

                <p class="or_pragraph"><s:text name="course.selection.or"/></p>

                <p class="leave_msg"><label><s:text name="button.message"/></label><textarea
                        id="invite_comments" name="inviteMessage"></textarea></p>

                <p class="email_list" id="invite_email_list">
                    <span><s:text name="label.email.friend"/><label id="invite_add_email"><s:property
                            value="%{getText('interview.add')}"/></label>&nbsp;&nbsp;<label
                            id="invite_email_msg"></label><br/>
                        <input type="text" class="emails" onblur="checkInviteEmail(this);" name="emails"></span>
                </p>

                <p class="begin_invite"><label onclick="startInvite();"><s:property
                        value="%{getText('course.invite.begin')}"/></label></p>
            </div>
        </s:form>
    </div>
</s:form>
