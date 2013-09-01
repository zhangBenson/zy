<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/course/courseCreation_js.jsp" %>

<link href="css/courseCreation.css" rel="stylesheet" type="text/css" />

<div class="course_create_container">
  <div class="create_tabs">
  	<ul>
    	<div class="left_border"></div>
    	<div class="left_border"></div>
    	<li>1、<s:property value="%{getText('title.select.type')}"/></li>
        <li class="stand_out">2、<s:property value="%{getText('titie.info.course')}"/></li>
        <li>3、<s:property value="%{getText('title.info.class')}"/> </li>
        <li>4、<s:property value="%{getText('title.course.confirm')}"/></li>
        <div class="right_border"></div>
    </ul>
  </div>
<s:form action="repeatCourse" method="POST" validate="true" theme="css_xhtml" enctype="multipart/form-data">
    <s:hidden name="course.id"/>
  <div class="create_content">
  	<ul class="content_courseInfo">
    	<li>
        	<div class="option_tittle"><s:property value="%{getText('repeat.course.of.select.course')}"/></div><div class="course_name_input_msg input_msg"></div>
            <div class="option_content"><s:select name="course.fromCourse.id" id="courseName" list="orgs" listKey="key" cssClass="long_text_field" listValue="value" value="course.id"/></div>
        </li>

        <li class="long_select_li">
        	<div class="option_tittle"><s:property value="%{getText('label.online.class.startdate')}"/></div><div class="course_date_input_msg input_msg"></div>
            <div class="option_content"><s:textfield id="courseStartDate" name="startTime" readonly="true" cssClass="Wdatepicker short_text_field"/></div>
        </li>
        <li class="long_select_li" id="pointLecturer"></li>
        <li>
        	<div class="option_tittle"><s:property value="%{getText('course.student.appointed')}"/></div><span class="add_student_btn_for_course_repeat" id="add_student_btn_for_course_repeat"><s:property value="%{getText('course.add.student')}"/></span><div class="invite_student_input_msg input_msg"></div>
            <div class="option_content" id="invitedStudents">
                <input class="long_text_field_for_student"  placeholder="<s:property value="%{getText('org.course.student.email')}"/>" id="studentEmail1" onblur="checkRepeatStudentMail(this);" name="emails" type="text" />
            </div>
        </li>
    </ul>
  </div>
  <div class="direction_wrap">
            <input type="button" class="act_btn back" onclick="goback2step1();" value="<s:property value="%{getText('page.previous')}"/>" />
            <input type="submit" class="act_btn forth" onclick="return yzRepeatCourseForm();" value="<s:property value="%{getText('page.next')}"/>" />
  </div>
  </s:form>
</div>

<script type="text/javascript">
    var courseType = 0;
    var content =  "<div class='option_tittle'><s:property value="%{getText('label.forcast.lecturer')}"/></div><div class='invite_teacher_input_msg input_msg'></div><div class='option_content'><input type='text' class='long_text_field' id='course_teacherEmail' placeholder='<s:text name='org.course.lecturer.email'/>' onblur='checkTeacherMail(this);' name='teacherEmail'/></div>";
    $(document).ready(function(){
          $.get('courseTypeJudge.html?course.id='+$("#courseName").val(),function(data){
            if(data.length!=0){
                $('#pointLecturer').html(content);
                courseType = 1;
            }
        },"html");
        $("#courseName").change(function(){
            $.get('courseTypeJudge.html?course.id='+$("#courseName").val(),function(data){
                if(data.length!=0){
                     $('#pointLecturer').html(content);
                     courseType = 1;
                }else{
                    $('#pointLecturer').html("");
                    courseType = 0;
                }
            },"html");
        });
    });
     $(document).ready(function(){
         <s:if test="course.id != null">
            $("#courseStartDate").attr('value','<s:date  name="course.startDate" format="%{getText('global.display.date')}"/>');
              <s:if test="course.teacherEmail != null">
               $('#pointLecturer').html(content);
               $("#course_teacherEmail").attr('value','<s:property value="course.teacherEmail"/>');
              </s:if>
            <s:if test="courseInviteStudents!=null">
              <s:iterator value="courseInviteStudents" status="idx">
                 <s:if test="#idx.index==0">
                     $("#studentEmail1").attr('value', '<s:property value="invitedStudentEmail"/>');
                 </s:if>
                 <s:else>
                     $("#invitedStudents").append("<input class='long_text_field_for_student' value='<s:property value="invitedStudentEmail"/>' onblur='checkRepeatStudentMail(this);' name='emails' type='text' /><span class='del_student_btn' onclick='remove_student(this);'><s:text name="course.class.delete"/></span>");
                     count++;
                 </s:else>
              </s:iterator>
           </s:if>
        </s:if>
     });
</script>
