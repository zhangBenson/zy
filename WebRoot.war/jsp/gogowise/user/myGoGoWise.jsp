<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/user/user_center.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>

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
    <%--<s:if test="#session.user_own_org != null">--%>
        <a class="submit_btn_large" href="createCourseAllInOne.html"><s:text name="course.create"/></a>
    <%--</s:if>--%>
</div>
<s:if test="existLatestCourse">
    <div class="usItem_wrap fl">
        <h3 class="h3_title"><s:text name="course.upcoming"/></h3>
        <s:iterator value="latestCourse" status="idx">
            <div class="usItem_cont fl">
                <div class="logo_wrap fl"><a href="voaCourseBlog.html?course.id=<s:property value="id" />"
                                             title="<s:property value="name"/>"><img
                        src="<s:property value="logoUrl" />"/></a></div>
                <div class="detail fl">
                    <a class="h_title" href="voaCourseBlog.html?course.id=<s:property value="id" />"
                       title="<s:property value="name"/>"><s:property value="name"/></a>

                    <p>
                        <s:text name="courses.info.lecturer"/>：<s:a action="userBlog"><s:param
                            name="user.id" value="teacher.id"/><s:property value="teacher.nickName"/></s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;<s:date name="classOnTheCorner.date"
                                                        format="%{getText('dateformat.forclass')}"/>
                    </p>
                    <strong><span id="timer"><s:text name="courses.time.left"/></span>&nbsp;<b
                            id="timeLeft<s:property value="#idx.index"/>"></b></strong>
                    <script type="text/javascript">
                        $("#timeLeft<s:property value="#idx.index"/>").countdown({
                            date: '<s:date name="classOnTheCorner.date" format="%{getText('date.formate.firstpage.course.startdate')}"/>',
                            onChange: function (event, timer) {
                            },
                            onComplete: function (event) {
                                $("#timer").html("");
                                $(this).html("<s:text name='course.in.progress'/>");
                            },
                            htmlTemplate: "<span><b>%{d}</b><s:text name="course.time.day"/><b> %{h}</b><s:text name="course.time.hour"/><b>%{m}</b><s:text name="course.time.minute"/><b>%{s}</b><s:text name="course.tine.second"/></span>",
                            leadingZero: true,
                            direction: "down"
                        });
                    </script>
                </div>
                <div class="handle fr">
                    <a class="a_1" href="javascript:;"><s:property value="%{getText('class.count',{classOneTheCornerSequence})}"/></a>
                    <a class="a_2"
                       href="javascript:getVideoUrl('<s:property value="classOnTheCorner.id"/>','<s:property value="teachingNum"/>');"><s:text name="button.start.class"/></a>
                    <a class="a_2" href="makeCourseVideo.html?course.id=<s:property value="id"/>"><s:text name="course.makeVideos"/></a>
                    <a class="a_2" href="/designGame.html?course.id=<s:property value="id"/>"><s:text name="course.designGame"/></a>

                </div>
                <div style="height:45px;clear: both"></div>
                <div class="desc fl" style="float: left">
                    <p><s:property value="description"/></p>
                </div>
            </div>
        </s:iterator>
    </div>
</s:if>


<div class="usItem2_wrap fl">
    <h3 class="h3_title"><s:text name="usermenu.item.newestcourses"/></h3>
    <ul>
        <s:iterator value="hotCourse">
            <li>
                <a class="img" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                   title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
                <a class="title" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                   title="<s:property value="name"/>"><s:property value="name"/></a>
            </li>
        </s:iterator>
    </ul>
</div>

<div class="usItem2_wrap fl">
    <h3 class="h3_title"><s:text name="course.interested"/></h3>
    <ul>
        <s:iterator value="userLikeCourse">
            <li>
                <a class="img" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                   title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
                <a class="title" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                   title="<s:property value="name"/>"><s:property value="name"/></a>
            </li>
        </s:iterator>
    </ul>
</div>
</div>


<div class="mfp_right fl">
    <div class="rtItem1 fl">
        <h3 class="h3_title"><s:text name="title.newest.notifications"/></h3>
        <s:if test="matterCount != 0">
            <div class="message_tip" id="message_tip_elipse"
                 title="<s:property value="matterCount"/><s:text name="my.firstpage.new.matter.num"/>">
                <s:property value="matterCount"/></div>
            <div id="message_box" class="message_box"></div>
        </s:if>
        <ul>
            <li>
                <a class="fl daynew"><s:text name="course.yesterday"/></a>
                <s:if test="yesterdayCourse">
                    <p class="rt_detail fl">
                        <a class="img" href="voaCourseBlog.html?course.id=<s:property value='yesterdayCourse.id' />"
                           title="<s:property value='yesterdayCourse.name' />"><img
                                src="<s:property value='yesterdayCourse.logoUrl' />"/></a>
                        <a class="title" href="voaCourseBlog.html?course.id=<s:property value='yesterdayCourse.id' />"
                           title="<s:property value='yesterdayCourse.name' />"><s:property value='yesterdayCourse.name'/></a>
                        <span><s:date name="yesterdayCourse.classOnTheCorner.date"
                                      format="%{getText('dateformat.forclass')}"/></span>
                    </p>
                </s:if>
                <s:else>
                    <p class="no_course"><s:text name="msg.nocourse"/></p>
                </s:else>
            </li>
            <li>
                <a class="fl daynew"><s:text name="course.today"/></a>
                <s:if test="todayCourse">
                    <p class="rt_detail fl">
                        <a class="img"
                           href="lecturerClass.html?courseClass.id=<s:property value='todayCourse.classOnTheCorner.id' />"
                           title="<s:text name="button.start.class"/>"><img
                                src="<s:property value='todayCourse.logoUrl' />"/></a>
                        <a class="title" href="voaCourseBlog.html?course.id=<s:property value='todayCours.id' />"
                           title="<s:property value='todayCourse.name' />"><s:property value='todayCourse.name'/></a>
                        <span><s:date name="todayCourse.classOnTheCorner.date"
                                      format="%{getText('dateformat.forclass')}"/></span>
                    </p>
                </s:if>
                <s:else>
                    <p class="no_course"><s:text name="msg.nocourse"/></p>
                </s:else>
            </li>
            <li>
                <a class="fl daynew"><s:text name="course.tomorrow"/></a>
                <s:if test="tomorrowCourse">
                    <p class="rt_detail fl">
                        <a class="img" href="voaCourseBlog.html?course.id=<s:property value='tomorrowCourse.id' />"
                           title="<s:property value='tomorrowCourse.name' />"><img
                                src="<s:property value='tomorrowCourse.logoUrl' />"/></a>
                        <a class="title" href="voaCourseBlog.html?course.id=<s:property value='tomorrowCourse.id' />"
                           title="<s:property value='tomorrowCourse.name' />"><s:property value='tomorrowCourse.name'/></a>
                        <span><s:date name="tomorrowCourse.classOnTheCorner.date"
                                      format="%{getText('dateformat.forclass')}"/></span>
                    </p>
                </s:if>
                <s:else>
                    <p class="no_course"><s:text name="msg.nocourse"/></p>
                </s:else>
            </li>
        </ul>
    </div>

</div>
</div>

<script type="text/javascript">
    var sendRequest = 0;
    var total_message_number = <s:property value="matterCount"/>;

    $(document).ready(function () {
        $(".menu_base_userCenter").addClass("menu_base_current");

        $(".daynew").click(function () {
            $(this).parent().children("p").slideToggle();
        });

        $(".handle .a_1").click(function () {
            $(this).parent().children(".candidate").slideToggle();
            $(".candidate").not($(this).parent().children(".candidate")).hide();
        });

        $("#message_tip_elipse").click(function () {
            $(this).siblings("div.message_box").toggle();
            if ($(this).css("background-position") == "0px -52px") {
                $(this).css("background-position", "0px 0px");
            } else {
                $(this).css("background-position", "0px -52px");
            }
            if (sendRequest == 0) {
                $.post('initMatters.html', {}, function (data) {
                    $('#message_box').html(data);
                    sendRequest = 1;
                });
            }
        });

        $(document).click(function (event) {
            if ($(".candidate").is(":visible") && !$(event.target).isChildAndSelfOf($(".candidate")) && !$(event.target).isChildAndSelfOf($(".handle .a_1"))) {
                $(".candidate").hide();
            }
            if ($("div.message_box").is(":visible") && !$(event.target).isChildAndSelfOf($("div.message_box")) && !$(event.target).isChildAndSelfOf($("#message_tip_elipse"))) {
                $("div.message_box").hide();
                $("div.message_tip").css("background-position", "0px 0px");
            }
        });

    });
    jQuery.fn.isChildAndSelfOf = function (b) {
        return (this.closest(b).length > 0);
    };

    function getVideoUrl(cid, type) {
        if (type == 4) {
            window.location.href = "lecturerClass.html?courseClass.id=" + cid;
        }
    }
</script>
