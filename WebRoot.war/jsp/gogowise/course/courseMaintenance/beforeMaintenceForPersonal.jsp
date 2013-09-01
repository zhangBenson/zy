<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/course/courseCreation_js.jsp" %>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<link href="css/courseCreation.css" rel="stylesheet" type="text/css" />
<link href="css/course/course_maintenance.css" rel="stylesheet" type="text/css" />

<div class="course_create_container">
  <div class="create_tabs">
  	<ul>
    	<div class="left_border"></div>
    	<li>1、<s:property value="%{getText('title.select.type')}"/></li>
        <li class="stand_out">2、<s:property value="%{getText('titie.info.course')}"/></li>
        <li>3、<s:property value="%{getText('title.info.class')}"/> </li>
        <li>4、<s:property value="%{getText('title.course.confirm')}"/></li>
        <div class="right_border"></div>
    </ul>
  </div>
  <s:form action="modifyCourseStep2" method="POST" validate="true" theme="css_xhtml" enctype="multipart/form-data">
      <s:hidden name="identity"/>
      <s:hidden name="course.id"/>
      <s:hidden name="courseType"/>
  <div class="create_content">
  	<ul class="content_courseInfo">
    	<li>
        	<div class="option_tittle"><s:property value="%{getText('course.info.courseName')}"/></div><div class="course_name_input_msg input_msg"></div>
            <div class="option_content"><s:textfield cssClass="long_text_field" id="step2_course_name" name="course.name" /></div>
        </li>
        <li>
        	<div class="option_tittle"><s:property value="%{getText('course.info.description')}"/></div><div class="course_intro_input_msg input_msg"></div>
            <div class="option_content">
              <s:textarea cssClass="long_text_area" id="step2_course_intro" name="course.description"/>
            </div>
        </li>

        <li class="long_select_li">
        	<div class="option_tittle"><s:property value="%{getText('label.online.class.tutor.price')}"/></div><div class="input_msg"></div>
            <div class="option_content"><s:textfield cssClass="slim_text_field" name="course.charges" value="0" type="text" readonly="true" />&nbsp;<s:property value="%{getText('label.zhibi.true')}"/></div>
        </li>
        <li class="long_select_li">
        	<div class="option_tittle"><s:property value="%{getText('label.online.class.logo')}"/></div><div class="input_msg" id="course_logo_input_msg"></div>
            <div class="option_content">
                <img src="<s:property value="course.logoUrl"/>" id="show_log_preview"/><br/>
                <s:file cssClass="long_text_field" id="course_logo_upload" name="upload"/><br/>
                <s:hidden id="course_logo" cssClass="long_text_field" name="course.logoUrl"/>
            </div>
        </li>
        <s:if test="courseType == 1 || courseType == 2">
           <li>
        	<div class="option_tittle"><s:property value="%{getText('label.forcast.lecturer')}"/></div><div class="invite_teacher_input_msg input_msg"></div>
            <div class="option_content"><s:textfield cssClass="long_text_field" id="course_teacherEmail" placeholder="%{getText('org.course.lecturer.email')}" onblur="checkTeacherMail(this);" name="teacherEmail" type="text" /></div>
           </li>
        </s:if>
    </ul>
  </div>
  <div class="direction_wrap">
        <s:submit cssClass="act_btn forth" value="%{getText('page.next')}" />
  </div>
  </s:form>
</div>
