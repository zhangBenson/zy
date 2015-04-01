<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link rel="stylesheet" href="css/course/bootstrap.min.css"/>
<script type="text/javascript">
    $(function () {
        //banner slides
        $('#slides').slidesjs({
            width: 1246,
            height: 458,
            fadeSpeed: 5000,
            start: 1,
            play: {
                auto: true
            }
        });

    });
</script>

<div class="crumbBar">
    <div class="crumbTxt"><a href="index.html">首页</a>&gt;<a href="msList.html">授课名师</a></div>
</div>
<div class="container">
    <div class="bgee">
        <div class="zbClassBox">
            <ul class="msList clearfix">
                <li>
                    <div class="msName"><strong><s:property value="teacher.nickName"/></strong></div>
                    <div class="msPhoto"><img src="<s:property value="pic"/>"/></div>
                    <div class="msTxt">
                        <p>学校：<s:property value="orgTeacher.org.schoolName"/></p>

                        <p><span>学科：<em class="fontc">数学</em></span></p>

                        <p><span>学段：<em class="fontc">高中</em></span></p>

                        <p>职称：中学高级教师、高中英语评价小组成员</p>

                        <p>视频：<span class="abtn_2">直播<em class="icons icon_play_gray"></em></span><a href="msVideo.html?teacher.id=<s:property value="teacher.id"/>" class="abtn_1">点播<em class="icons icon_play_white"></em></a></p>
                    </div>
                </li>
            </ul>
            <div class="clearfix"></div>
            <div class="cMoBox mainTopBar">
                <dl class="zbDl">
                    <dt>
                    <div class="fL dtTit"><strong>|&nbsp;个人简介</strong></div>
                    </dt>
                    <dd>
                        <div style=" padding:0 25px 30px; font-size:16px; line-height:30px;"><p>     <s:property value="user.selfDescription"/></p>
                        </div>
                    </dd>
                </dl>
            </div>
            <div class="cMoBox zbCMo">
                <dl class="zbDl">
                    <dt>
                    <div class="fL dtTit"><strong>|&nbsp;公开课视频</strong></div>
                    <a href="msVideo.html?teacher.id=<s:property value="teacher.id"/>" class="fR">更多&raquo;</a></dt>
                    <dd>
                        <ul class="zbCList zbCList2 clearfix">

                            <s:iterator value="records" status="status">
                                <li>
                                    <a href="playerClass.html?courseClass.id=<s:property value="lastRecordClass.id"/>" class="cImg">
                                        <img src="<s:property value="logoUrl"/>"/>

                                        <div class="vTip"><span class="vTime">时长：<s:property value="classOnTheCorner.duration"/>分钟</span><span class="abtn_1">播放<em class="icons icon_play_white"></em></span></div>
                                    </a>
                                </li>
                            </s:iterator>

                        </ul>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
</div>

