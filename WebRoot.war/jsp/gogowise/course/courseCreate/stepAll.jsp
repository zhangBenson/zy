<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link href="css/course/stepAll.css" rel="stylesheet" type="text/css"/>
<%--<script src="/js/course/jquery-1.10.2.min.js"></script>--%>
<script src="/js/course/jquery-ui.min.js"></script>
<script src="/js/course/tag.js" type="text/javascript" charset="utf-8"></script>
<link href="/css/course/jquery.tagit.css" rel="stylesheet" type="text/css">
<link href="/css/course/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="">
            <a href="myForcastClass.html"><s:text name="usermenu.item.my.created.courses"/></a>
        </li>
        <li class="">
            <a href="myRegistration.html"><s:text name="usermenu.item.my.reged.courses"/></a>
        </li>
        <li class="stand_out">
            <a href="javascript:;"><s:text name="usermenu.item.createcourse"/></a>
        </li>
    </ul>
</div>
<div class="create_cont fl">
    <div class="stepTip fl">
        <s:text name="msg.intr"/>
    </div>


    <div class="stepWrap fl">
        <s:form id="course_main_info_form">
            <s:hidden name="course.id" id="course_id"/>
            <s:hidden name="courseType" value="1"/><%-- 1表示组织课程 --%>
            <%--<s:hidden name="course.teachingNum" id="course_identity"/>--%>
            <%-- 直接就是1对多的大班 --%>
            <input type="hidden" name="course.teachingNum" value="4"/>

            <h3 alt="2"><span class="num">1</span><s:text name="titie.info.course"/></h3>

            <div class="stepCont" style="display: block;">
                <div class="pic_1"></div>


                <tiles:insertAttribute name="courseInfo"/>


                <div class="pic_3"></div>
            </div>
        </s:form>
    </div>

    <div class="stepWrap fl">
        <h3 alt="3"><span class="num">2</span><s:text name="title.info.class"/></h3>

        <div class="stepCont">
            <div class="pic_1"></div>
            <tiles:insertAttribute name="classInfo"/>

            <div class="pic_3"></div>
        </div>
    </div>

    <div class="content_clause">
        <input name="checkbox" type="checkbox" id="clauseCheckbox"/>
        <label for="clauseCheckbox"><s:text name="course.creation.document.accept"/></label>
        <a href="createCourseClause.html" id="course_creation_clause"><s:text name="course.creation.document.rule"/></a><br/>
        <span id="checkboxMsg" class="tip_words"></span>
    </div>

    <div class="create_confirm">
        <input type="button" id="submit_btn_large" class="submit_btn_large" onclick="publishCourse();"
               value="<s:text name="org.course.creation"/>"/>
    </div>

</div>

<%@ include file="/jsp/gogowise/course/courseCreate/stepAll_js.jsp" %>
