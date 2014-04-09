<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/course/courseCreation_js.jsp" %>
<link href="css/courseCreation.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" language="javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" language="javascript" src="js/My97DatePicker/calendar.js"></script>
<script type="text/javascript">
    var warn_start_time_empty = error_div + "<s:text name='course.start.time.of.class'/>";
    var warn_class_startTime_litter_than_course_time = error_div + "<s:text name='msg.courseclass.endtimeminite.error'/>";
    function checkSaveClass() {
        var startTime = $("#class_start_time_input").val();
        var time123 = "<s:date name="course.startDate" format="%{getText('dateformat.forclass')}"/>";
        var courseStartTime = new Date(time123.replace(/-/g, '/'));
        var currentTime = new Date(startTime.replace(/-/g, '/'));
        if (startTime.length == 0) {
            $("#class_start_time_msg").html(warn_start_time_empty);
            return false;
        } else if (currentTime < courseStartTime) {
            $("#class_start_time_msg").html(warn_class_startTime_litter_than_course_time);
            return false;
        }
        return true;
    }
</script>
<div class="course_create_container">
    <s:hidden value="teacherChange"/>
    <div class="create_tabs">
        <ul>
            <div class="left_border"></div>
            <li>1、<s:property value="%{getText('title.select.type')}"/></li>
            <li>2、<s:property value="%{getText('titie.info.course')}"/></li>
            <li class="stand_out">3、<s:property value="%{getText('title.info.class')}"/></li>
            <li>4、<s:property value="%{getText('title.course.confirm')}"/></li>
            <div class="right_border"></div>
        </ul>
    </div>
    <div class="create_content">
        <div class="content_inner">
            <div class="content_class_list">
                <p><s:property value="%{getText('label.class.created')}"/></p>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="htitle"><s:property value="%{getText('lable.course.no')}"/></td>
                        <td class="htitle"><s:property value="%{getText('lable.course.nickname')}"/></td>
                        <td class="htitle"><s:property value="%{getText('lable.course.starttime')}"/></td>
                        <td class="htitle"><s:property value="%{getText('label.lastingtime')}"/></td>
                        <td class="htitle">&nbsp;</td>
                        <td class="htitle">&nbsp;</td>
                    </tr>
                    <tbody class="list_tbody">
                    <s:iterator value="course.classes">
                        <tr id="classes<s:property value="id"/>">
                            <td id="course_name<s:property value="id"/>"><s:property value="name"/></td>
                            <td id="course_nickName<s:property value="id"/>"><s:property value="nickName"/></td>
                            <td id="course_date<s:property value="id"/>"><s:date name="date"
                                                                                 format="%{getText('global.display.hour.minute')}"/></td>
                            <td id="course_duration<s:property value="id"/>"><s:property value="duration"/></td>
                            <td>
                                <span class="class_btn edit_class_btn" id="course_edit<s:property value="id"/>"
                                      onclick="editSpecifiedClass(<s:property value="id"/>);"><s:property
                                        value="%{getText('course.class.edit')}"/></span>
                            </td>
                            <td>
                                <span class="class_btn"
                                      onclick="deleteAddedClass('classes<s:property value="id"/>',<s:property
                                              value="id"/>);"><img src="images/delete.gif"/><s:property
                                        value="%{getText('course.class.delete')}"/></span>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
            <div class="content_class_add">
                <div class="add_selection">
                    <ul class="system_ul_list">
                        <li id="self_click_li"><s:property value="%{getText('label.one.by.one.ctreate')}"/></li>
                        <li id="auto_click_li" class="wait"><s:property
                                value="%{getText('label.auto.scheduing')}"/></li>
                    </ul>

                    <s:form action="saveClass" method="POST">
                        <s:hidden name="course.id"/>
                        <s:hidden name="courseType"/>
                        <ul class="self_system_ul" id="self_show_ul">
                            <li>
                                <div class="option_tittle"><s:property value="%{getText('lable.course.name')}"/></div>
                                <div id="class_name_msg" class="input_msg"></div>
                                <div class="option_content">
                                    <s:textfield name="courseClass.name" id="class_name_input"
                                                 value="%{getText('class.count',{classCount})}"
                                                 cssClass="long_text_field" readonly="true"/>
                                </div>
                            </li>
                            <li>
                                <div class="option_tittle"><s:property
                                        value="%{getText('lable.course.nickname')}"/></div>
                                <div id="class_nickname_msg" class="input_msg"></div>
                                <div class="option_content">
                                    <s:textfield name="courseClass.nickName" id="class_nickname_input"
                                                 cssClass="long_text_field"/>
                                </div>
                            </li>
                            <li class="short_li">
                                <div class="option_tittle"><s:property
                                        value="%{getText('lable.course.starttime')}"/></div>
                                <div id="class_start_time_msg" class="input_msg"></div>
                                <div class="option_content">
                                    <s:textfield name="courseClass.date" id="class_start_time_input" value=""
                                                 readonly="true"
                                                 cssClass="WdateTime short_text_field"
                                                 onfocus="WdatePicker({lang:'%{getText('language')}',startDate:'%y-%M-01 00:00:00',dateFmt:'%{getText('dateformat.forclass')}',alwaysUseStartDate:true})"/>
                                </div>
                            </li>
                            <li class="short_li">
                                <div class="option_tittle"><s:property value="%{getText('label.lastingtime')}"/></div>
                                <div class="option_content">
                                    <select name="durations" class="long_select">
                                        <option value=60 selected="selected">60<s:property
                                                value="%{getText('label.minute')}"/></option>
                                        <option value=55>55<s:property
                                                value="%{getText('label.minute')}"/></option>
                                        <option value=50>50<s:property
                                                value="%{getText('label.minute')}"/></option>
                                        <option value=45>45<s:property
                                                value="%{getText('label.minute')}"/></option>
                                        <option value=40>40<s:property
                                                value="%{getText('label.minute')}"/></option>
                                        <option value=35>35<s:property
                                                value="%{getText('label.minute')}"/></option>
                                        <option value=30>30<s:property
                                                value="%{getText('label.minute')}"/></option>
                                    </select>
                                </div>
                            </li>
                            <li class="long_li">
                                <s:reset value="%{getText('course.creation.reset')}" cssClass="reset_btn"/>
                                <s:submit value="%{getText('course.creation.confirm')}" cssClass="submit_btn"
                                          onclick="return checkSaveClass();"/>
                            </li>
                        </ul>
                    </s:form>

                    <s:form action="autoSaveClass" method="POST" validate="false">
                        <s:hidden name="course.id"/>
                        <s:hidden name="courseType"/>
                        <ul class="auto_system_ul" id="auto_show_ul">
                            <li class="long_li">
                                <table id="add_class_table">
                                    <tr>
                                        <td><span class="option_tittle"><s:property
                                                value="%{getText('lable.course.starttime')}"/></span><span
                                                class="input_msg" id="form2_start_time_msg"></span></td>
                                        <td><s:property value="%{getText('label.lastingtime')}"/></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr id="urFirst">
                                        <td class="time_td"><s:textfield name="startTimes"
                                                                         onblur="checkTimeError(this);" value=""
                                                                         readonly="true"
                                                                         cssClass="WTime short_text_field"/></td>
                                        <td><select name="durations" class="long_select">
                                            <option value=60 selected="selected">60<s:property
                                                    value="%{getText('label.minute')}"/></option>
                                            <option value=55>55<s:property value="%{getText('label.minute')}"/></option>
                                            <option value=50>50<s:property value="%{getText('label.minute')}"/></option>
                                            <option value=45>45<s:property value="%{getText('label.minute')}"/></option>
                                            <option value=40>40<s:property value="%{getText('label.minute')}"/></option>
                                            <option value=35>35<s:property value="%{getText('label.minute')}"/></option>
                                            <option value=30>30<s:property value="%{getText('label.minute')}"/></option>
                                        </select></td>
                                        <td class="add_class_btn"><s:property value="%{getText('interview.add')}"/></td>
                                    </tr>
                                </table>
                            </li>
                            <li class="long_li">
                                <div class="option_tittle"><s:property value="%{getText('date.fixed.model')}"/></div>
                                <div class="input_msg"></div>
                                <div class="option_content" id="fixed_model_div">
                                    <input name="classDate" type="checkbox" value="2"/>
                                    &nbsp;<s:property value="%{getText('monday')}"/>&nbsp;&nbsp;
                                    <input name="classDate" type="checkbox" value="3"/>
                                    &nbsp;<s:property value="%{getText('tuesday')}"/>&nbsp;&nbsp;
                                    <input name="classDate" type="checkbox" value="4"/>
                                    &nbsp;<s:property value="%{getText('wednesday')}"/>&nbsp;&nbsp;
                                    <input name="classDate" type="checkbox" value="5"/>
                                    &nbsp;<s:property value="%{getText('thursday')}"/>&nbsp;&nbsp;
                                    <input name="classDate" type="checkbox" value="6"/>
                                    &nbsp;<s:property value="%{getText('friday')}"/>&nbsp;&nbsp;
                                    <input name="classDate" type="checkbox" value="7"/>
                                    &nbsp;<s:property value="%{getText('saturday')}"/>&nbsp;&nbsp;
                                    <input name="classDate" type="checkbox" value="1"/>
                                    &nbsp;<s:property value="%{getText('sunday')}"/></div>
                            </li>
                            <li class="long_li">
                                <div class="option_tittle"><s:property
                                        value="%{getText('course.creation.repeat.range')}"/></div>
                                <div class="option_content"><s:property value="%{getText('course.creation.repeat')}"/>
                                    <select class="long_select" name="repeatTimes">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                    </select>
                                    <s:property value="%{getText('coruse.creation.week')}"/></div>

                            </li>
                            <li class="long_li">
                                <s:reset value="%{getText('course.creation.reset')}" cssClass="reset_btn"/>
                                <s:submit value="%{getText('course.creation.confirm')}" cssClass="submit_btn"/>
                            </li>
                        </ul>
                    </s:form>

                </div>
            </div>
        </div>
    </div>
    <div id="classesMsg"></div>
    <div class="direction_wrap">
        <input type="button" class="act_btn back" onclick="modifygoback2step2();"
               value="<s:property value="%{getText('page.previous')}"/>"/>
        <input type="submit" class="act_btn forth" onclick="return checkModifyClasses();"
               value="<s:property value="%{getText('page.next')}"/>"/>
    </div>
</div>