<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/show/showAdManage_js.jsp" %>
<link href="css/show/showAdManage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.rate.js"></script>

<div id="cnt_cntai">
    <ul class="cntai_first_ul">
        <li>
            <s:iterator value="myShows" status="idx">
                <ul class="sub_ul">
                    <li class="li_0"><s:a action="showBlog" target="_blank"><s:param name="myShow.id" value="id"/><img src="<s:property value="logoUrl"/>" onerror="javascript:this.src='images/nopic.jpg'" /></s:a></li>
                    <li class="li_1"><h3><s:property value="name"/></h3></li>
                    <li class="li_2 type2" id="show_range_evaluate<s:property value="#idx.index"/>"></li>
                    <li class="li_3"><s:property value="%{getText('show.creation.time')}"/>：<span class="orangeWords"><s:date name="showDate" format="%{getText('dateformat')}"/></span></li>
                    <li class="li_3"><s:property value="%{getText('show.total.terms')}"/>：<span class="orangeWords"><s:property value="finishedTermsNum"/></span></li>
                    <li class="li_3"><s:property value="%{getText('show.total.fans.num')}"/>：<span class="orangeWords"><s:property value="fansNum"/><s:property value="%{getText('show.person')}"/></span></li>
                    <li class="li_3"><s:property value="%{getText('show.total.invite.num')}"/>：<span class="orangeWords"><s:property value="totalInviteNum"/><s:property value="%{getText('show.person')}"/></span></li>
                    <li class="li_3"><s:property value="%{getText('show.this.season.fans')}"/>：<span class="orangeWords"><s:property value="seasonIncreasedFansNum"/><s:property value="%{getText('show.person')}"/></span></li>
                    <li class="li_3"><s:property value="%{getText('show.this.season.invitation.num')}"/>：<span class="orangeWords"><s:property value="seasonIncreasedInviteNum"/><s:property value="%{getText('show.person')}"/></span></li>
                    <li class="li_4">
                        <s:a action="showAdBidList">
                            <input type="button" value=<s:property value="%{getText('show.ad.bidding')}"/>>
                            <s:param name="myShow.id" value="id"/>
                        </s:a>
                    </li>
                </ul>
                <script type="text/javascript">
                    $("#show_range_evaluate<s:property value="#idx.index"/>").rate({
                        selected:<s:property value="synthetical"/>,
                        selectable:false,
                        decimal:true,
                        revert:true,
                        fullStar:false
                    });
                </script>
            </s:iterator>
        </li>
    </ul>
</div>