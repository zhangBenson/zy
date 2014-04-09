<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/course/courseCreation_js.jsp" %>

<link rel="stylesheet" href="js/wokaobox/wokaobox.css" type="text/css"/>
<link href="css/courseCreation.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
    <s:if test="course.id!=null">
    $(document).ready(function () {
        document.getElementById("courseStartDate").value = "<s:date  name="course.startDate" format="%{getText('global.display.date')}"/>";
        <s:if test="courseInviteStudents!=null">
        <s:iterator value="courseInviteStudents" status="idx">
        <s:if test="#idx.index==0">
        $("#studentEmail1").attr('value', '<s:property value="invitedStudentEmail"/>');
        </s:if>
        <s:else>
        <s:if test="identity!=null">
        var count =
        <s:property value="#idx.index+1"/>
        if (count > <s:property value="identity"/>) {
            return;
        }
        </s:if>
        $("#invitedStudents").append("<input class='long_text_field_for_student' value='<s:property value="invitedStudentEmail"/>' onblur='checkStudentMail(this);' name='emails' type='text' /><span class='del_student_btn' onclick='remove_student(this);'><s:text name="course.class.delete"/></span>");
        count++;
        </s:else>
        </s:iterator>
        </s:if>
    });
    </s:if>
</script>
<div class="course_create_container">
    <div class="create_tabs">
        <ul>
            <div class="left_border"></div>
            <li>1、<s:property value="%{getText('title.select.type')}"/></li>
            <li class="stand_out">2、<s:property value="%{getText('titie.info.course')}"/></li>
            <li>3、<s:property value="%{getText('title.info.class')}"/></li>
            <li>4、<s:property value="%{getText('title.course.confirm')}"/></li>
            <div class="right_border"></div>
        </ul>
    </div>
    <s:form action="saveCourse" method="POST" validate="false" theme="css_xhtml">
        <s:hidden name="identity"/>
        <s:hidden name="course.id"/>
        <s:hidden name="courseType"/>
        <div class="create_content">
            <ul class="content_courseInfo">

                <li>
                    <div class="option_tittle"><s:property value="%{getText('course.info.courseName')}"/></div>
                    <div class="course_name_input_msg input_msg"></div>
                    <div class="option_content"><s:textfield cssClass="long_text_field" id="step2_course_name"
                                                             name="course.name" type="text"/></div>
                </li>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('course.info.description')}"/></div>
                    <div class="course_intro_input_msg input_msg"></div>
                    <div class="option_content">
                        <s:textarea cssClass="long_text_area" id="step2_course_intro" name="course.description"/>
                    </div>
                </li>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('course.info.of.student.type')}"/></div>
                    <div class="course_student_type_input_msg input_msg"></div>
                    <div class="option_content"><s:textfield cssClass="long_text_field" id="step2_course_student_type"
                                                             name="course.studentType" type="text"/></div>
                </li>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('course.info.of.teaching.book')}"/></div>
                    <div class="course_teaching_book_input_msg input_msg"></div>
                    <div class="option_content"><s:textfield cssClass="long_text_field" id="step2_course_teaching_book"
                                                             name="course.courseTeachingBook" type="text"/></div>
                </li>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('course.info.of.course.type')}"/></div>
                    <div class="course_type_input_msg input_msg"></div>
                    <div class="option_content"><s:select
                            list="#{'7':getText('course.type.7'),'1':getText('course.type.1'),'2':getText('course.type.2'),'3':getText('course.type.3'),'4':getText('course.type.4'),'5':getText('course.type.5'),'6':getText('course.type.6')}"
                            headerKey="-1" headerValue="%{getText('please.choose.course.type')}"
                            cssClass="long_text_field" id="step2_course_type" name="course.courseType"/></div>
                </li>
                <li class="long_select_li">
                    <div class="option_tittle"><s:property value="%{getText('label.online.class.startdate')}"/></div>
                    <div class="course_date_input_msg input_msg"></div>
                    <div class="option_content"><s:textfield id="courseStartDate" name="course.startDate"
                                                             readonly="true"
                                                             cssClass="Wdatepicker short_text_field"/></div>
                </li>
                <li class="long_select_li">
                    <div class="option_tittle"><s:property value="%{getText('label.online.class.tutor.price')}"/></div>
                    <div class="input_msg"></div>
                    <s:hidden name="course.consumptionType" value="true"/>
                    <div class="option_content"><s:textfield cssClass="short_text_field" name="course.charges" value="0"
                                                             type="text" readonly="false"/>&nbsp;<s:property
                            value="%{getText('label.zhibi.true')}"/></div>
                </li>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('label.online.class.logo')}"/></div>
                    <div class="input_msg" id="course_logo_input_msg"></div>
                    <div class="option_content">
                        <img src="images/defaultImgs/course.gif" id="show_log_preview"/><br/>
                            <%--<s:file cssClass="long_text_field" id="course_logo_upload" name="upload"/><br/>--%>
                        <s:hidden id="course_logo" cssClass="long_text_field" name="course.logoUrl"/>
                        <input type="button" id="change_portrait"
                               value="<s:property value="%{getText('onlive.message.update')}"/>"
                               href="courseLogoProcess.html"/>
                    </div>
                </li>
                <s:if test="courseType == 1 || courseType == 2">
                    <li>
                        <div class="option_tittle"><s:property value="%{getText('label.forcast.lecturer')}"/></div>
                        <div class="invite_teacher_input_msg input_msg"></div>
                        <div class="option_content">
                            <s:checkboxlist list="teachers" listKey="id" listValue="email" name="teacherIds"/>
                        </div>
                    </li>
                </s:if>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('course.student.appointed')}"/></div>
                    <span class="add_student_btn"><s:property value="%{getText('course.add.student')}"/></span>

                    <div class="invite_student_input_msg input_msg"></div>
                    <div class="option_content" id="invitedStudents"><input class="long_text_field_for_student"
                                                                            placeholder="<s:property value="%{getText('org.course.student.email')}"/>"
                                                                            id="studentEmail1"
                                                                            onblur="checkStudentMail(this);"
                                                                            name="emails" type="text"/></div>
                </li>
            </ul>
        </div>
        <div class="direction_wrap">
            <input type="button" class="act_btn back" onclick="goback2step1();"
                   value="<s:property value="%{getText('page.previous')}"/>"/>
            <input type="submit" class="act_btn forth" onclick="return yzSaveCourseForm();"
                   value="<s:property value="%{getText('page.next')}"/>"/>
        </div>
    </s:form>
</div>

<script type="text/javascript">
    $(function () {
        $("#change_portrait").fancybox({
            type: 'iframe',
            width: 720,
            height: 490
        });
    });
</script>
