<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/course/courseCreation_js.jsp" %>

<link href="css/courseCreation.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
    <s:if test="course.id!=null">
    $(document).ready(function () {
        var teachingNum = "<s:property value="course.teachingNum"/>";
        $("[value='" + teachingNum + "']").parent().siblings("li").removeClass("checked_li");
        $("[value='" + teachingNum + "']").attr('checked', 'checked');
        $("[value='" + teachingNum + "']").parent().addClass("checked_li");
    });
    </s:if>
</script>
<div class="course_create_container">
    <div class="create_tabs">
        <ul>
            <li class="stand_out">1、<s:property value="%{getText('title.select.type')}"/></li>
            <li>2、<s:property value="%{getText('titie.info.course')}"/></li>
            <li>3、<s:property value="%{getText('title.info.class')}"/></li>
            <li>4、<s:property value="%{getText('title.course.confirm')}"/></li>
        </ul>
    </div>
    <s:form action="initSaveCourse" id="form1" method="POST">
        <s:hidden name="course.id"/>
        <s:hidden name="courseType"/>
        <div class="create_content">
            <p class="content_tip1"><s:property value="%{getText('msg.intr')}"/></p>

            <p class="content_tip2"><s:property value="%{getText('msg.select.type')}"/></p>
            <ul class="content_style">
                <li class="checked_li"><input name="identity" type="radio" checked="checked" value="1"/>
                    <s:property value="%{getText('label.select.121')}"/></li>
                <li>
                    <input name="identity" type="radio" value="2"/>
                    <s:property value="%{getText('label.select.122')}"/></li>
                <li>
                    <input name="identity" type="radio" value="3"/>
                    <s:property value="%{getText('label.select.123')}"/></li>
                <li>
                    <input name="identity" type="radio" value="4"/>
                    <s:property value="%{getText('label.select.12many')}"/></li>
                <li id="repeat_course">
                    <input name="identity" type="radio" value="5"/>
                    <s:property value="%{getText('label.select.repeat')}"/></li>
            </ul>
            <div class="content_clause">
                <input name="checkbox" type="checkbox" value="" id="checkbox" checked="checked"/>&nbsp;
                <a href="createCourseClause.html" id="course_creation_clause"><s:property
                        value="%{getText('course.creation.document.rule')}"/></a><br/>
                <span id="checkboxMsg"></span>
            </div>
        </div>
        <div class="direction_wrap">
            <input type="submit" class="act_btn forth" onclick="return yszCheck();"
                   value="<s:property value="%{getText('page.next')}"/>"/>
        </div>
    </s:form>
</div>

<script type="text/javascript">
    function yszCheck() {
        $("#checkboxMsg").text('');
        if (!$("#checkbox").is(':checked')) {
            $("#checkboxMsg").text(acceptRuleFirst);
            return false;
        }
        document.getElementById("form1").submit();
    }
</script>
