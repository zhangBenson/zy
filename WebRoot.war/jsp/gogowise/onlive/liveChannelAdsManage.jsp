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

        <li>
            <s:iterator value="liveChannel.nextSeasonAd">
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
            <s:if test="!liveChannel.existNextSeasonAd">
                您的直播栏目还有广告赞助哦！
            </s:if>
        </li>

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