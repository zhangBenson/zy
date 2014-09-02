<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="type == 1"><div style="width:1180px;" id="foreignCourseList<s:property value="forignPagination.pageNow"/>"></s:if>
<s:if test="type == 2"><div style="width:1180px;" id="zhongXueCourseList<s:property value="zhongXuePagination.pageNow"/>"></s:if>
<s:if test="type == 3"><div style="width:1180px;" id="xiaoXueCourseList<s:property value="xiaoXuePagination.pageNow"/>"></s:if>
<s:if test="type == 4"><div style="width:1180px;" id="childCourseList<s:property value="childPagination.pageNow"/>"></s:if>

    <s:iterator value="courses" status="status">
        <s:if test="#status.index<10">
            <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"
               class="newLeft">
                <div class="coursePanel" style="width:550px;">
                    <div class="coursePanelInfoLeft">
                        <img class="coursePanelPortrait" src="<s:property value="logoUrl"/>"/>
                    </div>

                    <div class="coursePanelInfoRight">
                        <p class="textOverSinglerow"><s:property value="name"/></p>

                        <p class="textOverSinglerow"><s:property value="%{getText('course.school')}"/>:&nbsp;<s:property
                                value="organization.schoolName"/></p>

                        <p class="textOverSinglerow">
                            <s:property value="%{getText('courses.info.lecturer')}"/>:&nbsp;
                            <s:if test="teacher.userName != null"><s:property value="teacher.userName"/></s:if>
                            <s:else><s:property value="teacher.nickName"/></s:else>
                        </p>
                    </div>
                </div>
            </a>
            <s:if test="#status.index%2==1"><br/></s:if>
        </s:if>
    </s:iterator>
</div>

<s:if test="type == 1">
    <div id="foreignCourseList<s:property value="forignPagination.pageNow+1"/>"></div>
    <s:if test="forignPagination.hasNext">
        <a href="javascript:;" id="foreignLink<s:property value="forignPagination.pageNow"/>"
           onclick="getMoreCousre(<s:property value="forignPagination.pageNow"/>, 1);">
            <p class="text-right" style="margin-right: 0px;"><s:property value="%{getText('others.more')}"/></p>
        </a>
    </s:if>
</s:if>

<s:if test="type == 2">
    <div id="zhongXueCourseList<s:property value="zhongXuePagination.pageNow+1"/>"></div>
    <s:if test="zhongXuePagination.hasNext">
        <a href="javascript:;" id="zhongXueLink<s:property value="zhongXuePagination.pageNow"/>"
           onclick="getMoreCousre(<s:property value="zhongXuePagination.pageNow"/>, 2);">
            <p class="text-right" style="margin-right: 0px;"><s:property value="%{getText('others.more')}"/></p>
        </a>
    </s:if>
</s:if>

<s:if test="type == 3">
    <div id="xiaoXueCourseList<s:property value="xiaoXuePagination.pageNow+1"/>"></div>
    <s:if test="xiaoXuePagination.hasNext">
        <a href="javascript:;" id="xiaoXueLink<s:property value="xiaoXuePagination.pageNow"/>"
           onclick="getMoreCousre(<s:property value="xiaoXuePagination.pageNow"/>, 3);">
            <p class="text-right" style="margin-right: 0px;"><s:property value="%{getText('others.more')}"/></p>
        </a>
    </s:if>
</s:if>

<s:if test="type == 4">
    <div id="childCourseList<s:property value="childPagination.pageNow+1"/>"></div>
    <s:if test="childPagination.hasNext">
        <a href="javascript:;" id="childLink<s:property value="childPagination.pageNow"/>"
           onclick="getMoreCousre(<s:property value="childPagination.pageNow"/>, 4);">
            <p class="text-right" style="margin-right: 0px;"><s:property value="%{getText('others.more')}"/></p>
        </a>
    </s:if>
</s:if>