<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/list/hotListLeft.css" rel="stylesheet"/>


<div class="live_title fl">
    <h3 class="h3_title"><s:property value="%{getText('gogowise.latest.liveChannel')}"/></h3>
    <%--<p>--%>
        <%--<a href="javascript:;">按开始时间排序</a>--%>
        <%--<a href="javascript:;">按会员名排序</a>--%>
        <%--<a href="javascript:;">按热度排序</a>--%>
    <%--</p>--%>
</div>

<s:iterator value="latestChannel">
<div class="listView fl">

    <div class="viewRight fl">
        <a class="img" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>">
            <img src="<s:property value="logoUrl"/>"/>
        </a>
        <a class="person" href="userBlog.html?user.id=<s:property value="creator.id"/>" title="<s:property value="creator.nickName"/>"><img width="30" height="30" src="<s:property value="creator.pic"/>"/></a>
    </div>

    <div class="viewLeft fl">
        <p class="title">
            <a class="title" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>" title="<s:property value="name"/>"><s:property value="name"/></a>
            <%--<a class="watch orange_words" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>"><s:property value="%{getText('gogowise.things.details')}"/></a>--%>
        </p>
        <p class="info">
            <span><span class="orange_words"><s:date name="createTime" format="%{getText('dateformat')}"/></span></span>&nbsp;&nbsp;|&nbsp;&nbsp;
            <span><span class="orange_words"><s:property value="fansNum"/>&nbsp;</span><s:property value="%{getText('user.add.focus')}"/></span>&nbsp;&nbsp;|&nbsp;&nbsp;
            <%--<span><span class="orange_words"> 247&nbsp;</span>推荐</span> &nbsp;&nbsp;|&nbsp;&nbsp;--%>
            <span><span class="orange_words"><s:property value="totalTermsNum"/>&nbsp;</span><s:property value="%{getText('sequence.of.tail')}"/></span>
        </p>
        <p><s:property value="description"/></p>
    </div>

</div>
</s:iterator>
