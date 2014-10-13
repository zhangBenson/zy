<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<style type="text/css">
body, div, ul, li, h1, h2, h3, h4, h5, h6, table {
    margin: 0px;
    padding: 0px;
    font-family: Verdana, Geneva, sans-serif;
    color: #666;
    font-size: 12px;
    margin-left: auto;
    margin-right: auto;
}

ul, li {
    list-style: none;
}

#courseconfirm {
    width: 800px;
    margin-top: 10px;
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
    float: left;
    width: 140px;
    padding: 2px;
    margin: 0 10px 20px 15px;
}

.blogframe #video img {
    float: left;
    height: 90px;
    width: 120px;
    padding: 2px;
    border: 1px solid #CCC;
    cursor: pointer;
}

.blogframe #video a {
    float: left;
    width: 130px;
    margin-top: 5px;
}

.courseinfo {
    width: 180px;
    text-align: left;
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
    margin-right: 70%;
    margin-top: 15px;
    margin-bottom: 5px;
}

img.frame1bottom {
    position: absolute;
    left: 0;
    bottom: 0;
}

/*.btn1{border:none; height:40px; width:136px; cursor:pointer; margin:5px 30px 0px 15px;}*/
.reservationconfirmed {
    border: none;
    height: 40px;
    width: 136px;
    cursor: pointer;
    margin: 5px 30px 0px 15px;
    background: url(images/courseconfirm/reservationconfirmed.gif) no-repeat;
}

.cancel {
    border: none;
    cursor: pointer;
    margin-top: 20px;
    background: transparent;
    text-decoration: underline;
    color: #cc6600;
    font-size: 16px;
}

.evaluate {
    background: url(images/courseconfirm/blogevaluate.gif) no-repeat;
}

.courseintro {
    float: left;
    width: 60%;
    margin-top: 10px;
    line-height: 18px;
    text-align: left;
}

.info_class {
    float: left;
    margin-top: 10px;
    margin-left: 40px;
    width: 100%;
}

.info_class h3 {
    float: left;
    margin-left: 280px;
    color: #cc6600;
}

.info_class .htitle {
    color: #000;
}

.info_class table {
    float: left;
    width: 660px;
    margin-top: 5px;
    color: rgb(229, 73, 13);
    /*background-color: #ddd;*/
}

.info_class table tr td {
    line-height: 26px;
    /*float: left;*/
    height: 26px;
    width: 156px;
    text-align: center;
    padding: 3px;
    border: 1px solid #999;
}

.info_class table,
.info_class table tr,
.info_class table tr td {
    border-collapse: collapse;
}

#reservationbtn {
    background: url(images/courseconfirm/coursereservation.gif) no-repeat;
    width: 136px;
    height: 40px;
    border: 0;
    cursor: pointer;
}

.tipsinfo h6 {
    width: 100%;
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
    width: 770px;
    margin-left: 15px;
    padding: 4px 0 10px 0;
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
    display: block;
    width: 600px;
    line-height: 25px;
    margin: 5px 0px 5px 45px;
}

#panelinfo {
    width: 730px;
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
</style>

<div align="center">

    <s:hidden name="course.id"/>
    <div id="courseconfirm">
        <div class="blogframe">
            <img src="images/courseconfirm/courseframetop.gif"/>

            <div class="tipsinfo">
                <p><s:text name="text.warn.tips"/></p>
                <h6><s:text name="label.clourse.selected"/>：<s:property value="course.name"/> </br><b
                        style="color:red;" id="msg"><s:property value="purchaseMsg"/></b></h6>
            </div>
            <div id="courseinfoshow">
                <div id="video">
                    <img src="<s:property value="course.logoUrl"/> "/>
                    <s:if test="course.organization != null">
                        <s:a action="orgBlog"><s:param name="org.id" value="course.organization.id"/><s:property value="course.organization.schoolName"/></s:a>
                    </s:if>
                </div>
                <div class="courseinfo">
                    <s:if test="course.organization == null">
                        <p><s:text name="label.forcast.lecturer"/>：<b><a href="#"><s:property value="course.teacher.nickName"/></a></b></p>
                    </s:if>
                    <p><s:text name="lable.course.date"/>：<b><s:date name="course.startDate"
                                                                     format="%{getText('dateformat')}"/></b>
                    </p>
                </div>
                <div class="courseinfo">
                    <p><s:text name="label.course.fee"/>：<b><s:if
                            test="%{course.personalTeacher == null}"><s:property value="%{4 * course.classes.size}"/>
                        <s:if test="course.consumptionType"><s:property value="%{getText('label.zhibi.true')}"/></s:if><s:else><s:property value="%{getText('label.course.zhiquan')}"/></s:else></s:if><s:else><s:property value="course.charges"/><s:if test="course.consumptionType"><s:property value="%{getText('label.zhibi.true')}"/> </s:if><s:else><s:property value="%{getText('label.course.zhiquan')}"/></s:else></s:else></b></p>

                    <p><s:text name="label.online.class.totalperods"/>：<b><s:property value="course.totalHours"/>&nbsp;<s:property value="%{getText('label.online.class.perods')}"/></b></p>
                </div>
                <div class="courseinfo">
                    <p><s:text name="label.forcast.enrollment"/>：<b><s:property value="course.observationNum"/></b>人</p>

                    <p><s:text name="label.forcast.subscriber"/>：<b><s:property value="course.buyAgesNum"/></b>人</p>
                </div>
                <div class="courseintro"><strong><s:property value="%{getText('label.online.class.introduction')}"/>：</strong><s:property value="course.description"/></div>
            </div>

            <div class="info_class">
                <h3><s:text name="course.classes.info"/></h3>
                <table>
                    <tr>
                        <td class="htitle"><s:text name="lable.course.no"/></td>
                        <td class="htitle"><s:text name="lable.course.nickname"/></td>
                        <td class="htitle"><s:text name="lable.course.starttime"/></td>
                        <td class="htitle"><s:text name="label.lastingtime"/></td>
                    </tr>
                    <tbody>
                    <s:iterator value="course.classes">
                        <tr>
                            <td><s:property value="name"/></td>
                            <td><s:property value="nickName"/></td>
                            <td><s:date name="date" format="%{getText('global.display.hour.minute')}"/></td>
                            <td><s:property value="duration"/></td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>

            <p class="p1"><s:text name="label.zhibi.left"/>：<b><s:property value="userAccountInfo.zhiBi"/></b></p>

            <p class="p1"><s:text name="label.zhiquan.left"/>：<b><s:property value="userAccountInfo.zhiQuan"/></b></p>

            <p class="tipsinfo highlight"><s:text name="label.fee.for.this"/>：
                <b>
                    <s:property value="course.charges"/>
                    <s:if test="course.consumptionType">
                        <s:text name="label.zhibi.true"/>
                    </s:if>
                    <s:else>
                        <s:text name="label.course.zhiquan"/>
                    </s:else>
                </b>
            </p>
            <s:form action="purchaseCourse" method="POST" theme="css_xhtml" id="purchaseCourse_Form">
                <s:hidden name="course.id"/>
                <div class="topbtn">
                    <input type="button" class="btn1 reservationconfirmed" value="" id="reservationconfirmed"/>
                    <input type="button" class="btn1 cancel"
                           value="<s:text name="button.cancel"/>"/>
                </div>
            </s:form>
            <div id="panelinfo">
                <div class="tipsinfo succeed"><img src="/images/courseconfirm/succeed.gif" width="28" height="28"/>
                    <strong>&nbsp;&nbsp;<s:text name="label.registration.successful"/></strong></div>
                <p class="p1"><s:text name="label.account.info"/>：</p>

                <p class="p1"><s:text name="label.zhibi.true"/>:<b id="zhibi"><s:property value="userAccountInfo.zhiBi"/></b></p>

                <p class="p1"><s:text name="label.course.zhiquan"/>：<b id="zhiquan"><s:property value="userAccountInfo.zhiQuan"/></b></p>

                <p class="p1"><s:text name="text.question"/></p>

                <div id="redirectto"><strong id="time">10</strong><s:text name="label.turn"/>
                    <a href="forcastClass.html" id="tiaozhuan"><b><s:property value="%{getText('online.class.avigation.mycourse')}"/></b></a>
                    <s:text name="label.page"/>
                </div>
            </div>
            <img src="images/courseconfirm/courseframebottom.gif" class="frame1bottom"/>
        </div>
    </div>

</div>
<script type="text/javascript">
    var notenough = "<s:text name='label.not.enough'/>";
    var time = 10;
    function descTime() {
        time = time - 1;
        if (time < 0) {
            time = 0;
        }
        $("#time").text(time);
    }

    function goUrl() {
        window.location.href = "myForcastClass.html";
    }
    $(document).ready(function () {
        $("#reservationconfirmed").click(function () {
            $("#purchaseCourse_Form").submit();
        });

        <%--$("#reservationconfirmed").click(function(){--%>
        <%--var url = "courseconfirm.html";--%>
        <%--var zhibi = <s:property value="userAccountInfo.zhiBi"/> +'';--%>
        <%--var zhiquan = <s:property value="userAccountInfo.zhiQuan"/>+'';--%>
        <%--var cost =  <s:property value="course.charges" />;--%>
        <%--&lt;%&ndash;var cost = <s:if test="%{course.personalTeacher == null}"><s:property value="%{4 * course.classes.size}"/></s:if><s:else><s:property value="course.charges" /></s:else> ;&ndash;%&gt;--%>
        <%--if((zhibi+zhiquan) >= cost){--%>
        <%--$.post(url,{'course.id':"<s:property value="course.id"/>"},function(data){--%>
        <%--// alert(data.message);--%>
        <%--$("#msg").text(data.message);--%>
        <%--if(data.state){--%>
        <%--$("#zhibi").text(data.zhiBi);--%>
        <%--$("#zhiquan").text(data.zhiQuan);--%>
        <%--$("#panelinfo").css({"display":"block"});--%>
        <%--setTimeout(goUrl,10000)//500是0.5秒 \--%>
        <%--setInterval('descTime()',1000);--%>
        <%--}--%>
        <%--});--%>
        <%--} else{--%>
        <%--$("#msg").text(notenough);--%>
        <%--}--%>

        <%--});--%>
    })
</script>
