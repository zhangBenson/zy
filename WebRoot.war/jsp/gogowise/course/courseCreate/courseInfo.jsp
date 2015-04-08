<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script>
    $(document).ready(function () {

        var sampleTags = [];

        $.getJSON("listTags.html", function (data) {
            $.each(data.existTags, function (key, info) {
                sampleTags.push(info["name"].toString());
            });
        });

        var s = $('.grayPanel').tagit({
            availableTags: sampleTags
        });

        $("#btnTest").click(function () {
            alert(getTag());
        })


        <s:iterator value="tags">
        $(".grayPanel").tagit("createTag", "<s:property value="name"/>");
        </s:iterator>
    });

    //    window.onload=setTags;
</script>

<style type="text/css">
    .grayPanel {
        border-style: solid;
        border-color: #eee;
        border-width: 1px;
        min-height: 80px;
        margin-top: 10px;
        font-family: Verdana, '微软雅黑', Geneva, sans-serif;
        font-size: 12px;
        width: 500px;
    }

    .grayPanel li {
        border-bottom: none;
        width: 50px;
    }
</style>

<div class="pic_2">
    <ul class="content_courseInfo fl">
        <li>
            <span class="item"><s:text name="course.info.courseName"/></span>
            <s:textfield cssClass="long_text_field" id="step2_course_name" name="course.name" type="text"/>
            <span class="course_name_input_msg tip_words">*</span>

        </li>

        <li>
            <s:text name="course.access"/>：
            <s:radio name="course.isPublic" list="#{true:getText('course.public'),false:getText('course.private')}"
                     value="course.isPublic" cssStyle="margin-left: 10px;margin-right: 10px;"/>
        </li>

        <li>
            <span class="item"><s:text name="course.info.courseTag"/></span>
            <span class="course_tag_input_msg tip_words">*</span>
            <%--<s:checkboxlist list="tags" listKey="id" listValue="name" name="tags"/>--%>
            <br/>
            <ul class="grayPanel"></ul>

        </li>

        <li>
            <span class="item"><s:text name="course.info.description"/></span>
            <span class="course_intro_input_msg tip_words">*</span> <br/>
            <s:textarea cssClass="long_text_area" id="step2_course_intro" name="course.description"/>
        </li>
        <li>
            <span class="item">学段 </span>
            <%--<s:textarea cssClass="long_text_area" id="step2_course_student_type" name="course.studentType"--%>
            <%--type="text"/>--%>
            <s:select
                    list="#{'1':'高三','2':'高二','3':'高一','4':'初三','5':'初二','6':'初一','7':'小学','8':'其他'}"
                    headerKey="-1" headerValue="请选择学段"
                    cssClass="long_text_field" id="step2_studentAge_type" name="course.studentAgeType"/>
            <span class="course_student_type_input_msg tip_words">*</span>
        </li>

        <li>
            <span class="item">学科</span>
            <s:select
                    list="#{'1':'语文','2':'数学','3':'英语','4':'物理','5':'化学','6':'生物','7':'地理','8':'历史','9':'其他'}"
                    headerKey="-1" headerValue=" 请选择学科"
                    cssClass="long_text_field" id="step2_course_type" name="course.courseType"/>
            <span class="course_type_input_msg tip_words">*</span>
        </li>
        <li class="long_select_li">
            <span class="item"><s:text name="label.online.class.startdate"/></span>
            <s:textfield id="courseStartDate" name="course.startDate" readonly="true"
                         cssClass="Wdatepicker short_text_field"/>
            <span class="course_date_input_msg tip_words">*</span>
        </li>
        <li class="long_select_li">
            <span class="item"><s:text name="label.online.class.tutor.price"/></span>
            <s:hidden name="course.consumptionType" value="true"/>
            <s:textfield cssClass="short_text_field" id="course_charges" name="course.charges"
                         type="text" readonly="false"/>&nbsp;<s:text name="label.zhibi.true"/>
            <span class="course_charges_msg tip_words">*</span>
        </li>
        <li>
            <span class="item"><s:text name="label.online.class.logo"/></span><span
                class="tip_words" id="course_logo_input_msg">*</span><br/>
            <img src="<s:property value="course.logoUrl"/>" id="show_log_preview"
                 onerror="this.onerror=null;this.src='images/defaultImgs/course.gif'"/>
            <s:hidden id="crop_logo" cssClass="long_text_field" name="course.logoUrl"/>
            <input type="button" class="submit_btn change_portrait" id="change_portrait"
                   value="<s:text name="common.modify"/>"
                   href="imgProcess.html?key=crop_logo"/>
        </li>
        <s:if test="courseType == 1 || courseType == 2">
            <li>
                <span class="item"><s:text name="label.forcast.lecturer"/></span>
                <s:radio list="teachers" listKey="email" listValue="nickName" name="teacherIds" value="course.teacher.email"/>
                <span class="invite_teacher_input_msg tip_words">*</span>
            </li>
        </s:if>
        <li>
            <s:text name="course.student.appointed"/>
            <a class="add_student_btn"><s:text name="course.add.student"/></a> &nbsp;&nbsp;&nbsp;
            <span class="invite_student_input_msg tip_words"></span><br/>
            <%--<table id="invitationListModify"></table>--%>
            <%--<div class="option_content" id="invitedStudents">--%>
            <%--<input class="long_text_field_for_student"--%>
            <%--placeholder="<s:text name="org.course.student.email"/>"--%>
            <%--id="studentEmail1" onblur="checkStudentMail(this);" name="emails" type="text"/> <br/>--%>
            <%--</div>--%>
            <iframe src="plugin/using.htm" width="400" height="250" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
            <%--<iframe src="plugin/using.htm"  width="200" height="500"  />--%>
            <%--<iframe src="index.html"  width="200" height="500"  />--%>

        </li>
    </ul>
    <div class="storeWrap">
        <input type="button" class="store_btn" id="step2_store"
               value="<s:text name="term.info.save"/>"/>
        <span class="tip_words" id="step2_store_msg"></span>
    </div>
</div>


<div class="pic_2 after_store" id="step2_store_cont">
    <ul>
        <li>
            <s:text name="course.info.courseName"/>：
            <span class="orange_words" id="store_name"><s:property value="course.name"/></span>
        </li>
        <li>
            <s:text name="course.access"/>：
            <span class="orange_words" id="store_course_access">
                <s:if test="course.isPublic != true"><s:text name="course.private"/></s:if>
                <s:else><s:text name="course.public"/></s:else>
            </span>
        </li>
        <li>
            <s:text name="course.info.courseTag"/>：
            <span class="orange_words" id="store_courseTag"><s:property value="course.getTagsAsStr()"/></span>
        </li>
        <li>
            <s:text name="course.info.description"/>：
            <span class="orange_words" id="store_description"><s:property value="course.description"/></span>
        </li>
        <li><s:text name="course.info.of.student.type"/>：<span class="orange_words"
                                                               id="store_studentType"><s:property value="course.studentAgeType"/></span></li>
        <li><s:text name="course.info.of.course.type"/>：<span class="orange_words"
                                                              id="store_courseType"><s:property value="course.courseType"/></span></li>
        <li><s:text name="label.online.class.startdate"/>：<span class="orange_words"
                                                                id="store_startDate"><s:date
                name="course.startDate" format="%{getText('dateformat')}"/></span></li>
        <li><s:text name="label.online.class.tutor.price"/>：<span class="orange_words"
                                                                  id="store_charges"><s:property value="course.charges"/>&nbsp;<s:text name="label.zhibi.true"/></span>
        </li>
        <li><s:text name="label.forcast.lecturer"/>：<span class="orange_words"
                                                          id="store_teacherEmail"><s:property value="course.teacher.nickName"/></span></li>
        <li><s:text name="course.student.appointed"/>：
        </li>
        <li style="width: 370px;font-family: '宋体';font-size: 12px;color: #008AB8;font-weight: bold;">
            <%--<table id="invitationList"></table>--%>
            <%--<div style="width: 370px;font-family: '宋体';font-size: 12px;display: none;color: #008AB8;font-weight: bold;" id="selectList">--%>
            <div style="padding: 5px;font-size: 14px;color: #2EB800;">一师二附小</div>
            <div style="color: #2EB800;">----------------</div>
            <div style="padding: 5px;">一年级1班(2人)</div>
            <div style="padding: 5px;">一年级1班(1人)</div>
            <%--</div>--%>
        </li>

    </ul>
    <div class="obv_logo"><s:text name="label.online.class.logo"/><br/><img
            id="obv_course_logo" src="<s:property value="course.logoUrl"/>"/></div>

    <input type="button" class="store_btn" id="step2_modify"
           value="<s:text name="common.modify"/>"
           onclick="modifyStepMsg(this,2);"/>
</div>
<%@ include file="/jsp/gogowise/course/courseCreate/courseInfo_js.jsp" %>
