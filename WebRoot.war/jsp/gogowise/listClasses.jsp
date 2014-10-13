<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table>
    <s:form method="POST" validate="true">
        <tr>
            <td>
                <s:textfield name="searchValue" size="15"/>
            </td>
            <td>
                <s:select list="#{'1':'课程','2':'老师'}" listKey="key" listValue="value" name="searchType"></s:select>
            </td>
            <td>
                <s:submit name="search" value="搜索" action="search"></s:submit></td>
                <%--<td><s:submit name="搜索"></s:submit></td>--%>
        </tr>
    </s:form>
</table>


<script type="text/javascript" src="js/jquery.rate.js"></script>

<style type="text/css">
#now {
    background: url(images/navigation-menu2.gif) bottom repeat-x;
    color: #fff;
}

#rightcontent {
    border: 0px;
    width: 810px;
}

#tabtitle {
    float: left;
    overflow: hidden;
    list-style: none;
    margin: 0;
    padding: 0;
    margin-left: 5px;
}

#tabtitle li {
    width: 120px;
    height: 25px;
    line-height: 24px;
    float: left;
    text-align: center;
    margin-right: 2px;
    list-style: none;
    font-size: 14px;
    font-weight: bold;
}

#tabtitle li a:link, #tabtitle li a:visited {
    text-decoration: none;
    background: url(images/navigation-menu4.gif) repeat-x bottom;
    display: block;
    width: 120px;
    height: 25px;
    color: #fff;
}

#tabtitle li a:hover, #tabtitle li a:active {
    background: url(images/navigation-menu5.gif) bottom repeat-x;
    color: #fff;
}

#html_1 {
    border-top: 1px solid #68CEFF;
    width: 800px;
    word-wrap: break-word;
    padding: 3px;
    float: left;
}

.blogframe ul, .blogframe li, .blogframe h1, .blogframe h2, .blogframe h3, .blogframe h4, .blogframe h5, .blogframe h6, .blogframe table {
    margin: 0px;
    padding: 0px;
    font-family: Verdana, Geneva, sans-serif;
    color: #666;
    background: #FFF;
    font-size: 12px;
}

.blogframe ul, li {
    list-style: none;
}

.blogframe div {
    float: left;
}

.blogframe {
    width: 800px;
    background: url(images/blogindex/courseframecenter.gif) center repeat-y;
    position: relative;
    padding-bottom: 15px;
    float: left;
}

.blogframe .video {
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

a:link, a:visited {
    color: #cc6600;
}

a:hover {
    color: #F90;
}

b a {
    color: #F90;
    text-decoration: underline;
}

.blogframe h6 {
    color: #006699;
    font-size: 18px;
    padding-bottom: 2px;
    float: left;
    width: 600px;
    position: relative;
}

#evaluate {
    width: 350px;
}

#evaluate b {
    font-style: oblique;
}

#evaluate h3 {
    font-size: 18px;
    height: 28px;
    padding-bottom: 2px;
}

#evaluate h3 b {
    font-size: 24px;
}

img.frame1bottom {
    position: absolute;
    left: 0;
    bottom: 0;
}

.btn1 {
    border: none;
    height: 54px;
    width: 183px;
    cursor: pointer;
    margin: 5px 30px 0px 15px;
}

.reservation {
    background: url(images/blogindex/blogreservation.gif) no-repeat;
}

.evaluate {
    background: url(images/blogindex/blogevaluate.gif) no-repeat;
}

.courseintro {
    width: 95%;
    margin-left: 15px;
    color: #666666;
    font-size: 12px;
}

.type2, .type2 .rate-current, .type2 .rate-on:hover, .type2-bad .rate-current, .type2-bad .rate-on:hover {
    background: url(images/blogindex/star.gif) repeat-x;
    color: #cc6600;
}

.type2 {
    position: relative;
    height: 18px;
    width: 110px;
}

.type2 .rate-on, .type2 .rate-current {
    position: absolute;
    top: 0;
    left: 0;
    height: 18px;
    outline: none;
}

.type2 .rate-current, .type2 .rate-on:hover {
    background-position: 0 -46px;
}

.type2-bad .rate-current, .type2-bad .rate-on:hover {
    background-position: 0 -23px;
}

.seeall {
    font-size: 16px;
    color: #cc6600;
    position: absolute;
    right: -50px;
    top: 50px;
    cursor: pointer;
    width: 136px;
    height: 40px;
}

.classintro {
    margin: 8px 0px 8px 40px;
    width: 85%;
    display: none;
}

.classintro tr {
    height: 28px;
}

.classintro td {
    padding: 3px 2px 3px 4px;
    border-bottom: 1px dashed #999;
    text-align: right;
}

.classintro .td1 {
    color: #006699;
    width: 60px;
}

h6 .type2 {
    position: absolute;
    top: 0;
    right: 170px;
}

h6 .seeallclass {
    position: absolute;
    top: 0;
    right: -200px;
    cursor: pointer;
    font-size: 16px;
}

#reservationbtn {
    background: url(images/blogindex/coursereservation.gif) no-repeat;
    width: 136px;
    height: 40px;
    border: 0;
    cursor: pointer;
}

.reservationsucceed {
    position: absolute;
    top: 95px;
    right: -50px;
    font-size: 12px;
    color: #006699;
}


</style>

<script type="text/javascript">

    function InitAjax() {
        var ajax = false;
        try {
            ajax = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                ajax = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (E) {
                ajax = false;
            }
        }
        if (!ajax && typeof XMLHttpRequest != 'undefined') {
            ajax = new XMLHttpRequest();
        }
        return ajax;
    }

    function saveReservation(idx, id) {
        var url = "initCourseconfirm.html?course.id=" + id;
        window.location.href = url;
//        var msg = document.getElementById("msg"+idx);
//        var url = "saveSeniorClassRoom.html";
//        var postStr = "seniorClassRoom.course.id="+id;
//        var ajax = InitAjax();
//        ajax.open("POST", url, true);
//        ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
//        ajax.send(postStr);
//        ajax.onreadystatechange = function() {
//            if (ajax.readyState == 4) {
//                msg.innerHTML = ajax.responseText;
//            }
//        }
    }
</script>

<div id="rightcontent">
    <%--<ul id="tabtitle">--%>
    <%--<li><a href="livingClass.html"><s:text name="online.class.avigation.realtime.course"/></a></li>--%>
    <%--<li><a href="myForcastClass.html"><s:text name="online.class.avigation.mycourse"/></a></li>--%>
    <%--<li id="now"><s:text name="online.class.avigation.newest.course"/></li>--%>
    <%--<li><a href="createCourse.html"><s:text name="online.class.avigation.open.course"/></a></li>--%>
    <%--<li><a href="ageClass.html"><s:text name="online.class.avigation.course.video"/></a></li>--%>
    <%--</ul>--%>
    <div id="html_1">


        <s:iterator value="courses" status="idx">

            <div class="blogframe">
                <img src="images/blogindex/courseframetop.gif"/>

                <div class="video"><a href="#"><img src="<s:property value="logoUrl"/>" height="100" width="100"
                                                    border="0"/></a></div>
                <h6><s:property value="name"/>
                    <s:if test="personalTeacher!=null">
                        <s:if test="teachingNum==1"><b
                                style="font-size:12px; color: #cc6600; margin-left: 15px; "><s:text name="label.tutor.1to1"/></b></s:if>
                        <s:if test="teachingNum==2"><b
                                style="font-size:12px; color: #cc6600; margin-left: 15px; "><s:text name="label.tutor.1to2"/></b></s:if>
                        <s:if test="teachingNum==3"><b
                                style="font-size:12px; color: #cc6600; margin-left: 15px; "><s:text name="label.tutor.1to3"/></b></s:if>
                        <s:if test="teachingNum==4"><b
                                style="font-size:12px; color: #cc6600; margin-left: 15px; "><s:text name="label.tutor.1tomany"/></b></s:if>
                    </s:if>

                    <s:else>
                        <s:if test="opened"><b style="font-size:12px; color: #cc6600; margin-left: 15px; "><s:text name="label.online.class.public"/></b></s:if>
                        <s:else>
                            <s:if test="teachingNum==1"><b
                                    style="font-size:12px; color: #cc6600; margin-left: 15px; "><s:text name="label.no.public.1to1"/></b></s:if>
                            <s:if test="teachingNum==2"><b
                                    style="font-size:12px; color: #cc6600; margin-left: 15px; "><s:text name="label.no.public.1to2"/></b></s:if>
                            <s:if test="teachingNum==3"><b
                                    style="font-size:12px; color: #cc6600; margin-left: 15px; "><s:text name="label.no.public.1tomany"/></b></s:if>
                        </s:else>
                    </s:else>

                    <span id="rate_t_<s:property value="#idx.index"/>" class="type2"><span
                            class="seeallclass">[<s:text name="span.all.course"/>]</span></span>
              <span class="seeall">
                   <%--<a onclick="saveReservation(<s:property value="#idx.index"/> ,<s:property value="id"/> );">--%>
                    <s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>
                        <input name="" type="button" value="" id="reservationbtn"/>
                    </s:a>
                   <%--</a>--%>
              </span>
                    <span id="msg<s:property value="#idx.index"/>" class="reservationsucceed"></span>
                </h6>

                <div class="courseinfo">
                        <%--<p><s:text name="label.forcast.lecturer"/>：<b><a href="#"><s:property value="teacher.userName"/></a></b></p>--%>
                    <p><s:text name="label.forcast.lecturer"/>：<b><s:a action="userBlog"><s:param
                            name="user.id" value="teacher.id"/><s:property value="teacher.nickName"/></s:a></b></p>
                        <%--<p><s:text name="label.online.class.org.name"/>：<b><a href="#"><s:property value="organization.schoolName"/></a></b></p>--%>
                    <p><s:text name="label.online.class.org.name"/>：<b><s:a action="orgBlog"><s:param
                            name="org.id" value="organization.id"/><s:property value="organization.schoolName"/></s:a></b></p>
                        <%--<p><s:text name="label.forcast.producer"/>：<b><a href="#"><s:property value="cameraMan.userName"/></a></b></p>--%>
                    <p><s:text name="label.forcast.producer"/>：<b><s:a action="userBlog"><s:param
                            name="user.id" value="teacher.id"/><s:property value="cameraMan.nickName"/></s:a></b></p>
                </div>
                <div class="courseinfo">
                    <p><s:text name="label.course.fee"/>：<b>1000&nbsp;<s:text name="label.zhibi"/></b></p>

                    <p><s:text name="label.online.class.totalperods"/>：<b><s:property value="totalHours"/>&nbsp;<s:text name="label.online.class.perods"/></b>
                    </p>

                    <p><s:text name="label.online.class.startdate"/>：<b><s:property value="startDate"/></b></p>
                </div>
                <div class="courseinfo">
                    <p><s:text name="label.forcast.enrollment"/>：<b><s:property value="observationNum"/></b> <s:text name="label.forcast.person"/></p>

                    <p><s:text name="label.forcast.subscriber"/>：<b><s:property value="buyAgesNum"/></b> <s:text name="label.forcast.person"/></p>
                </div>
                <div class="courseintro"><strong><s:text name="label.online.class.introduction"/>：</strong><s:property value="description"/></div>
                <div class="classintro">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <s:iterator value="classes">
                            　
                            <tr>
                                <td class="td1"><s:property value="name"/></td>
                                <td><b><s:property value="nickName"/></b></td>
                                <td><s:text name="lable.course.starttime"/>：<b><s:property value="date"/>&nbsp; <s:property value="startTimeHour"/> : <s:property value="startTimeMinite"/></b></td>
                                <td><s:text name="lable.course.endtime"/>：<b><s:property value="date"/>&nbsp; <s:property value="endTimeHour"/> : <s:property value="endTimeMinite"/></b></td>
                                <td><b><s:if test="finished"><span><s:text name="label.ended"/></span></s:if></b></td>
                                　
                            </tr>
                        </s:iterator>
                    </table>
                </div>
                <img src="images/blogindex/courseframebottom.gif" class="frame1bottom"/>
            </div>

        </s:iterator>
    </div>

</div>

<script type="text/javascript">

    <s:iterator value="courses" status="idx">
    $("#rate_t_<s:property value="#idx.index"/>").rate({
        selected:<s:property value="synthetical"/>,
        selectable: false,
        decimal: true,
        revert: true,
        fullStar: false
    });
    </s:iterator>
    $(".seeallclass").click(function () {
        $(".classintro").not($(this).parents("div.blogframe").children()).hide();
        $(this).parents("div.blogframe").children("div.classintro").slideToggle(500);
    });
</script>
