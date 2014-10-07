<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link type="text/css" href="css/download/<s:text name="download.css.file"/>" rel="stylesheet"/>

<div class="banner">
    <p><s:text name="download.version"/>1.0 &nbsp;&nbsp;&nbsp;<s:property
            value="%{getText('download.size')}"/>9.31MB</p>

    <p><s:text name="download.publish.time"/>08/30/2012</p>

    <p><s:text name="download.sys.require"/>Android2.2+</p>

    <p><s:text name="android.download.time"/>：<s:property value="downloadTime.downloadTimes"/></p>
    <a href="javascript:startDownload();" class="download1"></a><br/>
    <a href="javascript:goToGooglePlay();" class="download2"></a><br/>

    <div class="android"></div>
</div>

<div id="content">
    <div class="content_m">
        <div class="content_mm">
            <h2><s:text name="download.real.time.video"/></h2>

            <p><s:text name="download.share.happiness"/></p>
            <img src="images/download/img4.png"/>
        </div>

        <img style="float:left;margin-right:60px;" src="images/download/line.png"/>

        <div class="content_mm">
            <h2><s:text name="download.virtual.room"/></h2>

            <p><s:text name="download.share.knowledge"/></p>
            <img src="images/download/img5.png"/>
        </div>

        <img style="float:left;margin-right:60px;" src="images/download/line.png"/>

        <div class="content_mm">
            <h2><s:text name="download.personal.show"/></h2>

            <p><s:text name="download.only.one"/></p>
            <img src="images/download/img6.png"/>
        </div>

        <div style="clear:both"></div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $(".menu_base_download").addClass("menu_base_current");
    });

    function startDownload() {
        $.post("addDownloadTime.html");
        window.location.href = "software/GoGoWise.apk";
    }
    function goToGooglePlay() {
        $.post("addDownloadTime.html");
        var url = "https://play.google.com/store/apps/details?id=air.GoGoWise";
        goUrl(url);
    }
</script>

