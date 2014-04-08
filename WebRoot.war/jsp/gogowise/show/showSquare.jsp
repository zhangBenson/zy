<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/show/show_square.css" rel="stylesheet"/>
<link type="text/css" href="css/square/square.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript" src="js/square/squreSubTitle.js"></script>

<div class="square_container">
    <s:hidden value="%{#session.userID}" id="hidSessionId"/>
    <div class="head_img">
        <p class="desc"><span class="big"><s:property value="%{getText('index.second.image.intro1')}"/></span><br/><br/><s:property
                value="%{getText('index.second.image.intro2')}"/></p>

        <p class="handle">
            <a class="handle_1" href="initShowCreate.html"><s:property value="%{getText('show.creation')}"/></a>
            <a class="handle_2" href="showRangeBoard.html"><s:property
                    value="%{getText('show.ad.bidding.in.square')}"/></a>
        </p>
    </div>

    <div class="show_count sc_d">
        <h3 class="h3_title">
            <s:property value="%{getText('show.online.time.left')}"/>
            <%--<div class="lead_img"></div>--%>
        </h3>

        <div class="cont">
            <ul>
                <s:iterator value="showsOnline" status="idx">
                    <li>
                        <a class="img" href="userBlog.html?user.id=<s:property value="owner.id"/>"
                           title="<s:property value="owner.nickName"/>"><img src="<s:property value="owner.pic"/>"/></a>
                        <a class="nick" href="userBlog.html?user.id=<s:property value="owner.id"/>"
                           title="<s:property value="owner.nickName"/>"><s:property value="owner.nickName"/></a>
                        <span class="date"><s:date name="firstFutureTerm.startTime"
                                                   format="%{getText('dateformat.forclass')}"/></span>
                        <a class="title" href="showBlog.html?myShow.id=<s:property value="id"/>"
                           title="<s:property value="name"/>"><s:property value="name"/></a>
                        <span class="count" id="showOnline_timeLeft<s:property value="#idx.index"/>"></span>
                    </li>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#showOnline_timeLeft<s:property value="#idx.index"/>").countdown({
                                date: '<s:date name="firstFutureTerm.startTime" format="%{getText('date.formate.firstpage.course.startdate')}" />',
                                onChange: function (event, timer) {
                                },
                                onComplete: function (event) {
                                    $(this).html("<s:property value="%{getText('live.term.is.on.living')}"/>");
                                },
                                htmlTemplate: "<span><b>%{d}</b><s:property value="%{getText('course.time.day')}" /><b> %{h}</b><s:property value="%{getText('course.time.hour')}" /><b>%{m}</b><s:property value="%{getText('course.time.minute')}" /><b>%{s}</b><s:property value="%{getText('course.tine.second')}" /></span>",
                                leadingZero: true,
                                direction: "down"
                            });
                            <%--$("#show_abstract<s:property value="#idx.index"/>").html(getSpecialSubString($("#show_abstract<s:property value="#idx.index"/>").html(),50));--%>
                        });
                    </script>
                </s:iterator>
            </ul>
        </div>
    </div>
    <div class="highlight">
        <h3 class="h3_title">
            <s:property value="%{getText('gogowise.announce')}"/>
        </h3>
        <ul>
            <s:iterator value="goGoWiseAnnounces">
                <li>
                    <div class="dot"></div>
                    <a href="announceRead.html?goGoWiseAnnounce.id=<s:property value="id"/>"
                       title="<s:property value="title"/>" class="goGoWiseAnnounce_newEvents"><s:property
                            value="title"/></a></li>
            </s:iterator>
        </ul>
    </div>

    <%--<div class="ad_img"></div>--%>

    <div class="new_items sc_e">
        <h3 class="h3_title">
            <s:property value="%{getText('show.square.of.newest.show')}"/>
        </h3>
        <a class="other_more" href="showHotList.html"><s:property value="%{getText('others.more')}"/></a>

        <div class="cont">
            <ul>
                <s:iterator value="newestShows">
                    <li>
                        <a class="img" href="showBlog.html?myShow.id=<s:property value="id"/>"
                           title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
                        <a class="title" href="showBlog.html?myShow.id=<s:property value="id"/>"
                           title="<s:property value="name"/>"><s:property value="name"/></a>
                        <s:if test="!userFocused"><a class="reserve" href="javascript:;"
                                                     onclick="becomeFans(this,<s:property value="id"/>);"><s:property
                                value="%{getText('user.add.focus')}"/></a></s:if>
                        <s:else><a class="reserve" href="javascript:;"
                                   onclick="becomeFans(this,<s:property value="id"/>);"><s:property
                                value="%{getText('user.add.focused')}"/></a></s:else>
                        <div class="msg">
                            <span class="num num1"><s:property value="totalInviteNum"/>&nbsp;<s:property
                                    value="%{getText('user.inviteNum')}"/></span>
                            <span class="num num2"><s:property value="fansNum"/>&nbsp;<s:property
                                    value="%{getText('onlive.fensi')}"/></span>
                        </div>
                        <span class="date"><s:date name="firstFutureTerm.startTime"
                                                   format="%{getText('dateformat.forclass')}"/></span>
                        <a class="teacher" href="userBlog.html?user.id=<s:property value="owner.id"/>"
                           title="<s:property value="owner.nickName"/>"><img src="<s:property value="owner.pic"/>"/></a>
                    </li>
                </s:iterator>
            </ul>
        </div>
    </div>
    <div class="hot_items sc_d" id="hot_location">
        <h3 class="h3_title">
            <s:property value="%{getText('show.square.hottest')}"/>
            <%--<div class="lead_img"></div>--%>
        </h3>
        <a class="other_more" href="showHotList.html"><s:property value="%{getText('others.more')}"/></a>

        <div class="cont">
            <ul>

                <s:iterator value="hotestShows">
                    <li class="thesame">
                        <a class="thesame img" href="showBlog.html?myShow.id=<s:property value="id"/>"
                           title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
                        <a class="thesame title" href="showBlog.html?myShow.id=<s:property value="id"/>"
                           title="<s:property value="name"/>"><s:property value="name"/></a>
                        <span class="thesame reg"><s:property value="totalInviteNum"/>&nbsp;<s:property
                                value="%{getText('show.total.invite.num.in.all')}"/></span>
                        <span class="thesame date"><s:date name="firstFutureTerm.startTime"
                                                           format="%{getText('dateformat.forclass')}"/></span>
                        <a class="teacher" href="userBlog.html?user.id=<s:property value="owner.id"/>"
                           title="<s:property value="owner.nickName"/>"><img src="<s:property value="owner.pic"/>"/></a>
                    </li>
                </s:iterator>
            </ul>
        </div>
    </div>

    <div class="highlight sc_f" style="margin-top: 20px;">
        <h3 class="h3_title">
            <s:property value="%{getText('show.square.new.events')}"/>
        </h3>
        <ul>
            <s:iterator value="showNewEvents">
                <li>
                    <div class="dot"></div>
                    <a href="showEventRead.html?showNewEvent.id=<s:property value="id"/>"
                       title="<s:property value="title"/>" class="show_newEvents"><s:property value="title"/></a></li>
            </s:iterator>
        </ul>
    </div>
    <%--<div class="ad_img"></div>--%>

    <div class="ads sc_f">
        <%--<h3 class="h3_title">--%>
        <%--<s:property value="%{getText('system.advertisement')}"/>--%>
        <%--<div class="lead_img"></div>--%>
        <%--</h3>--%>
        <ul>
            <s:iterator value="coursesForAds">
                <li><a href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                       title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a></li>
            </s:iterator>
        </ul>

    </div>
</div>
<script type="text/javascript">
    $(function () {
        $(".menu_base_show").addClass("menu_base_current");
    });

    function becomeFans(obj, showID) {
        if (validateLogo()) {
            $.post("becomeFans.html", {'myShow.id': showID}, function (data) {
                $.fancybox({
                    content: data.message,
                    onComplete: function () {
                        setTimeout("$.fancybox.close();", "2000")
                    }
                });
                $(obj).html("<s:text name='user.add.focused'/>");
            });
        }
    }
</script>