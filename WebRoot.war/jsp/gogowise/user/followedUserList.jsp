<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link type="text/css" href="css/onlive/list/liveGoingList.css" rel="stylesheet"/>


<div class="live_title fl">
    <h3 class="h3_title"><s:property value="%{getText('my.firstpage.users.i.followed')}"/></h3>
    <%--<p>--%>
        <%--<a href="javascript:;">按开始时间排序</a>--%>
        <%--<a href="javascript:;">按会员名排序</a>--%>
        <%--<a href="javascript:;">按热度排序</a>--%>
    <%--</p>--%>
</div>

<s:iterator value="userFanses">

    <div class="listView fl">

        <div class="viewRight fl">
            <a href="userBlog.html?user.id=<s:property value="user.id"/>" title="<s:property value="user.nickName"/>">
                <img src="<s:property value="user.pic"/>"/>
            </a>
        </div>

        <div class="viewLeft fl">
            <p class="title">
                <a class="title" href="userBlog.html?user.id=<s:property value="user.id"/>"><s:property value="user.nickName"/></a>
                <%--<a class="watch orange_words" href="javascript:;"><s:property value="%{getText('user.add.focus')}"/></a>--%>
            </p>
            <p class="info">
                <span><%--7课程&nbsp;&nbsp;5个人秀&nbsp;&nbsp;4直播&nbsp;&nbsp;--%><s:property value="user.fansNum"/><s:property value="%{getText('onlive.fensi')}"/></span>
            </p>
            <p>
                <s:if test="user.selfDescription != null">
                    <s:property value="user.selfDescription"/>
                </s:if>
                <s:else>
                    <s:property value="%{getText('user.without.self.desc')}"/>
                </s:else>
            </p>
        </div>
    </div>

</s:iterator>

    <div class="pagination" style="padding-top:0px;">
            <tiles:insertTemplate template="../pagination.jsp">
                <tiles:putAttribute name="pagination" value="${pagination}"/>
            </tiles:insertTemplate>
   </div>