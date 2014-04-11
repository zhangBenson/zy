<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/news/list.css" rel="stylesheet" type="text/css"/>
<%@ include file="/jsp/gogowise/news/newsReader_js.jsp" %>

<script type="text/javascript">
    $(document).ready(function () {
        var content = $("#mainContent").text();
        $("#mainContent").html(content);
    });
</script>

<div class="dfz-nav fl">
    <div class="fl">
        <%--<h2 class="sinalogo-nav logo-1192"><a href="http://hunan.sina.com.cn/" target="_blank">新浪湖南</a></h2>--%>
        <p class="bnav">
            <a href="javascript:;"><s:property value="%{getText('gogowise.news')}"/></a><i>&gt;</i>
            <a href="javascript:;"><s:property value="%{getText('gogowise.live.trailer')}"/></a><i>&gt;</i><s:property
                value="%{getText('gogowise.news.content')}"/>
        </p>
    </div>
</div>

<div class="wrap fl">
    <div class="con fl">
        <div class="article-title">
            <h2 id="share_title"><s:property value="liveTrailer.title"/></h2>
        </div>
        <div class="artInfo" id="blk_n001_003">
            <span id="pub_date"><s:date name="liveTrailer.publishTime"
                                        format="%{getText('dateformat.forclass')}"/></span>&nbsp;&nbsp;
            <span id="media_name">
                <a class="pub_name" href="userBlog.html?user.id=<s:property value="liveTrailer.owner.id"/>"
                   target="_blank"><s:property value="liveTrailer.owner.nickName"/></a>&nbsp;&nbsp;&nbsp;
                <s:if test="personalOnlive != null">
                    <a class="watch"
                       href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="personalOnlive.id"/>"
                       target="_blank"><s:property value="%{getText('watch.the.live.term')}"/></a>
                </s:if>
                <s:else>
                    <a class="watch" href="userBlog.html?user.id=<s:property value="liveTrailer.owner.id"/>"
                       target="_blank"><s:property value="%{getText('enter.into.user.blog')}"/></a>
                </s:else>
            </span>
        </div>
        <div class="main-body">
            <%--<img  style="float:left;display: inline;margin:0 15px 15px 0;" alt="" src="<s:property value="goGoWiseAnnounce.logoUrl"/>" title="<s:property value="goGoWiseAnnounce.title"/>"/>--%>
            <p id="mainContent"><s:property value="liveTrailer.content"/></p>
        </div>

        <div class="list_share fl">
            <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare" data="">
                <span style="float:left;line-height: 30px;margin-left: 10px;"><s:property
                        value="%{getText('label.shared.with')}"/>：</span>
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
                var share_title = document.getElementById("share_title").innerText + "@GoGoWise";
                var share_pic = "";
                var share_comment = share_title;
                var share_desc = share_title;

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

    <div class="side fr">

        <div class="sdiv sdivt3">
            <h3 class="stit"><strong><a target="_blank" href="javascript:;"><s:property
                    value="%{getText('gogowise.announce')}"/></a></strong></h3>
            <ul class="everyday-list">
                <s:iterator value="goGoWiseAnnounces">
                    <li><a href="announceRead.html?goGoWiseAnnounce.id=<s:property value="id"/>"
                           class="goGoWiseAnnounce_newEvents"><s:property value="title"/></a></li>
                </s:iterator>
            </ul>
        </div>

        <div class="sdiv sdivt3">
            <h3 class="stit"><strong><a target="_blank" href="javascript:;"><s:property
                    value="%{getText('gogowise.live.trailer')}"/></a></strong></h3>
            <ul class="everyday-list">
                <s:iterator value="liveTrailers">
                    <li><a href="liveTrailerRead.html?liveTrailer.id=<s:property value="id"/>"
                           class="goGoWiseAnnounce_newEvents"><s:property value="title"/></a></li>
                </s:iterator>
            </ul>
        </div>

        <div class="sdiv sdivt3">
            <h3 class="stit"><strong><a target="_blank" href="javascript:;"><s:property
                    value="%{getText('course.square.of.new.events')}"/></a></strong></h3>
            <ul class="everyday-list">
                <s:iterator value="courseNewEvents">
                    <li><a href="courseEventRead.html?courseNewEvent.id=<s:property value="id"/>"
                           class="course_newEvents"><s:property value="title"/></a></li>
                </s:iterator>
            </ul>
        </div>

        <div class="sdiv sdivt3">
            <h3 class="stit"><strong><a target="_blank" href="javascript:;"><s:property
                    value="%{getText('show.square.new.events')}"/></a></strong></h3>
            <ul class="everyday-list">
                <s:iterator value="showNewEvents">
                    <li><a href="showEventRead.html?showNewEvent.id=<s:property value="id"/>"
                           class="show_newEvents"><s:property value="title"/></a></li>
                </s:iterator>
            </ul>
        </div>

        <%--<div class="sdiv sdivt3">--%>
        <%--<h3 class="stit"><strong><a target="_blank" href="http://hunan.sina.com.cn/news/"><s:property value="%{getText('live.square.new.events')}"/></a></strong></h3>--%>
        <%--<ul class="everyday-list">--%>
        <%--<s:iterator value="liveChannelNewEvents">--%>
        <%--<li><a href="liveChannelEventRead.html?liveChannelNewEvent.id=<s:property value="id"/>" class="liveChannel_newEvents"><s:property value="title"/></a></li>--%>
        <%--</s:iterator>--%>
        <%--</ul>--%>
        <%--</div>--%>

        <%--<div class="sdiv vedio-recom clear">--%>
        <%--<h3 class="stit"><strong><a href="javascript:;"><s:property value="%{getText('news.center.recommend.video')}"/></a></strong><span><a href="javascript:;" class="grey"><s:property value="%{getText('others.more')}"/>&gt;&gt;</a></span></h3>--%>
        <%--<ul class="recom-list clear">--%>
        <%--<s:iterator value="liveChannels">--%>
        <%--<li>--%>
        <%--<a href="liveTermBlog.html?channelTerms.id=<s:property value="lastOwnRecordTerm.id"/>" title="<s:property value="lastOwnRecordTerm.subTitle"/>"><img src="<s:property value="lastOwnRecordTerm.logoUrl"/>" alt="<s:property value="lastOwnRecordTerm.subTitle"/> "></a>--%>
        <%--&lt;%&ndash;<i>03:02</i>&ndash;%&gt;--%>
        <%--<p style="height:21px;overflow:hidden;"><a href="liveTermBlog.html?channelTerms.id=<s:property value="lastOwnRecordTerm.id"/>" title="<s:property value="lastOwnRecordTerm.subTitle"/> "><s:property value="lastOwnRecordTerm.subTitle"/> </a></p>--%>
        <%--<p class="cnum"><em class="icon iplay"><s:property value="totalInviteNum"/></em></p>--%>
        <%--</li>--%>
        <%--</s:iterator>--%>
        <%--</ul>--%>
        <%--</div>--%>

        <div class="sdiv">
            <h3 class="stit"><strong><a href="javascript:;"><s:property
                    value="%{getText('news.center.course.recommend')}"/></a></strong><span><a href="javascript:;"
                                                                                              class="grey"><s:property
                    value="%{getText('others.more')}"/>&gt;&gt;</a></span></h3>
            <ul class="recom-list clear">
                <s:iterator value="courses">
                    <li>
                        <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" target="_blank"><img
                                src="<s:property value="logoUrl"/>" alt="<s:property value="name"/>"></a>

                        <p><a href="voaCourseBlog.html?course.id=<s:property value="id"/>" target="_blank"><s:property
                                value="name"/></a></p>
                    </li>
                </s:iterator>
            </ul>
        </div>

    </div>
</div>