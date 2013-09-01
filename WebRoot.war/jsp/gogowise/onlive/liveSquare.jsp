<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/square/square.css" rel="stylesheet"/>
<link type="text/css" href="css/onlive/live_square.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript" src="js/square/squreSubTitle.js"></script>


<div class="square_container">
    <s:hidden value="%{#session.userID}" id="hidSessionId"/>
    <div class="head_img">
        <p class="desc"><span class="big"><s:property value="%{getText('index.third.image.intro1')}"/></span><br/><br/><br/><s:property value="%{getText('index.third.image.intro2')}"/></p>
        <p class="handle">
            <a  class="handle_1" href="createOnlive.html"><s:property value="%{getText('onlive.creation')}"/></a>
            <a  class="handle_2" href="rangeLiveChannel.html"><s:property value="%{getText('onlive.ad.bdding')}"/></a>
        </p>
    </div>

    <div class="show_count sc_d">
        <h3 class="h3_title">
            <s:property value="%{getText('live.square.liveonlive.time.left')}"/>
        </h3>
        <div class="cont">
            <ul>
                <s:iterator value="liveChannelsOnline" status="idx">
                    <li>
                        <a class="img fl" href="liveTermBlog.html?channelTerms.id=<s:property value="theLatestChannelTerms.id"/>" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
                        <p class="focus fl"><s:property value="fansNum"/><s:property value="%{getText('the.num.of.focus.on.live.channel')}"/></p>
                        <p><a class="title fl" href="liveTermBlog.html?channelTerms.id=<s:property value="theLatestChannelTerms.id"/>" title="<s:property value="name"/>"><s:property value="name"/></a></p>
                        <p class="count" id ="liveChannelOnline_timeLeft<s:property value="#idx.index"/>"></p>
                    </li>
                    <script type="text/javascript">
                            $(document).ready(function () {
                                $("#liveChannelOnline_timeLeft<s:property value="#idx.index"/>").countdown({
                                    date:'<s:date name="theLatestChannelTerms.startTime" format="%{getText('date.formate.firstpage.course.startdate')}" />',
                                    onChange:function (event, timer) {},
                                    onComplete:function (event) {
                                        $(this).html("<s:property value="%{getText('live.term.is.on.living')}"/>");
                                    },
                                    htmlTemplate: "<span><b>%{d}</b><s:property value="%{getText('course.time.day')}" /><b> %{h}</b><s:property value="%{getText('course.time.hour')}" /><b>%{m}</b><s:property value="%{getText('course.time.minute')}" /><b>%{s}</b><s:property value="%{getText('course.tine.second')}" /></span>",
                                    leadingZero:true,
                                    direction:"down"
                                });
                                <%--$("#show_abstract<s:property value="#idx.index"/>").html(getSpecialSubString($("#show_abstract<s:property value="#idx.index"/>").html(),50));--%>
                            });
                        </script>
                </s:iterator>
            </ul>
        </div>
    </div>
    <div class="highlight sc_f live_trailer">
        <h3 class="h3_title">
            <s:property value="%{getText('gogowise.live.trailer')}"/>
        </h3>
        <ul>
            <s:iterator value="liveTrailers">
               <li>
                   <div class="dot"></div>
                   <a href="liveTrailerRead.html?liveTrailer.id=<s:property value="id"/>" title="<s:property value="title"/>" class="goGoWiseAnnounce_newEvents"><s:property value="title"/></a>
                   <span>--<s:date name="publishTime" format="%{getText('dateformat.forclass')}"/></span>
               </li>
            </s:iterator>
        </ul>
    </div>

    <%--<div class="ad_img"></div>--%>

    <s:if test="existOnlivings">
    <div class="new_items sc_e">
        <h3 class="h3_title">
            <s:property value="%{getText('live.term.is.on.living')}"/>
        </h3>
        <div class="cont">
            <ul>
               <s:iterator value="onlivings" status="idx">
               <li>
                    <a class="img" href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="id"/>" title="<s:property value="owner.nickName"/>"><img src="<s:property value="owner.pic"/>"/></a>
                    <a class="title" href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="id"/>" title="<s:property value="owner.nickName"/>"><s:property value="owner.nickName"/></a>
                    <s:if test="!owner.userFocused">
                       <a class="reserve" href="javascript:;" onclick="addUserFocus(this,<s:property value="owner.id"/>);" style="display: inline;"><s:property value="%{getText('user.add.focus')}"/></a>
                    </s:if>
                    <s:else>
                        <a class="reserve" href="javascript:;" onclick="addUserFocus(this,<s:property value="owner.id"/>);" style="display: inline;"><s:property value="%{getText('user.add.focused')}"/></a>
                    </s:else>
                    <div class="msg">
                        <span class="num num1"><s:property value="owner.fansNum"/><s:property value="%{getText('onlive.fensi')}"/></span>
                        <%--<span class="num num2"><s:property value="fansNum"/>粉丝</span>--%>
                    </div>
                    <span class="date"><s:property value="%{getText('course.start.time')}"/>：<s:date name="startTime" format="%{getText('dateformat.forclass')}" /></span>
               </li>
               </s:iterator>
            </ul>
        </div>
    </div>
    </s:if>

     <div class="new_items sc_e" id="hot_location">
        <h3 class="h3_title">
            <s:property value="%{getText('gogowise.hottest.liveChannel')}"/>
        </h3>
        <div class="cont">
            <ul>
               <s:iterator value="hotestLiveChannels" status="idx">
               <li>
                    <a class="img" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
                    <a class="title" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>" title="<s:property value="name"/>"><s:property value="name"/></a>
                    <s:if test="userType == 1">
                       <a class="reserve" href="javascript:;" id="focusButton<s:property value="#idx.index"/>" onclick="userAddFollows(this,<s:property value="id"/>);" style="display: inline;"><s:property value="%{getText('user.add.focus')}"/></a>
                    </s:if>
                    <s:else>
                        <a class="reserve" href="javascript:;" id="focusButton<s:property value="#idx.index"/>" onclick="userAddFollows(this,<s:property value="id"/>);" style="display: inline;"><s:property value="%{getText('user.add.focused')}"/></a>
                    </s:else>
                    <div class="msg">
                        <span class="num num1"><s:property value="totalInviteNum"/><s:property value="%{getText('show.total.invite.num.in.all')}"/></span>
                        <span class="num num2"><s:property value="fansNum"/><s:property value="%{getText('onlive.fensi')}"/></span>
                    </div>
                    <span class="date"><s:property value="%{getText('onlive.creation.time')}"/>：<s:date name="createTime" format="%{getText('dateformat.forclass')}" /></span>
               </li>
               </s:iterator>
            </ul>
        </div>
    </div>
    <div class="hot_persons sc_d">
        <h3 class="h3_title">
            <s:property value="%{getText('personalonlive.stars')}"/>
        </h3>
        <div class="cont">
            <ul>
                <s:iterator value="onliveStars">
                    <li>
                        <a class="img" href="userBlog.html?user.id=<s:property value="owner.id"/>" title="<s:property value="owner.nickName"/>"><img src="<s:property value="owner.pic"/>"/></a>
                        <a class="nick" href="userBlog.html?user.id=12" title="<s:property value="owner.id"/>"><s:property value="owner.nickName"/></a>
                        <span class="msg"><s:property value="owner.fansNum"/> <s:property value="%{getText('onlive.fensi')}"/> &nbsp;&nbsp;&nbsp;<s:property value="owner.onliveTimes"/><s:property value="%{getText('personal.onliv.times')}"/></span>
                        <s:if test="!owner.userFocused"><a class="focus" onclick="addUserFocus(this,<s:property value="owner.id"/>);"><s:property value="%{getText('user.add.focus')}"/></a></s:if>
                        <s:else><a class="focus" onclick="addUserFocus(this,<s:property value="owner.id"/>);"><s:property value="%{getText('user.add.focused')}"/></a></s:else>

                        <span class="title">
                            <s:if test="owner.selfDescription != null">
                                <s:property value="owner.selfDescription"/>
                            </s:if>
                            <s:else>
                                <s:property value="%{getText('user.without.self.desc')}"/>
                            </s:else>
                        </span>
                    </li>
                </s:iterator>
            </ul>
        </div>
    </div>

    <div class="highlight" style="margin-top: 20px;">
        <h3 class="h3_title">
            <s:property value="%{getText('live.square.new.events')}"/>
        </h3>
        <ul>
            <s:iterator value="liveChannelNewEvents">
               <li><div class="dot"></div><a href="liveChannelEventRead.html?liveChannelNewEvent.id=<s:property value="id"/>" title="<s:property value="title"/>" class="liveChannel_newEvents"><s:property value="title"/></a></li>
            </s:iterator>
        </ul>
        <script type="text/javascript">
            for(var i=0; i<$(".liveChannel_newEvents").size();i++){
              var str = $($(".liveChannel_newEvents")[i]).html();
              $($(".liveChannel_newEvents")[i]).html(getSubstringForCourseName(str));
            }
        </script>
    </div>
    <%--<div class="ad_img"></div>--%>

    <div class="ads">
        <ul>
            <s:iterator value="coursesForAds">
                <li><a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a></li>
           </s:iterator>
        </ul>

    </div>
</div>
<script type="text/javascript">
    $(function(){
        $(".menu_base_live").addClass("menu_base_current");
    });

   function userAddFollows(obj,liveChannelID){
        if(validateLogo()){
            $.post("addUser2LiveFollower.html",{'liveChannel.id':liveChannelID});
            $.fancybox({
                overlayShow:true,
                showCloseButton:true,
                content:"<div style='height: 40px;width: 300px;'><p align='center' style='line-height: 40px;'><s:property value="%{getText('success.to.add.livefollowers')}"/> &nbsp;&nbsp; <a href='javascript:;' onclick='$.fancybox.close();'></a></p></div>",
                onComplete: function(){ setTimeout("$.fancybox.close();","2000")}
            });
           $(obj).html("<s:text name='user.add.focused'/>");
        }
   }

   function addUserFocus(obj,ownerID){
         if(validateLogo()){
             $.post("addUserFocus.html",{'user.id':ownerID});
             $.fancybox({
                content:"<div style='height: 40px;width: 300px;'><p align='center' style='line-height: 40px;'><s:property value="%{getText('success.to.add.livefollowers')}"/></p></div>",
                onComplete: function(){ setTimeout("$.fancybox.close();","2000")}
            });
           $(obj).html("<s:text name='user.add.focused'/>");
         }
   }

</script>