<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link type="text/css" href="css/course/courseOnline.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript" src="js/jquery.rate.js"></script>

<script type="text/javascript">
    function audting(cid) {
        window.location.href = "startSupervision.html?courseClass.id=" + cid + "&courseOnline=true";
    }
</script>

<div class="rightcontent">

    <s:iterator value="courses" status="idx">
        <div class="blogframe">
            <img src="images/blogindex/courseframetop.gif"/>

            <div class="courseLogo"><s:a action="voaCourseBlog"><s:param name="course.id" value="id"/><img
                    src="<s:property value="logoUrl"/>" onerror="javascript:this.src='images/nopic.jpg'"/></s:a></div>
            <div class="course_info">
                <div class="course_tittle">
                    <h6><s:property value="name"/><s:if test="organization != null">--<s:property
                            value="organization.schoolName"/></s:if></h6>
                    <span class="type2"></span>
                </div>
                <div class="course_detail">
                    <table cellpadding="5" cellspacing="5">
                        <tr>
                            <td><s:property value="%{getText('org.blog.lecture')}"/>：<s:a action="userBlog"><s:param
                                    name="user.id" value="teacher.id"/><s:property value="teacher.nickName"/></s:a></td>
                            <td><s:property value="%{getText('label.number.of.attendee')}"/>：<span class="orangeWords">
                                       <s:property value="studentNum"/>
                                  </span></td>
                        </tr>
                        <tr>
                            <td><s:property value="classOnTheCorner.name"/>：<span class="orangeWords"><s:date
                                    name="classOnTheCorner.date" format="%{getText('dateformat.forclass')}"/></span>
                            </td>
                            <td><s:property value="%{getText('course.total.charge')}"/>：<span
                                    class="orangeWords"><s:property value="charges"/>&nbsp;<s:property
                                    value="%{getText('label.zhibi.'+consumptionType)}"/></span></td>
                        </tr>
                        <tr>
                            <td colspan=2 style="width:445px;"><s:property
                                    value="%{getText('course.info.description')}"/>：<span class="orangeWords"
                                                                                          id="descriptionMsg<s:property value='#idx.index'/>"><s:property
                                    value="description"/></span></td>
                        </tr>
                    </table>
                </div>
                <div class="course_time_left">
                    <s:property value="%{getText('courses.time.left')}"/>：<span class="orangeWords"
                                                                                id="timeLeft<s:property value="#idx.index"/>"></span>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#timeLeft<s:property value="#idx.index"/>").countdown({
                                date: '<s:date name="classOnTheCorner.date" format="%{getText('date.formate.firstpage.course.startdate')}" />',
                                onChange: function (event, timer) {
                                },
                                onComplete: function (event) {
                                    $(this).html("<s:text name='course.in.progress'/>");
                                },
                                htmlTemplate: "<span><b>%{d}</b><s:property value="%{getText('course.time.day')}" /><b> %{h}</b><s:property value="%{getText('course.time.hour')}" /><b>%{m}</b><s:property value="%{getText('course.time.minute')}" /><b>%{s}</b><s:property value="%{getText('course.tine.second')}" /></span>",
                                leadingZero: true,
                                direction: "down"
                            });
                        });
                    </script>
                </div>
                <div class="course_manipulate">
                    <a class="course_supervise_btn"
                       onclick="audting(<s:property value="classOnTheCorner.id"/>);"><s:property
                            value="%{getText('button.start.try')}"/></a>

                    <div class="see_all_classes">[<s:property value="%{getText('span.all.course')}"/>]</div>
                </div>
            </div>
            <div class="classintro classintro<s:property value='#id.index'/>">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <s:iterator value="forcastClasses">
                        <tr>
                            <td class="td1">
                                <s:property value="name"/>
                            </td>
                            <td>
                                <span class="orangeWords"><s:property value="nickName"/></span>
                            </td>
                            <td>
                                <s:property value="%{getText('lable.course.starttime')}"/>：
                                <span class="orangeWords"><s:date name="date"
                                                                  format="%{getText('dateformat.forclass')}"/></span>
                            </td>
                            <td>
                                <s:property value="%{getText('lable.course.endtime')}"/>：
                                <span class="orangeWords"><s:date name="finishDate"
                                                                  format="%{getText('dateformat.forclass')}"/></span>
                            </td>
                        </tr>
                    </s:iterator>
                </table>
            </div>

            <img src="images/blogindex/courseframebottom.gif" class="frame1bottom"/>
        </div>
    </s:iterator>

    <tiles:insertTemplate template="../pagination.jsp">
        <tiles:putAttribute name="pagination" value="${pagination}"/>
    </tiles:insertTemplate>
</div>


<script type="text/javascript">
    <%--<s:iterator value="courses" status="idx">--%>
    <%--$("#rate_t_<s:property value="#idx.index"/>").rate({--%>
    <%--selected:<s:property value="synthetical"/>,--%>
    <%--selectable:false,--%>
    <%--decimal:true,--%>
    <%--revert:true,--%>
    <%--fullStar:false--%>
    <%--});--%>
    <%--</s:iterator>--%>


    $(document).ready(function () {
        $(".see_all_classes").click(function () {
            $(this).parent().parent().next().slideToggle();
        });
        <s:iterator value="courses" status="idx">
        var str = $("#descriptionMsg<s:property value="#idx.index"/>").text();
        $("#descriptionMsg<s:property value="#idx.index"/>").text(getSpecialSubString(str, 100));
        </s:iterator>
    });
    function getSpecialSubString(str, sLength) {
        var len = 0;
        for (var i = 0; i < str.length; i++) {
            var c = str.charCodeAt(i);
            if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
                len++;
            } else {
                len += 2;
            }
            if (len >= sLength) {
                return str.substring(0, i) + " ...";
            }
        }
        return str;
    }
</script>


