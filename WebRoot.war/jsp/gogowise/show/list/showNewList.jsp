<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link type="text/css" href="css/list/hotListLeft.css" rel="stylesheet"/>


<div class="live_title fl">
    <h3 class="h3_title"><s:property value="%{getText('show.square.of.newest.show')}"/></h3>
    <%--<p>--%>
        <%--<a href="javascript:;">按开始时间排序</a>--%>
        <%--<a href="javascript:;">按会员名排序</a>--%>
        <%--<a href="javascript:;">按热度排序</a>--%>
    <%--</p>--%>
</div>

<s:iterator value="newestShows">
<div class="listView fl">

    <div class="viewRight fl">
        <a class="img" href="showBlog.html?myShow.id=<s:property value="id"/>" title="<s:property value="name"/>">
            <img src="<s:property value="logoUrl"/>"/>
        </a>
        <a class="person" href="userBlog.html?user.id=<s:property value="owner.id"/>" title="<s:property value="owner.nickName"/>"><img width="30" height="30" src="<s:property value="owner.pic"/>"/></a>
    </div>

    <div class="viewLeft fl">
        <p class="title">
            <a class="title" href="showBlog.html?myShow.id=<s:property value="id"/>" title="<s:property value="name"/>"><s:property value="name"/></a>
            <%--<a class="watch orange_words" href="showBlog.html?myShow.id=<s:property value="id"/>"><s:property value="%{getText('gogowise.things.details')}"/></a>--%>
        </p>
        <p class="info">
            <span><span class="orange_words"><s:date name="showDate" format="%{getText('dateformat')}"/></span></span>&nbsp;&nbsp;|&nbsp;&nbsp;
            <span><span class="orange_words"><s:property value="fansNum"/>&nbsp;</span><s:property value="%{getText('user.add.focus')}"/></span>&nbsp;&nbsp;|&nbsp;&nbsp;
            <%--<span><span class="orange_words"> 247&nbsp;</span><s:property value="%{getText('user.info.identity.finish.reg')}"/>推荐</span> &nbsp;&nbsp;|&nbsp;&nbsp;--%>
            <span><span class="orange_words"><s:property value="firstFutureTermSquence"/>&nbsp;</span><s:property value="%{getText('sequence.of.tail')}"/></span>
        </p>
        <p><s:property value="description"/></p>
    </div>

</div>
</s:iterator>
<tiles:insertTemplate template="../../pagination.jsp">
     <tiles:putAttribute name="pagination" value="${pagination}"/>
</tiles:insertTemplate>

