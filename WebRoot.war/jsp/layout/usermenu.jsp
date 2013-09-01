<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/usermenu.css" rel="stylesheet"/>

<div class="menu">
    <div class="portrait">
        <a class="por" href="userBlog.html?user.id=<s:property value="#session.userID"/>" title="<s:property value="%{getText('user.header.enter.my.blog')}"/>"><img id="usermenu_user_img" src="<s:property value="#session.userLogoUrl"/>" alt="<s:property value="#session.nickName"/>" /></a>
        <a class="nick" href="userBlog.html?user.id=<s:property value="#session.userID"/>" title="<s:property value="#session.nickName"/>"><s:property value="#session.nickName"/></a>
        <span class="num"><s:property value="#session.userFansNum"/>&nbsp;<s:property value="%{getText('user.add.focus')}"/><br/>0&nbsp;<s:property value="%{getText('course.consumptionType.true')}"/></span>
    </div>
    <div class="sidebar">

        <div class="start_monitor">
            <a class="submit_btn_large" href="openUserChannelResult.html"><s:property value="%{getText('contentLeft.param1')}"/></a>
        </div>

        <div class="list">
            <h3 class="h3_title"><s:property value="%{getText('usermenu.item.mycourses')}"/></h3>
            <ul>
                <li><a href="myForcastClass.html"><s:property value="%{getText('usermenu.item.my.created.courses')}"/></a></li>
                <li><a href="myRegistration.html"><s:property value="%{getText('usermenu.item.my.reged.courses')}"/></a></li>
                <%--<li><a href="createCourse.html"><s:property value="%{getText('usermenu.item.createcourse')}"/></a></li>--%>
                <li><a href="createCourseAllInOne.html"><s:property value="%{getText('usermenu.item.createcourse')}"/></a></li>
            </ul>
        </div>

        <div class="list">
            <h3 class="h3_title"><s:property value="%{getText('button.personal.show')}"/></h3>
            <ul>
                <li><a href="showManageResult.html"><s:property value="%{getText('usermenu.item.my.created.shows')}"/></a></li>
                <li><a href="myFollowing.html"><s:property value="%{getText('usermenu.item.my.focused.shows')}"/></a></li>
                <li><a href="initShowCreate.html"><s:property value="%{getText('show.creation')}"/></a></li>
                <li><a href="showRangeBoard.html"><s:property value="%{getText('show.hero.list')}"/></a></li>
            </ul>
        </div>

        <%--<div class="list">--%>
            <%--<h3 class="h3_title">多点直播</h3>--%>
            <%--<ul>--%>
                <%--<li><a href="privateLiveTip.html">开通提示页面</a></li>--%>
                <%--<li><a href="privateLiveCharge.html">资费套餐页面</a></li>--%>
                <%--<s:if test="#session.user_private_channelID != null">--%>
                    <%--<li><a href="openPrivateChannel.html?userPrivateChannel.id=<s:property value="#session.user_private_channelID"/>">多视频直播入口</a></li>--%>
                    <%--<li><a href="watchPrivateChannel.html?userPrivateChannel.id=<s:property value="#session.user_private_channelID"/>">观看直播情况</a></li>--%>
                    <%--<li><a href="openPrivateChannel.html?userPrivateChannel.id=<s:property value="#session.user_private_channelID"/>">我的监控室</a></li>--%>
                <%--</s:if>--%>
            <%--</ul>--%>
        <%--</div>--%>

        <%--<div class="list">--%>
            <%--<h3 class="h3_title"><s:property value="%{getText('onlive.channel')}"/></h3>--%>
            <%--<ul>--%>
                <%--<li><a href="initMyOnlive.html"><s:property value="%{getText('usermenu.item.my.created.channel')}"/></a></li>--%>
                <%--<li><a href="listParticipatingChannel.html"><s:property value="%{getText('usermenu.item.my.partispate.channel')}"/></a></li>--%>
                <%--<li><a href="listFollowingChannel.html"><s:property value="%{getText('usermenu.item.my.focused.channel')}"/></a></li>--%>
                <%--<li><a href="createOnlive.html"><s:property value="%{getText('onlive.creation')}"/></a></li>--%>
                <%--<li><a href="rangeLiveChannel.html"><s:property value="%{getText('onlive.channel.range')}"/></a></li>--%>
            <%--</ul>--%>
        <%--</div>--%>

        <s:if test="#session.user_own_org != null">
            <div class="list">
                <h3 class="h3_title"><s:property value="%{getText('usermenu.item.organizationmatters')}"/></h3>
                <ul>
                    <li><a href="initOrgCourseCreation.html"><s:property value="%{getText('usermenu.item.createcourse')}"/></a></li>
                    <li><a href="courseSupervise.html"><s:property value="%{getText('org.matters.course.supervisions')}"/></a></li>
                    <li><a href="orgInterview.html"><s:property value="%{getText('online.interview')}"/></a></li>
                    <li><a href="initOrgMeeting.html"><s:property value="%{getText('org.matters.video.meeting')}"/></a></li>
                    <li><a href="orgInfoUpdate.html"><s:property value="%{getText('org.information.setting')}"/></a></li>
                </ul>
            </div>
        </s:if>

        <div class="list">
            <h3 class="h3_title"><s:property value="%{getText('usermenu.item.zhibi.center')}"/></h3>
            <ul>
                <li><a href="myGGWAccount.html"><s:property value="%{getText('usermenu.item.zhibi.myAccount')}"/></a></li>
                <%--<li><a href="initRecharge.html"><s:property value="%{getText('usermenu.item.zhibi.fulfilment')}"/></a></li>--%>
                <li><a href="javascript:;"><s:property value="%{getText('usermenu.item.zhibi.fulfilment')}"/></a></li>
                <li><a href="initTransfer.html"><s:property value="%{getText('usermenu.item.zhibi.change')}"/></a></li>
                <li><a href="initConsumption.html"><s:property value="%{getText('usermenu.item.zhibi.query')}"/></a></li>
                <li><a href="javascript:;"><s:property value="%{getText('usermenu.item.zhibi.to.cash')}"/></a></li>
            </ul>
        </div>

        <div class="list">
            <h3 class="h3_title"><s:property value="%{getText('usermenu.item.user.info.setting')}"/></h3>
            <ul>
                <li><a href="initUpdate.html"><s:property value="%{getText('table.base.info')}"/></a></li>
                <li><a href="myGGWAccount.html"><s:property value="%{getText('usermenu.item.user.account')}"/></a></li>
            </ul>
        </div>
    </div>
</div>