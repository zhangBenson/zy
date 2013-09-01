<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/index.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript">
    var current = 0,count = 0,interval = 0,INTERVAL_TIME = 6000;  //current:当前显示的位置值(以0为基准)
    $(function(){
        count = $("ul.cont li").length;

        $(".menu_base_home").addClass("menu_base_current");
        for(var i=0;i < count;i++){
            //<![CDATA[
                $(".btn").append("<a>"+(i+1)+"</a>");
            //]]>
        }
        $(".btn a").eq(0).addClass("stand_out");
        $("ul.cont li").eq(0).fadeIn(600);
        $("div.btn a").click(function(){
            if($(this).hasClass("stand_out")) return;
            current = $(this).text() - 1;
            $("ul.cont li").filter(":visible").fadeOut(400);
            $("ul.cont li").eq(current).fadeIn(800);
            $(this).siblings().removeClass("stand_out");
            $(this).addClass("stand_out");
        });

        interval = window.setInterval("showAuto();",INTERVAL_TIME);
        $("ul.cont li").hover(function(){
            window.clearInterval(interval);
        },function(){
            interval = window.setInterval("showAuto();",INTERVAL_TIME);
        });
    });

    function showAuto(){
        current = (current >= count-1) ? 0 : (++current);
        $("div.btn a").eq(current).trigger("click");
    }
</script>

<div class="scroll">
    <ul class="cont">
        <li>
            <img src="images/index/bg_remote_eye.jpg" alt="picture"/>
            <p class="desc desc_live">
                    <s:property value="%{getText('index.desc.onlive')}"/>
            </p>
            <p class="handle handle_live">
                <a  class="handle_1" href="startPersonalOnlive.html"><s:property value="%{getText('index.btn.start.broadcast')}"/></a>
                <a  class="handle_2" href="liveGoingList.html"><s:property value="%{getText('index.btn.pay.visit')}"/></a>
            </p>
        </li>
        <li>
            <img src="images/index/bg_control_room.jpg" alt="picture"/>
            <p class="desc desc_control_room">
                <s:property value="%{getText('index.desc.monitor')}"/>
            </p>
            <p class="handle handle_live">
                <a  class="handle_1" href="openUserChannelResult.html"><s:property value="%{getText('contentLeft.param1')}"/></a>
                <a  class="handle_2" href="downloadRemoteEye.html"><s:property value="%{getText('control.room.ggw.remote.eye')}"/></a>
            </p>
        </li>
        <%--<li>--%>
            <%--<a href="courseCompetition.html"><img src="images/index/index_bg_0.jpg"/></a>--%>
            <%--<a class="create_course" title="" href="createCourseAllInOne.html"></a>--%>
        <%--</li>--%>
        <li>
            <a href="courseSquare.html"><img src="images/index/index_bg_1.jpg" alt="picture"/></a>
            <p class="desc desc_course">
                <span class="big h_title"><s:property value="%{getText('index.not.need.install.soft')}"/></span><br/><br/>
                <s:property value="%{getText('index.first.page.intro')}"/><br/>
                <s:property value="%{getText('index.first.page.intro2')}"/>
            </p>
            <p class="handle handle_course">
                <a class="handle_1" href="createCourseAllInOne.html"><s:property value="%{getText('course.square.be.teacher')}"/></a>
                <a class="handle_2" href="searchResult.html?searchType=4"><s:property value="%{getText('course.square.be.student')}"/></a>
            </p>
        </li>
        <li>
            <a href="showSquare.html"><img src="images/index/index_bg_2.jpg" alt="picture"/></a>
            <p class="desc desc_square"><span class="big h_title"><s:property value="%{getText('index.second.image.intro1')}"/></span><br/><br/><s:property value="%{getText('index.second.image.intro2')}"/></p>
            <p class="handle handle_square">
                <a  class="handle_1" href="initShowCreate.html"><s:property value="%{getText('show.creation')}"/></a>
                <a  class="handle_2" href="showRangeBoard.html"><s:property value="%{getText('show.ads.bidding')}"/></a>
            </p>
        </li>
        <%--<li>--%>
            <%--<a href="courseSquare.html"><img src="images/index/index_bg_3.jpg"/></a>--%>
            <%--<p class="desc"><br/><span class="big h_title"><s:property value="%{getText('index.third.image.intro1')}"/></span><br/><br/><s:property value="%{getText('index.third.image.intro2')}"/></p>--%>
            <%--&lt;%&ndash;<s:if test="enteredRoom == null || !enteredRoom"><a class="begin_live act_btn" href="startPersonalOnlive.html"><s:property value="%{getText('frame.index.start.onlive')}"/></a></s:if>&ndash;%&gt;--%>
            <%--<p class="handle">--%>
                <%--<a  class="handle_1" href="createOnlive.html"><s:property value="%{getText('onlive.channel.creation')}"/></a>--%>
                <%--<a  class="handle_2" href="rangeLiveChannel.html"><s:property value="%{getText('onlive.ad.bdding')}"/></a>--%>
            <%--</p>--%>
        <%--</li>--%>
        <%--<li>--%>
            <%--<a href="aboutUs.html"><img src="images/index/index_bg_4.jpg"/></a>--%>
            <%--<p class="desc desc_square"><span class="big h_title"><s:property value="%{getText('title.gogowise')}"/></span><br/><br/><s:property value="%{getText('the.place.to.share.happiness.and.knowlege')}"/></p>--%>
            <%--<p class="handle handle_square">--%>
                <%--<a class="handle_2" href="javascript:;"><s:property value="%{getText('zixun.online')}"/></a>--%>
                <%--<a class="handle_3" href="javascript:;"><s:property value="%{getText('link.contact.us')}"/></a>--%>
            <%--</p>--%>
        <%--</li>--%>
    </ul>
    <div class="btn">
        <%--<a class="stand_out" alt="0">1</a>--%>
    </div>
</div>

<div class="kind-list">
    <div style="float: left;width: 1100px;">

        <s:if test="personalOnlives.size != 0">
        <div class="live_list term-list">
            <h3 class="h3_title"><s:property value="%{getText('index.onlive.online')}"/></h3>
            <%--<s:if test="personalOnlivesNum == 3">--%>
                <a class="a_more" href="liveGoingList.html"><s:property value="%{getText('others.more')}"/></a>
            <%--</s:if>--%>
            <ul>
                <s:iterator value="personalOnlives">
                <li>
                    <a href="userBlog.html?user.id=<s:property value="owner.id"/>" class="a_img" title="<s:property value="owner.nickName"/>"><img src="<s:property value="owner.pic"/>" alt="picture"/></a>
                    <a href="userBlog.html?user.id=<s:property value="owner.id"/>" class="a_title" title="<s:property value="owner.nickName"/>"><s:property value="owner.nickName"/></a>
                    <a href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="id"/>" class="a_focus"><s:property value="%{getText('click.to.watch')}"/></a>
                    <a href="liveOnMap.html?personalOnlive.id=<s:property value="id"/>" class="a_focus" target="_blank"><s:property value="%{getText('map.index.param1')}"/></a>
                </li>
                </s:iterator>
            </ul>
        </div>
        </s:if>

        <s:if test="coursesNum != 0">
        <div class="term-list">
            <h3 class="h3_title"><s:property value="%{getText('course.hottest')}"/></h3>
            <s:if test="coursesNum == 3"><a class="a_more" href="courseHotList.html"><s:property value="%{getText('others.more')}"/></a></s:if>
            <ul>
                <s:iterator value="courses">
                <li>
                    <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" class="a_img" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>" alt="picture"/></a>
                    <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" class="a_title" title="<s:property value="name"/>"><s:property value="name"/></a>
                    <span><s:date name="publicationTime" format="%{getText('dateformat.forclass')}"/></span>
                </li>
                </s:iterator>
            </ul>
        </div>
        </s:if>

        <s:if test="showsNum != 0">
        <div class="term-list">
            <h3 class="h3_title"><s:property value="%{getText('show.square.hottest')}"/></h3>
            <s:if test="showsNum == 3"><a class="a_more" href="showHotList.html"><s:property value="%{getText('others.more')}"/></a></s:if>
            <ul>
               <s:iterator value="myShows">
                <li>
                    <a href="showBlog.html?myShow.id=<s:property value="id"/>" class="a_img" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>" alt="picture"/></a>
                    <a href="showBlog.html?myShow.id=<s:property value="id"/>" class="a_title" title="<s:property value="name"/>"><s:property value="name"/></a>
                    <span><s:date name="publishTime" format="%{getText('dateformat.forclass')}"/></span>
                </li>
                </s:iterator>
            </ul>
        </div>
        </s:if>

       <%--<s:if test="personalOnlivesNum != 0">--%>
        <div class="live_list term-list">
            <h3 class="h3_title"><s:property value="%{getText('index.onlive.hottest')}"/></h3>
            <%--<s:if test="personalOnlivesNum == 3">--%>
                <a class="a_more" href="hotOnLiveList.html"><s:property value="%{getText('others.more')}"/></a>
            <%--</s:if>--%>
            <ul>
                <s:iterator value="hottestOnlives">
                <li>
                    <a href="userBlog.html?user.id=<s:property value="owner.id"/>" class="a_img" title="<s:property value="owner.nickName"/>"><img src="<s:property value="owner.pic"/>" alt="picture"/></a>
                    <a href="userBlog.html?user.id=<s:property value="owner.id"/>" class="a_title" title="<s:property value="owner.nickName"/>"><s:property value="owner.nickName"/></a>
                    <span><s:property value="title"/></span>
                    <span><s:date name="startTime" format="%{getText('dateformat')}"/></span>
                </li>
                </s:iterator>
            </ul>
        </div>
        <%--</s:if>--%>

        <%--<s:if test="liveChannelsNum != 0">--%>
        <%--<div class="term-list">--%>
            <%--<h3 class="h3_title"><s:property value="%{getText('index.onlive.hottest')}"/></h3>--%>
            <%--<s:if test="liveChannelsNum == 3"><a class="a_more" href="liveHotList.html"><s:property value="%{getText('others.more')}"/></a></s:if>--%>
            <%--<ul>--%>
               <%--<s:iterator value="liveChannels">--%>
                <%--<li>--%>
                    <%--<a href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>" class="a_img" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>--%>
                    <%--<a href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>" class="a_title" title="<s:property value="name"/>"><s:property value="name"/></a>--%>
                    <%--<span><s:date name="createTime" format="%{getText('dateformat.forclass')}"/></span>--%>
                <%--</li>--%>
                <%--</s:iterator>--%>
            <%--</ul>--%>
        <%--</div>--%>
        <%--</s:if>--%>
    </div>
</div>

<div class="roles">
    <h3 class="h3_title"><s:property value="%{getText('label.have.a.try')}"/></h3>
    <ul>
        <li>
            <a href="createCourseAllInOne.html"><s:property value="%{getText('index.function.to.be.teacher')}"/></a>
            <p><s:property value="%{getText('to.be.teacher.intro')}"/></p>
        </li>
        <li>
            <a href="searchResult.html?searchType=4"><s:property value="%{getText('index.function.search.course')}"/></a>
            <p><s:property value="%{getText('search.course.intro')}"/></p>
        </li>
        <li>
            <a href="initShowCreate.html"><s:property value="%{getText('index.function.create.show')}"/></a>
            <p><s:property value="%{getText('create.show.intro')}"/></p>
        </li>
        <li>
            <a href="openUserChannelResult.html"><s:property value="%{getText('index.function.MySupervising')}"/></a>
            <p><s:property value="%{getText('index.function.MySupervising.info')}"/></p>
        </li>
        <%--<li>--%>
            <%--<a href="createOnlive.html"><s:property value="%{getText('index.function.create.liveChannel')}"/></a>--%>
            <%--<p><s:property value="%{getText('create.liveChannel.intro')}"/></p>--%>
        <%--</li>--%>
        <li>
            <a href="initOrgLeague.html"><s:property value="%{getText('usermenu.item.organizationleague')}"/></a>
            <p><s:property value="%{getText('add.org.intro')}"/></p>
        </li>
    </ul>
</div>