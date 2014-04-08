<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/show/showAdManage_js.jsp" %>
<link href="css/onlive/live_channel_ad_bid_list.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.rate.js"></script>

<div class="mf_1">
    <p id="sub_nav">
        <a href="initMyOnlive.html"><s:property value="%{getText('my.onlive')}"/></a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;
        <a href="rangeLiveChannel.html"><s:property value="%{getText('onlive.channel.range.board')}"/></a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;
        <span id="nav_title"><s:property value="%{getText('onlive.ad.message ')}"/></span>
    </p>
</div>

<div class="cnt_1">
    <div class="sub_cnt_1">
        <p><s:property value="%{getText('onlive.channel')}"/><span class="orangeWords"><s:property
                value="liveChannel.name"/></span><s:property value="%{getText('onlive.channel.message.all')}"/></p>
        <ul>
            <li><s:property value="%{getText('show.creation.time')}"/>:<span class="orangeWords"><s:date
                    name="liveChannel.createTime" format="%{getText('dateformat')}"/></span></li>
            <li><s:property value="%{getText('show.total.terms')}"/>:<span class="orangeWords"><s:property
                    value="liveChannel.totalTermsNum"/></span></li>
            <li><s:property value="%{getText('show.total.fans.num')}"/>:<span class="orangeWords"><s:property
                    value="liveChannel.fansNum"/></span></li>
            <li><s:property value="%{getText('show.total.invite.num')}"/>:<span class="orangeWords"><s:property
                    value="liveChannel.totalInviteNum"/></span></li>
            <li><s:property value="%{getText('show.this.season.fans')}"/>:<span class="orangeWords"><s:property
                    value="liveChannel.seasonIncreasedFansNum"/></span></li>
            <li><s:property value="%{getText('show.this.season.invitation.num')}"/>:<span
                    class="orangeWords"><s:property value="liveChannel.seasonIncreasedInviteNum"/></span></li>
            <li><s:property value="%{getText('show.total.ad.bidding.price')}"/>:<span class="orangeWords"><s:property
                    value="liveChannel.totalBidPrice"/></span></li>
            <li><s:property value="%{getText('show.highest.ad.price')}"/>:<span class="orangeWords"><s:property
                    value="liveChannel.highestBidPriceOfThisSeason"/></span></li>
            <li><s:property value="%{getText('show.lowest.ad.price')}"/>:<span class="orangeWords"><s:property
                    value="liveChannel.LowestBidPriceOfThisSeason"/></span></li>
            <li><s:property value="%{getText('show.total.bidding.num')}"/>:<span class="orangeWords"><s:property
                    value="liveChannel.bidNum"/></span></li>
        </ul>
    </div>
    <div class="sub_cnt_2">
        <p class="p_1"><s:property value="%{getText('onlive.channel')}"/><span class="orangeWords"><s:property
                value="liveChannel.name"/></span><s:property value="%{getText('onlive.channel.bid.message')}"/></p>
        <s:if test="!liveChannel.existNextSeasonAd">
            <p class="p_2"><s:property value="%{getText('show.without.ad.info')}"/></p>
        </s:if>
        <s:else>
            <s:iterator value="liveChannel.nextSeasonAd">
                <ul class="sub_u2">
                    <li class="li_0"><img src="<s:property value="adLogoUrl"/>"
                                          onerror="javascript:this.src='images/nopic.jpg'"
                                          alt="<s:property value="%{getText('show.ad.logo')}" />"/></li>
                    <li class="li_1"><s:property value="%{getText('show.brand.name')}"/>：<s:property
                            value="productName"/></li>
                    <li class="li_1"><s:property value="%{getText('show.brand.link')}"/>:<a
                            href="http://<s:property value="linkAddress"/>"><s:property value="linkAddress"/></a></li>
                    <li class="li_1"><s:property value="%{getText('show.bidding.price')}"/>:<s:property
                            value="bidPrice"/></li>
                    <li class="li_1"><s:property value="%{getText('show.ad.user.nickname')}"/>:<s:a
                            action="userBlog"><s:param name="user.id" value="provider.id"/><s:property
                            value="provider.nickName"/></s:a></li>
                    <li class="li_1"><s:property value="%{getText('show.bidding.time')}"/>:<s:date name="bidTime"
                                                                                                   format="%{getText('dateformat')}"/></li>
                    <li class="li_1"><s:property value="%{getText('show.total.bidding.times')}"/>:<s:property
                            value="liveChannel.bidNum"/></li>
                </ul>
            </s:iterator>
        </s:else>
    </div>


    <div class="sub_cnt_3">
        <s:a action="createLiveChannelAdBid">
            <s:param name="liveChannel.id" value="liveChannel.id"/>
            <s:property value="%{getText('show.myself.want.bidding')}"/>
        </s:a>
    </div>

</div>