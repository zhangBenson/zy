<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/show/showCreation_js.jsp" %>
<script src="js/jqueryTabs.js" type="text/javascript"></script>
<link href="css/org/orgInfoUpdate.css" rel="stylesheet" type="text/css"/>
<link href="css/show/showCreate.css" rel="stylesheet" type="text/css"/>
<div class="course_create_container">
    <p class="create_content_title">
        <s:property value="%{getText('show.creation')}"/>
    </p>
    <s:form action="saveShow" method="POST" validate="true" theme="css_xhtml" enctype="multipart/form-data">
        <div class="create_content">
            <ul class="content_courseInfo">
                <li>
                    <div class="option_tittle"><s:property value="%{getText('show.name')}"/></div>
                    <div class="show_name_input_msg input_msg"></div>
                    <div class="option_content"><s:textfield cssClass="long_text_field" id="show_showName"
                                                             name="myShow.name"/>
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
                        <div class="option_content">
                            <s:select
                                    list="#{1:getText('myShow.label.type.1'),2:getText('myShow.label.type.2'),3:getText('myShow.label.type.3'),4:getText('myShow.label.type.4')}"
                                    cssClass="short_text_field" listKey="key"
                                    listValue="value" headerKey="唱歌" name="myShow.type"/>
                        </div>
                    </div>
                </li>
                <li class="long_select_li">
                    <div class="option_tittle"><s:property value="%{getText('show.start.date')}"/></div>
                    <div class="show_date_input_msg input_msg"></div>
                    <div class="option_content"><s:textfield id="show_showDate" name="myShow.showDate" readonly="true"
                                                             value="" cssClass="Wdatepicker short_text_field"/></div>
                </li>
                <li class="long_select_li">
                    <div class="option_tittle"><s:property value="%{getText('show.start.time')}"/></div>
                    <div class="show_startTime_input_msg input_msg"></div>
                    <div class="option_content"><s:textfield id="show_startTime" name="myShow.showFixedTime"
                                                             readonly="true" value=""
                                                             cssClass="WTime short_text_field"/></div>
                </li>
                <li class="long_select_li">
                    <div class="option_tittle"><s:property value="%{getText('show.duration.time')}"/></div>
                    <div class="input_msg"></div>
                    <div class="option_content">
                            <%--<s:select list="#{60:'60分钟'+,--%>
                            <%--55:'55分钟',--%>
                            <%--50:'50分钟',--%>
                            <%--45:'45分钟',--%>
                            <%--40:'40分钟',--%>
                            <%--35:'35分钟',--%>
                            <%--30:'30分钟'}"--%>
                            <%--cssClass="short_text_field" listKey="key" listValue="value" headerKey="60<s:property value='%{getText('label.minute')}'/>" name="myShow.duration"/>--%>
                        <select name="myShow.duration" class="short_text_field">
                            <option value=60 selected="selected">60<s:property
                                    value="%{getText('label.minute')}"/></option>
                            <option value=55>55<s:property value="%{getText('label.minute')}"/></option>
                            <option value=50>50<s:property value="%{getText('label.minute')}"/></option>
                            <option value=45>45<s:property value="%{getText('label.minute')}"/></option>
                            <option value=40>40<s:property value="%{getText('label.minute')}"/></option>
                            <option value=35>35<s:property value="%{getText('label.minute')}"/></option>
                            <option value=30>30<s:property value="%{getText('label.minute')}"/></option>
                        </select>
                    </div>
                </li>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('date.fixed.model')}"/></div>
                    <div class="show_fixedModel_input_msg input_msg"></div>
                    <div class="option_content" id="fixed_model_div">
                        <input name="showWeekDays" type="checkbox" value="2"/>
                        <s:property value="%{getText('monday')}"/>&nbsp;
                        <input name="showWeekDays" type="checkbox" value="3"/>
                        <s:property value="%{getText('tuesday')}"/>&nbsp;
                        <input name="showWeekDays" type="checkbox" value="4"/>
                        <s:property value="%{getText('wednesday')}"/>&nbsp;
                        <input name="showWeekDays" type="checkbox" value="5"/>
                        <s:property value="%{getText('thursday')}"/>&nbsp;
                        <input name="showWeekDays" type="checkbox" value="6"/>
                        <s:property value="%{getText('friday')}"/>&nbsp;
                        <input name="showWeekDays" type="checkbox" value="7"/>
                        <s:property value="%{getText('saturday')}"/>&nbsp;
                        <input name="showWeekDays" type="checkbox" value="1"/>
                        <s:property value="%{getText('sunday')}"/></div>
                </li>
                <li>
                    <div class="option_tittle"><s:property value="%{getText('my.show.logo')}"/></div>
                    <div class="show_logo_input_msg input_msg"></div>
                    <div class="option_content">
                        <img src="images/nopic.jpg" id="show_log_preview"
                             onerror="javascript:this.src='images/nopic.jpg'"/><br/>
                        <input type="file" name="upload" id="show_showLogo_upload"/>
                    </div>
                    <s:hidden id="show_showLogo" cssClass="long_text_field" name="myShow.logoUrl"/>
                </li>
            </ul>
        </div>
        <div class="create_back_forth">
            <s:submit cssClass="submit_btn" onclick="return checkShowInfoForm();" value='确认发布'/>
        </div>
    </s:form>
</div>
