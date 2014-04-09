<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/show/showAdManage_js.jsp" %>
<link href="css/onlive/live_channel_ad_man.css" rel="stylesheet" type="text/css"/>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="">
            <a href="initMyOnlive.html"><s:property value="%{getText('my.onlive')}"/></a>
        </li>
        <li class="">
            <a href="createOnlive.html"><s:property value="%{getText('onlive.creation')}"/></a>
        </li>
        <li class="stand_out">
            <a href="manageLiveChannelAds.html"><s:property value="%{getText('onlive.ad.management')}"/></a>
        </li>
        <li class="">
            <a href="rangeLiveChannel.html"><s:property value="%{getText('onlive.channel.range')}"/></a>
        </li>
        <%--<li class="">--%>
        <%--<a href="listLiveChannelAdBid.html">栏目广告列表</a>--%>
        <%--</li>--%>
        <%--<li class="">--%>
        <%--<a href="createLiveChannelAdBid.html">栏目广告投标创建</a>--%>
        <%--</li>--%>
    </ul>
</div>
<div id="cnt_cntai">
    <ul class="cntai_first_ul">
        <s:iterator value="liveChannels">
            <li>
                <ul class="sub_ul">
                    <li class="li_0"><s:a action="liveChannelBlog" target="_blank"><s:param name="liveChannel.id"
                                                                                            value="id"/><img
                            src="<s:property value="logoUrl"/>"/></s:a></li>
                    <li class="li_1"><h3><s:property value="name"/></h3></li>
                    <li class="li_2"><s:property value="%{getText('show.evaluation')}"/>：<s:property
                            value="synthetical"/></li>
                    <li class="li_3"><s:property value="%{getText('show.creation.time')}"/>：<span
                            class="orangeWords"><s:date name="createTime" format="%{getText('dateformat')}"/></span>
                    </li>
                    <li class="li_3"><s:property value="%{getText('show.total.terms')}"/>：<span
                            class="orangeWords"><s:property value="totalTermsNum"/></span></li>
                    <li class="li_3"><s:property value="%{getText('show.total.fans.num')}"/>：<span
                            class="orangeWords"><s:property value="totalFollowerNum"/></span></li>
                    <li class="li_3"><s:property value="%{getText('show.total.invite.num')}"/>：<span
                            class="orangeWords"><s:property value="totalInviteNum"/>人</span></li>
                    <li class="li_3"><s:property value="%{getText('show.this.season.fans')}"/>：<span
                            class="orangeWords"><s:property value="seasonIncreasedFansNum"/>人</span></li>
                    <li class="li_3"><s:property value="%{getText('show.this.season.invitation.num')}"/>：<span
                            class="orangeWords"><s:property value="seasonIncreasedInviteNum"/>人</span></li>
                    <li class="li_4"><a href="javascript:;"><s:property value="%{getText('show.ad.management')}"/></a>
                    </li>
                </ul>
                <s:iterator value="nextSeasonAdvertisements" status="idx">
                    <ul class="sub_u2">
                        <li class="li_0"><img src="<s:property value="adLogoUrl"/>"
                                              alt="<s:property value="%{getText('show.ad.logo')}" />"/></li>
                        <li class="li_1"><%--品牌名称：--%><s:property value="productName"/></li>
                        <li class="li_1"><%--连接:--%><s:property value="linkAddress"/></li>
                        <li class="li_1"><s:property value="%{getText('show.bid.price')}"/>:<s:property
                                value="bidPrice"/></li>
                        <li class="li_1"><s:property value="%{getText('show.ad.user.nickname')}"/>:<s:property
                                value="provider.nickName"/></li>
                        <li class="li_1"><%--投标时间:--%><s:property value="linkAddress"/></li>
                        <li class="li_1"><s:property value="%{getText('show.ad.accept')}"/><input
                                onclick="acceptBid(<s:property value="id"/>,<s:property value="myShow.id"/>,this);"
                                type="checkbox" <s:if test="accept">checked="checked"</s:if>/></li>
                    </ul>
                </s:iterator>
                <s:iterator value="nextSeasonAd">
                    <ul class="sub_u2">
                        <li class="li_0"><a href="http://<s:property value="linkAddress"/>" target="_blank"><img
                                src="<s:property value="adLogoUrl"/>"
                                alt="<s:property value="%{getText('show.ad.logo')}" />"/></a></li>
                        <li class="li_1"><s:property value="productName"/></li>
                        <li class="li_1"><a href="http://<s:property value="linkAddress"/>" target="_blank"><s:property
                                value="linkAddress"/></a></li>
                        <li class="li_1"><s:property value="%{getText('show.bid.price')}"/>:<s:property
                                value="bidPrice"/></li>
                        <li class="li_1"><s:property value="%{getText('show.ad.user.nickname')}"/>:<s:property
                                value="provider.nickName"/></li>
                        <li class="li_1"><s:date name="bidTime" format="%{getText('dateformat')}"/></li>
                        <li class="li_1"><s:property value="%{getText('show.ad.accept')}"/><input
                                onclick="acceptBid(<s:property value="id"/>,<s:property value="liveChannel.id"/>,this);"
                                type="checkbox" <s:if test="accept">checked="checked"</s:if>/></li>
                    </ul>
                </s:iterator>
            </li>
        </s:iterator>
        <tiles:insertTemplate template="../pagination.jsp">
            <tiles:putAttribute name="pagination" value="${pagination}"/>
        </tiles:insertTemplate>
    </ul>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("li.li_4 a").click(function () {
            $(this).parent().parent().siblings("ul.sub_u2").slideToggle("fast");
        });
    });

    function acceptBid(advertisementID, onliveID, obj) {
        //alert($(obj).attr("checked"));
        if ($(obj).attr("checked") == 'checked') {
            if ($("input[type='checkbox']:checked").length > 4) {
                $(obj).removeAttr("checked");
                alert("<s:property value="%{getText('show.ad.limit.accept.num')}" />");
                return;
            }
            var hasAccepted = confirm("<s:text name="show.confirm.to.accept.the.ad.request"/> ");
            if (!hasAccepted) {
                $(obj).removeAttr("checked");
            } else {
                $.post("acceptBidForOnlive.html", {'advertisementForLive.id': advertisementID, 'liveChannel.id': onliveID}, function (data) {
                });
            }
        } else if ($(obj).attr("checked") != 'checked') {
            var hasCancelled = confirm("<s:text name="show.confirm.to.cancel.ad.request"/>");
            if (!hasCancelled) {
                $(obj).attr("checked", "checked");
            } else {
                $.post("cancelAcceptBidForOnlive.html", {'advertisementForLive.id': advertisementID, 'liveChannel.id': onliveID}, function (data) {
                });
            }
        }
    }
</script>