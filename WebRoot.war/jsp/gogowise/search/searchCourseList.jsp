<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link type="text/css" href="css/search/searchList.css" rel="stylesheet"/>

<s:form action="searchResult" theme="css_xhtml" id="postPageForm">
    <s:hidden name="searchType"/>
    <s:hidden name="searchStr"/>

    <div class="listDown fl">
        <h3 class="h3_title"><s:text name="search.header.course"/></h3>

            <%-- 这是课程循环的Div  --%>
        <div class="listView fl">

            <s:iterator value="courses">
                <div class="listView fl">
                    <div class="viewRight fl">
                        <a class="img" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                           title="<s:property value="name"/>">
                            <img src="<s:property value="logoUrl"/>"/>
                        </a>
                        <a class="person" href="userBlog.html?user.id=<s:property value="teacher.id"/>"
                           title="<s:property value="teacher.nickName"/>"><img width="30" height="30"
                                                                               src="<s:property value="teacher.pic"/>"/></a>
                    </div>

                    <div class="viewLeft fl">
                        <p class="title">
                            <a class="title" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                               title="<s:property value="name"/>"><s:property value="name"/></a>
                            <a class="watch orange_words"
                               href="voaCourseBlog.html?course.id=<s:property value="id"/>"><s:text name="gogowise.things.details"/></a>
                        </p>

                        <p class="info">
                            <span><span class="orange_words"><s:date name="startDate"
                                                                     format="%{getText('dateformat')}"/></span></span>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <span>
                            <s:if test="charges == 0">
                                <span class="orange_words"> <s:text name="course.without.charges"/></span>
                            </s:if>
                            <s:else>
                                <span class="orange_words"><s:property value="course.charges"/> &nbsp;&nbsp;<s:text name="course.consumptionType.true"/></span>
                            </s:else>
                        </span>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <span><span class="orange_words"> <s:property value="courseStudentsNum"/>&nbsp;</span><s:text name="course.blog.purchase.num"/></span>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <span><span class="orange_words"> <s:property value="courseRecommendNum"/>&nbsp;</span><s:text name="course.blog.recommend.num"/></span> &nbsp;&nbsp;|&nbsp;&nbsp;
                            <span><s:text name="course.blog.total.terms"/><span class="orange_words"> <s:property value="courseTermsNum"/>&nbsp;</span><s:text name="course.blog.total.terms.tail"/></span>
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
