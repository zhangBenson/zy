<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/show/showCreation_js.jsp" %>
<link href="css/show/showCreate.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
    $(document).ready(function () {
        <s:if test="myShow != null">
        document.getElementById("show_showDate").value = "<s:date name="myShow.showDate" format="%{getText('dateformat')}"/>";
        document.getElementById("show_startTime").value = "<s:date name="myShow.showFixedTime" format="%{getText('dateformat.hour.minute')}"/>";

        var dateOfWeeks = "<s:property value="myShow.dateOfWeek"/>".split(',');
        for (var i = 0; i < dateOfWeeks.length; i++) {
            var value = dateOfWeeks[i];
            $("input[name='showWeekDays'][value='" + value + "']").attr("checked", "checked");
        }
        </s:if>
    })


</script>

<div class="course_create_container">
    <p class="create_content_title">
        <s:property value="%{getText('personal.show.management')}"/>&nbsp;&nbsp;|&nbsp;&nbsp;<a
            href="addShowHight.html?myShow.id=<s:property value="myShow.id"/>">添加个人秀新鲜事</a>
    </p>
    <s:form action="manageShow" method="POST" enctype="multipart/form-data">
        <s:hidden name="myShow.id"/>
        <div class="create_content">
            <ul class="content_courseInfo">
                    <%--<li>--%>
                    <%--<div class="option_tittle">所有的个人秀</div>--%>
                    <%--<div class="option_content">--%>
                    <%--<s:select name="myShow.id" id="show_selected" list="shows" listKey="key" cssClass="long_text_field" listValue="value" headerKey="-1" headerValue="请选择要维护的秀" value=""/>--%>
                    <%--</div>--%>
                    <%--</li>--%>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('show.name')}"/></div>
                    <div class="course_name_input_msg input_msg"></div>
                    <div class="option_content"><s:textfield cssClass="long_text_field" id="step2_course_name"
                                                             name="myShow.name" disabled="true" type="text"/>
                    </div>
                </li>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('show.intro')}"/></div>
                    <div class="show_desp_input_msg input_msg"></div>
                    <div class="option_content">
                        <s:textarea cssClass="long_text_area" id="show_showDesp" name="myShow.description"/>
                    </div>
                </li>
                <li class="long_select_li">
                    <div class="option_tittle"><s:property value="%{getText('show.type')}"/></div>
                    <div class="course_type_input_msg input_msg"></div>
                    <div class="option_content">
                        <s:select list="#{1:'唱歌',2:'乐队',3:'吉他',4:'其他'}" cssClass="short_text_field" listKey="key"
                                  listValue="value" headerKey="唱歌" name="myShow.type"/>
                    </div>
                </li>
                <li class="long_select_li">
                    <div class="option_tittle"><s:property value="%{getText('show.start.date')}"/></div>
                    <div class="show_date_input_msg input_msg"></div>
                    <div class="option_content">
                        <input type="text" id="show_showDate" name="myShow.showDate" disabled="true" value=""
                               class="Wdatepicker short_text_field"/>
                    </div>
                </li>
                <li class="long_select_li">
                    <div class="option_tittle"><s:property value="%{getText('show.start.time')}"/></div>
                    <div class="show_startTime_input_msg input_msg"></div>
                    <div class="option_content"><input type="text" id="show_startTime" name="myShow.showFixedTime"
                                                       value="" readonly="true" class="WTime short_text_field"/></div>
                </li>
                <li class="long_select_li">
                    <div class="option_tittle"><s:property value="%{getText('show.duration.time')}"/></div>
                    <div class="input_msg"></div>
                    <div class="option_content">
                        <s:select list="#{60:'60分钟',
                                          55:'55分钟',
                                          50:'50分钟',
                                          45:'45分钟',
                                          40:'40分钟',
                                          35:'35分钟',
                                          30:'30分钟'}"
                                  cssClass="short_text_field" listKey="key" listValue="value"
                                  headerKey="60<s:property value='%{getText('label.minute')}'/>"
                                  name="myShow.duration"/>
                            <%--<select name="myShow.duration" class="short_text_field">--%>
                            <%--<option value=60 selected="selected">60<s:property value="%{getText('label.minute')}"/></option>--%>
                            <%--<option value=55>55<s:property value="%{getText('label.minute')}"/></option>--%>
                            <%--<option value=50>50<s:property value="%{getText('label.minute')}"/></option>--%>
                            <%--<option value=45>45<s:property value="%{getText('label.minute')}"/></option>--%>
                            <%--<option value=40>40<s:property value="%{getText('label.minute')}"/></option>--%>
                            <%--<option value=35>35<s:property value="%{getText('label.minute')}"/></option>--%>
                            <%--<option value=30>30<s:property value="%{getText('label.minute')}"/></option>--%>
                            <%--</select>--%>
                    </div>
                </li>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('date.fixed.model')}"/></div>
                    <div class="input_msg"></div>
                    <div class="option_content" id="fixed_model_div">
                        <input name="showWeekDays" type="checkbox" value="2"/>
                        <s:property value="%{getText('monday')}"/>&nbsp;&nbsp;
                        <input name="showWeekDays" type="checkbox" value="3"/>
                        <s:property value="%{getText('tuesday')}"/>&nbsp;&nbsp;
                        <input name="showWeekDays" type="checkbox" value="4"/>
                        <s:property value="%{getText('wednesday')}"/>&nbsp;&nbsp;
                        <input name="showWeekDays" type="checkbox" value="5"/>
                        <s:property value="%{getText('thursday')}"/>&nbsp;&nbsp;
                        <input name="showWeekDays" type="checkbox" value="6"/>
                        <s:property value="%{getText('friday')}"/>&nbsp;&nbsp;
                        <input name="showWeekDays" type="checkbox" value="7"/>
                        <s:property value="%{getText('saturday')}"/>&nbsp;&nbsp;
                        <input name="showWeekDays" type="checkbox" value="1"/>
                        <s:property value="%{getText('sunday')}"/></div>
                </li>
                    <%--<li long_select_li>--%>
                    <%--<div class="option_tittle">持续时间</div><div class="course_date_input_msg input_msg"></div>--%>
                    <%--<div class="option_content"><s:textfield id="courseStartDate" name="" readonly="true" cssClass="long_text_field"/></div>--%>
                    <%--</li>--%>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('my.show.logo')}"/></div>
                    <div class="show_logo_input_msg input_msg"></div>
                    <div class="option_content">
                        <img src="<s:property value="myShow.logoUrl"/>" id="show_log_preview"
                             onerror="javascript:this.src='images/nopic.jpg'"/><br/>
                        <input type="file" name="upload" id="show_showLogo_upload"/>
                    </div>
                    <s:hidden id="show_showLogo" cssClass="long_text_field" name="myShow.logoUrl"/>
                </li>

                    <%--<li>--%>
                    <%--<div class="option_tittle"><s:property value="%{getText('course.student.appointed')}"/></div><span class="add_student_btn"><s:property value="%{getText('course.add.student')}"/></span><div class="invite_student_input_msg input_msg"></div>--%>
                    <%--<div class="option_content" id="invitedStudents"><input class="long_text_field_for_student"  placeholder="<s:property value="%{getText('org.course.student.email')}"/>" id="studentEmail1" onblur="checkStudentMail(this);" name="emails" type="text" /></div>--%>
                    <%--</li>--%>
            </ul>
        </div>
        <div class="create_back_forth">
            <s:submit cssClass="submit_btn" onclick="return checkShowInfoForm();"
                      value="%{getText('course.maintenance.confirm')}"/>
        </div>
    </s:form>
</div>
