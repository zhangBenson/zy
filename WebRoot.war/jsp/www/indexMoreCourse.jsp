<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<div id="courseList<s:property value="pagination.pageNow"/>"  >
    <s:iterator value="courses" status="status">
        <s:if test="#status.index<6">
            <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>" class="newLeft">
            <div class="coursePanel">
                <div class="coursePanelInfoLeft">
                    <img class="coursePanelPortrait" src="<s:property value="logoUrl"/>"/>
                </div>

                <div class="coursePanelInfoRight">
                    <p class="textOverSinglerow"><s:property value="name"/></p>
                    <p class="textOverSinglerow"><s:property value="%{getText('course.school')}"/>:&nbsp;<s:property value="organization.schoolName" /></p>
                    <p class="textOverSinglerow"><s:property value="%{getText('label.index.classes.start')}"/>:&nbsp;<s:date name="publicationTime" format="%{getText('dateformat.forclass')}"/></p>
                </div>
            </div>
            </a>
            <s:if test="#status.index%2==1"><br/></s:if>
        </s:if>
    </s:iterator>
</div>

<s:if test="pagination.hasNext">
    <a href="javascript:;" id="link<s:property value="pagination.pageNow"/>" onclick="getMoreCousre(<s:property value="pagination.pageNow"/>);">
        <p class="text-right"><s:property value="%{getText('others.more')}"/></p>
    </a>
</s:if>

<div id="courseList<s:property value="pagination.pageNow+1"/>"></div>