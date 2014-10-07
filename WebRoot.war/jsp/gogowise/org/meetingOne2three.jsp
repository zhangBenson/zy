<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript" src="js/virtualVideoRoom.js"></script>
<link href="css/room/roomBodyWithOneFlash.css" rel="stylesheet" type="text/css"/>
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
        function InRoom() {
            setframe();
            getGirlOjbect().InRoomComplete("<s:property value='initSeesionString' escape='false' />", "");
        }
        $(document).ready(function () {
            $(document).countdown({
                date: '<s:date name="orgMeeting.startTime" format="%{getText('date.formate.firstpage.course.startdate')}"/>',
                onChange: function (event, timer) {
                },
                onComplete: function (event) {
                    getGirlOjbect().classRing();
                },
                leadingZero: true,
                direction: "down"
            });
        });


    </script>

    <div class="titleWrapper">
        <h2>
            <s:property value="%{getText('org.matters.video.meeting')}"/>(<a
                href="orgBlog.html?org.id=<s:property value="orgMeeting.organization.id"/>" target="_blank"><s:property
                value="orgMeeting.organization.schoolName"/></a>)
        </h2>

        <h3>
            <s:property value="%{getText('org.meeting.virtual.host')}"/>:&nbsp;
            <a href="userBlog.html?user.id=<s:property value="orgMeeting.hostMan.id"/>" target="_blank"><s:property
                    value="orgMeeting.hostMan.nickName"/></a>
        </h3>
    </div>

    <div class="flashWrapper">
        <iframe scrolling=no frameborder="0" src="partyMessageOne2Three.html" id="messages" name="messages"
                style="position:absolute;z-index:2;background-color: white;top:410px;left:530px;*top:410px;*left:530px;width:405px; height:230px;*width:405px; *height:230px;"></iframe>

        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                name="Girl" width="1004" height="730" id="Girl" wmode="transparent"
                style="position:relative;z-index:3;">
            <param name="movie" value="<s:property value="flashPatch"/>"/>
            <param name="quality" value="high"/>
            <param name="wmode" value="transparent"/>
            <param name="allowFullScreen" value="true"/>
            <embed src="<s:property value="flashPatch"/>" allowFullScreen="true" width="1004" height="730"
                   quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
                   type="application/x-shockwave-flash" wmode="transparent" name="Girl" id="GirlEmbed"></embed>
        </object>
    </div>

</s:form>
