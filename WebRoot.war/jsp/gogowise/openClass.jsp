<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript" src="js/virtualVideoRoom.js"></script>
<s:form>
    <s:hidden value="fromHost"/>
    <style type="text/css">

        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }

        body, td, th {
            font-size: 9pt;
        }

    </style>
    <center>
        <h2 style="color:#cc6600;">课程名称：<s:property value="courseClass.course.name"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            授课老师：<s:property value="courseClass.course.teacher.nickName"/></h2>

        <div style="background-color:#EAEAEA; position: relative; z-index:1;">
            <iframe scrolling=no frameborder="0" src="partyMessage.html" id="messages" name="messages"
                    style="position:absolute;z-index:2;top:330px;left:480px;*top:360px;*left:520px;width:390px; height:180px;*width:425px; *height:200px;"></iframe>

            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                    codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                    name="Girl" width="1004" height="630" id="Girl" wmode="transparent"
                    style="position:relative;z-index:3;">
                <param name="movie" value="<s:property value="flashPatch"/>"/>
                <param name="quality" value="high"/>
                <param name="wmode" value="transparent"/>
                <param name="allowFullScreen" value="true"/>
                <embed src="<s:property value="flashPatch"/>" allowFullScreen="true" width="1004" height="630"
                       quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
                       type="application/x-shockwave-flash" wmode="transparent" name="Girl" id="GirlEmbed"></embed>
            </object>
        </div>
    </center>

</s:form>
