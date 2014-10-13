<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link type="text/css" href="css/search/searchList.css" rel="stylesheet"/>
<s:form action="searchResult" theme="css_xhtml" id="postPageForm">
    <s:hidden name="searchType"/>
    <s:hidden name="searchStr"/>

    <div class="listDown fl">
        <h3 class="h3_title"><s:text name="search.header.show"/></h3>

            <%-- 这是个人秀循环的Div --%>
        <div class="listView fl">
            <s:iterator value="myShows">
                <div class="listView fl">
                    <div class="viewRight fl">
                        <a class="img" href="showBlog.html?myShow.id=<s:property value="id"/>"
                           title="<s:property value="name"/>">
                            <img src="<s:property value="logoUrl"/>"/>
                        </a>
                        <a class="person" href="userBlog.html?user.id=<s:property value="owner.id"/>"
                           title="<s:property value="owner.nickName"/>"><img width="30" height="30"
                                                                             src="<s:property value="owner.pic"/>"/></a>
                    </div>

                    <div class="viewLeft fl">
                        <p class="title">
                            <a class="title" href="showBlog.html?myShow.id=<s:property value="id"/>"
                               title="<s:property value="name"/>"><s:property value="name"/></a>
                            <a class="watch orange_words"
                               href="showBlog.html?myShow.id=<s:property value="id"/>"><s:property value="%{getText('gogowise.things.details')}"/></a>
                        </p>

                        <p class="info">
                            <span><span class="orange_words"><s:date name="showDate"
                                                                     format="%{getText('dateformat')}"/></span></span>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <span><span class="orange_words"> <s:property value="fansNum"/>&nbsp;</span><s:property value="%{getText('course.blog.purchase.num')}"/></span>&nbsp;&nbsp;|&nbsp;&nbsp;
                                <%--<span><span class="orange_words"> 247&nbsp;</span>推荐</span> &nbsp;&nbsp;|&nbsp;&nbsp;--%>
                            <span><s:text name="course.blog.total.terms"/><span class="orange_words"> <s:property value="showTermsNum"/>&nbsp;</span><s:property value="%{getText('course.blog.total.terms.tail')}"/></span>
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
