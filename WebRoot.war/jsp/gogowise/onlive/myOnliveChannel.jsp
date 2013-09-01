<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/recommendForFriend_js.jsp" %>
<%--<link href="css/onlive/myOnlive.css" rel="stylesheet" type="text/css"/>--%>
<link href="css/user/user_center_list.css" rel="stylesheet" type="text/css"/>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="stand_out">
            <a href="initMyOnlive.html"><s:property value="%{getText('my.onlive')}"/></a>
        </li>
        <li class="">
            <a href="listParticipatingChannel.html"><s:property value="%{getText('usermenu.item.my.partispate.channel')}"/></a>
        </li>
        <li class="">
            <a href="listFollowingChannel.html"><s:property value="%{getText('usermenu.item.my.focused.channel')}"/></a>
        </li>
        <li class="">
            <a href="createOnlive.html"><s:property value="%{getText('onlive.creation')}"/></a>
        </li>
        <li class="">
            <a href="rangeLiveChannel.html"><s:property value="%{getText('onlive.channel.range')}"/></a>
        </li>
    </ul>
</div>
<div class="mf_2">
    <div class="overview cf">
        <div class="sub_info fl">
            <p class="number"><s:property value="totalNumOfViewOnlive"/><span><s:property value="%{getText('onlive.fensi')}"/></span></p>

            <p class="describe"><s:property value="%{getText('the.num.of.watched.my.onlive')}"/></p>
        </div>
        <div class="sub_info sub_info_center fl">
            <p class="number"><s:property value="totalNumOfViewVideo"/><span><s:property value="%{getText('the.static.times')}"/></span></p>

            <p class="describe"><s:property value="%{getText('the.num.of.onlive.record.open.times')}"/></p>
        </div>
        <div class="sub_info fl">
            <p class="number"><s:property value="totalNumOfChannelTerms"/><span><s:property value="%{getText('the.static.terms')}"/></span></p>

            <p class="describe"><s:property value="%{getText('the.num.of.channel')}"/></p>
        </div>
    </div>
    <s:iterator value="liveChannels" status="idx">
        <div class="course_item">
            <p class="course_logo"><a href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>"><img src="<s:property value="logoUrl"/>"/></a></p>
            <div class="infoWrap">
                <h4><a href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>"><s:property value="name"/></a></h4>
                <p class="date"><s:date name="createTime" format="%{getText('dateformat.forclass')}"/></p>
                <p class="maintenance">
                    <a href="initLiveChannelManagement.html?liveChannel.id=<s:property value="id"/>" >[<s:property value="%{getText('onlive.message.update')}"/>]</a>
                    <strong>•</strong>
                    <s:property value="allHostsNum"/><s:property value="%{getText('onlive.total.host.num')}"/>
                    <strong>•</strong>
                    <s:property value="allContestantsNum"/><s:property value="%{getText('onlive.total.contestants.num')}"/>
                    <strong>•</strong>
                    <s:property value="fansNum"/><s:property value="%{getText('the.num.of.focus.on.live.channel')}"/>
                </p>
                <p class="details cf">
                    <span class="fl"><s:property value="%{getText('onlive.channel.introduction')}"/>：<s:property value="description"/></span>
                </p>

                <p class="time">
                    <a class="manage_course" href="initLiveChannelManagement.html?liveChannel.id=<s:property value="id"/>"><s:property value="%{getText('onlive.channel.management')}"/></a>
                    <a class="manage_course" href="manageLiveTerm.html?liveChannel.id=<s:property value="id"/>"><s:property value="%{getText('onlive.term.management')}"/></a>
                    <a class="manage_course" id="onliveRecommend<s:property value="#idx.index"/>" href="#recommdatepanel<s:property value="#idx.index"/>"><s:property value="%{getText('onlive.recommend')}"/></a>
                    <a class="manage_course" href="maintenanceOnlive.html?liveChannel.id=<s:property value="id"/>"><s:property value="%{getText('create.a.new.term')}"/></a>
                    <a class="manage_course" href="initLiveChannelAds.html?liveChannel.id=<s:property value="id"/>"><s:property value="%{getText('onlive.channel.ad.management')}"/></a>
                </p>
            </div>
        </div>

          <%-- 推荐Div --%>
       <div style="display: none;">

          <div id="recommdatepanel<s:property value="#idx.index"/>" style="font-size: 16px;color:#666;">

            <div id="recommendMsg<s:property value="#idx.index"/>" style="float:left;margin-top: 3px;color:red;font-size: 12px;"></div>
            <form id="recommendCourseForm<s:property value="#idx.index"/>" name="recommendCourseForm<s:property value="#idx.index"/>">
                <input type="hidden" name="liveChannel.id" value="<s:property value="id"/>"/>
                <div class="recommdatepanel_inner">
                    <table>
                        <tr><td></td><td class="add_friend_email" onclick="addFriendEmail(<s:property value="#idx.index"/>);"><s:property value="%{getText('button.add.email.friend')}"/></td></tr>
                        <tr><td width="80px" align="right" valign="top"><s:property value="%{getText('label.email.friend')}"/>&nbsp;</td><td><input class="recommdate_email" value="" type ="text" name="emails" onblur="checkEmail(this,<s:property value="#idx.index"/>);"/></tr>
                        <tbody class="added_line" id="added_line<s:property value="#idx.index"/>"></tbody>
                        <tr><td align="right" valign="top"><s:property value="%{getText('button.message')}"/>&nbsp;</td><td><s:textarea cssClass="recommdate_message" placeholder="%{getText('onlive.default.recommend.sentence')}" name="comments"></s:textarea></td></tr>
                        <tr><td></td><td><input class="recommdate_submit" type="button" onclick="checkCourseRecommend(<s:property value="#idx.index"/>);" value="<s:property value="%{getText('button.submit')}" />" />&nbsp;&nbsp;<span class="recommdate_close recommdatebtn" onclick="$.fancybox.close();"><s:property value="%{getText('button.close')}"/></span>&nbsp;&nbsp;<div id="recommend_message<s:property value="#idx.index"/>"></div></td></tr>
                    </table>
                </div>
            </form>
           </div>

        </div>
    </s:iterator>
    <tiles:insertTemplate template="../pagination.jsp">
           <tiles:putAttribute name="pagination" value="${pagination}"/>
    </tiles:insertTemplate>

</div>

<script type="text/javascript">
      <s:iterator value="liveChannels" status="idx">
         $("#onliveRecommend<s:property value="#idx.index"/>").fancybox({});
      </s:iterator>

      function checkCourseRecommend(index){

        var vas = $("#recommendCourseForm"+index).serialize();
        $.post("recommendLiveChannelAjax.html",vas);
        $("#recommend_message"+index).html(right_div+"<s:text name='course.recommend.success'/>");
        $("#recommend_message"+index).css('color','green');
        window.setTimeout("$.fancybox.close();","1500");
        return true;
    }
</script>