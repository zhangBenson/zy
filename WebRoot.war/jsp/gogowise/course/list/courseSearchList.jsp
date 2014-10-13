<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link type="text/css" href="css/course/list/courseHotList.css" rel="stylesheet"/>


<div class="live_title fl">
    <h3 class="h3_title"><s:text name="usermenu.item.newestcourses"/></h3>
    <%--<p>--%>
    <%--<a href="javascript:;">按开始时间排序</a>--%>
    <%--<a href="javascript:;">按会员名排序</a>--%>
    <%--<a href="javascript:;">按热度排序</a>--%>
    <%--</p>--%>
</div>

<s:iterator value="courses">
    <div class="listView fl">
        <div class="viewRight fl">
            <a class="img" href="voaCourseBlog.html?course.id=<s:property value="id"/>">
                <img src="<s:property value="logoUrl"/>"/>
            </a>
            <a class="person" href="userBlog.html?user.id=<s:property value="teacher.id"/>"
               title="<s:property value="teacher.nickName"/>"><img width="30" height="30"
                                                                   src="<s:property value="teacher.pic"/>"/></a>
        </div>
        <div class="viewLeft fl">
            <p class="title">
                <a class="title" href="voaCourseBlog.html?course.id=<s:property value="id"/>"><s:property value="name"/></a>
                    <%--<a class="watch orange_words" href="voaCourseBlog.html?course.id=<s:property value="id"/>"><s:text name="gogowise.things.details"/></a>--%>
            </p>

            <p class="info">
                <span><span class="orange_words"><s:date name="startDate"
                                                         format="%{getText('dateformat')}"/></span></span>&nbsp;&nbsp;|&nbsp;&nbsp;
            <span>
                <s:if test="charges == 0"><span class="orange_words"><s:text name="course.without.charges"/></span></s:if><s:else><span
                    class="orange_words"><s:property value="charges"/></span><s:text name="course.consumptionType.true"/></s:else>
                <%--<span class="orange_words"> 课程免费</span>--%>
            </span>&nbsp;&nbsp;|&nbsp;&nbsp;
                <span><span class="orange_words"><s:property value="studentNum"/>&nbsp;</span><s:text name="user.info.identity.finish.reg"/></span>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <%--<span><span class="orange_words"> 247&nbsp;</span>推荐</span> &nbsp;&nbsp;|&nbsp;&nbsp;--%>
                <span><span class="orange_words"><s:property value="classesNum"/>&nbsp;</span><s:text name="course.total.class.num"/></span>
            </p>

            <p><s:property value="description"/></p>
        </div>
    </div>
</s:iterator>
<tiles:insertTemplate template="../../pagination.jsp">
    <tiles:putAttribute name="pagination" value="${pagination}"/>
</tiles:insertTemplate>
