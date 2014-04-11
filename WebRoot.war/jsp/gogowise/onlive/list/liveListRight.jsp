<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

<div class="rightTerm2 fl">
    <h3 class="h3_title"><s:property value="%{getText('gogowise.latest.liveChannel')}"/></h3>
    <a class="other_more" href="liveNewList.html"><s:property value="%{getText('others.more')}"/></a>
    <ul>
        <s:iterator value="latestChannel">
            <li>
                <a class="img" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>"
                   title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
                <a class="title" href="liveChannelBlog.html?liveChannel.id=<s:property value="id"/>"><s:property
                        value="name"/></a>
            </li>
        </s:iterator>
    </ul>
</div>

<style type="text/css">
    .rightItem1 {
        float: left;
        margin-top: 30px;
    }

    .onePerson {
        width: 300px;
        padding: 15px 0 10px;
        border-bottom: 1px dotted #cdcdcd;
    }

    .personLeft img {
        margin-top: 3px;
        width: 40px;
        height: 40px;
        border: none;
    }

    .personMid {
        width: 150px;
        margin: 0 10px;
        color: #888;
        line-height: 20px;
    }

    .personMid a.title {
        display: block;
        width: 150px;
        height: 20px;
        overflow: hidden;
        font-size: 14px;
        color: #598EDE;
    }

    .personMid span.sheet {
        display: block;
        width: 150px;
        height: 20px;
        overflow: hidden;
    }

    .personMid a.title:hover {
        text-decoration: underline;
    }

    .personRight a {
        float: left;
        width: 70px;
        margin-top: 4px;
        color: #f90;
        line-height: 24px;
        background: #EBEBEB;
        border: 1px solid #ABABAB;
        text-align: center;
        text-decoration: none;
        border-radius: 3px;
    }

    .personRight a:hover {
        background: #dadada;
    }

    .rightTerm2 {
        float: left;
        margin-top: 20px;
    }

    .rightTerm2 ul {
        float: left;
        width: 350px;
        list-style: none;
    }

    .rightTerm2 ul li {
        float: left;
        margin-top: 15px;
        margin-right: 25px;
        width: 130px;
        height: 120px;
        overflow: hidden;
    }

    .rightTerm2 ul li img {
        width: 120px;
        height: 90px;
        padding: 4px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .rightTerm2 ul li a.img {
        float: left;
    }

    .rightTerm2 ul li a.title {
        float: left;
        color: #333;
        line-height: 20px;
        width: 130px;
        text-align: center;
    }

    .rightTerm2 ul li a.title:hover {
        text-decoration: underline;
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