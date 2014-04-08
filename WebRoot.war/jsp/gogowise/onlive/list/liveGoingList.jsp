<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link type="text/css" href="css/onlive/list/liveGoingList.css" rel="stylesheet"/>


<div class="live_title fl">
    <h3 class="h3_title"><s:property value="%{getText('index.onlive.online')}"/></h3>
    <%--<p>--%>
    <%--<a href="javascript:;">按开始时间排序</a>--%>
    <%--<a href="javascript:;">按会员名排序</a>--%>
    <%--<a href="javascript:;">按热度排序</a>--%>
    <%--</p>--%>
</div>

<s:iterator value="personalOnlives">

    <div class="listView fl">

        <div class="viewRight fl">
            <a href="userBlog.html?user.id=<s:property value="owner.id"/>" title="<s:property value="owner.nickName"/>">
                <img src="<s:property value="owner.pic"/>"/>
            </a>
        </div>

        <div class="viewLeft fl">
            <p class="title">
                <a class="title" href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="id"/>"><s:property
                        value="title"/></a>
                <a class="watch orange_words"
                   href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="id"/>"><s:property
                        value="%{getText('click.to.watch')}"/></a>
                <a class="watch orange_words" href="liveOnMap.html?personalOnlive.id=<s:property value="id"/>"
                   target="_blank"><s:property value="%{getText('click.to.map')}"/></a>
            </p>

            <p class="info">
                <span><s:property value="%{getText('course.start.time')}"/>：<span class="orange_words"><s:date
                        name="startTime" format="%{getText('dateformat.forclass')}"/></span></span>&nbsp;&nbsp;&nbsp;
                <span><span class="orange_words"> <s:property value="numOfAudience"/></span>&nbsp;<s:property
                        value="%{getText('per.onlive.online.users')}"/></span>
            </p>

            <p><s:property value="owner.selfDescription"/></p>
        </div>
    </div>

</s:iterator>

<tiles:insertTemplate template="../../pagination.jsp">
    <tiles:putAttribute name="pagination" value="${pagination}"/>
</tiles:insertTemplate>
