<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>



<div class="container">
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <s:form method="post" action="searchAnswer" theme="simple" validate="true">
                <div class="input-group">
                    <s:textfield cssClass="form-control input-lg" name="searchStr" placeholder="search"></s:textfield>
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-default btn-lg">
                            <span class="glyphicon glyphicon-search"></span>
                            <s:property value="%{getText('menu.item.search')}"/>
                        </button>
                    </div>
                </div>
            </s:form>
            <div class="col-sm-2"></div>
        </div>
    </div>
</div>
<div class="searchContent">
    <s:if test="courses != null && courses.size()>0">
        <s:iterator value="courses" status="idx">
            <div class="searchCourseItem">
                <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                    <img src="<s:property value="logoUrl" />" class="searchCourseImg"/>
                </a>

                <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                    <h1 class = "searchCourseName"><s:property value="name"/></h1>
                </a>

                <h4 class="searchCourseBody">
                    <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                        <s:if test="description.length() > 200">
                            <s:property value="description.substring(0,200)+'...'" />
                        </s:if>
                        <s:else>
                            <s:property value="description"/>
                        </s:else>
                    </a>
                </h4>
                </h4>
                <div class="text-right">
                    <ul class="list-inline">
                      <li class="searchItemState"><s:property value="%{getText('course.school')}"/>:<a href="orgBlog.html?org.id=<s:property value="organization.id"/>" title="<s:property value="organization.nickName"/>"><s:property value="organization.schoolName"/></a></li>
                      <li class="searchItemState"><s:property value="%{getText('courses.info.lecturer')}"/>:<a href="userBlog.html?user.id=<s:property value="teacher.id"/>" title="<s:property value="teacher.nickName"/>"><s:property value="teacher.nickName"/></a></li>
                      <li class="searchItemState"><s:property value="%{getText('label.student')}"/>:<s:property value="studentNum"/></li>
                      <li class="searchItemStateBlue"><s:property value="%{getText('usermenu.item.mooc')}"/></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <s:if test="!#idx.last">
                <div class="imaginaryline"></div>
            </s:if>
        </s:iterator>
    </s:if>
    <s:else>
        <div class="searchCourseItem" style="text-align: center;">
            <strong><s:property value = "%{getText('search.course.no.result.message')}"/></strong>
        </div>
    </s:else>
</div>
<tiles:insertTemplate template="../common/pagination.jsp">
    <tiles:putAttribute name="pagination" value="${pagination}"/>
</tiles:insertTemplate>

