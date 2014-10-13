<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="pic_2 after_store_class">
    <div class="content_inner fl">
        <ul class="system_ul_list">
            <li id="self_click_li" class="stand_out"><s:text name="label.one.by.one.ctreate"/></li>
            <li id="auto_click_li" class="wait"><s:text name="label.auto.scheduing"/></li>
        </ul>

        <div class="content_class_list">
            <p><s:text name="label.class.created"/>&nbsp;&nbsp;<span id="class_nickname_msg"
                                                                                        class="tip_words"></span>
            </p>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th class="htitle"><s:text name="lable.course.no"/></th>
                    <th class="htitle" width="160px"><s:text name="lable.course.nickname"/></th>
                    <th class="htitle"><s:text name="lable.course.starttime"/></th>
                    <th class="htitle"><s:text name="label.lastingtime"/></th>
                    <th class="htitle">&nbsp;</th>
                    <th class="htitle">&nbsp;</th>
                </tr>
                <tbody class="list_tbody" id="list_tbody">
                <s:iterator value="course.classes" status="idx">
                    <tr id="classes<s:property value="id"/>">
                        <td id="course_name<s:property value="id"/>"><s:property value="#idx.index+1"/></td>
                        <td id="course_nickName<s:property value="id"/>" class="course_nickName_text"><s:property value="nickName"/></td>
                        <td id="course_date<s:property value="id"/>"><s:date name="date"
                                                                             format="%{getText('global.display.hour.minute')}"/></td>
                        <td id="course_duration<s:property value="id"/>"><s:property value="duration"/></td>
                        <td>
                            <a class="class_btn edit_class_btn" id="course_edit<s:property value="id"/>"
                               onclick="editSpecifiedClass(<s:property value="id"/>);"><s:text name="course.class.edit"/></a>
                        </td>
                        <td>
                            <a class="class_btn"
                               onclick="deleteAddedClass('classes<s:property value="id"/>',<s:property value="id"/>);"><s:text name="course.class.delete"/></a>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>

        <div class="self_system_wrap">
            <s:form id="self_class_system_form">
                <s:hidden name="course.id" id="self_class_courseID"/>
                <ul class="self_system_ul" id="self_show_ul">
                    <li>
                        <span class="item"><s:text name="lable.course.nickname"/></span>
                        <s:textfield name="classInfo.nickName" id="class_nickname_input"
                                     cssClass="long_text_field course_nick_name"/>
                        <span class="tip_words" id="class_nick_msg"></span>
                    </li>
                    <li class="short_li">
                        <span class="item"><s:text name="lable.course.starttime"/></span>
                        <s:textfield name="classInfo.date" id="class_start_time_input" value=""
                                     readonly="true"
                                     cssClass="WdateTime short_text_field"
                                     onfocus="WdatePicker({lang:'%{getText('language')}',startDate:'%y-%M-01 00:00:00',dateFmt:'%{getText('dateformat.forclass')}',alwaysUseStartDate:true})"/>
                        <span id="class_start_time_msg" class="tip_words"></span>
                    </li>
                    <li class="short_li">
                        <span class="item"><s:text name="label.lastingtime"/></span>
                        <select name="durations" class="long_select" id="class_durations_input">
                            <option value=60 selected="selected">60<s:text name="label.minute"/></option>
                            <option value=55>55<s:text name="label.minute"/></option>
                            <option value=50>50<s:text name="label.minute"/></option>
                            <option value=45>45<s:text name="label.minute"/></option>
                            <option value=40>40<s:text name="label.minute"/></option>
                            <option value=35>35<s:text name="label.minute"/></option>
                            <option value=30>30<s:text name="label.minute"/></option>
                        </select>
                    </li>
                </ul>
                <div class="storeWrap">
                    <input type="button" class="store_btn" id="step3_self_store"
                           value="<s:text name="button.save"/>"/>
                    <span class="tip_words" id="step3_store_msg"></span>
                </div>
            </s:form>
        </div>

        <div class="auto_system_wrap" style="display:none;">
            <s:form id="auto_class_system_form">
                <s:hidden name="course.id" id="auto_class_courseID"/>
                <ul class="auto_system_ul" id="auto_show_ul">
                    <li class="long_li">
                        <table id="add_class_table">
                            <tr>
                                <td><span class="item"><s:text name="lable.course.starttime"/></span><span
                                        class="tip_words" id="form2_start_time_msg"></span></td>
                                <td><s:text name="label.lastingtime"/></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr class="urFirst">
                                <td class="time_td"><s:textfield name="startTimes"
                                                                 onblur="checkTimeError(this);" value=""
                                                                 readonly="true"
                                                                 cssClass="WTime short_text_field"/></td>
                                <td><select name="durations" class="long_select">
                                    <option value=60>60<s:text name="label.minute"/></option>
                                    <option value=55>55<s:text name="label.minute"/></option>
                                    <option value=50>50<s:text name="label.minute"/></option>
                                    <option value=45>45<s:text name="label.minute"/></option>
                                    <option value=40>40<s:text name="label.minute"/></option>
                                    <option value=35>35<s:text name="label.minute"/></option>
                                    <option value=30>30<s:text name="label.minute"/></option>
                                </select></td>
                                <td class="add_class_btn class_btn"><s:text name="interview.add"/></td>
                            </tr>
                        </table>
                    </li>
                    <li class="long_li">
                        <span class="item"><s:text name="date.fixed.model"/></span><span
                            class="tip_words">*</span>
                        <span class="tip_words" id="form2_repeat_msg"></span>

                        <div id="fixed_model_div">
                            <input name="classDate" id="classDate1" type="checkbox" value="2"/>
                            &nbsp;<label for="classDate1"><s:text name="monday"/></label>&nbsp;&nbsp;
                            <input name="classDate" id="classDate2" type="checkbox" value="3"/>
                            &nbsp;<label for="classDate2"><s:text name="tuesday"/></label>&nbsp;&nbsp;
                            <input name="classDate" id="classDate3" type="checkbox" value="4"/>
                            &nbsp;<label for="classDate3"><s:text name="wednesday"/></label>&nbsp;&nbsp;
                            <input name="classDate" id="classDate4" type="checkbox" value="5"/>
                            &nbsp;<label for="classDate4"><s:text name="thursday"/></label>&nbsp;&nbsp;
                            <input name="classDate" id="classDate5" type="checkbox" value="6"/>
                            &nbsp;<label for="classDate5"><s:text name="friday"/></label>&nbsp;&nbsp;
                            <input name="classDate" id="classDate6" type="checkbox" value="7"/>
                            &nbsp;<label for="classDate6"><s:text name="saturday"/></label>&nbsp;&nbsp;
                            <input name="classDate" id="classDate7" type="checkbox" value="1"/>
                            &nbsp;<label for="classDate7"><s:text name="sunday"/></label>
                        </div>
                    </li>
                    <li class="long_li">
                        <s:text name="course.creation.repeat"/>
                        <select class="long_select1" name="repeatTimes">
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
                        <s:text name="coruse.creation.week"/>
                    </li>
                </ul>
                <div class="storeWrap">
                    <input type="button" class="store_btn" id="step3_auto_store"
                           value="<s:text name="button.save"/>"/>
                </div>
            </s:form>
        </div>
    </div>
</div>
