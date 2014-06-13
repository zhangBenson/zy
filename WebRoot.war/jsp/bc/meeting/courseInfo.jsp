<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="pic_2">
    <ul class="content_courseInfo fl">
        <li>
            <span class="item">Name of Meeting</span>
            <s:textfield cssClass="long_text_field" id="step2_course_name" name="course.name" type="text"/>
            <span class="course_name_input_msg tip_words">*</span>

        </li>
        <li>
            <s:property value="%{getText('course.access')}"/>：
            <s:radio name="course.isPublic" list="#{true:getText('course.public'),false:getText('course.private')}"
                     value="course.isPublic" cssStyle="margin-left: 10px;margin-right: 10px;"/>
        </li>
        <li>
            <span class="item">Meeting Description</span>
            <span class="course_intro_input_msg tip_words">*</span> <br/>
            <s:textarea cssClass="long_text_area" id="step2_course_intro" name="course.description"/>
        </li>


        <li class="long_select_li">
            <span class="item"><s:property value="%{getText('label.online.class.startdate')}"/></span>
            <s:textfield id="courseStartDate" name="course.startDate" readonly="true"
                         cssClass="Wdatepicker short_text_field"/>
            <span class="course_date_input_msg tip_words">*</span>
        </li>

        <li>
            <span class="item">Meeting Logo</span><span
                class="tip_words" id="course_logo_input_msg">*</span><br/>
            <img src="<s:property value="course.logoUrl"/>" id="show_log_preview"
                 onerror="this.onerror=null;this.src='images/defaultImgs/course.gif'"/>
            <s:hidden id="course_logo" cssClass="long_text_field" name="course.logoUrl"/>
            <input type="button" class="submit_btn" id="change_portrait"
                   value="<s:property value="%{getText('onlive.message.update')}"/>"
                   href="courseLogoProcess.html"/>
        </li>

            <li>
                <span class="item">Host</span>
                <s:radio list="teachers" listKey="id" listValue="nickName" name="teacherIds" value="course.teacher.id"/>
                <span class="invite_teacher_input_msg tip_words">*</span>
            </li>

        <li>
            The Participant(s) Appointed
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
               value="<s:property value="%{getText('term.info.save')}"/>"/>
        <span class="tip_words" id="step2_store_msg"></span>
    </div>
</div>


<div class="pic_2 after_store" id="step2_store_cont">
    <ul>
        <li>
            <s:property value="%{getText('course.info.courseName')}"/>：
            <span class="orange_words" id="store_name"><s:property value="course.name"/></span>
        </li>
        <li>
            <s:property value="%{getText('course.access')}"/>：
            <span class="orange_words" id="store_course_access">
                <s:if test="course.isPublic != true"><s:property value="%{getText('course.private')}"/></s:if>
                <s:else><s:property value="%{getText('course.public')}"/></s:else>
            </span>
        </li>
        <li>
            <s:property value="%{getText('course.info.description')}"/>：
            <span class="orange_words" id="store_description"><s:property value="course.description"/></span>
        </li>
        <li><s:property value="%{getText('course.info.of.student.type')}"/>：<span class="orange_words"
                                                                                  id="store_studentType"><s:property
                value="course.studentType"/></span></li>
        <li><s:property value="%{getText('course.info.of.teaching.book')}"/>：<span class="orange_words"
                                                                                   id="store_courseTeachingBook"><s:property
                value="course.courseTeachingBook"/></span></li>
        <li><s:property value="%{getText('course.info.of.course.type')}"/>：<span class="orange_words"
                                                                                 id="store_courseType"><s:property
                value="course.courseType"/></span></li>
        <li><s:property value="%{getText('label.online.class.startdate')}"/>：<span class="orange_words"
                                                                                   id="store_startDate"><s:date
                name="course.startDate" format="%{getText('dateformat')}"/></span></li>
        <li><s:property value="%{getText('label.online.class.tutor.price')}"/>：<span class="orange_words"
                                                                                     id="store_charges"><s:property
                value="course.charges"/>&nbsp;<s:property value="%{getText('label.zhibi.true')}"/></span>
        </li>
        <li><s:property value="%{getText('label.forcast.lecturer')}"/>：<span class="orange_words"
                                                                             id="store_teacherEmail"><s:property
                value="course.teacher.nickName"/></span></li>
        <li><s:property value="%{getText('course.student.appointed')}"/>：<span class="orange_words"
                                                                               id="store_emails"><s:property
                value="course.courseTeachingBook"/></span></li>
    </ul>
    <div class="obv_logo"><s:property value="%{getText('label.online.class.logo')}"/><br/><img
            id="obv_course_logo" src="<s:property value="course.logoUrl"/>"/></div>

    <input type="button" class="store_btn" id="step2_modify"
           value="<s:property value="%{getText('onlive.message.update')}"/>"
           onclick="modifyStepMsg(this,2);"/>
</div>

