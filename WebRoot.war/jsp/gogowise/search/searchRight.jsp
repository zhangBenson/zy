<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link type="text/css" href="css/search/searchRight.css" rel="stylesheet"/>

<div class="rightItem1">
    <h3 class="h3_title"><s:property value="%{getText('teacher.hottest')}"/></h3>
    <a class="other_more" href="teacherHotList.html"><s:property value="%{getText('others.more')}"/></a>

    <s:iterator value="hottestTeachers">
        <div class="onePerson fl">
            <p class="personLeft fl">
                <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                    <img src="<s:property value="pic"/>"/>
                </a>
            </p>

            <p class="personMid fl">
                <a class="title" href="userBlog.html?user.id=<s:property value="id"/>"
                   title="<s:property value="nickName"/>"><s:property value="nickName"/></a>
                    <%--<span class="sheet"><span class="orange_words"><s:property value="fansNum"/>&nbsp;</span><s:property value="%{getText('user.add.focus')}"/>&nbsp;&nbsp;&nbsp;&lt;%&ndash;<span class="orange_words">70&nbsp;</span>课程&ndash;%&gt;</span>--%>
                    <%--<span><s:property value="selfDescription"/></span>--%>
            </p>
                <%--<p class="personRight fl">--%>
                <%--<s:if test="!userFocused">--%>
                <%--<a class="orange_words" href="javascript:;" onclick="becomeFans(this,<s:property value="id"/>);"><s:property value="%{getText('user.add.focus')}"/></a>--%>
                <%--</s:if>--%>
                <%--<s:else>--%>
                <%--<a class="orange_words" href="javascript:;" onclick="becomeFans(this,<s:property value="id"/>);"><s:property value="%{getText('user.add.focused')}"/></a>--%>
                <%--</s:else>--%>
                <%--</p>--%>
        </div>
    </s:iterator>
</div>

<div class="rightTerm2 fl">
    <h3 class="h3_title"><s:property value="%{getText('course.hottest')}"/></h3>
    <a class="other_more" href="courseHotList.html"><s:property value="%{getText('others.more')}"/></a>
    <ul>
        <s:iterator value="hottestCourses">
            <li>
                <a class="img" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                   title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
                <a class="title" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                   title="<s:property value="name"/>"><s:property value="name"/></a>
            </li>
        </s:iterator>
    </ul>
</div>
