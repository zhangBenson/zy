<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/user/user_center.css" rel="stylesheet"/>


<style>
    .usItem_cont .handle a.a_j {
        float: right;
        clear: both;
        width: 100px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        color: #fff;
        /*background: #f5d173;*/
        background: cornflowerBlue;
        margin-top: 10px;
        /*color: #333;*/
    }
</style>

<div class="mfp">

    <div class="mfp_left fl">
        <div>
            <%--<a class="submit_btn_large" href="openUserChannelResult.html"><s:property value="%{getText('contentLeft.param1')}"/></a>--%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="submit_btn_large" href="initCreateMeeting.html">创建会议</a>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <a class="submit_btn_large" href="createCourseAllInOne.html">会议列表</a>
        </div>

    </div>


</div>
