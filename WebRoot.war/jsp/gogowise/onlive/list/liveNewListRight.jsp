<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/list/hotListRight.css" rel="stylesheet"/>

<div class="rightItem1">
    <s:hidden value="%{#session.userID}" id="hidSessionId"/>
    <h3 class="h3_title"><s:property value="%{getText('most.hottest.bloger')}"/></h3>
    <s:iterator value="hottestUsers">
            <div class="onePerson fl">
                <p class="personLeft fl">
                    <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                        <img src="<s:property value="pic"/>"/>
                    </a>
                </p>
                <p class="personMid fl">
                    <a class="title" href="userBlog.html?user.id=<s:property value="id"/>"><s:property value="nickName"/></a>
                    <span class="sheet"><span class="orange_words"><s:property value="fansNum"/>&nbsp;</span><s:property value="%{getText('onlive.fensi')}"/>&nbsp;&nbsp;&nbsp;<%--<span class="orange_words">70&nbsp;</span>课程--%></span>
                    <span><s:property value="selfDescription"/></span>
                </p>
                <p class="personRight fl">
                     <s:if test="!userFocused">
                          <a class="orange_words" href="javascript:;" onclick="becomeFans(this,<s:property value="id"/>);"><s:property value="%{getText('user.add.focus')}"/></a>
                    </s:if>
                    <s:else>
                        <a class="orange_words" href="javascript:;" onclick="becomeFans(this,<s:property value="id"/>);"><s:property value="%{getText('user.add.focused')}"/></a>
                    </s:else>
                </p>
            </div>
    </s:iterator>
</div>

<div class="rightTerm2 fl">
    <h3 class="h3_title"><s:property value="%{getText('index.onlive.hottest')}"/></h3>
    <a class="other_more" href="liveHotList.html"><s:property value="%{getText('others.more')}"/></a>
    <ul>
        <s:iterator value="hotestLiveChannels">
        <li>
            <a class="img" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
            <a class="title" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>"><s:property value="name"/></a>
        </li>
        </s:iterator>
    </ul>
</div>

<script type="text/javascript">
    function becomeFans(obj,userID){
        if(validateLogo()){
           $.post("addUserFocus.html",{'user.id':userID},function(data){
               $.fancybox({
                    content:data.message,
                    onComplete:function(){setTimeout("$.fancybox.close();","2000")}
               });
           });
           $(obj).html("<s:text name='user.add.focused'/>");
        }
    }
</script>