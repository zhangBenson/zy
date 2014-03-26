<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<div class="container">
    <div class="thinline"></div>

    <div class="row">
        <div class="col-sm-8">

            <s:iterator value="hotTeachers" status="#status">

                <div id="lecturerInfo">
                    <a href="userBlog.html?user.id=<s:property value="id"/>"title="<s:property value="nickName"/>">
                        <img src="<s:property value="pic"/>" style="float:left;margin-right:15px;margin-bottom:15px;border-radius: 6px;width: 120px;height: 120px;" />
                    </a>

                    <a href="userBlog.html?user.id=<s:property value="id"/>"title="<s:property value="nickName"/>">
                        <h1 class = "lecturerName"><s:property value="nickName"/></h1>
                    </a>

                    <h4 class="courseBody"><s:property escapeHtml="false" value="selfDescription"/> </h4>
                </div>
                <div class="thick70" style="clear: both"></div>
            </s:iterator>

            <tiles:insertTemplate template="/jsp/gogowise/pagination.jsp">
                <tiles:putAttribute name="pagination" value="${pagination}"/>
            </tiles:insertTemplate>

        </div>

        <div class="col-sm-4">
            <div class="container">
                <div  class="basePanel">
                    <a href="orgBlog.html?org.id=<s:property value="org.id"/>" title="<s:property value="org.nickName"/>">
                        <img src="<s:property value="org.logoUrl"/>" class="schoolPortrait" />
                    </a>
                    <div class="clearfix"></div>
                    <a href="orgBlog.html?org.id=<s:property value="org.id"/>" title="<s:property value="org.nickName"/>">
                        <h4 style="white-space: pre-wrap;word-wrap: break-word"><s:property value="org.schoolName"/> </h4>
                    </a>
                    <h4 class="courseBody"><s:property escapeHtml="false" value="org.description"/> </h4>
                </div>
            </div>
        </div>

    </div>

</div>