<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link type="text/css" href="css/course/courseBlog.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.rate.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.js"></script>

<style>
    .centerLink {
        text-decoration: none;
        display: block;
    }
</style>

<div class="container">
    <div class="thinline"></div>
    <br/>

    <div class="container">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <s:form method="post" action="searchSchool" theme="simple" validate="true">
                    <div class="input-group">
                        <s:textfield cssClass="form-control input-lg" name="searchStr"
                                     placeholder="search"></s:textfield>
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-default btn-lg">
                                <span class="glyphicon glyphicon-search"></span>
                                <s:text name="menu.item.search"/>
                            </button>
                        </div>
                    </div>
                </s:form>
                <div class="col-sm-2"></div>
            </div>
        </div>
    </div>

    <br/>
    <br/>

    <s:if test="organizations != null && organizations.size() > 0">
        <s:iterator value="organizations" status="idx">

            <div class="schoolRow">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="pull-left" style="width:900px;">
                            <a href="orgBlog.html?org.id=<s:property value="id"/>"
                               title="<s:property value="nickName"/>" class="centerLink">
                                <div id="share_title" class="courseSubject"><s:property value="schoolName"/></div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <div class="pull-right">
                            <p class="text-left">
                            <ul class="list-inline">
                                <li class="searchItemState"><s:property value="%{getText('label.student')}"/>:<s:property value="getStudentsNumByOrgId(id)"/></li>
                                <li class="searchItemState"><s:property value="%{getText('search.header.course')}"/>:<s:property value="courseDao.findByOrg(id,null).size()"/></li>
                                <li class="searchItemState"><s:property value="%{getText('course.lecturer')}"/>:<s:property value="organizationTeachers.size()"/></li>
                            </ul>
                            </p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="nickName"/>"
                           class="centerLink">
                            <img id="share_pic" src="<s:property value="logoUrl"/>" alt="" class="Schoolminlogo"/>
                        </a>
                    </div>
                    <div class="col-sm-9">
                        <div class="clearfix"></div>
                        <div id="share_desc" class="searchCourseBody">
                            <a href="orgBlog.html?org.id=<s:property value="id"/>"
                               title="<s:property value="nickName"/>" class="centerLink">
                                <s:if test="parseSchoolDescription(id).length() > 350">
                                    <s:property value="parseSchoolDescription(id).substring(0,350)+'...'"/>
                                </s:if>
                                <s:else>
                                    <s:property value="parseSchoolDescription(id)"/>
                                </s:else>
                            </a>
                        </div>
                    </div>
                    <p class="text-right"><a href="orgBlog.html?org.id=<s:property value="id"/>"
                                             title="<s:property value="nickName"/>">
                        <s:text name="label.school.comments"/>(<s:property value="organizationCommentDao.findOrgCommentByOrgId(id, null).size()"/>)
                    </a></p>
                </div>
            </div>
        </s:iterator>
    </s:if>
    <s:else>
        <div class="schoolRow" style="text-align: center;">
            <div class="row">
                <strong><s:text name="school.center.page.no.schools.message"/></strong>
            </div>
        </div>
    </s:else>

    <br/>

    <div style="text-align: center;">
        <tiles:insertTemplate template="/jsp/gogowise/pagination.jsp">
            <tiles:putAttribute name="pagination" value="${pagination}"/>
        </tiles:insertTemplate>
    </div>

</div>



