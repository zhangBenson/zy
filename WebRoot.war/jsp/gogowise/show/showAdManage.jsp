<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/show/showAdManage_js.jsp" %>
<link href="css/show/showAdManage.css" rel="stylesheet" type="text/css" />

<div id="cnt_cntai">
    <ul class="cntai_first_ul">
        <s:iterator value="myShows">
        <li>
            <ul class="sub_ul">
                <li class="li_0"><s:a action="showBlog" target="_blank"><s:param name="myShow.id" value="id"/><img src="<s:property value="logoUrl"/>"/></s:a></li>
                <li class="li_1"><h3><s:property value="name"/></h3></li>
                <li class="li_2"><s:property value="%{getText('show.evaluation')}" />：<s:property value="synthetical"/></li>
                <li class="li_3"><s:property value="%{getText('show.creation.time')}" />：<span class="orangeWords"><s:date name="publishTime" format="%{getText('dateformat')}"/></span></li>
                <li class="li_3"><s:property value="%{getText('show.total.terms')}" />：<span class="orangeWords"><s:property value="finishedTermsNum"/></span></li>
                <li class="li_3"><s:property value="%{getText('show.total.fans.num')}" />：<span class="orangeWords"><s:property value="fansNum"/></span></li>
                <li class="li_3"><s:property value="%{getText('show.total.invite.num')}" />：<span class="orangeWords"><s:property value="totalInviteNum"/>人</span></li>
                <li class="li_3"><s:property value="%{getText('show.this.season.fans')}" />：<span class="orangeWords"><s:property value="seasonIncreasedFansNum"/>人</span></li>
                <li class="li_3"><s:property value="%{getText('show.this.season.invitation.num')}" />：<span class="orangeWords"><s:property value="seasonIncreasedInviteNum"/>人</span></li>
                <li class="li_4"><input type="button" value="<s:property value="%{getText('show.ad.management')}" />"></li>
            </ul>
            <s:iterator value="nextSeasonAdvertisements" status="idx">
                <ul class="sub_u2">
                    <li class="li_0"><a href="http://<s:property value="linkAddress"/>" target="_blank"><img src="<s:property value="adLogoUrl"/>"/></a></li>
                    <li class="li_1"><%--品牌名称：--%><s:property value="productName"/></li>
                    <li class="li_1"><a href="http://<s:property value="linkAddress"/>" target="_blank"><s:property value="linkAddress"/></a></li>
                    <li class="li_1"><s:property value="%{getText('show.bid.price')}" />:<s:property value="bidPrice"/></li>
                    <li class="li_1"><s:property value="%{getText('show.ad.user.nickname')}" />:<s:property value="provider.nickName"/></li>
                    <li class="li_1"><%--投标时间:--%><s:date name="bidTime" format="%{getText('dateformat')}"/></li>
                    <li class="li_1"><s:property value="%{getText('show.ad.accept')}" /><input onclick="acceptBid(<s:property value="id"/>,<s:property value="myShow.id"/>,this);" type="checkbox" <s:if test="accept">checked="checked"</s:if>/></li>
                </ul>
            </s:iterator>
        </li>
        </s:iterator>
    </ul>
</div>
<script type="text/javascript">
         function acceptBid(advertisementID ,showID,obj){
            //alert($(obj).attr("checked"));
            if($(obj).attr("checked") == 'checked'){
                if($("input[type='checkbox']:checked").length>4){
                    $(obj).removeAttr("checked");
                    alert("<s:property value="%{getText('show.ad.limit.accept.num')}" />");
                    return;
                }
                var hasAccepted = confirm("<s:text name="show.confirm.to.accept.the.ad.request"/> ");
                if(!hasAccepted){
                    $(obj).removeAttr("checked");
                }else{
                    $.post("acceptBid.html",{'advertisement.id':advertisementID,'myShow.id':showID},function(data){});
                }
            }else if($(obj).attr("checked") != 'checked'){
                var hasCancelled = confirm("<s:text name="show.confirm.to.cancel.ad.request"/>");
                if(!hasCancelled){
                    $(obj).attr("checked","checked");
                }else{
                    $.post("cancelAcceptBid.html",{'advertisement.id':advertisementID,'myShow.id':showID},function(data){});
                }
            }
        }
</script>