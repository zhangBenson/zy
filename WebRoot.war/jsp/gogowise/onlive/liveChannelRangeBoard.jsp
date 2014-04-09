<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/show/showAdManage_js.jsp" %>
<link href="css/onlive/live_channel_range.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.rate.js"></script>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="">
            <a href="initMyOnlive.html"><s:property value="%{getText('my.onlive')}"/></a>
        </li>
        <li class="">
            <a href="listParticipatingChannel.html"><s:property
                    value="%{getText('usermenu.item.my.partispate.channel')}"/></a>
        </li>
        <li class="">
            <a href="listFollowingChannel.html"><s:property value="%{getText('usermenu.item.my.focused.channel')}"/></a>
        </li>
        <li class="">
            <a href="createOnlive.html"><s:property value="%{getText('onlive.creation')}"/></a>
        </li>
        <li class="stand_out">
            <a href="rangeLiveChannel.html"><s:property value="%{getText('onlive.channel.range')}"/></a>
        </li>
    </ul>
</div>
<div id="cnt_cntai">
    <ul class="cntai_first_ul">
        <li>
            <s:iterator value="liveChannels" status="idx">
                <ul class="sub_ul">
                    <li class="li_0"><s:a action="liveChannelBlog" target="_blank"><s:param name="liveChannel.id"
                                                                                            value="id"/><img
                            src="<s:property value="logoUrl"/>"/></s:a></li>
                    <li class="li_1"><h3><s:property value="name"/></h3></li>
                    <li class="li_2 type2" id="show_range_evaluate<s:property value="#idx.index"/>"></li>
                    <li class="li_3"><s:property value="%{getText('show.creation.time')}"/>：<span
                            class="orangeWords"><s:date name="createTime" format="%{getText('dateformat')}"/></span>
                    </li>
                    <li class="li_3"><s:property value="%{getText('onlive.term.finished.num')}"/>：<span
                            class="orangeWords"><s:property value="totalTermsNum"/></span></li>
                    <li class="li_3"><s:property value="%{getText('show.total.fans.num')}"/>：<span
                            class="orangeWords"><s:property value="totalFollowerNum"/><s:property
                            value="%{getText('show.person')}"/></span></li>
                    <li class="li_3"><s:property value="%{getText('show.total.invite.num')}"/>：<span
                            class="orangeWords"><s:property value="totalInviteNum"/><s:property
                            value="%{getText('show.person')}"/></span></li>
                    <li class="li_3"><s:property value="%{getText('show.this.season.fans')}"/>：<span
                            class="orangeWords"><s:property value="seasonIncreasedFansNum"/><s:property
                            value="%{getText('show.person')}"/></span></li>
                    <li class="li_3"><s:property value="%{getText('show.this.season.invitation.num')}"/>：<span
                            class="orangeWords"><s:property value="seasonIncreasedInviteNum"/><s:property
                            value="%{getText('show.person')}"/></span></li>
                    <li class="li_4">
                        <s:a action="listLiveChannelAdBid">
                            <s:param name="liveChannel.id" value="id"/>
                            <s:property value="%{getText('onlive.check.bid.info')}"/>
                        </s:a>
                    </li>
                </ul>
                <script type="text/javascript">
                    $("#show_range_evaluate<s:property value="#idx.index"/>").rate({
                        selected:<s:property value="synthetical"/>,
                        selectable: false,
                        decimal: true,
                        revert: true,
                        fullStar: false
                    });
                </script>
            </s:iterator>
            <tiles:insertTemplate template="../pagination.jsp">
                <tiles:putAttribute name="pagination" value="${pagination}"/>
            </tiles:insertTemplate>
        </li>
    </ul>
</div>