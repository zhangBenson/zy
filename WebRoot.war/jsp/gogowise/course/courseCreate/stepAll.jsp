<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<link href="css/course/stepAll.css" rel="stylesheet" type="text/css"/>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="">
            <a href="myForcastClass.html"><s:property value="%{getText('usermenu.item.my.created.courses')}"/></a>
        </li>
        <li class="">
            <a href="myRegistration.html"><s:property value="%{getText('usermenu.item.my.reged.courses')}"/></a>
        </li>
        <li class="stand_out">
            <a href="javascript:;"><s:property value="%{getText('usermenu.item.createcourse')}"/></a>
        </li>
    </ul>
</div>
<div class="create_cont fl">
    <div class="stepTip fl">
        <s:property value="%{getText('msg.intr')}"/>
    </div>

    <s:hidden name="course.id" id="course_id"/>
    <div class="stepWrap fl">

            <h3 alt="1"><span class="num">1</span><s:property value="%{getText('title.select.type')}"/></h3>
            <div class="stepCont step1Cont">
                <div class="pic_1"></div>
                <div class="pic_2">
                    <ul class="content_style">
                        <li>
                            <input name="course.identity" type="radio" checked="true" value="1" id="type1" />
                            <label for="type1"><s:property value="%{getText('label.select.121')}"/></label>
                        </li>
                        <%--<li>
                            <input name="course.identity" type="radio" value="2" id="type2" />
                            <label for="type2"><s:property value="%{getText('label.select.122')}"/></label>
                        </li>
                        <li>
                            <input name="course.identity" type="radio" value="3" id="type3" />
                            <label for="type3"><s:property value="%{getText('label.select.123')}"/>  </label>
                        </li>--%>
                        <li>
                            <input name="course.identity" type="radio" value="4" id="type4" />
                            <label for="type4"><s:property value="%{getText('label.select.12many')}"/> </label>
                        </li>
                    </ul>
                    <%--<div class="repeat_course">
                            <a href="myAgeCourses.html"><s:property value="%{getText('label.select.repeat')}"/>?</a>
                    </div>--%>
                    <div class="storeWrap">
                        <input type="button" class="store_btn" id="step1_store" value="<s:property value="%{getText('button.save')}"/>" />
                        <span class="tip_words" id="step1_store_msg"></span>
                    </div>
                </div>
                <div class="pic_2 after_store" id="step1_store_cont">
                    <span class="store_course_type"><s:property value="%{getText('label.select.121')}"/></span> <br/>
                    <input type="button" class="store_btn" id="step1_modify" value="<s:property value="%{getText('onlive.message.update')}"/>" onclick="modifyStepMsg(this,1);"/>
                </div>
                <div class="pic_3"></div>
            </div>
    </div>

    <div class="stepWrap fl">
        <s:form id="course_main_info_form">
            <s:hidden name="course.id" id="course_id"/>
            <s:hidden name="courseType"/>
            <s:hidden name="course.teachingNum" id="course_identity"/>
            <h3 alt="2"><span class="num">2</span><s:property value="%{getText('titie.info.course')}"/></h3>
            <div class="stepCont">
                <div class="pic_1"></div>
                <div class="pic_2">
                    <ul class="content_courseInfo fl">
                        <li>
                            <span class="item"><s:property value="%{getText('course.info.courseName')}"/></span>
                            <s:textfield cssClass="long_text_field" id="step2_course_name" name="course.name" type="text" />
                            <span class="course_name_input_msg tip_words">*</span>
                        </li>
                        <li>
                            <span class="item"><s:property value="%{getText('course.info.description')}"/></span>
                            <span class="course_intro_input_msg tip_words">*</span>  <br/>
                            <s:textarea cssClass="long_text_area" id="step2_course_intro" name="course.description"/>
                        </li>
                        <li>
                            <span class="item"><s:property value="%{getText('course.info.of.student.type')}"/> </span>
                            <s:textarea cssClass="long_text_area" id="step2_course_student_type" name="course.studentType" type="text" />
                            <span class="course_student_type_input_msg tip_words"></span>
                         </li>
                        <%--<li>
                            <span class="item"><s:property value="%{getText('course.info.of.teaching.book')}"/></span>
                            <s:textfield cssClass="long_text_field" id="step2_course_teaching_book" name="course.courseTeachingBook" type="text" />
                            <span class="course_teaching_book_input_msg tip_words"></span>
                         </li>--%>
                        <li>
                            <span class="item"><s:property value="%{getText('course.info.of.course.type')}"/></span>
                            <s:select list="#{'1':getText('course.type.1'),'2':getText('course.type.2'),'3':getText('course.type.3'),'4':getText('course.type.4'),'5':getText('course.type.5'),'6':getText('course.type.6')}" headerKey="-1" headerValue="%{getText('please.choose.course.type')}" cssClass="long_text_field" id="step2_course_type" name="course.courseType"/>
                            <span class="course_type_input_msg tip_words">*</span>
                         </li>
                        <li class="long_select_li">
                            <span class="item"><s:property value="%{getText('label.online.class.startdate')}"/></span>
                            <s:textfield id="courseStartDate" name="course.startDate" readonly="true" cssClass="Wdatepicker short_text_field"/>
                            <span class="course_date_input_msg tip_words">*</span>
                        </li>
                        <li class="long_select_li">
                            <span class="item"><s:property value="%{getText('label.online.class.tutor.price')}"/></span>
                            <s:hidden name="course.consumptionType"  value="true"/>
                            <s:textfield cssClass="short_text_field" id="course_charges" name="course.charges" value="0" type="text" readonly="false"/>&nbsp;<s:property value="%{getText('label.zhibi.true')}"/>
                            <span class="course_charges_msg tip_words">*</span>
                        </li>
                        <li>
                            <span class="item"><s:property value="%{getText('label.online.class.logo')}"/></span><span class="tip_words" id="course_logo_input_msg">*</span><br/>
                            <img src="images/defaultImgs/course.gif" id="show_log_preview"/>
                            <s:hidden id="course_logo" cssClass="long_text_field" name="course.logoUrl" />
                            <input type="button" class="submit_btn" id="change_portrait" value="<s:property value="%{getText('onlive.message.update')}"/>" href="courseLogoProcess.html"/>
                        </li>
                        <s:if test="courseType == 1 || courseType == 2">
                           <li>
                            <span class="item"><s:property value="%{getText('label.forcast.lecturer')}"/></span>
                               <s:checkboxlist list="teachers" listKey="id" listValue="nickName==null?email:nickName" name="teacherIds"/>
                            <span class="invite_teacher_input_msg tip_words">*</span>
                           </li>
                        </s:if>
                        <li>
                            <s:property value="%{getText('course.student.appointed')}"/>
                            <a class="add_student_btn"><s:property value="%{getText('course.add.student')}"/></a> &nbsp;&nbsp;&nbsp;
                            <span class="invite_student_input_msg tip_words"></span>
                            <div class="option_content" id="invitedStudents">
                                <input class="long_text_field_for_student"  placeholder="<s:property value="%{getText('org.course.student.email')}"/>" id="studentEmail1" onblur="checkStudentMail(this);" name="emails" type="text" /> <br/>
                            </div>
                        </li>
                    </ul>
                    <div class="storeWrap">
                        <input type="button" class="store_btn" id="step2_store" value="<s:property value="%{getText('button.save')}"/>"/>
                        <span class="tip_words" id="step2_store_msg" ></span>
                    </div>
                </div>
                <div class="pic_2 after_store" id="step2_store_cont">
                    <ul>
                        <li><s:property value="%{getText('course.info.courseName')}"/>：<span class="orange_words" id="store_name"></span></li>
                        <li><s:property value="%{getText('course.info.description')}"/>：<span class="orange_words" id="store_description"></span></li>
                        <li><s:property value="%{getText('course.info.of.student.type')}"/>：<span class="orange_words" id="store_studentType"></span></li>
                        <li><s:property value="%{getText('course.info.of.teaching.book')}"/>：<span class="orange_words" id="store_courseTeachingBook"></span></li>
                        <li><s:property value="%{getText('course.info.of.course.type')}"/>：<span class="orange_words" id="store_courseType"></span></li>
                        <li><s:property value="%{getText('label.online.class.startdate')}"/>：<span class="orange_words" id="store_startDate"></span></li>
                        <li><s:property value="%{getText('label.online.class.tutor.price')}"/>：<span class="orange_words" id="store_charges"></span></li>
                        <li><s:property value="%{getText('label.forcast.lecturer')}"/>：<span class="orange_words" id="store_teacherEmail"></span></li>
                        <li><s:property value="%{getText('course.student.appointed')}"/>：<span class="orange_words" id="store_emails"></span></li>
                    </ul>
                    <div class="obv_logo"><s:property value="%{getText('label.online.class.logo')}"/><br/><img  id="obv_course_logo"/></div>

                    <input type="button" class="store_btn" id="step2_modify" value="<s:property value="%{getText('onlive.message.update')}"/>" onclick="modifyStepMsg(this,2);"/>
                </div>
                <div class="pic_3"></div>
            </div>
        </s:form>
    </div>

    <div class="stepWrap fl">
        <h3 alt="3"><span class="num">3</span><s:property value="%{getText('title.info.class')}"/></h3>
        <div class="stepCont">
            <div class="pic_1"></div>
            <div class="pic_2">
                <div class="content_inner fl">
                      <ul class="system_ul_list">
                        <li id="self_click_li" class="stand_out"><s:property value="%{getText('label.one.by.one.ctreate')}"/></li>
                        <li id="auto_click_li" class="wait"><s:property value="%{getText('label.auto.scheduing')}"/></li>
                      </ul>

                      <div class="content_class_list">
                            <p><s:property value="%{getText('label.class.created')}"/>&nbsp;&nbsp;<span id="class_nickname_msg" class="tip_words"></span></p>
                            <table cellpadding="0" cellspacing="0">
                              <tr>
                                <th class="htitle"><s:property value="%{getText('lable.course.no')}"/></th>
                                <th class="htitle" width="160px"><s:property value="%{getText('lable.course.nickname')}"/></th>
                                <th class="htitle"><s:property value="%{getText('lable.course.starttime')}"/></th>
                                <th class="htitle"><s:property value="%{getText('label.lastingtime')}"/></th>
                                <th class="htitle">&nbsp;</th>
                                <th class="htitle">&nbsp;</th>
                              </tr>
                              <tbody class="list_tbody" id="list_tbody">

                              </tbody>
                            </table>
                      </div>

                      <div class="self_system_wrap">
                          <s:form id="self_class_system_form">
                                  <s:hidden name="course.id" id="self_class_courseID"/>
                                  <ul class="self_system_ul" id="self_show_ul">
                                    <li>
                                        <span class="item"><s:property value="%{getText('lable.course.nickname')}"/></span>
                                        <s:textfield name="courseClass.nickName" id="class_nickname_input" cssClass="long_text_field course_nick_name" />
                                    </li>
                                    <li class="short_li">
                                        <span class="item"><s:property value="%{getText('lable.course.starttime')}"/></span>
                                        <s:textfield name="courseClass.date" id="class_start_time_input" value="" readonly="true"
                                             cssClass="WdateTime short_text_field"
                                             onfocus="WdatePicker({lang:'%{getText('language')}',startDate:'%y-%M-01 00:00:00',dateFmt:'%{getText('dateformat.forclass')}',alwaysUseStartDate:true})"/>
                                        <span id="class_start_time_msg" class="tip_words"></span>
                                    </li>
                                    <li class="short_li">
                                        <span class="item"><s:property value="%{getText('label.lastingtime')}"/></span>
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
                                    </li>
                                  </ul>
                                  <div class="storeWrap">
                                    <input type="button" class="store_btn" id="step3_self_store" value="<s:property value="%{getText('button.save')}"/>"/>
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
                                        <tr><td><span class="item"><s:property value="%{getText('lable.course.starttime')}"/></span><span class="tip_words" id="form2_start_time_msg"></span></td><td><s:property value="%{getText('label.lastingtime')}"/></td><td>&nbsp;</td></tr>
                                        <tr class="urFirst">
                                            <td class="time_td"><s:textfield name="startTimes" onblur="checkTimeError(this);" value="" readonly="true" cssClass="WTime short_text_field"/></td>
                                            <td><select name="durations" class="long_select">
                                                    <option value=60 selected="selected">60<s:property value="%{getText('label.minute')}"/></option>
                                                    <option value=55>55<s:property value="%{getText('label.minute')}"/></option>
                                                    <option value=50>50<s:property value="%{getText('label.minute')}"/></option>
                                                    <option value=45>45<s:property value="%{getText('label.minute')}"/></option>
                                                    <option value=40>40<s:property value="%{getText('label.minute')}"/></option>
                                                    <option value=35>35<s:property value="%{getText('label.minute')}"/></option>
                                                    <option value=30>30<s:property value="%{getText('label.minute')}"/></option>
                                            </select></td>
                                            <td class="add_class_btn class_btn"><s:property value="%{getText('interview.add')}"/></td>
                                        </tr>
                                    </table>
                                </li>
                                <li class="long_li">
                                  <span class="item"><s:property value="%{getText('date.fixed.model')}"/></span><span class="tip_words">*</span>
                                    <div id="fixed_model_div">
                                        <input name="classDate" id="classDate1" type="checkbox" value="2" />
                                        &nbsp;<label for="classDate1"><s:property value="%{getText('monday')}"/></label>&nbsp;&nbsp;
                                        <input name="classDate" id="classDate2" type="checkbox" value="3" />
                                        &nbsp;<label for="classDate2"><s:property value="%{getText('tuesday')}"/></label>&nbsp;&nbsp;
                                        <input name="classDate" id="classDate3" type="checkbox" value="4" />
                                        &nbsp;<label for="classDate3"><s:property value="%{getText('wednesday')}"/></label>&nbsp;&nbsp;
                                        <input name="classDate" id="classDate4" type="checkbox" value="5" />
                                        &nbsp;<label for="classDate4"><s:property value="%{getText('thursday')}"/></label>&nbsp;&nbsp;
                                        <input name="classDate" id="classDate5" type="checkbox" value="6" />
                                        &nbsp;<label for="classDate5"><s:property value="%{getText('friday')}"/></label>&nbsp;&nbsp;
                                        <input name="classDate" id="classDate6" type="checkbox" value="7" />
                                        &nbsp;<label for="classDate6"><s:property value="%{getText('saturday')}"/></label>&nbsp;&nbsp;
                                        <input name="classDate" id="classDate7" type="checkbox" value="1" />
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
                                  <input type="button" class="store_btn" id="step3_auto_store" value="<s:property value="%{getText('button.save')}"/>"/>
                              </div>
                          </s:form>
                      </div>
                </div>
            </div>
            <div class="pic_3"></div>
        </div>
    </div>

    <div class="content_clause">
        <input name="checkbox" type="checkbox" id="clauseCheckbox" />
        <label for="clauseCheckbox"><s:property value="%{getText('course.creation.document.accept')}"/></label>
        <a href="createCourseClause.html" id="course_creation_clause"><s:property value="%{getText('course.creation.document.rule')}"/></a><br/>
        <span id="checkboxMsg" class="tip_words"></span>
    </div>

    <div class="create_confirm">
        <input type="button" id="submit_btn_large" class="submit_btn_large" onclick="publishCourse();" value="<s:property value="%{getText('org.course.creation')}"/>"/>
    </div>

</div>

<%@ include file="/jsp/gogowise/course/courseCreate/stepAll_js.jsp" %>