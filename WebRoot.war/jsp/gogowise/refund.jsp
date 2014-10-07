<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<style type="text/css">
    body, div, ul, li, h1, h2, h3, h4, h5, h6, table {
        margin: 0px;
        padding: 0px;
        font-family: Verdana, Geneva, sans-serif;
        color: #666;
        font-size: 12px;
    }

    ul, li {
        list-style: none;
    }

    #courseconfirm {
        width: 800px;
    }

    #courseconfirm div {
        float: left;
    }

    #courseconfirm a {
        color: #cc6600;
        text-decoration: underline;
    }

    #courseconfirm a:hover {
        color: #F90;
    }

    #blogindex {
        width: 1000px;
        margin: 0px auto;
        position: relative;
        float: none;
        font-size: 14px;
        text-align: left;
    }

    .blogframe {
        width: 800px;
        background: url(images/courseconfirm/courseframecenter.gif) center repeat-y;
        position: relative;
        padding-bottom: 15px;
    }

    .blogframe #video {
        height: 100px;
        width: 100px;
        padding: 2px;
        margin: 0 5px 10px 15px;
        border: 1px solid #CCC;
    }

    .courseinfo {
        width: 170px;
        margin: 8px 0 0 5px;
    }

    .courseinfo p {
        margin: 0;
        line-height: 24px;
    }

    b {
        color: #cc6600;
    }

    h6 {
        color: #006699;
        font-size: 18px;
        padding-bottom: 2px;
        float: left;
        width: 600px;
        position: relative;
    }

    img.frame1bottom {
        position: absolute;
        left: 0;
        bottom: 0;
    }

    .btn1 {
        height: 40px;
        width: 136px;
        cursor: pointer;
        margin: 5px 30px 0px 15px;
        font-size: 16px;
    }

    .reservationconfirmed {
        background: url(images/courseconfirm/reservationconfirmed.gif) no-repeat;
    }

    .cancel {
        border: none;
        background: transparent;
        text-decoration: underline;
        color: #cc6600;
        font-size: 16px;
        border: none;
    }

    .evaluate {
        background: url(images/courseconfirm/blogevaluate.gif) no-repeat;
    }

    .courseintro {
        width: 95%;
        margin-left: 15px;
    }

    #reservationbtn {
        background: url(images/courseconfirm/coursereservation.gif) no-repeat;
        width: 136px;
        height: 40px;
        border: 0;
        cursor: pointer;
        border: none;
    }

    .tipsinfo {
        width: 730px;
        float: left;
        font-size: 16px;
        color: #333;
        margin: 10px 0px 5px 15px;
    }

    .highlight {
        background: url(images/courseconfirm/highlight.gif) left bottom no-repeat;
        height: 35px;
        padding-left: 39px;
        line-height: 35px;
    }

    .succeed {
        line-height: 35px;
        color: #cc6600;
        text-align: center;
        background: #FFE7CE;
    }

    .succeed img {
        vertical-align: middle;
        display: inline-block;
    }

    #courseinfoshow {
        border: dotted 1px #999;
        width: 770px;
        margin-left: 15px;
        padding: 4px 0 10px 0;
        display: inline;
    }

    .topbtn {
        width: 740px;
        float: left;
        text-align: center;
        margin-top: 5px;
    }

    .p1 {
        float: left;
        font-size: 16px;
        display: inline;
        width: 600px;
        line-height: 25px;
        margin: 5px 0px 5px 45px;
    }

    #panelinfo {
        width: 760px;
        float: left;
        margin: 10px 0px 5px 15px;
        font-size: 16px;
        display: none;
    }

    #redirectto {
        text-align: center;
        width: 740px;
        margin: 10px 0px 5px 15px;
        font-size: 14px;
    }

    .vl {
        display: table-cell;
        vertical-align: top;
        padding-left: 30px;
    }

    label.bl {
        display: block;
        color: #666;
    }
</style>
<div align="center">
    <div id="courseconfirm">
        <div class="blogframe">
            <img src="images/courseconfirm/courseframetop.gif"/>

            <div class="tipsinfo">
                <h6>您要退订的课程：<s:property value="course.name"/> </br><b style="color:red;" id="msg"></b></h6>
            </div>
            <div id="courseinfoshow">
                <div id="video"><a href="#"><img src="images/courseconfirm/QA.gif" height="100" width="100" border="0"/></a>
                </div>
                <h6><s:property value="course.name"/></h6>

                <div class="courseinfo">
                    <p>授课老师：<b><a href="#"><s:property value="course.teacher.userName"/></a></b></p>

                    <p>组织机构名称：<b><a href="#"><s:property value="course.organization.schoolName"/></a></b></p>

                    <p>制作人：<b><a href="#"><s:property value="course.cameraMan.userName"/></a></b></p>
                </div>
                <div class="courseinfo">
                    <p>课程预订价格：<b><s:if test="%{course.personalTeacher == null}"><s:property
                            value="%{4 * course.classes.size}"/>
                        <s:if test="course.consumptionType">知币 </s:if><s:else>知券</s:else></s:if><s:else><s:property
                            value="course.charges"/><s:if
                            test="course.consumptionType">知币 </s:if><s:else>知券</s:else></s:else></b></p>

                    <p>总课时：<b><s:property value="course.totalHours"/>&nbsp;学时</b></p>

                    <p>开课日期：<b><s:property value="course.startDate"/></b></p>
                </div>
                <div class="courseinfo">
                    <p>课程注册人数：<b><s:property value="course.observationNum"/></b>人</p>

                    <p>课程订阅人数：<b><s:property value="course.buyAgesNum"/></b>人</p>
                </div>
                <div class="courseintro"><strong>课程简介：</strong><s:property value="course.description"/></div>

                <p class="p1">您的知币余额：<b><s:property value="userAccountInfo.zhiBi"/></b></p>

                <p class="p1">您的知券余额：<b><s:property value="userAccountInfo.zhiQuan"/></b></p>

                <div class="tipsinfo vl">
                    <label for="textarea" class="bl">退款原因：</label>
                    <textarea name="textarea" id="textarea" cols="50" rows="3"></textarea>
                </div>
                <div class="topbtn">
                    <input name="refund" type="button" class="btn1" id="refund" value="我要退款"/>
                    <input type="button" class="btn1" value="取消" onclick="goUrl();"/>
                </div>
                <div id="panelinfo">
                    <div class="tipsinfo succeed"><img src="images/courseconfirm/succeed.gif" width="28"
                                                       height="28"/><strong>&nbsp;退订成功</strong></div>
                    <p class="p1">您现在账户信息为： </p>

                    <p class="p1">知币:<b id="zhibi"></b></p>

                    <p class="p1">知券：<b id="zhiquan"></b></p>

                    <p class="p1">如果有什么疑问，请联系我们的客服，谢谢！ </p>

                    <div id="redirectto"><strong id="time">10</strong>秒钟之后网页将自动跳转至<a href="####"><b>我的课堂</b></a>页面</div>
                </div>
                <img src="images/courseconfirm/courseframebottom.gif" class="frame1bottom"/>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var time = 10;
    function descTime() {
        time = time - 1;
        if (time < 0) {
            time = 0;
        }
        $("#time").text(time);
    }

    function goUrl() {
        window.location.href = "forcastClass.html";
    }
    $(function () {
        $("#refund").click(function () {
                    var comments = $("#textarea").attr('value');
                    var url = "courseRefund.html";
                    $.post(url, {'course.id': "<s:property value="course.id"/>", 'comments': comments}, function (data) {
                        $("#msg").text(data.message);
                        if (data.state) {
                            $("#zhibi").text(data.zhiBi);
                            $("#zhiquan").text(data.zhiQuan);
                            $("#panelinfo").css({"display": "block"});
                            setTimeout(goUrl, 10000)//500是0.5秒 \
                            setInterval('descTime()', 1000);
                        }
                    });
                }
        )
    })
</script>
