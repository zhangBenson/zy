<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/course/course_square.css" rel="stylesheet"/>
<link type="text/css" href="css/square/square.css" rel="stylesheet"/>
<script type="text/javascript" src="js/square/squreSubTitle.js"></script>

<script type="text/javascript">
    function getCoursesDivideByType(courseType, obj) {
        $(obj).addClass("stand_out");
        $(obj).siblings("li").removeClass("stand_out");
        $.post("loadCoursesDivideByType.html", {'course.courseType': courseType}, function (data) {
            $("#courseInTypes").html(data);
        });
    }
</script>

<div class="square_container">
<s:hidden value="%{#session.userID}" id="hidSessionId"/>
<div class="head_img">
    <p class="desc"><span class="big"><s:property value="%{getText('index.not.need.install.soft')}"/></span><br/><br/><s:property value="%{getText('index.first.page.intro')}"/></p>

    <p class="handle">
        <a class="handle_1" href="createCourseAllInOne.html"><s:text name="course.square.be.teacher"/></a>
        <a class="handle_2" href="courseSelection.html"><s:text name="course.square.be.student"/></a>
    </p>
</div>
<div class="classify sc_d">
    <h3 class="h3_title">
        <s:text name="course.square.course.zhanshi"/>
        <div class="lead_img"></div>
    </h3>
    <ul class="switch">
        <li class="stand_out" onclick="getCoursesDivideByType(0,this);"><s:text name="search.header.all"/></li>
        <li onclick="getCoursesDivideByType(1,this);"><s:text name="course.square.course.type.language"/></li>
        <li onclick="getCoursesDivideByType(2,this);"><s:text name="course.square.course.type.trip"/></li>
        <li onclick="getCoursesDivideByType(3,this);"><s:text name="course.square.course.type.carreer"/></li>
        <li onclick="getCoursesDivideByType(4,this);"><s:text name="course.square.course.type.science"/></li>
        <li onclick="getCoursesDivideByType(5,this);"><s:text name="course.square.course.type.abroad"/></li>
        <li onclick="getCoursesDivideByType(6,this);"><s:text name="course.square.course.type.sociaty"/></li>
    </ul>
    <div class="class" id="courseInTypes">
        <ul class="left">
            <s:iterator value="coursesInTypesLeft">
                <li><a href="voaCourseBlog.html?course.id=<s:property value="id"/>" class="courseInTypes_name_size"><s:property value="name"/></a><span class="price"><s:property value="charges"/><s:text name="label.zhibi.true"/></span><span class="date"><s:date name="startDate"
                                                                                                                                                                                                                                                                      format="%{getText('dateformat')}"/></span>
                </li>
            </s:iterator>
        </ul>
        <div class="split"></div>
        <ul class="right">
            <s:iterator value="coursesInTypesRight">
                <li><a href="voaCourseBlog.html?course.id=<s:property value="id"/>" class="courseInTypes_name_size"><s:property value="name"/></a><span class="price"><s:property value="charges"/><s:text name="label.zhibi.true"/></span><span class="date"><s:date name="startDate"
                                                                                                                                                                                                                                                                      format="%{getText('dateformat')}"/></span>
                </li>
            </s:iterator>
        </ul>
    </div>
</div>
<div class="highlight">
    <h3 class="h3_title">
        <s:text name="gogowise.announce"/>
    </h3>
    <ul>
        <s:iterator value="goGoWiseAnnounces">
            <li>
                <div class="dot"></div>
                <a href="announceRead.html?goGoWiseAnnounce.id=<s:property value="id"/>"
                   title="<s:property value="title"/>" class="goGoWiseAnnounce_newEvents"><s:property value="title"/></a></li>
        </s:iterator>
    </ul>
</div>

<%--<div class="ad_img"></div>--%>

<s:if test="existCourse">
    <div class="new_course">
        <h3 class="h3_title">
            <s:text name="online.class.avigation.newest.course"/>
        </h3>
        <a class="other_more" href="courseNewList.html"><s:text name="others.more"/></a>

        <div class="cont">
            <ul>
                <s:iterator value="courses">
                    <li>
                        <a class="img" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                           title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>

                        <div class="date_reserve">
                                <span class="date"><s:date name="classOnTheCorner.date"
                                                           format="%{getText('dateformat.forclass')}"/></span>
                            <a href="initCourseconfirm.html?course.id=<s:property value="course.id"/>"><s:text name="user.info.identity.finish.reg"/></a>
                        </div>
                        <div class="tc">
                            <a class="title" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                               title="<s:property value="name"/>"><s:property value="name"/></a>
                            <a class="teacher" href="userBlog.html?user.id=<s:property value="teacher.id"/>"
                               title="<s:property value="teacher.nickName"/>"><img
                                    src="<s:property value="teacher.pic"/>"/></a>
                        </div>
                    </li>
                </s:iterator>
            </ul>
        </div>
    </div>
</s:if>
<div class="hot_course sc_d" id="hot_location">
    <h3 class="h3_title">
        <s:text name="course.hottest"/>
        <div class="lead_img"></div>
    </h3>
    <a class="other_more" href="courseHotList.html"><s:text name="others.more"/></a>

    <div class="cont">
        <ul>
            <s:iterator value="hotCourses">
                <li>
                    <a class="img" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                       title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>

                    <div class="date_reserve">
                        <span class="date"><s:date name="startDate" format="%{getText('dateformat')}"/></span>
                    </div>
                    <div class="tc">
                        <a class="title" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                           title="<s:property value="name"/>"><s:property value="name"/></a>
                        <a class="teacher" href="userBlog.html?user.id=<s:property value="teacher.id"/>"
                           title="<s:property value="teacher.nickName"/>"><img
                                src="<s:property value="teacher.pic"/>"/></a>
                    </div>
                </li>
            </s:iterator>
        </ul>
    </div>
</div>

<div class="highlight">
    <h3 class="h3_title">
        <s:text name="course.square.of.new.events"/>
    </h3>
    <ul>
        <s:iterator value="courseNewEvents">
            <li>
                <div class="dot"></div>
                <a href="courseEventRead.html?courseNewEvent.id=<s:property value="id"/>"
                   title="<s:property value="title"/>" class="course_newEvents"><s:property value="title"/></a></li>
        </s:iterator>
    </ul>
</div>
<%--<div class="ad_img"></div>--%>
<%--<div class="new_org sc_d">--%>
<%--<h3>--%>
<%--新加盟组织--%>
<%--<div class="lead_img"></div>--%>
<%--</h3>--%>
<%--</div>--%>
<%--<div class="hot_org sc_f">--%>
<%--<h3>--%>
<%--最热组织--%>
<%--<div class="lead_img"></div>--%>
<%--</h3>--%>
<%--</div>--%>
<div style="float:left;width:756px;">
    <div class="hot_teacher sc_d">
        <h3 class="h3_title">
            <s:text name="teacher.hottest"/>
        </h3>
        <a class="other_more" href="teacherHotList.html"><s:text name="others.more"/></a>

        <div class="cont">
            <ul>
                <s:iterator value="hottestTeacher">
                    <li>
                        <a class="img" href="userBlog.html?user.id=<s:property value="id"/>"
                           title="<s:property value="nickName"/>"><img src="<s:property value="pic"/>"/></a>
                        <a class="nick" href="userBlog.html?user.id=<s:property value="id"/>"
                           title="<s:property value="nickName"/>"><s:property value="nickName"/></a>
                        <s:if test="!userFocused">
                            <a class="follow" href="javascript:;"
                               onclick="becomeFans(this,<s:property value="id"/>);"><s:text name="user.add.focus"/></a>
                        </s:if>
                        <s:else>
                            <a class="follow" href="javascript:;"
                               onclick="becomeFans(this,<s:property value="id"/>);"><s:text name="user.add.focused"/></a>
                        </s:else>
                        <span><s:property value="fansNum"/><s:text name="the.num.of.focus.on.live.channel"/></span>
                    </li>
                </s:iterator>
            </ul>
        </div>
    </div>

    <div class="new_org sc_d">
        <h3 class="h3_title">
            <s:text name="course.square.of.new.orgs"/>
            <div class="lead_img"></div>
        </h3>
        <div class="cont">
            <ul>
                <s:iterator value="organizations">
                    <li>
                        <a class="img" href="orgBlog.html?org.id=<s:property value="id"/>"
                           title="<s:property value="schoolName"/>"><img src="<s:property value="logoUrl"/>"/></a>

                        <div class="date_reserve">
                                <span class="date"><s:text name="course.square.of.new.orgs.addTime"/>：<s:date
                                        name="createDate" format="%{getText('dateformat')}"/></span>
                        </div>
                        <div class="tc">
                            <a class="title" href="orgBlog.html?org.id=<s:property value="id"/>"
                               title="<s:property value="schoolName"/>"><s:property value="schoolName"/></a>
                                <%--<a class="teacher" href="userBlog.html?user.id=<s:property value="teacher.id"/>" title="<s:property value="teacher.nickName"/>"><img src="<s:property value="teacher.pic"/>"/></a>--%>
                        </div>
                    </li>
                </s:iterator>
            </ul>
        </div>
    </div>
</div>
<div class="ads sc_f">
    <%--<h3 class="h3_title">--%>
    <%--<s:text name="system.advertisement"/>--%>
    <%--<div class="lead_img"></div>--%>
    <%--</h3>--%>
    <div class="cont">
        <ul>
            <s:iterator value="coursesForAds">
                <li><a href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                       title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a></li>
            </s:iterator>
        </ul>
    </div>
</div>
</div>
<script type="text/javascript">
    $(function () {
        $(".menu_base_course").addClass("menu_base_current");
    });

    function becomeFans(obj, userID) {
        if (validateLogo()) {
            $.post("addUserFocus.html", {'user.id': userID}, function (data) {
                $.fancybox({
                    content: data.message,
                    onComplete: function () {
                        setTimeout("$.fancybox.close();", "2000")
                    }
                });
            });
            $(obj).html("<s:text name='user.add.focused'/>");
        }
    }
</script>
