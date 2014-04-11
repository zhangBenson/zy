<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/higSec/ggwAnnounceCreation_js.jsp" %>
<script src="js/jqueryTabs.js" type="text/javascript"></script>
<link href="css/org/orgInfoUpdate.css" rel="stylesheet" type="text/css"/>
<link href="css/show/showCreate.css" rel="stylesheet" type="text/css"/>
<div class="course_create_container">
    <p class="create_content_title">
        知元用户反馈中心
    </p>
    <span>您可以在这里输入在系统使用中遇到的问题，以及您对本网站的一些建议。</span>
    <s:form action="addGGWAnnounce" method="POST" enctype="multipart/form-data">
        <s:hidden name="goGoWiseAnnounce.id"/>
        <div class="create_content">
            <ul class="content_courseInfo">
                <li>
                    <div class="option_tittle">您的Email</div>
                    <div class="show_name_input_msg input_msg"></div>
                    <div class="option_content"><s:textfield cssClass="long_text_field" id="show_showName"
                                                             name="goGoWiseAnnounce.title"/>
                    </div>
                </li>
                <li>
                    <div class="option_tittle">您的手机</div>
                    <div class="show_name_input_msg input_msg"></div>
                    <div class="option_content"><s:textfield cssClass="long_text_field" id="show_showName"
                                                             name="goGoWiseAnnounce.title"/>
                    </div>
                </li>
                <li>
                    <div class="option_tittle">内容</div>
                    <div class="show_desp_input_msg input_msg"></div>
                    <div class="option_content">
                        <s:textarea cssClass="long_text_area" id="show_showDesp" name="goGoWiseAnnounce.content"/>
                    </div>
                </li>
                <li>
                    <div class="option_tittle">上传截图</div>
                    <div class="show_logo_input_msg input_msg"></div>
                    <div class="option_content">
                        <img src="images/nopic.jpg" id="show_log_preview"/><br/>
                        <input type="file" name="upload" id="show_showLogo_upload"/>
                    </div>
                    <s:hidden id="show_showLogo" cssClass="long_text_field" name="goGoWiseAnnounce.logoUrl"/>
                </li>
            </ul>
        </div>
        <div class="create_back_forth">
            <s:submit cssClass="submit_btn" onclick="return checkShowInfoForm();" value='确认发布'/>
        </div>
    </s:form>
</div>

<script type="text/javascript">
    <s:if test="goGoWiseAnnounce.id != null">
    $("#show_log_preview").attr('src', '<s:property value="goGoWiseAnnounce.logoUrl"/>');
    </s:if>
</script>
