<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="css/course/stepAll.css" rel="stylesheet" type="text/css"/>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="pic_2">
    <ul class="content_courseInfo fl">
        <li>
            <span class="item"><s:property value="%{getText('course.info.courseName')}"/></span>
            <s:textfield cssClass="long_text_field" id="step2_course_name" name="course.name" type="text"/>
            <span class="course_name_input_msg tip_words">*</span>
        </li>
        <li>
            <span class="item"><s:property value="%{getText('course.info.description')}"/></span>
            <span class="course_intro_input_msg tip_words">*</span> <br/>
            <s:textarea cssClass="long_text_area" id="step2_course_intro" name="course.description"/>
        </li>
        <li>
            <span class="item"><s:property value="%{getText('course.info.of.student.type')}"/> </span>
            <%--<s:textarea cssClass="long_text_area" id="step2_course_student_type" name="course.studentType"--%>
            <%--type="text"/>--%>
            <s:select
                    list="#{'1':getText('course.student.type.1'),'2':getText('course.student.type.2'),'3':getText('course.student.type.3'),
                                '4':getText('course.student.type.4'),'5':getText('course.student.type.5'),'6':getText('course.student.type.6')}"
                    headerKey="-1" headerValue="%{getText('course.student.default')}"
                    cssClass="long_text_field" id="step2_studentAge_type" name="course.studentAgeType"/>
            <span class="course_student_type_input_msg tip_words">*</span>
        </li>
        <%--<li>
            <span class="item"><s:property value="%{getText('course.info.of.teaching.book')}"/></span>
            <s:textfield cssClass="long_text_field" id="step2_course_teaching_book" name="course.courseTeachingBook" type="text" />
            <span class="course_teaching_book_input_msg tip_words"></span>
         </li>--%>
        <li>
            <span class="item"><s:property value="%{getText('course.info.of.course.type')}"/></span>
            <s:select
                    list="#{'7':getText('course.type.7'),'1':getText('course.type.1'),'2':getText('course.type.2'),'3':getText('course.type.3'),'4':getText('course.type.4'),'5':getText('course.type.5'),'5':getText('course.type.5')}"
                    headerKey="-1" headerValue="%{getText('please.choose.course.type')}"
                    cssClass="long_text_field" id="step2_course_type" name="course.courseType"/>
            <span class="course_type_input_msg tip_words">*</span>
        </li>
        <li class="long_select_li">
            <span class="item"><s:property value="%{getText('label.online.class.startdate')}"/></span>
            <s:textfield id="courseStartDate" name="course.startDate" readonly="true"
                         cssClass="Wdatepicker short_text_field"/>
            <span class="course_date_input_msg tip_words">*</span>
        </li>
        <li class="long_select_li">
            <span class="item"><s:property value="%{getText('label.online.class.tutor.price')}"/></span>
            <s:hidden name="course.consumptionType" value="true"/>
            <s:textfield cssClass="short_text_field" id="course_charges" name="course.charges" value="0"
                         type="text" readonly="false"/>&nbsp;<s:property
                value="%{getText('label.zhibi.true')}"/>
            <span class="course_charges_msg tip_words">*</span>
        </li>
        <li>
            <span class="item"><s:property value="%{getText('label.online.class.logo')}"/></span><span
                class="tip_words" id="course_logo_input_msg">*</span><br/>
            <img src="images/defaultImgs/course.gif" id="show_log_preview"/>
            <s:hidden id="course_logo" cssClass="long_text_field" name="course.logoUrl"/>
            <input type="button" class="submit_btn" id="change_portrait"
                   value="<s:property value="%{getText('onlive.message.update')}"/>"
                   href="courseLogoProcess.html"/>
        </li>
        <s:if test="courseType == 1 || courseType == 2">
            <li>
                <span class="item"><s:property value="%{getText('label.forcast.lecturer')}"/></span>
                <s:checkboxlist list="teachers" listKey="id" listValue="email" name="teacherIds"/>
                <span class="invite_teacher_input_msg tip_words">*</span>
            </li>
        </s:if>
        <li>
            <s:property value="%{getText('course.student.appointed')}"/>
            <a class="add_student_btn"><s:property value="%{getText('course.add.student')}"/></a> &nbsp;&nbsp;&nbsp;
            <span class="invite_student_input_msg tip_words"></span>

            <div class="option_content" id="invitedStudents">
                <input class="long_text_field_for_student"
                       placeholder="<s:property value="%{getText('org.course.student.email')}"/>"
                       id="studentEmail1" onblur="checkStudentMail(this);" name="emails" type="text"/> <br/>
            </div>
        </li>
    </ul>
    <div class="storeWrap">
        <input type="button" class="store_btn" id="step2_store"
               value="<s:property value="%{getText('button.save')}"/>"/>
        <span class="tip_words" id="step2_store_msg"></span>
    </div>
</div>


