<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script>
    $(document).ready(function () {

        var sampleTags = [];

        $.getJSON("listTags.html",function(data){
            $.each(data.existTags,function(key,info){
                sampleTags.push( info["name"].toString() );
            });
        });

        var s = $('.grayPanel').tagit({
            availableTags: sampleTags
        });

        $("#btnTest").click(function(){
            alert(getTag());
        })


        <s:iterator value="tags">
        $(".grayPanel").tagit("createTag", "<s:property value="name"/>" );
        </s:iterator>
    });

//    window.onload=setTags;
</script>

<style type="text/css">
    .grayPanel
    {
        border-style:solid;border-color: #eee;border-width: 1px;
        min-height: 80px;margin-top: 10px;
        font-family: Verdana,'微软雅黑', Geneva, sans-serif;
        font-size:12px;
        width: 500px;
    }
    .grayPanel li{
        border-bottom: none;
        width: 50px;
    }
</style>

<div class="pic_2">
    <ul class="content_courseInfo fl">
        <li>
            <span class="item"><s:property value="%{getText('course.info.courseName')}"/></span>
            <s:textfield cssClass="long_text_field" id="step2_course_name" name="course.name" type="text"/>
            <span class="course_name_input_msg tip_words">*</span>

        </li>

        <li>
            <s:property value="%{getText('course.access')}"/>：
            <s:radio name="course.isPublic" list="#{true:getText('course.public'),false:getText('course.private')}"
                    value="course.isPublic" cssStyle="margin-left: 10px;margin-right: 10px;"/>
        </li>

        <li>
            <span class="item"><s:property value="%{getText('course.info.courseTag')}"/></span>
            <span class="course_tag_input_msg tip_words">*</span>
            <%--<s:checkboxlist list="tags" listKey="id" listValue="name" name="tags"/>--%>
            <br/>
            <ul class="grayPanel"></ul>

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
            <s:textfield cssClass="long_text_field" id="step2_course_teaching_book"
                         name="course.courseTeachingBook" type="text"/>
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
            <s:textfield cssClass="short_text_field" id="course_charges" name="course.charges"
                         type="text" readonly="false"/>&nbsp;<s:property
                value="%{getText('label.zhibi.true')}"/>
            <span class="course_charges_msg tip_words">*</span>
        </li>
        <li>
            <span class="item"><s:property value="%{getText('label.online.class.logo')}"/></span><span
                class="tip_words" id="course_logo_input_msg">*</span><br/>
            <img src="<s:property value="course.logoUrl"/>" id="show_log_preview"
                 onerror="this.onerror=null;this.src='images/defaultImgs/course.gif'"/>
            <s:hidden id="course_logo" cssClass="long_text_field" name="course.logoUrl"/>
            <input type="button" class="submit_btn" id="change_portrait"
                   value="<s:property value="%{getText('onlive.message.update')}"/>"
                   href="courseLogoProcess.html"/>
        </li>
        <s:if test="courseType == 1 || courseType == 2">
            <li>
                <span class="item"><s:property value="%{getText('label.forcast.lecturer')}"/></span>
                <s:radio list="teachers" listKey="id" listValue="nickName" name="teacherIds" value="course.teacher.id"/>
                <span class="invite_teacher_input_msg tip_words">*</span>
            </li>
        </s:if>
        <li>
            <s:property value="%{getText('course.student.appointed')}"/>
            <a class="add_student_btn"><s:property value="%{getText('course.add.student')}"/></a> &nbsp;&nbsp;&nbsp;
            <span class="invite_student_input_msg tip_words"></span>
            <table>
                <s:iterator value="course.courseInviteStudents" status="idx">
                    <tr id="invite<s:property value="id"/>">
                        <td width="150px" name="emails" value="<s:property value="invitedStudentEmail"/>">
                        <s:property value="invitedStudentEmail"/>
                        </td>
                        <td width="80px" id="inviteStatus<s:property value="id"/>">
                            <s:if test="false == acceptInvite">
                                <s:text name='title.user.invite.status.refused'/>
                            </s:if>
                            <s:if test="acceptInvite">
                                <s:text name='title.user.invite.status.confirmed'/>
                            </s:if>
                            <s:if test="acceptInvite == null">
                                <s:text name='title.user.invite.status.unconfirmed'/>
                            </s:if>
                        </td>
                        <td width="200px">
                            <s:if test="acceptInvite">
                            </s:if>
                            <s:else>
                                <a href="javascript:;" onclick="reInvite(
                                    <s:property value="id"/> );"><s:text name="title.user.invite.user.reinvite"/></a>&nbsp;
                                <a href="javascript:;" onclick="deleteInvite( <s:property value="id"/>);"><s:text
                                        name="title.delete"/></a>
                            </s:else>
                        </td>
                    </tr>
                </s:iterator>
            </table>
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
                <s:if test="course.isPublic != true"><s:property value="%{getText('course.private')}" /></s:if>
                <s:else><s:property value="%{getText('course.public')}" /></s:else>
            </span>
        </li>
        <li>
            <s:property value="%{getText('course.info.courseTag')}"/>：
            <span class="orange_words" id="store_courseTag"><s:property value="course.getTagsAsStr()"/></span>
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
        <li><s:property value="%{getText('course.student.appointed')}"/>：
            <span class="orange_words" id="store_emails">

            </span>
        </li>
        <li>
            <table>
                <s:iterator value="course.courseInviteStudents" status="idx">
                    <tr id="invite<s:property value="id"/>">
                        <td width="150px" name="emails" value="<s:property value="invitedStudentEmail"/>">
                            <s:property value="invitedStudentEmail"/>
                        </td>
                        <td width="80px" id="inviteStatus<s:property value="id"/>">
                            <s:if test="false == acceptInvite">
                                <s:text name='title.user.invite.status.refused'/>
                            </s:if>
                            <s:if test="acceptInvite">
                                <s:text name='title.user.invite.status.confirmed'/>
                            </s:if>
                            <s:if test="acceptInvite == null">
                                <s:text name='title.user.invite.status.unconfirmed'/>
                            </s:if>
                        </td>
                        <td width="200px">
                            <s:if test="acceptInvite">
                            </s:if>
                            <s:else>
                                <a href="javascript:;" onclick="reInvite(
                                    <s:property value="id"/> );"><s:text name="title.user.invite.user.reinvite"/></a>&nbsp;
                                <a href="javascript:;" onclick="deleteInvite( <s:property value="id"/>);"><s:text
                                        name="title.delete"/></a>
                            </s:else>
                        </td>
                    </tr>
                </s:iterator>
            </table>
        </li>

    </ul>
    <div class="obv_logo"><s:property value="%{getText('label.online.class.logo')}"/><br/><img
            id="obv_course_logo" src="<s:property value="course.logoUrl"/>"/></div>

    <input type="button" class="store_btn" id="step2_modify"
           value="<s:property value="%{getText('onlive.message.update')}"/>"
           onclick="modifyStepMsg(this,2);"/>
</div>
<script type="text/javascript">
    function reInvite(id) {
        $.post("resendInvitation.html", {'id': id}, changeToPending);
        function changeToPending() {
            $("#inviteStatus" + id)[0].innerHTML = '<s:text name='title.user.invite.status.unconfirmed'/>';
        }
    }

    function deleteInvite(id) {
        $.post("deleteInvitation.html", {'id': id}, removeInviteCell);
        function removeInviteCell() {
            $("#invite" + id)[0].style.display = 'none';
        }
    }
</script>
