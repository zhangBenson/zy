<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/news.css" rel="stylesheet"/>
<link type="text/css" href="css/list/hotListRight.css" rel="stylesheet"/>

<div class="news_block live_trailer">
    <h3 class="h3_title">
        <s:property value="%{getText('gogowise.live.trailer')}"/>
    </h3>
    <ul>
        <s:iterator value="liveTrailers">
            <li>
                <div class="dot"></div>
                <a href="liveTrailerRead.html?liveTrailer.id=<s:property value="id"/>"
                   title="<s:property value="title"/>" class="goGoWiseAnnounce_newEvents"><s:property
                        value="title"/></a>
                <span><s:date name="publishTime" format="%{getText('dateformat.forclass')}"/></span>
            </li>
        </s:iterator>
    </ul>
</div>

<div class="rightItem1">
    <s:hidden value="%{#session.userID}" id="hidSessionId"/>
    <h3 class="h3_title"><s:property value="%{getText('most.hottest.bloger')}"/></h3>
    <a class="other_more" href="bloggerHotList.html"><s:property value="%{getText('others.more')}"/></a>
    <s:iterator value="hotestUsers">
        <div class="onePerson fl">
            <p class="personLeft fl">
                <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                    <img src="<s:property value="pic"/>"/>
                </a>
            </p>

            <p class="personMid fl">
                <a class="title" href="userBlog.html?user.id=<s:property value="id"/>"><s:property
                        value="nickName"/></a>
                <span class="sheet"><span class="orange_words"><s:property value="fansNum"/>&nbsp;</span><s:property
                        value="%{getText('onlive.fensi')}"/>&nbsp;&nbsp;&nbsp;<%--<span class="orange_words">70&nbsp;</span>课程--%></span>
                <span><s:property value="selfDescription"/></span>
            </p>

            <p class="personRight fl">
                <s:if test="!userFocused">
                    <a class="orange_words" href="javascript:;"
                       onclick="becomeFans(this,<s:property value="id"/>);"><s:property
                            value="%{getText('user.add.focus')}"/></a>
                </s:if>
                <s:else>
                    <a class="orange_words" href="javascript:;"
                       onclick="becomeFans(this,<s:property value="id"/>);"><s:property
                            value="%{getText('user.add.focused')}"/></a>
                </s:else>
            </p>
        </div>
    </s:iterator>
</div>

<%--<div class="rightTerm2 fl">--%>
<%--<h3 class="h3_title"><s:property value="%{getText('gogowise.latest.liveChannel')}"/></h3>--%>
<%--<ul>--%>
<%--<s:iterator value="latestChannel">--%>
<%--<li>--%>
<%--<a class="img" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>--%>
<%--<a class="title" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>"><s:property value="name"/></a>--%>
<%--</li>--%>
<%--</s:iterator>--%>
<%--</ul>--%>
<%--</div>--%>

<style type="text/css">
    .live_trailer {
        margin-top: 30px;
    }

    .live_trailer ul li a {
        float: left;
        width: 180px;
        height: 22px;
        overflow: hidden;
    }

    .live_trailer ul li span {
        color: #999;
        margin-left: 5px;
    }
</style>

<script type="text/javascript">
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