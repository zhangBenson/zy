<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/show/showAdManage_js.jsp" %>
<link href="css/show/showAdBidList.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.rate.js"></script>

<div class="cnt_1">
    <div class="sub_cnt_1">
        <p><s:property value="myShow.owner.nickName"/><s:property value="%{getText('show.personal.all.info')}"/></p>
        <ul>
            <li><s:property value="%{getText('show.creation.time')}"/>:<span class="orangeWords"><s:date
                    name="myShow.showDate" format="%{getText('dateformat')}"/></span></li>
            <li><s:property value="%{getText('show.total.terms')}"/>:<span class="orangeWords"><s:property
                    value="myShow.finishedTermsNum"/></span></li>
            <li><s:property value="%{getText('show.total.fans.num')}"/>:<span class="orangeWords"><s:property
                    value="myShow.fansNum"/></span></li>
            <li><s:property value="%{getText('show.total.invite.num')}"/>:<span class="orangeWords"><s:property
                    value="myShow.totalInviteNum"/></span></li>
            <li><s:property value="%{getText('show.this.season.fans')}"/>:<span class="orangeWords"><s:property
                    value="myShow.seasonIncreasedFansNum"/></span></li>
            <li><s:property value="%{getText('show.this.season.invitation.num')}"/>:<span
                    class="orangeWords"><s:property value="myShow.seasonIncreasedInviteNum"/></span></li>
            <li><s:property value="%{getText('show.total.ad.bidding.price')}"/>:<span class="orangeWords"><s:property
                    value="myShow.totalBidPrice"/></span></li>
            <li><s:property value="%{getText('show.highest.ad.price')}"/>:<span class="orangeWords"><s:property
                    value="myShow.highestBidPrice"/></span></li>
            <li><s:property value="%{getText('show.lowest.ad.price')}"/>:<span class="orangeWords"><s:property
                    value="myShow.lowestBidPrice"/></span></li>
            <li><s:property value="%{getText('show.total.bidding.num')}"/>:<span class="orangeWords"><s:property
                    value="myShow.bidNum"/></span></li>
        </ul>
    </div>
    <div class="sub_cnt_2">
        <p class="p_1"><s:property value="myShow.owner.nickName"/><s:property
                value="%{getText('show.bidding.user.info')}"/></p>
        <s:if test="!myShow.existAdvertisement">
            <p class="p_2"><s:property value="%{getText('show.without.ad.info')}"/></p>
        </s:if>
        <s:else>
            <s:iterator value="myShow.nextSeasonAdvertisements">
                <ul class="sub_u2">
                    <li class="li_0"><a href="http://<s:property value="linkAddress"/>" target="_blank"><img
                            src="<s:property value="adLogoUrl"/>"
                            alt="<s:property value="%{getText('show.ad.logo')}" />"/></a></li>
                    <li class="li_1"><s:property value="%{getText('show.brand.name')}"/>：<s:property
                            value="productName"/></li>
                    <li class="li_1"><s:property value="%{getText('show.brand.link')}"/>:<a
                            href="http://<s:property value="linkAddress"/>" target="_blank"><s:property
                            value="linkAddress"/></a></li>
                    <li class="li_1"><s:property value="%{getText('show.bidding.price')}"/>:<s:property
                            value="bidPrice"/></li>
                    <li class="li_1"><s:property value="%{getText('show.ad.user.nickname')}"/>:<s:a
                            action="userBlog"><s:param name="user.id" value="provider.id"/><s:property
                            value="provider.nickName"/></s:a></li>
                    <li class="li_1"><s:property value="%{getText('show.bidding.time')}"/>:<s:date name="bidTime"
                                                                                                   format="%{getText('dateformat')}"/></li>
                    <li class="li_1"><s:property value="%{getText('show.total.bidding.times')}"/>:<s:property
                            value="myShow.totalBidNum"/></li>
                </ul>
            </s:iterator>
        </s:else>

    </div>
    <div class="sub_cnt_3"><s:a action="initShowAdBid"><s:param name="myShow.id" value="myShow.id"/><input type="button"
                                                                                                           value="<s:property value="%{getText('show.myself.want.bidding')}" />"></s:a>
    </div>

</div>