<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link href="css/onlive/multiLiveChannel.css" rel="stylesheet" type="text/css"/>

<div class="content">
    <div class="item_wrap cf" id="item_wrap">
            <p class="item_nav"><s:property value="%{getText('multi.onlive.room')}"/></p>
            <s:hidden value="%{#session.userID}" id="hidSessionId"/>
            <s:iterator value="liveChannels">
                <div class="item">

                    <div class="cf">
                        <a class="avatar fl" href="javascript:;" target="_blank" title="<s:property value="theLatestChannelTerms.host.nickName"/>">
                            <img src="<s:property value="theLatestChannelTerms.host.pic"/>" class="to_popup" alt="<s:property value="theLatestChannelTerms.host.nickName"/>" height="40"
                                 width="40"><input name="id" value="9058478300" type="hidden">
                        </a>

                        <div class="fl">
                            <h4><a class="title" href="javascript:;" title="<s:property value="theLatestChannelTerms.subTitle"/>"><s:property value="name"/></a></h4>
                            <a class="nickname" href="javascript:;" title="<s:property value="theLatestChannelTerms.host.nickName"/>"><s:property value="theLatestChannelTerms.host.nickName"/></a>
                        </div>
                        <span class="start_time fr"><s:date name="theLatestChannelTerms.startTime" format="%{getText('dateformat.forclass')}"/></span>
                        <span class="focus fr">20<s:property value="%{getText('the.num.of.focus.on.live.channel')}"/></span>
                    </div>

                    <div class="top_dot cf">
                        <a class="course_img fl" href="liveTermBlog.html?channelTerms.id=<s:property value="theLatestChannelTerms.id"/>" title="<s:property value="name"/>">
                            <img src="<s:property value="theLatestChannelTerms.logoUrl"/>" alt="<s:property value="name"/>" height="80" width="120">
                        </a>
                        <div class="fl">
                            <p class="description with_tags"><s:property value="description"/></p>

                            <p class="course_tags cf">
                                <s:if test="userType != 0">
                                     <a href="javascript:;" onclick="setUser2LiveFollower(<s:property value="id"/>,this);"><s:property value="%{getText('onlive.focus.on')}"/></a>
                                </s:if>
                                <s:else>
                                     <a href="javascript:;"><s:property value="%{getText('cancel.the.onlive.focus')}"/></a>
                                </s:else>
                            </p>
                        </div>
                    </div>
                </div>
            </s:iterator>

    </div>
</div>

<script type="text/javascript">
    function  setUser2LiveFollower(liveChannelID,obj){
        if(validateLogo()) {
                $.post("addUser2LiveFollower.html",{'liveChannel.id':liveChannelID},function(data){
                    Boxy.alert("<s:property value="%{getText('onlive.add.focus.success')}"/>");
                });
                $(obj).text("<s:property value="%{getText('cancel.the.onlive.focus')}"/>");
        }
    }

</script>