<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<s:form action="orgMoreMooc" theme="css_xhtml" id="postPageForm">
    <s:hidden name="org.id"></s:hidden>


    <div class="container">
        <div class="thinline"></div>
        <br/>

        <h3 class="courseSubhead"><span><s:property value="org.schoolName"/> </span>-<span><s:property
                value="%{getText('label.more.courses')}"/></span></h3>
        <br/>

        <div class="row">
            <s:iterator value="moocs" status="status">
                <div class="col-sm-3">
                    <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                        <div class="recommended">
                            <img src="<s:property value="logoUrl" />" alt="<s:property value="name" />">
                            <br/><span><s:property value="name"/> </span>
                        </div>
                    </a>
                </div>
                <s:if test="#status.getCount() % 4 == 0"><br/></s:if>
            </s:iterator>
        </div>


        <tiles:insertTemplate template="/jsp/gogowise/paginationPost.jsp">
            <tiles:putAttribute name="pagination" value="${pagination}"/>
        </tiles:insertTemplate>


    </div>
</s:form>
