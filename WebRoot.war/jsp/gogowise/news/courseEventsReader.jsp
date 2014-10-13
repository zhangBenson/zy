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
            <a href="javascript:;"><s:text name="gogowise.news"/></a><i>&gt;</i>
            <a href="javascript:;"><s:text name="course.square.of.new.events"/></a><i>
            &gt;</i><s:text name="gogowise.news.content"/>
        </p>
    </div>
</div>

<div class="wrap fl">
    <div class="con fl">
        <div class="article-title">
            <h2 id="share_title"><s:property value="courseNewEvent.title"/></h2>

            <div class="artInfo" id="blk_n001_003">
                <span id="pub_date"><s:date name="courseNewEvent.createTime"
                                            format="%{getText('dateformat.forclass')}"/></span>&nbsp;&nbsp;
                <span id="media_name">
                    <a class="pub_name" href="userBlog.html?user.id=<s:property value="courseNewEvent.owner.id"/>"
                       target="_blank"><s:property value="courseNewEvent.owner.nickName"/></a>&nbsp;&nbsp;&nbsp;
                </span>
            </div>
        </div>
        <div class="main-body">
            <%--<img  style="float:left;display: inline;margin:0 15px 15px 0;" alt="" src="<s:property value="courseNewEvent.logoUrl"/>" title="<s:property value="courseNewEvent.title"/>"/>--%>
            <p id="mainContent"><s:property value="courseNewEvent.content"/></p>
        </div>

        <div class="list_share fl">
            <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare" data="">
                <span style="float:left;line-height: 30px;margin-left: 10px;"><s:property value="%{getText('label.shared.with')}"/>：</span>
                <a class="bds_qzone">QQ空间</a>
                <a class="bds_tsina">新浪微博</a>
                <a class="bds_tqq">腾讯微博</a>
                <a class="bds_renren">人人网</a>
                <a class="bds_fbook">Facebook</a>
                <a class="bds_twi">Twitter</a>
                <span class="bds_more"><s:text name="others.more"/></span>
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
            <h3 class="stit"><strong><a target="_blank" href="javascript:;"><s:property value="%{getText('gogowise.announce')}"/></a></strong></h3>
            <ul class="everyday-list">
                <s:iterator value="goGoWiseAnnounces">
                    <li><a href="announceRead.html?goGoWiseAnnounce.id=<s:property value="id"/>"
                           class="goGoWiseAnnounce_newEvents"><s:property value="title"/></a></li>
                </s:iterator>
            </ul>
        </div>

        <div class="sdiv sdivt3">
            <h3 class="stit"><strong><a target="_blank" href="javascript:;"><s:property value="%{getText('gogowise.live.trailer')}"/></a></strong></h3>
            <ul class="everyday-list">
                <s:iterator value="liveTrailers">
                    <li><a href="liveTrailerRead.html?liveTrailer.id=<s:property value="id"/>"
                           class="goGoWiseAnnounce_newEvents"><s:property value="title"/></a></li>
                </s:iterator>
            </ul>
        </div>

        <div class="sdiv sdivt3">
            <h3 class="stit"><strong><a target="_blank" href="javascript:;"><s:property value="%{getText('course.square.of.new.events')}"/></a></strong></h3>
            <ul class="everyday-list">
                <s:iterator value="courseNewEvents">
                    <li><a href="courseEventRead.html?courseNewEvent.id=<s:property value="id"/>"
                           class="course_newEvents"><s:property value="title"/></a></li>
                </s:iterator>
            </ul>
        </div>

        <div class="sdiv sdivt3">
            <h3 class="stit"><strong><a target="_blank" href="javascript:;"><s:property value="%{getText('show.square.new.events')}"/></a></strong></h3>
            <ul class="everyday-list">
                <s:iterator value="showNewEvents">
                    <li><a href="showEventRead.html?showNewEvent.id=<s:property value="id"/>"
                           class="show_newEvents"><s:property value="title"/></a></li>
                </s:iterator>
            </ul>
        </div>


        <div class="sdiv">
            <h3 class="stit"><strong><a href="javascript:;"><s:property value="%{getText('news.center.course.recommend')}"/></a></strong><span><a href="javascript:;"
                                                                                                                                                  class="grey"><s:property value="%{getText('others.more')}"/>&gt;&gt;</a></span></h3>
            <ul class="recom-list clear">
                <s:iterator value="courses">
                    <li>
                        <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" target="_blank"><img
                                src="<s:property value="logoUrl"/>" alt="<s:property value="name"/>"></a>

                        <p><a href="voaCourseBlog.html?course.id=<s:property value="id"/>" target="_blank"><s:property value="name"/></a></p>
                    </li>
                </s:iterator>
            </ul>
        </div>

    </div>
</div>

