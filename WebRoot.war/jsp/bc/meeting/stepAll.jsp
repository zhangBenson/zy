<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link href="css/course/stepAll.css" rel="stylesheet" type="text/css"/>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="">
            <a href="myForcastClass.html"><s:property value="%{getText('usermenu.item.my.created.courses')}"/></a>
        </li>
        <li class="">
            <a href="myRegistration.html"><s:property value="%{getText('usermenu.item.my.reged.courses')}"/></a>
        </li>
        <li class="stand_out">
            <a href="javascript:;"><s:property value="%{getText('usermenu.item.createcourse')}"/></a>
        </li>
    </ul>
</div>
<div class="create_cont fl">
    <div class="stepTip fl">
        <s:property value="%{getText('msg.intr')}"/>
    </div>


    <div class="stepWrap fl">
        <s:form id="course_main_info_form">
            <s:hidden name="course.id" id="course_id"/>
            <s:hidden name="courseType" value="1"/><%-- 1表示组织课程 --%>
            <%--<s:hidden name="course.teachingNum" id="course_identity"/>--%>
            <%-- 直接就是1对多的大班 --%>
            <input type="hidden" name="course.teachingNum" value="4"/>

            <h3 alt="2"><span class="num">1</span><s:property value="%{getText('titie.info.course')}"/></h3>

            <div class="stepCont" style="display: block;">
                <div class="pic_1"></div>


                <tiles:insertAttribute name="courseInfo"/>


                <div class="pic_3"></div>
            </div>
        </s:form>
    </div>


    <div class="content_clause">
        <input name="checkbox" type="checkbox" id="clauseCheckbox"/>
        <label for="clauseCheckbox"><s:property value="%{getText('course.creation.document.accept')}"/></label>
        <a href="createCourseClause.html" id="course_creation_clause"><s:property
                value="%{getText('course.creation.document.rule')}"/></a><br/>
        <span id="checkboxMsg" class="tip_words"></span>
    </div>

    <div class="create_confirm">
        <input type="button" id="submit_btn_large" class="submit_btn_large" onclick="publishCourse();"
               value="<s:property value="%{getText('org.course.creation')}"/>"/>
    </div>

</div>

<%@ include file="/jsp/bc/meeting/stepAll_js.jsp" %>