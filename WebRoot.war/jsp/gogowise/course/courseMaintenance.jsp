<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>


<link href="css/course/stepAll.css" rel="stylesheet" type="text/css"/>
<link href="css/course/course_maintenance.css" rel="stylesheet" type="text/css"/>

<div class="create_cont fl">
<div class="stepTip fl">
    <a href="myForcastClass.html"><s:property value="%{getText('usermenu.item.my.created.courses')}"/></a>
    <i>&gt;</i>
    <a href="voaCourseBlog.html?course.id=<s:property value="course.id"/>"><s:property value="course.name"/></a>
    <i>&gt;</i>
    <s:property value="%{getText('my.forcast.course.info.manage')}"/>
</div>

<s:hidden name="course.id" id="course_id"/>
<%--<div class="stepWrap fl">

        <h3 alt="1"><span class="num">1</span><s:property value="%{getText('title.select.type')}"/></h3>
        <div class="stepCont step1Cont">
            <div class="pic_1"></div>
            <div class="pic_2">
                <ul class="content_style">
                    <li>
                        <input name="course.identity" type="radio" checked="true" value="1" id="type1" />
                        <label for="type1"><s:property value="%{getText('label.select.121')}"/></label>
                    </li>
                    <li>
                        <input name="course.identity" type="radio" value="2" id="type2" />
                        <label for="type2"><s:property value="%{getText('label.select.122')}"/></label>
                    </li>
                    <li>
                        <input name="course.identity" type="radio" value="3" id="type3" />
                        <label for="type3"><s:property value="%{getText('label.select.123')}"/>  </label>
                    </li>
                    <li>
                        <input name="course.identity" type="radio" value="4" id="type4" />
                        <label for="type4"><s:property value="%{getText('label.select.12many')}"/> </label>
                    </li>
                </ul>
                <div class="storeWrap">
                    <input type="button" class="store_btn" id="step1_store" value="<s:property value="%{getText('term.info.save')}"/>" />
                    <span class="tip_words" id="step1_store_msg"></span>
                </div>
            </div>
            <div class="pic_2 after_store" id="step1_store_cont">
                <span class="store_course_type">
                    <s:if test="course.organization==null">
                        <s:property value="%{getText('label.tutor.1to'+course.teachingNum)}" />
                    </s:if>
                    <s:else>
                        <s:property value="%{getText('label.no.public.1to'+course.teachingNum)}"/>
                    </s:else>
                </span> <br/>
                <input type="button" class="store_btn" id="step1_modify" value="<s:property value="%{getText('onlive.message.update')}"/>" onclick="modifyStepMsg(this,1);"/>
            </div>
            <div class="pic_3"></div>
        </div>
</div>--%>

<div class="stepWrap fl">
    <s:form id="course_main_info_form">
        <s:hidden name="course.id" id="course_id"/>
        <h3 alt="2"><span class="num">1</span><s:property value="%{getText('titie.info.course')}"/></h3>

        <div class="stepCont" style="display:block;">
            <div class="pic_1"></div>

            <tiles:insertAttribute name="courseInfo"/>


            <div class="pic_3"></div>
        </div>
    </s:form>
</div>

<div class="stepWrap fl">
    <h3 alt="3"><span class="num">2</span><s:property value="%{getText('title.info.class')}"/></h3>

    <div class="stepCont">
        <div class="pic_1"></div>
        <div class="pic_2 after_store">
            <div class="content_inner fl">
                <ul class="system_ul_list">
                    <li id="self_click_li" class="stand_out"><s:property
                            value="%{getText('label.one.by.one.ctreate')}"/></li>
                    <li id="auto_click_li" class="wait"><s:property value="%{getText('label.auto.scheduing')}"/></li>
                </ul>

                <div class="content_class_list">
                    <p><s:property value="%{getText('label.class.created')}"/>&nbsp;&nbsp;<span id="class_nickname_msg"
                                                                                                class="tip_words"></span>
                    </p>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <th class="htitle"><s:property value="%{getText('lable.course.no')}"/></th>
                            <th class="htitle" width="160px"><s:property
                                    value="%{getText('lable.course.nickname')}"/></th>
                            <th class="htitle"><s:property value="%{getText('lable.course.starttime')}"/></th>
                            <th class="htitle"><s:property value="%{getText('label.lastingtime')}"/></th>
                            <th class="htitle">&nbsp;</th>
                            <th class="htitle">&nbsp;</th>
                        </tr>

                        <tbody class="list_tbody" id="list_tbody">
                        <s:iterator value="course.classes" status="idx">
                            <tr id="classes<s:property value="id"/>">
                                <td id="course_name<s:property value="id"/>"><s:property value="#idx.index+1"/></td>
                                <td id="course_nickName<s:property value="id"/>" class="course_nickName_text">
                                    <s:property value="nickName"/></td>
                                <td id="course_date<s:property value="id"/>"><s:date name="date"
                                                                                     format="%{getText('global.display.hour.minute')}"/></td>
                                <td id="course_duration<s:property value="id"/>"><s:property value="duration"/></td>
                                <td>
                                    <a class="class_btn edit_class_btn" id="course_edit<s:property value="id"/>"
                                       onclick="editSpecifiedClass(<s:property value="id"/>);"><s:property
                                            value="%{getText('course.class.edit')}"/></a>
                                </td>
                                <td>
                                    <a class="class_btn"
                                       onclick="deleteAddedClass('classes<s:property value="id"/>',<s:property
                                               value="id"/>);"><s:property
                                            value="%{getText('course.class.delete')}"/></a>
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
                                <span class="item"><s:property value="%{getText('lable.course.nickname')}"/></span>
                                <s:textfield name="courseClass.nickName" id="class_nickname_input"
                                             cssClass="long_text_field course_nick_name"/>
                            </li>
                            <li class="short_li">
                                <span class="item"><s:property value="%{getText('lable.course.starttime')}"/></span>
                                <s:textfield name="courseClass.date" id="class_start_time_input" value=""
                                             readonly="true"
                                             cssClass="WdateTime short_text_field"
                                             onfocus="WdatePicker({lang:'%{getText('language')}',startDate:'%y-%M-01 00:00:00',dateFmt:'%{getText('dateformat.forclass')}',alwaysUseStartDate:true})"/>
                                <span id="class_start_time_msg" class="tip_words"></span>
                            </li>
                            <li class="short_li">
                                <span class="item"><s:property value="%{getText('label.lastingtime')}"/></span>
                                <select name="durations" class="long_select" id="class_durations_input">
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
                            </li>
                        </ul>
                        <div class="storeWrap">
                            <input type="button" class="store_btn" id="step3_self_store"
                                   value="<s:property value="%{getText('term.info.save')}"/>"/>
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
                                        <td><span class="item"><s:property
                                                value="%{getText('lable.course.starttime')}"/></span><span
                                                class="tip_words" id="form2_start_time_msg"></span></td>
                                        <td><s:property value="%{getText('label.lastingtime')}"/></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr class="urFirst">
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
                                        <td class="add_class_btn class_btn"><s:property
                                                value="%{getText('interview.add')}"/></td>
                                    </tr>
                                </table>
                            </li>
                            <li class="long_li">
                                <span class="item"><s:property value="%{getText('date.fixed.model')}"/></span><span
                                    class="tip_words">*</span>

                                <div id="fixed_model_div">
                                    <input name="classDate" id="classDate1" type="checkbox" value="2"/>
                                    &nbsp;<label for="classDate1"><s:property value="%{getText('monday')}"/></label>&nbsp;&nbsp;
                                    <input name="classDate" id="classDate2" type="checkbox" value="3"/>
                                    &nbsp;<label for="classDate2"><s:property value="%{getText('tuesday')}"/></label>&nbsp;&nbsp;
                                    <input name="classDate" id="classDate3" type="checkbox" value="4"/>
                                    &nbsp;<label for="classDate3"><s:property value="%{getText('wednesday')}"/></label>&nbsp;&nbsp;
                                    <input name="classDate" id="classDate4" type="checkbox" value="5"/>
                                    &nbsp;<label for="classDate4"><s:property value="%{getText('thursday')}"/></label>&nbsp;&nbsp;
                                    <input name="classDate" id="classDate5" type="checkbox" value="6"/>
                                    &nbsp;<label for="classDate5"><s:property value="%{getText('friday')}"/></label>&nbsp;&nbsp;
                                    <input name="classDate" id="classDate6" type="checkbox" value="7"/>
                                    &nbsp;<label for="classDate6"><s:property value="%{getText('saturday')}"/></label>&nbsp;&nbsp;
                                    <input name="classDate" id="classDate7" type="checkbox" value="1"/>
                                    &nbsp;<label for="classDate7"><s:property value="%{getText('sunday')}"/></label>
                                </div>
                            </li>
                            <li class="long_li">
                                <s:property value="%{getText('course.creation.repeat')}"/>
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
                                <s:property value="%{getText('coruse.creation.week')}"/>
                            </li>
                        </ul>
                        <div class="storeWrap">
                            <input type="button" class="store_btn" id="step3_auto_store"
                                   value="<s:property value="%{getText('term.info.save')}"/>"/>
                        </div>
                    </s:form>
                </div>
            </div>
        </div>
        <div class="pic_3"></div>
    </div>
</div>

<div class="content_clause">
    <input name="checkbox" type="checkbox" checked value="" id="clauseCheckbox"/>
    <label for="clauseCheckbox"><s:property value="%{getText('course.creation.document.accept')}"/></label>
    <a href="createCourseClause.html" id="course_creation_clause"><s:property
            value="%{getText('course.creation.document.rule')}"/></a><br/>
    <span id="checkboxMsg" class="tip_words"></span>
</div>

<div class="create_confirm">
    <input type="button" id="submit_btn_large" class="submit_btn_large" onclick="publishCourse();"
           value="<s:property value="%{getText('course.management.store')}"/>"/>
</div>

</div>

<%@ include file="/jsp/gogowise/course/courseCreate/stepAll4Maintenance_js.jsp" %>