<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>


<link href="css/course/stepAll.css" rel="stylesheet" type="text/css"/>
<link href="css/course/course_maintenance.css" rel="stylesheet" type="text/css"/>

<div class="create_cont fl">
<div class="stepTip fl">
    <a href="myForcastClass.html"><s:property value="%{getText('usermenu.item.my.created.courses')}"/></a>
    <i>&gt;</i>
    <a href="voaCourseBlog.html?course.id=<s:property value="course.id"/>"><s:property value="course.name"/></a>
    <i>&gt;</i>
    <s:property value="%{getText('my.forcast.course.info.manage')}"/>
</div>

<div class="stepWrap fl">
    <s:form id="course_main_info_form">
        <s:hidden name="course.id" id="course_id"/>
        <h3 alt="2"><span class="num">1</span><s:property value="%{getText('titie.info.course')}"/></h3>

        <div class="stepCont" style="display:block;">
            <div class="pic_1"></div>

            <tiles:insertAttribute name="courseInfo"/>


            <div class="pic_3"></div>
        </div>
    </s:form>
</div>

<div class="stepWrap fl">
    <h3 alt="3"><span class="num">2</span><s:property value="%{getText('title.info.class')}"/></h3>

    <div class="stepCont">
        <div class="pic_1"></div>
        <tiles:insertAttribute name="classInfo"/>
        <div class="pic_3"></div>
    </div>
</div>

<div class="content_clause">
    <input name="checkbox" type="checkbox" checked value="" id="clauseCheckbox"/>
    <label for="clauseCheckbox"><s:property value="%{getText('course.creation.document.accept')}"/></label>
    <a href="createCourseClause.html" id="course_creation_clause"><s:property
            value="%{getText('course.creation.document.rule')}"/></a><br/>
    <span id="checkboxMsg" class="tip_words"></span>
</div>

<div class="create_confirm">
    <input type="button" id="submit_btn_large" class="submit_btn_large" onclick="publishCourse();"
           value="<s:property value="%{getText('course.management.store')}"/>"/>
</div>

</div>

<%@ include file="/jsp/gogowise/course/courseCreate/stepAll4Maintenance_js.jsp" %>