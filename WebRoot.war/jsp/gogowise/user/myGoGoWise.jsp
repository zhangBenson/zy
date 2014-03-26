<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/user/user_center.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>

<div class="mfp">

<div class="mfp_left fl">
<div>
    <%--<a class="submit_btn_large" href="openUserChannelResult.html"><s:property value="%{getText('contentLeft.param1')}"/></a>--%>
    <s:if test="#session.user_own_org != null">
        <a  class="submit_btn_large" href="createCourseAllInOne.html"><s:property value="%{getText('course.create')}"/></a>
    </s:if>
</div>
<s:if test="existLatestCourse">
    <div class="usItem_wrap fl">
        <h3 class="h3_title"><s:property value="%{getText('course.upcoming')}"/></h3>
        <s:iterator value="latestCourse" status="idx">
            <div class="usItem_cont fl">
                <div class="logo_wrap fl"><a href="voaCourseBlog.html?course.id=<s:property value="id" />" title="<s:property value="name"/>"><img src="<s:property value="logoUrl" />"/></a></div>
                <div class="detail fl">
                    <a class="h_title" href="voaCourseBlog.html?course.id=<s:property value="id" />" title="<s:property value="name"/>"><s:property value="name"/></a>
                    <p>
                        <s:property value="%{getText('courses.info.lecturer')}" />：<s:a action="userBlog"><s:param name="user.id"  value="teacher.id"/><s:property value="teacher.nickName"/></s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;<s:date name="classOnTheCorner.date" format="%{getText('dateformat.forclass')}"/>
                    </p>
                    <strong><s:property value="%{getText('courses.time.left')}" />&nbsp;<b id="timeLeft<s:property value="#idx.index"/>"></b></strong>
                    <script type="text/javascript">
                        $("#timeLeft<s:property value="#idx.index"/>").countdown({
                            date:'<s:date name="classOnTheCorner.date" format="%{getText('date.formate.firstpage.course.startdate')}" />',
                            onChange:function (event, timer) {
                            },
                            onComplete:function (event) {
                                $(this).html("<s:text name='course.in.progress'/>");
                            },
                            htmlTemplate: "<span><b>%{d}</b><s:property value="%{getText('course.time.day')}" /><b> %{h}</b><s:property value="%{getText('course.time.hour')}" /><b>%{m}</b><s:property value="%{getText('course.time.minute')}" /><b>%{s}</b><s:property value="%{getText('course.tine.second')}" /></span>",
                            leadingZero:true,
                            direction:"down"
                        });
                    </script>
                </div>
                <div class="handle fr">
                    <a class="a_1" href="javascript:;"><s:property value="%{getText('class.count',{classOneTheCornerSequence})}"/></a>
                    <a class="a_2" href="javascript:getVideoUrl('<s:property value="classOnTheCorner.id"/>','<s:property value="teachingNum"/>');"><s:property value="%{getText('button.start.class')}"/></a>
                </div>
                <div class="desc fl">
                    <p><s:property value="description"/></p>
                </div>
            </div>
        </s:iterator>
    </div>
</s:if>

<s:if test="existShow">
    <div class="usItem_wrap fl">
        <h3 class="h3_title"><s:property value="%{getText('myfirst.page.coming.show')}"/></h3>
        <s:iterator value="myShows" status="idx">
            <div class="usItem_cont fl">
                <div class="logo_wrap fl"><a href="showBlog.html?myShow.id=<s:property value="id" />" title="<s:property value="name"/>"><img src="<s:property value="logoUrl" />"/></a></div>
                <div class="detail fl">
                    <a class="h_title" href="showBlog.html?myShow.id=<s:property value="id" />" title="<s:property value="name"/>"><s:property value="name"/></a>
                    <p>
                        <s:property value="%{getText('myfirst.page.show.host.name')}"/>：<s:a action="userBlog"><s:param name="user.id"  value="owner.id"/><s:property value="owner.nickName"/></s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;<s:date name="firstFutureTerm.startTime" format="%{getText('dateformat.forclass')}"/>
                    </p>
                    <strong><s:property value="%{getText('myfirst.page.show.letf.time')}"/>&nbsp;<b id="showTimeleft<s:property value="#idx.index"/>"></b></strong>
                    <script type="text/javascript">
                        $("#showTimeleft<s:property value="#idx.index"/>").countdown({
                            date:'<s:date name="firstFutureTerm.startTime" format="%{getText('date.formate.firstpage.course.startdate')}" />',
                            onChange:function (event, timer) {},
                            onComplete:function (event) {
                                $(this).html("<s:text name='live.term.is.on.living'/>");
                            },
                            htmlTemplate: "<span><b>%{d}</b><s:property value="%{getText('course.time.day')}" /><b> %{h}</b><s:property value="%{getText('course.time.hour')}" /><b>%{m}</b><s:property value="%{getText('course.time.minute')}" /><b>%{s}</b><s:property value="%{getText('course.tine.second')}" /></span>",
                            leadingZero:true,
                            direction:"down"
                        });
                    </script>
                </div>
                <div class="handle fr">
                    <a class="a_1" href="javascript:;"><s:property value="%{getText('shows.count',{firstFutureTermSquence})}"/></a>
                    <a class="a_2" href="startShow.html?showTerms.id=<s:property value="firstFutureTerm.id"/>" ><s:property value="%{getText('myfirst.page.start.show')}"/></a>
                </div>
                <div class="desc fl">
                    <p><s:property value="description"/></p>
                </div>
            </div>
        </s:iterator>
    </div>
</s:if>

<%--<s:if test="existLiveChannel">--%>
<%--<div class="usItem_wrap fl">--%>
<%--<h3 class="h3_title"><s:property value="%{getText('the.onlive.on.the.corner')}"/></h3>--%>
<%--<s:iterator value="liveChannels" status="idx">--%>
<%--<div class="usItem_cont fl">--%>
<%--<div class="logo_wrap fl"><a href="liveTermBlog.html?channelTerms.id=<s:property value="theLatestChannelTerms.id"/>" title="<s:property value="name"/>"><img src="<s:property value="logoUrl" />"/></a></div>--%>
<%--<div class="detail fl">--%>
<%--<a class="h_title" href="liveTermBlog.html?channelTerms.id=<s:property value="theLatestChannelTerms.id"/>" title="<s:property value="name"/>"><s:property value="name"/></a>--%>
<%--<p>--%>
<%--<s:property value="%{getText('onlive.host.name')}"/>：<s:a action="userBlog"><s:param name="user.id"  value="theLatestChannelTerms.host.id"/><s:property value="theLatestChannelTerms.host.nickName"/></s:a>--%>
<%--&nbsp;&nbsp;&nbsp;&nbsp;<s:date name="theLatestChannelTerms.startTime" format="%{getText('dateformat.forclass')}"/>--%>
<%--</p>--%>
<%--<strong><s:property value="%{getText('myfirst.page.onlive.left.time')}"/>&nbsp;<b id="liveChannelTimeLeft<s:property value="#idx.index"/>"></b></strong>--%>
<%--<script type="text/javascript">--%>
<%--$("#liveChannelTimeLeft<s:property value="#idx.index"/>").countdown({--%>
<%--date:'<s:date name="theLatestChannelTerms.startTime" format="%{getText('date.formate.firstpage.course.startdate')}" />',--%>
<%--onChange:function (event, timer) {},--%>
<%--onComplete:function (event) {--%>
<%--$(this).html("<s:text name='live.term.is.on.living'/>");--%>
<%--},--%>
<%--htmlTemplate: "<span><b>%{d}</b><s:property value="%{getText('course.time.day')}" /><b> %{h}</b><s:property value="%{getText('course.time.hour')}" /><b>%{m}</b><s:property value="%{getText('course.time.minute')}" /><b>%{s}</b><s:property value="%{getText('course.tine.second')}" /></span>",--%>
<%--leadingZero:true,--%>
<%--direction:"down"--%>
<%--});--%>
<%--</script>--%>
<%--</div>--%>
<%--<div class="handle fr">--%>
<%--<a class="a_1" href="javascript:;"><s:property value="%{getText('the.onlive.contestants')}"/></a>--%>
<%--<a class="a_2" href="startOnLive.html?channelTerms.id=<s:property value="theLatestChannelTerms.id"/>" >--%>
<%--<s:if test="userType == 0">--%>
<%--<s:property value="%{getText('the.onlive.start.watch')}"/>--%>
<%--</s:if>--%>
<%--<s:else>--%>
<%--<s:property value="%{getText('frame.index.start.onlive')}"/>--%>
<%--</s:else>--%>
<%--</a>--%>
<%--<div class="candidate">--%>
<%--<table class="interviewees_list" cellpadding="0" cellspacing="0">--%>
<%--<tr><td colspan="3" width="370px;">--%>
<%--<s:property value="%{getText('channel.term.contetant')}"/>：<span class="orangeWords"><s:property value="theLatestChannelTerms.contestantsNum"/></span><s:property value="%{getText('label.person')}"/>，<s:property value="%{getText('label.is.confirm')}"/>：<span class="orangeWords"><s:property value="theLatestChannelTerms.acceptContestantsNum"/></span><s:property value="%{getText('label.person')}"/>--%>
<%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--<s:property value="%{getText('channel.term.guest')}"/>：<span class="orangeWords"><s:property value="theLatestChannelTerms.guestsNum"/></span><s:property value="%{getText('label.person')}"/>，<s:property value="%{getText('label.is.confirm')}"/>：<span class="orangeWords"><s:property value="theLatestChannelTerms.acceptGuestsNum"/></span><s:property value="%{getText('label.person')}"/>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr><td width="145px"><s:property value="%{getText('msg.email')}"/></td>--%>
<%--<td width="135px"><s:property value="%{getText('menber.reg.nickName')}"/></td>--%>
<%--<td width="70px"><s:property value="%{getText('label.status')}"/></td></tr>--%>
<%--<s:iterator value="theLatestChannelTerms.memberOfLiveChannels">--%>
<%--<tr><td width="145px"><span class="orangeWords"><s:property value="memberEmail"/></span></td>--%>
<%--<td width="135px"><span class="orangeWords"><s:property value="member.nickName"/></span></td>--%>
<%--<td width="70px"><span class="orangeWords"><s:property value="%{getText('label.interviewee.accept.'+acceptInvite)}"/></span></td></tr>--%>
<%--</s:iterator>--%>
<%--</table>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="desc fl">--%>
<%--<p><s:property value="description"/></p>--%>
<%--</div>--%>
<%--</div>--%>
<%--</s:iterator>--%>
<%--</div>--%>
<%--</s:if>--%>

<s:if test="existInterview">
    <div class="usItem_wrap fl">
        <h3 class="h3_title"><s:property value="%{getText('interview.upcoming')}"/></h3>
        <s:iterator value="interviews" status="idx">
            <div class="usItem_cont fl">
                <div class="logo_wrap fl"><a href="orgBlog.html?org.id=<s:property value="organization.id"/>" title="<s:property value="organization.schoolName"/>"><img src="<s:property value="organization.logoUrl"/>"/></a></div>
                <div class="detail fl">
                    <a class="h_title" href="orgBlog.html?org.id=<s:property value="organization.id"/>" title="<s:property value="organization.schoolName"/>"><s:property value="organization.schoolName"/></a>
                    <p>
                        <s:property value="%{getText('onlive.host.name')}"/>：<s:a action="userBlog"><s:param name="user.id"  value="interviewer.id"/><s:property value="interviewer.nickName"/></s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;<s:date name="startTime" format="%{getText('dateformat.forclass')}"/>
                    </p>
                    <strong><s:property value="%{getText('courses.time.left')}" />&nbsp;<b id="interviewTimeLeft<s:property value="#idx.index"/>"></b></strong>
                    <script type="text/javascript">
                        $("#interviewTimeLeft<s:property value="#idx.index"/>").countdown({
                            date:'<s:date name="startTime" format="%{getText('date.formate.firstpage.course.startdate')}" />',
                            onChange:function (event, timer) {},
                            onComplete:function (event) {
                                $(this).html("<s:text name='interview.in.progress'/>");
                            },
                            htmlTemplate: "<span><b>%{d}</b><s:property value="%{getText('course.time.day')}" /><b> %{h}</b><s:property value="%{getText('course.time.hour')}" /><b>%{m}</b><s:property value="%{getText('course.time.minute')}" /><b>%{s}</b><s:property value="%{getText('course.tine.second')}" /></span>",
                            leadingZero:true,
                            direction:"down"
                        });
                    </script>
                </div>
                <div class="handle fr">
                    <a class="a_1" href="javascript:;"><s:property value="%{getText('link.check.interview')}"/></a>
                    <a class="a_2" href="interviewVideo.html?interview.id=<s:property value="id"/>"><s:property value="%{getText('button.start.interview')}"/></a>
                    <div class="candidate">
                        <table class="interviewees_list" cellpadding="0" cellspacing="0">
                            <tr><td colspan="3" width="370px;"><s:property value="%{getText('label.candidature')}"/>：<span class="orangeWords"><s:property value="intervieweeNum"/></span><s:property value="%{getText('label.person')}"/>，<s:property value="%{getText('label.is.confirm')}"/>：<span class="orangeWords"><s:property value="intervieweeRealNum"/></span><s:property value="%{getText('label.person')}"/></td></tr>
                            <tr><td width="145px"><s:property value="%{getText('msg.email')}"/></td>
                                <td width="135px"><s:property value="%{getText('menber.reg.nickName')}"/></td>
                                <td width="70px"><s:property value="%{getText('label.status')}"/></td></tr>
                            <s:iterator value="interviewAppointers">
                                <tr><td width="145px"><span class="orangeWords"><s:property value="intervieweeEmail"/></span></td>
                                    <td width="135px"><span class="orangeWords"><s:property value="interviewee.nickName"/></span></td>
                                    <td width="70px"><span class="orangeWords"><s:property value="%{getText('label.interviewee.accept.'+accept)}"/></span></td></tr>
                            </s:iterator>
                        </table>
                    </div>
                </div>
                <div class="desc fl">
                    <p><s:property value="content"/></p>
                </div>
            </div>
        </s:iterator>
    </div>
</s:if>

<s:if test="existMeeting">
    <div class="usItem_wrap fl">
        <h3 class="h3_title"><s:property value="%{getText('org.meeting.upcoming')}"/></h3>
        <s:iterator value="orgMeetings" status="idx">
            <div class="usItem_cont fl">
                <div class="logo_wrap fl"><a href="orgBlog.html?org.id=<s:property value="organization.id"/>" title="<s:property value="organization.schoolName"/>"><img src="<s:property value="organization.logoUrl"/>"/></a></div>
                <div class="detail fl">
                    <a class="h_title" href="orgBlog.html?org.id=<s:property value="organization.id"/>" title="<s:property value="organization.schoolName"/>"><s:property value="organization.schoolName"/></a>
                    <p>
                        <s:property value="%{getText('onlive.host.name')}"/>：<s:a action="userBlog"><s:param name="user.id"  value="hostMan.id"/><s:property value="hostMan.nickName"/></s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;<s:date name="startTime" format="%{getText('dateformat.forclass')}"/>
                    </p>
                    <strong><s:property value="%{getText('courses.time.left')}" />&nbsp;<b id="meetingTimeLeft<s:property value="#idx.index"/>"></b></strong>
                    <script type="text/javascript">
                        $("#meetingTimeLeft<s:property value="#idx.index"/>").countdown({
                            date:'<s:date name="startTime" format="%{getText('date.formate.firstpage.course.startdate')}" />',
                            onChange:function (event, timer) {},
                            onComplete:function (event) {
                                $(this).html("<s:text name='meeting.in.progress'/>");
                            },
                            htmlTemplate: "<span><b>%{d}</b><s:property value="%{getText('course.time.day')}" /><b> %{h}</b><s:property value="%{getText('course.time.hour')}" /><b>%{m}</b><s:property value="%{getText('course.time.minute')}" /><b>%{s}</b><s:property value="%{getText('course.tine.second')}" /></span>",
                            leadingZero:true,
                            direction:"down"
                        });
                    </script>
                </div>
                <div class="handle fr">
                    <a class="a_1" href="javascript:;"><s:property value="%{getText('org.meeting.member')}"/></a>
                    <a class="a_2" href="startMeeting.html?orgMeeting.id=<s:property value="id"/>"><s:property value="%{getText('org.meeting.startTime')}"/></a>
                    <div class="candidate">
                        <table class="interviewees_list" cellpadding="0" cellspacing="0">
                            <tr><td colspan="3" width="370px;"><s:property value="%{getText('label.orgMeeting.attendee')}"/>：<span class="orangeWords"><s:property value="memberNum"/></span><s:property value="%{getText('label.person')}"/>，<s:property value="%{getText('label.is.confirm')}"/>：<span class="orangeWords"><s:property value="memberConfirmedNum"/></span><s:property value="%{getText('label.person')}"/></td></tr>
                            <tr><td width="145px"><s:property value="%{getText('msg.email')}"/></td>
                                <td width="135px"><s:property value="%{getText('menber.reg.nickName')}"/></td>
                                <td width="70px"><s:property value="%{getText('label.status')}"/></td></tr>
                            <s:iterator value="orgMeetingMembers">
                                <tr><td width="145px"><span class="orangeWords"><s:property value="memberEmail"/></span></td>
                                    <td width="135px"><span class="orangeWords"><s:property value="member.nickName"/></span></td>
                                    <td width="70px"><span class="orangeWords"><s:property value="%{getText('label.interviewee.accept.'+accept)}"/></span></td></tr>
                            </s:iterator>
                        </table>
                    </div>
                </div>
                <div class="desc fl">
                    <p><s:property value="content"/></p>
                </div>
            </div>
        </s:iterator>
    </div>
</s:if>

<div class="usItem2_wrap fl">
    <h3 class="h3_title"><s:property value="%{getText('usermenu.item.newestcourses')}"/></h3>
    <ul>
        <s:iterator value="hotCourse">
            <li>
                <a class="img" href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
                <a class="title" href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"><s:property value="name"/></a>
            </li>
        </s:iterator>
    </ul>
</div>

<div class="usItem2_wrap fl">
    <h3 class="h3_title"><s:property value="%{getText('course.interested')}"/></h3>
    <ul>
        <s:iterator value="userLikeCourse">
            <li>
                <a class="img" href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
                <a class="title" href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"><s:property value="name"/></a>
            </li>
        </s:iterator>
    </ul>
</div>
</div>


<div class="mfp_right fl">
    <div class="rtItem1 fl">
        <h3 class="h3_title"><s:property value="%{getText('title.newest.notifications')}"/></h3>
        <s:if test="matterCount != 0">
            <div class="message_tip" id="message_tip_elipse" title="<s:property value="matterCount"/><s:property value="%{getText('my.firstpage.new.matter.num')}"/>"><s:property value="matterCount"/> </div>
            <div id="message_box" class="message_box"></div>
        </s:if>
        <ul>
            <li>
                <a class="fl daynew"><s:property value="%{getText('course.yesterday')}"/></a>
                <s:if test="yesterdayCourse">
                    <p class="rt_detail fl">
                        <a class="img" href="voaCourseBlog.html?course.id=<s:property value='yesterdayCourse.id' />" title="<s:property value='yesterdayCourse.name' />"><img src="<s:property value='yesterdayCourse.logoUrl' />"/></a>
                        <a class="title" href="voaCourseBlog.html?course.id=<s:property value='yesterdayCourse.id' />" title="<s:property value='yesterdayCourse.name' />"><s:property value='yesterdayCourse.name' /></a>
                        <span><s:date name="yesterdayCourse.classOnTheCorner.date" format="%{getText('dateformat.forclass')}"/></span>
                    </p>
                </s:if>
                <s:else>
                    <p class="no_course"><s:property value="%{getText('msg.nocourse')}"/></p>
                </s:else>
            </li>
            <li>
                <a class="fl daynew"><s:property value="%{getText('course.today')}"/></a>
                <s:if test="todayCourse">
                    <p class="rt_detail fl">
                        <a class="img" href="openClassSession.html?courseClass.id=<s:property value='todayCourse.classOnTheCorner.id' />" title="<s:property value="%{getText('button.start.class')}" />"><img src="<s:property value='todayCourse.logoUrl' />"/></a>
                        <a class="title" href="voaCourseBlog.html?course.id=<s:property value='todayCours.id' />" title="<s:property value='todayCourse.name' />"><s:property value='todayCourse.name' /></a>
                        <span><s:date name="todayCourse.classOnTheCorner.date" format="%{getText('dateformat.forclass')}"/></span>
                    </p>
                </s:if>
                <s:else>
                    <p class="no_course"><s:property value="%{getText('msg.nocourse')}"/></p>
                </s:else>
            </li>
            <li>
                <a class="fl daynew"><s:property value="%{getText('course.tomorrow')}"/></a>
                <s:if test="tomorrowCourse">
                    <p class="rt_detail fl">
                        <a class="img" href="voaCourseBlog.html?course.id=<s:property value='tomorrowCourse.id' />" title="<s:property value='tomorrowCourse.name' />"><img src="<s:property value='tomorrowCourse.logoUrl' />"/></a>
                        <a class="title" href="voaCourseBlog.html?course.id=<s:property value='tomorrowCourse.id' />" title="<s:property value='tomorrowCourse.name' />"><s:property value='tomorrowCourse.name' /></a>
                        <span><s:date name="tomorrowCourse.classOnTheCorner.date" format="%{getText('dateformat.forclass')}"/></span>
                    </p>
                </s:if>
                <s:else>
                    <p class="no_course"><s:property value="%{getText('msg.nocourse')}"/></p>
                </s:else>
            </li>
        </ul>
    </div>

    <div class="rtItem2 fl">
        <h3 class="h3_title"><s:property value="%{getText('title.courses.browsed')}"/></h3>
        <ul>
            <s:iterator value="browsedCourses">
                <li>
                    <a class="img" href="voaCourseBlog.html?course.id=<s:property value="course.id"/>" title="<s:property value="course.name"/>"><img src="<s:property value="course.logoUrl"/>"/></a>
                    <a class="title" href="voaCourseBlog.html?course.id=<s:property value="course.id"/>" title="<s:property value="course.name"/>"><s:property value="course.name"/></a>
                </li>
            </s:iterator>
        </ul>
    </div>

    <s:if test="existUserFanses">
        <li class="rtItem3 fl" id="userFans_data">
            <h3 class="h3_title"><s:property value="%{getText('my.firstpage.users.i.followed')}"/></h3>
                <%--<s:property value="userFansNum"/>--%>
                <%--<s:if test="currentPageSize >= 6">--%>
            <span class="more"><a href="followedUserList.html"><s:property value="%{getText('others.more')}"/></a></span>
                <%--</s:if>--%>
            <ul class="courseul">
                <s:iterator value="userFanses">
                    <li class="host">
                        <a class="host_img" href="userBlog.html?user.id=<s:property value="user.id"/>" title="<s:property value="user.nickName"/>"><img src="<s:property value="user.pic"/>"/></a>
                        <a class="host_name" href="userBlog.html?user.id=<s:property value="user.id"/>" title="<s:property value="user.nickName"/>"><s:property value="user.nickName"/></a>

                        <s:if test="userLiving">
                            <a class="live_tip" href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="personalOnliveID"/>" title="<s:property value="%{getText('click.to.watch')}"/>"><s:property value="%{getText('video.is.living')}"/></a>
                        </s:if>
                    </li>
                </s:iterator>
                <script type="text/javascript">
                    function getMoreConcernUserFans(){
                        $.post("getMoreConcernUserFans.html",{'currentPageSize':<s:property value="currentPageSize"/>},function(data){
                            $("#userFans_data").html(data);
                        })
                    }
                </script>
            </ul>
        </li>
    </s:if>
</div>
</div>

<script type="text/javascript">
    var sendRequest=0;
    var total_message_number = <s:property value="matterCount"/>;

    $(document).ready(function(){
        $(".menu_base_userCenter").addClass("menu_base_current");

        $(".daynew").click(function(){
            $(this).parent().children("p").slideToggle();
        });

        $(".handle .a_1").click(function(){
            $(this).parent().children(".candidate").slideToggle();
            $(".candidate").not($(this).parent().children(".candidate")).hide();
        });

        $("#message_tip_elipse").click(function(){
            $(this).siblings("div.message_box").toggle();
            if($(this).css("background-position")=="0px -52px"){
                $(this).css("background-position","0px 0px");
            }else{
                $(this).css("background-position","0px -52px");
            }
            if(sendRequest==0){
                $.post('initMatters.html',{}, function(data) {
                    $('#message_box').html(data);
                    sendRequest=1;
                });
            }
        });

        $(document).click(function(event){
            if($(".candidate").is(":visible") && !$(event.target).isChildAndSelfOf($(".candidate")) && !$(event.target).isChildAndSelfOf($(".handle .a_1"))){
                $(".candidate").hide();
            }
            if($("div.message_box").is(":visible") && !$(event.target).isChildAndSelfOf($("div.message_box")) && !$(event.target).isChildAndSelfOf($("#message_tip_elipse"))){
                $("div.message_box").hide();
                $("div.message_tip").css("background-position","0px 0px");
            }
        });

    });
    jQuery.fn.isChildAndSelfOf = function(b){
        return (this.closest(b).length > 0);
    };

    function getVideoUrl(cid,type){
        if(type == 1){
            window.location.href = "openClassSession.html?courseClass.id="+cid;
        }
        if(type == 2){
            window.location.href = "one2twoSession.html?courseClass.id="+cid;
        }
        if(type == 3){
            window.location.href = "one2threeSession.html?courseClass.id="+cid;
        }
        if(type == 4){
//           window.location.href = "one2manySession.html?courseClass.id="+cid;
            window.location.href = "lecturerClass.html?courseClass.id="+cid;
        }
    }
</script>