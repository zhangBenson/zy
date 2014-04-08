<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
    .tips1all {
        width: 770px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 12px;
        color: #333;
        margin: 0px auto;
    }

    .tips1 {
        width: 770px;
        font-size: 14px;
        color: #333;
    }

    .tips1 h2 {
        color: #FFF;
        text-align: center;
        background: #39F;
        padding: 3px 0;
        margin: 0px;
    }

    .tips1 p {
        text-indent: 2em;
        margin: 5px;
    }

    .tips1 .bottom {
        margin-top: 10px;
        height: 40px;
        margin: 30px 10px 5px;
        text-align: right;
    }

    .tips1 .content {
        margin: 4px 6px;
        line-height: 170%;
    }

    .tips1 .button1 {
        background: url(images/next.gif) no-repeat;
        height: 30px;
        width: 65px;
        border: 0px;
        cursor: pointer;
    }

    .tips1 .content ul li {
        list-style: square;
        color: #CA4200;
        font-size: 12px;
        margin: 2px;
    }
</style>
<div class="tips1all">
    <img src="images/top.png" width="770" height="10"/>

    <div class="tips1">
        <h2>温馨提示</h2>

        <div class="content">
            <strong>尊敬的用户：</strong>

            <p><strong>您好！</strong></p>

            <p>您的推荐已在处理中，如果您推荐的负责人<s:property value="organization.responsiblePerson.userName"/> 正是成为<s:property
                    value="organization.schoolName"/>学校在知元网上的<s:property value="organization.schoolName"/>组织负责人，我们将会给您发送一份正式的协议。</p>

            <p>谢谢您的推荐！ </p>

            <p>&nbsp;</p>

            <div class="bottom">
                <input type="submit" name="button" id="button1" value="" class="button1" onclick="index();"/>
            </div>
        </div>
    </div>
    <img src="images/bottom.png" width="770" height="10"/>
</div>
<script type="text/javascript">
    function index() {
        window.location.href = "index.html";
    }
</script>