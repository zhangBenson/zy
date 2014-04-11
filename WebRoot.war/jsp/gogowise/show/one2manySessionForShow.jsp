<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/virtualClass/virtualClass_js.jsp" %>
<link href="css/virtualClass/virtualVideoRoom.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript" src="js/virtualVideoRoom.js"></script>

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

</script>
<div class="course_msg">
    <s:a action="showBlog" cssClass="course_title" target="_blank"><s:param name="myShow.id"
                                                                            value="showTerms.myShow.id"/><s:property
            value="showTerms.myShow.name"/> </s:a>
    <div class="teacher_name">
        <s:property value="%{getText('show.host')}"/>：
        <s:a action="userBlog" target="_blank"><s:param name="user.id" value="showTerms.myShow.owner.id"/><s:property
                value="showTerms.myShow.owner.nickName"/></s:a>
    </div>
</div>
<div style="float:left;background-color:#EAEAEA; position: relative; z-index:1;">
    <s:if test="showTerms.myShow.owner.nickName == #session.nickName">
        <iframe scrolling=no frameborder="0" src="partyMessage.html" id="messages" name="messages"
                style="position:absolute;z-index:2;background-color:#FFF;top:355px;left:630px;*top:350px;*left:630px;width:330px; height:200px;*width:333px; *height:200px;margin: 0px;padding:0px"></iframe>
    </s:if>
    <s:else>
        <iframe scrolling=no frameborder="0" src="partyMessage.html" id="messages" name="messages"
                style="position:absolute;z-index:2;background-color:#FFF;top:355px;left:630px;*top:350px;*left:630px;width:286px; height:200px;*width:289px; *height:200px;margin: 0px;padding:0px"></iframe>
    </s:else>

    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" name="Girl"
            width="1004" height="630" id="Girl" wmode="transparent" class="flash_obj   ">
        <param name="movie" value="<s:property value="flashPatch"/>"/>
        <param name="quality" value="high"/>
        <param name="wmode" value="transparent"/>
        <param name="allowFullScreen" value="true"/>
        <embed src="<s:property value="flashPatch"/>" allowFullScreen="true" width="1004" height="630" quality="high"
               pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"
               wmode="transparent" name="Girl" id="GirlEmbed"></embed>
    </object>
</div>
