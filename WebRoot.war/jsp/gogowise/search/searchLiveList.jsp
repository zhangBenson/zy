<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link type="text/css" href="css/search/searchList.css" rel="stylesheet"/>
<s:form action="searchResult" theme="css_xhtml" id="postPageForm">
    <s:hidden name="searchType"/>
    <s:hidden name="searchStr"/>

<div class="listDown fl">
    <h3 class="h3_title"><s:property value="%{getText('search.header.live')}"/></h3>

    <%-- 这是直播栏目循环的Div --%>

    <div class="listView fl">

       <s:iterator value="liveChannels">
        <div class="listView fl">
        <div class="viewRight fl">
            <a class="img" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>" title="<s:property value="name"/>">
                <img src="<s:property value="logoUrl"/>"/>
            </a>
            <a class="person" href="userBlog.html?user.id=<s:property value="creator.id"/>" title="<s:property value="creator.nickName"/>"><img width="30" height="30" src="<s:property value="creator.pic"/>"/></a>
        </div>

        <div class="viewLeft fl">
            <p class="title">
                <a class="title" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>" title="<s:property value="name"/>"><s:property value="name"/></a>
                <a class="watch orange_words" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>"><s:property value="%{getText('gogowise.things.details')}"/></a>
            </p>
            <p class="info">
                <span><span class="orange_words"><s:date name="createTime" format="%{getText('dateformat')}"/></span></span>&nbsp;&nbsp;|&nbsp;&nbsp;
                <span><span class="orange_words"> <s:property value="fansNum"/>&nbsp;</span><s:property value="%{getText('course.blog.purchase.num')}"/></span>&nbsp;&nbsp;|&nbsp;&nbsp;
                <%--<span><span class="orange_words"> 247&nbsp;</span>推荐</span> &nbsp;&nbsp;|&nbsp;&nbsp;--%>
                <span><s:property value="%{getText('course.blog.total.terms')}"/><span class="orange_words"> <s:property value="totalTermsNum"/>&nbsp;</span><s:property value="%{getText('course.blog.total.terms.tail')}"/></span>
            </p>
            <p><s:property value="description"/></p>
        </div>

    </div>
    </s:iterator>
    </div>
     <div class="pagination" style="padding-top:0px;">
        <tiles:insertTemplate template="../paginationPost.jsp">
            <tiles:putAttribute name="pagination" value="${pagination}"/>
        </tiles:insertTemplate>
    </div>
</div>
</s:form>