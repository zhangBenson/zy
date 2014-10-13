<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link type="text/css" rel="stylesheet" href="css/map/mapHeader.css">


<div id="header">
    <h1>
        <a href="index.html" target="_blank" title="<s:text name="title.gogowise"/>"></a>
    </h1>

    <p class="words"><s:text name="share.happy.share.knowlege"/></p>

    <div class="searchWrap">
        <form action="liveListOnMap.html" method="post">
            <input type="text" class="text" id="liveSearchInput" name="searchStr"
                   placeholder="<s:text name="map.head.param1"/>"/>
            <input type="submit" class="btn" id="liveSearchBtn"
                   value="<s:text name="map.head.param2"/>"/>
        </form>
    </div>

    <s:if test="#session.email !=null">
        <p class="handle">
            <a href="index.html"><s:text name="menu.item.index"/></a>
            &nbsp;<strong>|</strong>&nbsp;
            <a href="userBlog.html?user.id=<s:property value="#session.userID"/>" target="_blank"
               class="nick"><s:property value="#session.nickName"/></a>
            &nbsp;&nbsp;
            <a href="myfirstPage.html" target="_blank"><s:text name="usermenu.item.myhomepage"/></a>
            &nbsp;<strong>|</strong>&nbsp;
            <a href="initUpdate.html" target="_blank"><s:property value="%{getText('account.item.accountsettings')}"/></a>
            &nbsp;<strong>|</strong>&nbsp;
            <a href="myGGWAccount.html" target="_blank"><s:property value="%{getText('usermenu.item.zhibi.myAccount')}"/></a>
            &nbsp;<strong>|</strong>&nbsp;
            <a href="exitSystem.html"><s:text name="href.logout"/></a>
        </p>
    </s:if>
    <s:else>
        <p class="handle">
            <a href="index.html"><s:text name="menu.item.index"/></a>
            &nbsp;<strong>|</strong>&nbsp;
            <a href="login.html" id="login_btn"><s:text name="Login"/></a>
            &nbsp;<strong>|</strong>&nbsp;
            <a href="initReg.html" target="_blank"><s:text name="user.info.identity.finish.reg"/></a>
        </p>
    </s:else>

</div>

<script type="text/javascript">
    $(function () {
        $("#login_btn").fancybox({
            "type": "iframe",
            "width": 350,
            "height": 270
        });

        $("#favBtn").click(function () {
            var title = document.title;
            var url = location.href;
            addFavorite(url, title);
        });
    });

    //添加收藏
    function addFavorite(sURL, sTitle) {
        try {
            window.external.addFavorite(sURL, sTitle);
        } catch (e) {
            try {
                window.sidebar.addPanel(sTitle, sURL, "");
            } catch (e) {
                alert("<s:text name='add.collection.param1'/>");
            }
        }
    }

    //移动地图中心
    function moveCenterTo(markers, infoWindows, markIndex, latitude, longitude) {
        var livePoint = new BMap.Point(longitude, latitude);
        bMap.panTo(livePoint);
        markers[markIndex].openInfoWindow(infoWindows[markIndex]);
    }
</script>
