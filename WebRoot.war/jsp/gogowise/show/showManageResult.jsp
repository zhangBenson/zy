<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/recommendForFriend_js.jsp" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link href="css/user/user_center_list.css" rel="stylesheet" type="text/css"/>


<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="stand_out">
            <a href="javascript:;"><s:property value="%{getText('usermenu.item.my.created.shows')}"/></a>
        </li>
         <li class="">
            <a href="myFollowing.html"><s:property value="%{getText('usermenu.item.my.focused.shows')}"/></a>
        </li>
        <li>
            <a href="initShowCreate.html"><s:property value="%{getText('show.creation')}"/></a>
        </li>
        <li>
            <a href="showRangeBoard.html"><s:property value="%{getText('show.hero.list')}"/></a>
        </li>
    </ul>
</div>
<div class="mf_2">
    <div class="overview cf">
        <div class="sub_info fl">
            <p class="number"><s:property value="totalNumOfViewOnlive"/><s:property value="showFansNum"/><span><s:property value="%{getText('onlive.fensi')}"/></span></p>

            <p class="describe"><s:property value="%{getText('people.watched.my.show')}"/></p>
        </div>
        <div class="sub_info fl">
            <p class="number"><s:property value="totalNumOfLiveChannels"/><s:property value="showTermsNum"/><span><s:property value="%{getText('the.static.terms')}"/></span></p>

            <p class="describe"><s:property value="%{getText('personal.show.terms.num')}"/></p>
        </div>
    </div>
    <s:iterator value="myShows" status="idx">
        <div style="">
            <div class="course_item">
                <p class="course_logo"><s:a action="showBlog" target="_blank"><s:param name="myShow.id" value="id"/><img src="<s:property value="logoUrl"/>" /></s:a></p>
                <div class="infoWrap">
                    <h4><s:a action="showBlog" target="_blank"><s:param name="myShow.id" value="id"/><s:property value="name"/></s:a></h4>
                    <p class="date"><s:date name="showDate" format="%{getText('dateformat')}"/></p>
                    <p class="maintenance">
                        <s:property value="fansNum"/><s:property value="%{getText('the.num.of.focus.on.live.channel')}"/>
                        <strong>•</strong>
                        <s:property value="%{getText('show.have.created.terms')}"/><s:property value="finishedTermsNum"/><s:property value="%{getText('the.static.terms')}"/>
                        <strong>•</strong>
                        <s:property value="%{getText('course.blog.zonghe.evaluation')}"/><s:property value="synthetical"/><s:property value="%{getText('user.evaluate.grade')}"/>
                    </p>

                    <p class="details cf">
                        <span class="fl"><s:property value="description"/></span>
                    </p>

                    <p class="time">
                        <a class="manage_course" href="initShowManage.html?myShow.id=<s:property value="id"/>"><s:property value="%{getText('personal.show.management')}"/></a>
                        <a class="manage_course" id="showRecommend<s:property value="#idx.index"/>" href="#recommdatepanel<s:property value="#idx.index"/>"><s:property value="%{getText('my.show.recommend')}"/></a>
                        <a class="manage_course" href="showNewEventsManage.html?myShow.id=<s:property value="id"/>"><s:property value="%{getText('show.new.events.management')}"/></a>
                        <a class="manage_course" href="initShowAds.html?myShow.id=<s:property value="id"/>"><s:property value="%{getText('show.ad.management')}"/></a>
                    </p>
                </div>
            </div>
        </div>

       <div style="display: none;">
          <div id="recommdatepanel<s:property value="#idx.index"/>" style="font-size: 16px;color:#666;">
            <div id="recommendMsg<s:property value="#idx.index"/>" style="float:left;margin-top: 3px;color:red;font-size: 12px;"></div>
            <form id="recommendCourseForm<s:property value="#idx.index"/>" name="recommendCourseForm<s:property value="#idx.index"/>">
                <input type="hidden" name="myShow.id" value="<s:property value="id"/>"/>
                <div class="recommdatepanel_inner">
                    <table>
                        <tr><td></td><td class="add_friend_email" onclick="addFriendEmail(<s:property value="#idx.index"/>);"><s:property value="%{getText('button.add.email.friend')}"/></td></tr>
                        <tr><td width="80px" align="right" valign="top"><s:property value="%{getText('label.email.friend')}"/>&nbsp;</td><td><input class="recommdate_email" value="" type ="text" name="emails" onblur="checkEmail(this,<s:property value="#idx.index"/>);"/></tr>
                        <tbody class="added_line" id="added_line<s:property value="#idx.index"/>"></tbody>
                        <tr><td align="right" valign="top"><s:property value="%{getText('button.message')}"/>&nbsp;</td><td><s:textarea cssClass="recommdate_message" placeholder="%{getText('show.recommend.default.sentence')}" name="comments"></s:textarea></td></tr>
                        <tr><td></td><td><input class="recommdate_submit" type="button" onclick="checkCourseRecommend(<s:property value="#idx.index"/>);" value="<s:property value="%{getText('button.submit')}" />" />&nbsp;&nbsp;<span class="recommdate_close recommdatebtn" onclick="$.fancybox.close();"><s:property value="%{getText('button.close')}"/></span>&nbsp;&nbsp;<div id="recommend_message<s:property value="#idx.index"/>"></div></td></tr>
                    </table>
                </div>
            </form>
           </div>
       </div>
    </s:iterator>

</div>

<script type="text/javascript">
     var friendEmail="<s:text name='label.email.friend'/>";
     var  del = "<s:text name='course.class.delete'/>";
     var right_div = "<div class='tip_right'></div>";
    <s:iterator value="myShows" status="idx">
          $("#showRecommend<s:property value="#idx.index"/>").fancybox({});
    </s:iterator>
    $(function(){
        $(".upcoming_class").click(function(){
            $(".classintro").not($(this).parents("div.course_item").children()).hide();
            $(this).parents("div.course_item").children("div.classintro").slideToggle(500);
        });
    });

    function checkCourseRecommend(index){

        var vas = $("#recommendCourseForm"+index).serialize();
       $.post("recommendShowAjax.html",vas);
        $("#recommend_message"+index).html(right_div+"<s:text name='course.recommend.success'/>");
        $("#recommend_message"+index).css('color','green');
        window.setTimeout("$.fancybox.close();","1500");
        return true;
    }
</script>