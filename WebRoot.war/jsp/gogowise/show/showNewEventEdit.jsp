<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/newsEdit_js.jsp" %>
<script src="js/jqueryTabs.js" type="text/javascript"></script>
<link href="css/org/orgInfoUpdate.css" rel="stylesheet" type="text/css"/>
<link href="css/show/showCreate.css" rel="stylesheet" type="text/css"/>
<div class="course_create_container">
    <p class="create_content_title">
        请编辑个人秀新鲜事
    </p>
    <s:form action="editShowNewEvent" method="POST" enctype="multipart/form-data">
        <s:hidden name="showNewEvent.id"/>
        <div class="create_content">
            <ul class="content_courseInfo">
                <li>
                    <div class="option_tittle">名称</div>
                    <div class="show_name_input_msg input_msg"></div>
                    <div class="option_content"><s:textfield cssClass="long_text_field" id="show_showName"
                                                             name="showNewEvent.title"/>
                    </div>
                </li>
                <li>
                    <div class="option_tittle">主要内容</div>
                    <div class="show_desp_input_msg input_msg"></div>
                    <div class="option_content">
                        <s:textarea cssClass="long_text_area" id="show_showDesp" name="showNewEvent.content"/>
                    </div>
                </li>
                <li>
                    <div class="option_tittle">请上传新鲜事图片</div>
                    <div class="show_logo_input_msg input_msg"></div>
                    <div class="option_content">
                        <img src="images/nopic.jpg" id="show_log_preview"/><br/>
                        <input type="file" name="upload" id="show_showLogo_upload"/>
                    </div>
                    <s:hidden id="show_showLogo" cssClass="long_text_field" name="showNewEvent.logoUrl"/>
                </li>
            </ul>
        </div>
        <div class="create_back_forth">
            <s:submit cssClass="submit_btn" onclick="return checkShowInfoForm();" value='确认发布'/>
        </div>
    </s:form>
</div>

<script type="text/javascript">
    <s:if test="showNewEvent.id != null && showNewEvent.logoUrl != null">
    $("#show_log_preview").attr('src', '<s:property value="showNewEvent.logoUrl"/>');
    </s:if>
</script>
