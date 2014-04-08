<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/onlive/liveTermBlog.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.rate.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.js"></script>

<div class="ltb_cont">
<div class="lcb_up">
    <div class="logo">
        <a href="liveChannelBlog.html?liveChannel.id=<s:property value="channelTerms.liveChannel.id"/>"
           title="<s:property value="channelTerms.liveChannel.name"/>"><img id="share_pic"
                                                                            src="<s:property value="channelTerms.liveChannel.logoUrl"/>"/></a>
    </div>
    <div class="info">
        <a class="title" id="share_title" title="<s:property value="channelTerms.liveChannel.name"/>"><s:property
                value="channelTerms.liveChannel.name"/></a>

        <p id="share_desc"><s:property value="channelTerms.liveChannel.description"/></p>
        <a href="javascript:;" class="act_btn host_btn"><s:property value="%{getText('live.term.blog.be.host')}"/></a>
        <a href="javascript:;" class="act_btn player_btn"><s:property
                value="%{getText('live.term.blog.be.contestant')}"/></a>
        <a href="javascript:;" class="act_btn guest_btn"><s:property value="%{getText('live.term.blog.be.guest')}"/></a>
    </div>
    <div class="other_terms">
        <h4><s:property value="%{getText('live.term.blog.other.terms')}"/></h4>

        <div class="term_scroll">
            <div class="scroll_left">
                <a href="#" id="left_scroll_btn"></a>
            </div>
            <div class="scroll_center">
                <ul id="scroll_list_ul">
                    <s:iterator value="channelTerms.liveChannel.channelTermses">
                        <li>
                            <a href="liveTermBlog.html?channelTerms.id=<s:property value="id"/>"
                               title="<s:property value="subTitle"/>"><img src="<s:property value="logoUrl"/>"/></a>
                        </li>
                    </s:iterator>
                </ul>
            </div>
            <div class="scroll_right">
                <a href="javascript:;" id="right_scroll_btn"></a>
            </div>
        </div>
    </div>
    <div class="share">
        <s:if test="!focused">
                <span id="focus_center">
                    <a href="javascript:;" onclick="setUser2LiveFollower();" class="focus">关&nbsp;&nbsp;&nbsp;注</a>
                </span>
        </s:if>


        <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare" data="">
            <%--<span style="float:left;line-height: 30px;margin-left: 10px;"><s:property value="%{getText('label.shared.with')}"/>：</span>--%>
            <a class="bds_qzone">QQ空间</a>
            <a class="bds_tsina">新浪微博</a>
            <a class="bds_tqq">腾讯微博</a>
            <a class="bds_renren">人人网</a>
            <a class="bds_fbook">Facebook</a>
            <a class="bds_twi">Twitter</a>
            <span class="bds_more"><s:property value="%{getText('others.more')}"/></span>
        </div>
        <script type="text/javascript" id="bdshare_js" data="type=tools"></script>
        <script type="text/javascript" id="bdshell_js"></script>
        <script type="text/javascript">
            var share_title = document.getElementById("share_title").innerText + "@GoGoWise" + "  <s:text name="onlive.default.recommend.sentence"/>";
            var share_pic = document.getElementById("share_pic").src;
            var share_comment = "<s:text name="onlive.default.recommend.sentence"/>";
            var share_desc = document.getElementById("share_desc").innerText;

            var _data = "{'text':'" + share_title + "'," +
                    "'comment':'" + share_comment + "'," +
                    "'url':'" + window.location.href + "'}";

            document.getElementById("bdshare").setAttribute("data", _data);


            var bds_config = {'bdText': share_title,
                'bdDesc': share_desc, //qq，开心
                'bdComment': share_comment,
                'bdPopTitle': 'GoGoWise Share',
                'bdPic': share_pic
            };
            document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
        </script>

    </div>
</div>


<div class="lcb_left">
<div class="term_info">
    <img src="<s:property value="channelTerms.logoUrl"/>" title="<s:property value="channelTerms.subTitle"/>"/>
    <h5><span><s:property value="%{getText('live.term.blog.terms.sequence.first')}"/><s:property
            value="channelTerms.termSequence"/><s:property
            value="%{getText('live.term.blog.terms.sequence.tail')}"/></span>--<s:property
            value="channelTerms.subTitle"/></h5>

    <div class="date_host">
        <s:property value="%{getText('org.meeting.virtual.host')}"/>：<a class="host name_link"
                                                                        href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>"
                                                                        title="<s:property value="channelTerms.host.nickName"/>"><s:property
            value="channelTerms.host.nickName"/></a>
        <span class="date"><s:date name="channelTerms.startTime" format="%{getText('dateformat.forclass')}"/></span>
    </div>
    <div class="name_list">
        <div class="player if">
            <s:property value="%{getText('channel.term.contetant')}"/>：
            <s:iterator value="channelTerms.contestants">
                <s:if test="member != null">
                    <a href="userBlog.html?user.id=<s:property value="member.id"/>"
                       title="<s:property value="member.nickName"/>"><s:property value="member.nickName"/></a>
                </s:if>
                <s:else>
                    <a href="javascript:;" title="<s:property value="memberEmail"/>"><s:property
                            value="memberEmail"/></a>
                </s:else>
            </s:iterator>
        </div>
        <div class="guest if">
            <s:property value="%{getText('channel.term.guest')}"/>：
            <s:iterator value="channelTerms.guests">
                <s:if test="member != null">
                    <a href="userBlog.html?user.id=<s:property value="member.id"/>"
                       title="<s:property value="member.nickName"/>"><s:property value="member.nickName"/></a>
                </s:if>
                <s:else>
                    <a href="javascript:;" title="<s:property value="memberEmail"/>"><s:property
                            value="memberEmail"/></a>
                </s:else>
            </s:iterator>
        </div>
    </div>
</div>
<div class="term_desc">
    <h3><s:property value="%{getText('live.term.this.term.intro')}"/></h3>

    <p><s:property value="channelTerms.description"/></p>
</div>
<div class="person_info">
    <h3><s:property value="%{getText('org.meeting.virtual.host')}"/></h3>
    <%-- div.info 写在循环内 js代码嵌套在iterator中，并且每次对评分所用元素设置不同的ID --%>
    <div class="info">
        <div class="ifl">
            <a href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>"
               title='<s:property value="channelTerms.host.nickName"/>'><img
                    src="<s:property value="channelTerms.host.pic"/>"/></a>
            <a href="javascript:;" class="focus"><s:property value="%{getText('user.add.focus')}"/></a>
        </div>
        <div class="ifc">
            <a href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>" class="name_link"
               title='<s:property value="channelTerms.host.nickName"/>'><s:property
                    value="channelTerms.host.nickName"/></a>
                    <span class="data"><span class="orWord"><s:property value="channelTerms.host.fansNum"/></span>&nbsp;&nbsp;<s:property
                            value="%{getText('onlive.fensi')}"/>
                        <%--&nbsp;&nbsp;|&nbsp;&nbsp;<span class="orWord">20</span>学生&nbsp;&nbsp;|&nbsp;&nbsp;<span class="orWord">20</span>课程--%>
                    </span>
                    <span class="desc">
                        <s:if test="channelTerms.host.selfDescription == null"><s:property
                                value="%{getText('onlive.fensi')}"/></s:if>
                        <s:else><s:property value="%{getText('live.term.without.host.selfIntro')}"/></s:else>
                    </span>
        </div>
        <div class="ifr">
            <ul>
                <li><s:property value="%{getText('live.term.average.score')}"/>&nbsp;&nbsp;<span class="orWord_large">4.1</span>&nbsp;<s:property
                        value="%{getText('user.evaluate.grade')}"/></li>
                <li><s:property value="%{getText('live.term.highest.score')}"/>&nbsp;&nbsp;<span class="orWord_large">5.0</span>&nbsp;<s:property
                        value="%{getText('user.evaluate.grade')}"/></li>
                <li><s:property value="%{getText('live.term.lowest.score')}"/>&nbsp;&nbsp;<span
                        class="orWord_large">3.3</span>&nbsp;<s:property value="%{getText('user.evaluate.grade')}"/>
                </li>
                <li><s:property value="%{getText('live.term.evaluate.user.num')}"/>&nbsp;&nbsp;<span
                        class="orWord_large">2537</span>&nbsp;<s:property value="%{getText('label.person')}"/></li>
                <li class="gradeLi"><span class="type2_left"><s:property
                        value="%{getText('live.term.evaluate.by.myself')}"/>&nbsp;&nbsp;</span><span id="rate_t_1"
                                                                                                     class="type2"></span><span
                        class="orWord_large ontime_value" id="grade_1">&nbsp;&nbsp;3.5</span></li>
            </ul>
        </div>
        <script type="text/javascript">
            $("#rate_t_1").rate({
                selected: 3,
                selectable: true,
                decimal: true,
                revert: true,
                fullStar: false,
                initCallBack: function (val, obj) {
                    val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
                    $("#grade_1").html(val);
                },
                mouseOutCallBack: function (val, obj) {
                    $("#grade_1").html() < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
                },
                selectedCallBack: function (val, obj) {
                    val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
                },
                clickCallBack: function (val, obj) {
                    $("#grade_1").html(val);
                    $.growlUI('Thx 4 ur evaluation!');
                }
            });
        </script>
    </div>
</div>
<s:if test="channelTerms.confirmedContestantsNum != 0">
    <div class="person_info">
        <h3><s:property value="%{getText('channel.term.contetant')}"/></h3>

        <s:iterator value="channelTerms.confirmedContestants" status="idx">

            <div class="info">
                <div class="ifl">
                    <a href="userBlog.html?user.id=<s:property value="member.id"/>"
                       title='<s:property value="member.nickName"/>'><img src="<s:property value="member.pic"/>"/></a>
                    <a href="javascript:;" class="focus"><s:property value="%{getText('user.add.focus')}"/></a>
                </div>
                <div class="ifc">
                    <a href="userBlog.html?user.id=<s:property value="member.id"/>" class="name_link"
                       title='<s:property value="member.nickName"/>'><s:property value="member.nickName"/></a>
                            <span class="data"><span class="orWord"><s:property value="member.fansNum"/></span>&nbsp;&nbsp;<s:property
                                    value="%{getText('onlive.fensi')}"/>
                                <%--&nbsp;&nbsp;|&nbsp;&nbsp;<span class="orWord">20</span>学生&nbsp;&nbsp;|&nbsp;&nbsp;<span class="orWord">20</span>课程--%>
                            </span>
                            <span class="desc">
                                <s:if test="member.selfDescription == null"><s:property
                                        value="%{getText('live.term.without.contestant.selfIntro')}"/></s:if>
                                <s:else><s:property value="member.selfDescription"/></s:else>
                                <%--<s:property value="member.selfDescription"/>--%>
                            </span>
                </div>
                <div class="ifr">
                    <ul>
                        <li><s:property value="%{getText('live.term.average.score')}"/>&nbsp;&nbsp;<span
                                class="orWord_large">4.1</span>&nbsp;<s:property
                                value="%{getText('user.evaluate.grade')}"/></li>
                        <li><s:property value="%{getText('live.term.highest.score')}"/>&nbsp;&nbsp;<span
                                class="orWord_large">5.0</span>&nbsp;<s:property
                                value="%{getText('user.evaluate.grade')}"/></li>
                        <li><s:property value="%{getText('live.term.lowest.score')}"/>&nbsp;&nbsp;<span
                                class="orWord_large">3.3</span>&nbsp;<s:property
                                value="%{getText('user.evaluate.grade')}"/></li>
                        <li><s:property value="%{getText('live.term.evaluate.user.num')}"/>&nbsp;&nbsp;<span
                                class="orWord_large">2537</span>&nbsp;<s:property value="%{getText('label.person')}"/>
                        </li>
                        <li class="gradeLi"><span class="type2_left"><s:property
                                value="%{getText('live.term.evaluate.by.myself')}"/>&nbsp;&nbsp;</span><span
                                id="rate_t_contestant_<s:property value="#idx.index"/>" class="type2"></span><span
                                class="orWord_large ontime_value"
                                id="grade_contestants_<s:property value="#idx.index"/>">&nbsp;&nbsp;3.5</span></li>
                    </ul>
                </div>
            </div>
            <script type="text/javascript">
                $("#rate_t_contestant_<s:property value="#idx.index"/>").rate({
                    selected: 3,
                    selectable: true,
                    decimal: true,
                    revert: true,
                    fullStar: false,
                    initCallBack: function (val, obj) {
                        val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
                        $("#grade_contestants_<s:property value="#idx.index"/>").html(val);
                    },
                    mouseOutCallBack: function (val, obj) {
                        $("#grade_contestants_<s:property value="#idx.index"/>").html() < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
                    },
                    selectedCallBack: function (val, obj) {
                        val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
                    },
                    clickCallBack: function (val, obj) {
                        $("#grade_contestants_<s:property value="#idx.index"/>").html(val);
                        $.growlUI('Thx 4 ur evaluation!');
                    }
                });
            </script>
        </s:iterator>
    </div>
</s:if>
<s:if test="channelTerms.confirmedGuestsNum != 0">
    <div class="person_info">
        <h3><s:property value="%{getText('channel.term.guest')}"/></h3>
            <%-- div.info 写在循环内 js代码嵌套在iterator中，并且每次对评分所用元素设置不同的ID --%>
        <s:iterator value="channelTerms.confirmedGuests" status="idx">

            <div class="info">
                <div class="ifl">
                    <a href="userBlog.html?user.id=<s:property value="member.id"/>"
                       title='<s:property value="member.nickName"/>'><img src="<s:property value="member.pic"/>"/></a>
                    <a href="javascript:;" class="focus"><s:property value="user.add.focus"/></a>
                </div>
                <div class="ifc">
                    <a href="userBlog.html?user.id=<s:property value="member.id"/>" class="name_link"
                       title='<s:property value="member.nickName"/>'><s:property value="member.nickName"/></a>
                        <span class="data"><span class="orWord"><s:property
                                value="member.fansNum"/></span>&nbsp;&nbsp;<s:property
                                value="%{getText('onlive.fensi')}"/>
                            <%--&nbsp;&nbsp;|&nbsp;&nbsp;<span class="orWord">20</span>学生&nbsp;&nbsp;|&nbsp;&nbsp;<span class="orWord">20</span>课程--%>
                        </span>
                        <span class="desc">
                            <s:if test="member.selfDescription == null"><s:property
                                    value="%{getText('live.term.without.guest.selfIntro')}"/></s:if>
                            <s:else><s:property value="member.selfDescription"/></s:else>
                        </span>
                </div>
                <div class="ifr">
                    <ul>
                        <li><s:property value="%{getText('live.term.average.score')}"/>&nbsp;&nbsp;<span
                                class="orWord_large">4.1</span>&nbsp;<s:property
                                value="%{getText('user.evaluate.grade')}"/></li>
                        <li><s:property value="%{getText('live.term.highest.score')}"/>&nbsp;&nbsp;<span
                                class="orWord_large">5.0</span>&nbsp;<s:property
                                value="%{getText('user.evaluate.grade')}"/></li>
                        <li><s:property value="%{getText('live.term.lowest.score')}"/>&nbsp;&nbsp;<span
                                class="orWord_large">3.3</span>&nbsp;<s:property
                                value="%{getText('user.evaluate.grade')}"/></li>
                        <li><s:property value="%{getText('live.term.evaluate.user.num')}"/>&nbsp;&nbsp;<span
                                class="orWord_large">2537</span>&nbsp;<s:property value="%{getText('label.person')}"/>
                        </li>
                        <li class="gradeLi"><span class="type2_left"><s:property
                                value="%{getText('live.term.evaluate.by.myself')}"/>&nbsp;&nbsp;</span><span
                                id="rate_t_guests_<s:property value="#idx.index"/>" class="type2"></span><span
                                class="orWord_large ontime_value" id="grade_guests_<s:property value="#idx.index"/>">&nbsp;&nbsp;3.5</span>
                        </li>
                    </ul>
                </div>
            </div>
            <script type="text/javascript">
                $("#rate_t_guests_<s:property value="#idx.index"/>").rate({
                    selected: 3,
                    selectable: true,
                    decimal: true,
                    revert: true,
                    fullStar: false,
                    initCallBack: function (val, obj) {
                        val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
                        $("#grade_guests_<s:property value="#idx.index"/>").html(val);
                    },
                    mouseOutCallBack: function (val, obj) {
                        $("#grade_guests_<s:property value="#idx.index"/>").html() < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
                    },
                    selectedCallBack: function (val, obj) {
                        val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
                    },
                    clickCallBack: function (val, obj) {
                        $("#grade_guests_<s:property value="#idx.index"/>").html(val);
                        $.growlUI('Thx 4 ur evaluation!');
                    }
                });
            </script>
        </s:iterator>
    </div>
</s:if>
<div class="message_box">
    <h3><s:property value="%{getText('blog.message.board')}"/></h3>

    <div class="cont_out">
        <s:hidden value="%{#session.userID}" id="hidSessionId"/>
        <textarea id="message_textarea"></textarea>
        <a href="javascript:;" class="submit_btn"
           onclick="submitComment(<s:property value="channelTerms.id"/>);"><s:property
                value="%{getText('button.submit')}"/></a>

        <div id="message_list_ul">
            <s:iterator value="liveTermComments">
                <p>
                    <img src="<s:property value="commenter.pic"/>"/>
                    <a href="javascript:;" class="nick_name"><s:property value="commenter.nickName"/></a>
                            <span class="span_out">
                                <span class="span1"><s:property value="content"/></span>
                                <s:if test="channelTerms.host.id == #session.userID && commenter.id != #session.userID">
                                    <a class="span2" href="####"
                                       onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property
                                               value="commenter.id"/>);"><s:property
                                            value="%{getText('blog.comments.reply')}"/></a>
                                    <a class="span2" href="####"
                                       onclick="deleteThisComment(this,<s:property value="id"/>);"><s:property
                                            value="%{getText('blog.comments.delete')}"/></a>
                                </s:if>
                                <s:elseif
                                        test="channelTerms.host.id != #session.userID && commenter.id != #session.userID">
                                    <a class="span2" href="####"
                                       onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property
                                               value="commenter.id"/>);"><s:property
                                            value="%{getText('blog.comments.reply')}"/></a>
                                </s:elseif>
                                <s:else>
                                    <a class="span2" href="####"
                                       onclick="deleteThisComment(this,<s:property value="id"/>);"><s:property
                                            value="%{getText('blog.comments.delete')}"/></a>
                                </s:else>
                                <span class="span3"><s:date name="commentTime"
                                                            format="%{getText('global.display.datetime')}"/></span>
                            </span>
                </p>
            </s:iterator>
            <s:if test="commentsNum != 0">
                <s:if test="!commentsNumOverflow">
                    <a class="more_or_close" href="javascript:;" onclick="getMoreComments();"><s:property
                            value="%{getText('blog.comments.more.result')}"/>&gt;&gt;</a>
                </s:if>
                <s:elseif test="commentsNumOverflow && commentsNum>=10">
                    <a class="more_or_close" href="javascript:;" onclick="rollBack();">&lt;&lt;<s:property
                            value="%{getText('blog.comments.rollBack')}"/></a>
                </s:elseif>
            </s:if>
            <script type="text/javascript">
                function getMoreComments() {
                    $.post("moreLiveTermsComments.html", {'channelTerms.id':<s:property value="channelTerms.id"/>, 'commentsNum':<s:property value="commentsNum"/>}, function (data) {
                        $("#message_list_ul").html(data);
                    });
                }

                function rollBack() {
                    $.post("moreLiveTermsComments.html", {'channelTerms.id':<s:property value="channelTerms.id"/>, 'commentsNum': 0}, function (data) {
                        $("#message_list_ul").html(data);
                    });
                }
            </script>
        </div>
    </div>
</div>
</div>


<div class="lcb_right">
    <div class="begin">
        <s:if test="channelTerms.finished">
            <p><s:property value="%{getText('live.term.is.finished')}"/></p>
        </s:if>
        <s:else>
            <p><s:property value="%{getText('live.term.left.time')}"/><br/><span class="orWord"
                                                                                 id="channelTermsLeftTime"></span></p>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#channelTermsLeftTime").countdown({
                        date: '<s:date name="channelTerms.startTime" format="%{getText('date.formate.firstpage.course.startdate')}" />',
                        onChange: function (event, timer) {
                        },
                        onComplete: function (event) {
                            $(this).html("<s:text name='live.term.is.on.living'/>");
                        },
                        htmlTemplate: "<span><b>%{d}</b><s:property value="%{getText('course.time.day')}" /><b> %{h}</b><s:property value="%{getText('course.time.hour')}" /><b>%{m}</b><s:property value="%{getText('course.time.minute')}" /><b>%{s}</b><s:property value="%{getText('course.tine.second')}" /></span>",
                        leadingZero: true,
                        direction: "down"
                    });
                });
            </script>
            <a href="javascript:;" style="color:#fff;"><s:property value="%{getText('watch.the.live.term')}"/></a>
        </s:else>

    </div>
    <div class="fans lcb_round persons">
        <h4><s:property value="channelTerms.liveChannel.totalFollowerNum"/> <s:property
                value="%{getText('live.term.channel.focused.user.num')}"/></h4>
        <ul>
            <s:iterator value="channelTerms.liveChannel.onliveFollowers">
                <li class="imgLi"><a href="userBlog.html?user.id=<s:property value="follower.id"/>"
                                     title='<s:property value="follower.nickName"/>'><img
                        src="<s:property value="follower.pic"/>"/></a></li>
            </s:iterator>
            <s:if test="channelTerms.liveChannel.totalFollowerNum > 8">
                <li class="li_more"><a href="javascript:;"><s:property value="%{getText('others.more')}"/>&nbsp;↓</a>
                </li>
            </s:if>
        </ul>
    </div>
    <%--<div class="players lcb_round persons">--%>
    <%--<h4>20人已报名</h4>--%>
    <%--<ul>--%>
    <%--<li class="imgLi"><a href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>"  title='<s:property value="channelTerms.host.nickName"/>'><img src="<s:property value="channelTerms.host.pic"/>"/></a></li>--%>
    <%--<li class="imgLi"><a href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>"  title='<s:property value="channelTerms.host.nickName"/>'><img src="<s:property value="channelTerms.host.pic"/>"/></a></li>--%>
    <%--<li class="imgLi"><a href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>"  title='<s:property value="channelTerms.host.nickName"/>'><img src="<s:property value="channelTerms.host.pic"/>"/></a></li>--%>
    <%--<li class="imgLi"><a href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>"  title='<s:property value="channelTerms.host.nickName"/>'><img src="<s:property value="channelTerms.host.pic"/>"/></a></li>--%>
    <%--<li class="imgLi"><a href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>"  title='<s:property value="channelTerms.host.nickName"/>'><img src="<s:property value="channelTerms.host.pic"/>"/></a></li>--%>
    <%--<li class="imgLi"><a href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>"  title='<s:property value="channelTerms.host.nickName"/>'><img src="<s:property value="channelTerms.host.pic"/>"/></a></li>--%>
    <%--<li class="imgLi"><a href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>"  title='<s:property value="channelTerms.host.nickName"/>'><img src="<s:property value="channelTerms.host.pic"/>"/></a></li>--%>
    <%--<li class="imgLi"><a href="userBlog.html?user.id=<s:property value="channelTerms.host.id"/>"  title='<s:property value="channelTerms.host.nickName"/>'><img src="<s:property value="channelTerms.host.pic"/>"/></a></li>--%>
    <%--<li class="li_more"><a href="javascript:;">更多&nbsp;↓</a></li>--%>
    <%--</ul>--%>
    <%--</div>--%>

    <s:if test="channelTerms.titbits != null">
        <div class="news lcb_round">
            <h4><s:property value="%{getText('live.term.new.events')}"/></h4>
            <ul class="list03 fblue">
                <li><a href="javascript:;" target="_blank" title="">&gt;&nbsp;&nbsp;<s:property
                        value="channelTerms.titbits"/></a></li>
            </ul>
        </div>
    </s:if>

    <div class="hot_terms lcb_round">
        <h4><s:property value="%{getText('live.term.of.hotest.channel')}"/></h4>
        <ul>
            <s:iterator value="liveChannels">
                <li class="imgLi">
                    <a class="up" href="javascript:;" title='<s:property value="name"/>'><img
                            src="<s:property value="logoUrl"/>"/></a>
                    <a class="down" href="javascript:;" title='<s:property value="name"/>'><s:property
                            value="name"/></a>
                </li>
            </s:iterator>
            <li class="li_more"><a href="javascript:;"><s:property value="%{getText('others.more')}"/>&nbsp;↓</a></li>
        </ul>
    </div>
    <div class="ads">
        <s:iterator value="advertisementForLives" status="idx">
            <a href="http://<s:property value="linkAddress"/>" target="_blank">
                <img class="advertise_rent" src="<s:property value="adLogoUrl"/>" class="showImg"/>
            </a>
        </s:iterator>

        <s:iterator value="courses">
            <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" target="_blank">
                <img class="advertise_rent" src="<s:property value="logoUrl"/>" class="showImg"/>
            </a>
        </s:iterator>

        <a class="ad-bid"
           href="listLiveChannelAdBid.html?liveChannel.id=<s:property value="channelTerms.liveChannel.id"/>"><s:property
                value="%{getText('live.term.ad.bidding')}"/></a>
    </div>
</div>

</div>

<script type="text/javascript">

    $(function () {
        var ff = new SellerScroll({
            lButton: "left_scroll_btn",
            rButton: "right_scroll_btn",
            oList: "scroll_list_ul",
            showSum: 3    //一次滚动多少个items
        });
    });


    <%--function  setUser2LiveFollower(liveChannelID){--%>
    <%--if(validateLogo()) {--%>
    <%--$.post("addUser2LiveFollower.html",{'liveChannel.id':liveChannelID},function(data){--%>
    <%--Boxy.alert("<s:text name='onlive.add.focus.success'/>");--%>
    <%--});--%>
    <%--}--%>
    <%--}--%>

    function submitComment(channelTermsID) {
        if (validateLogo()) {
            var messageText = $("#message_textarea").val();
            if (messageText == "") {
                $("#message_area_tip").html("<s:text name='blog.left.message.empty'/>");
                return;
            }
            $.post("saveLiveTermComment.html", {'channelTerms.id': channelTermsID, 'liveTermComment.content': messageText, 'commentsNum':<s:property value="commentsNum"/>}, function (data) {
                $("#message_list_ul").html(data);
            });
            $("#message_textarea").attr('value', "");
            $("#message_area_tip").html("");

        }
    }

    function replyToComment(nickName, userID) {
        var prefixStr = "<s:text name='blog.message.reply'/>";
        $("#message_textarea").val(prefixStr + nickName + ": ");
        $("#message_textarea").focus();
        $.post("putUserIDtoSession.html", {'user.id': userID}, function (data) {
        });
    }
    function deleteThisComment(obj, commentId) {
        $(obj).parents("li.li_out").remove();
        $.post("deleteLiveTermComment.html", {'liveTermComment.id': commentId}, function (data) {
        });
    }

    var SellerScroll = function (options) {
        this.SetOptions(options);
        this.lButton = this.options.lButton;
        this.rButton = this.options.rButton;
        this.oList = this.options.oList;
        this.showSum = this.options.showSum;

        this.iList = $("#" + this.options.oList + " > li");
        this.iListSum = this.iList.length;
        this.iListWidth = this.iList.outerWidth(true);
        this.moveWidth = this.iListWidth * this.showSum;

        this.dividers = Math.ceil(this.iListSum / this.showSum);	//共分为多少块
        this.moveMaxOffset = (this.dividers - 1) * this.moveWidth;
        this.LeftScroll();
        this.RightScroll();
    };
    SellerScroll.prototype = {
        SetOptions: function (options) {
            this.options = options;
            $.extend(this.options, options || {});
        },
        ReturnLeft: function () {
            return isNaN(parseInt($("#" + this.oList).css("left"))) ? 0 : parseInt($("#" + this.oList).css("left"));
        },
        LeftScroll: function () {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.lButton).click(function () {
                currentOffset = _this.ReturnLeft();
                if (currentOffset == 0) {
                    for (var i = 1; i <= _this.showSum; i++) {
                        $(_this.iList[_this.iListSum - i]).prependTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth });
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, { duration: "slow", complete: function () {
                        for (var j = _this.showSum + 1; j <= _this.iListSum; j++) {
                            $(_this.iList[_this.iListSum - j]).prependTo($("#" + _this.oList));
                        }
                        $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 1) });
                    } });
                } else {
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, "slow");
                }
            });
        },
        RightScroll: function () {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.rButton).click(function () {
                currentOffset = _this.ReturnLeft();
                if (Math.abs(currentOffset) >= _this.moveMaxOffset) {
                    for (var i = 0; i < _this.showSum; i++) {
                        $(_this.iList[i]).appendTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 2) });

                    $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, { duration: "slow", complete: function () {
                        for (var j = _this.showSum; j < _this.iListSum; j++) {
                            $(_this.iList[j]).appendTo($("#" + _this.oList));
                        }
                        $("#" + _this.oList).css({ left: 0 });
                    } });
                } else {
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, "slow");
                }
            });
        }
    };

    function setUser2LiveFollower() {
        if (validateLogo()) {
            $.post("addUser2LiveFollower.html", {'liveChannel.id':<s:property value="channelTerms.liveChannel.id"/>}, function (data) {
                Boxy.alert("<s:property value="%{getText('onlive.add.focus.success')}"/>");
                $("#focus_center").html("");
            });
        }
    }
</script>