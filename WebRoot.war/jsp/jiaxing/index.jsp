<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

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

        $(".ul_Jlist li").hover(function () {
            $(this).children(".cInfo").animate({"top": "0px"}, 400, "swing");
        }, function () {
            var _height = $(this).height();
            $(this).children(".cInfo").animate({"top": "+" + _height - 30 + "px"}, 400, "swing");
        });

    });
</script>

<div class="container">
    <div class="banner" style="width: 1200px;">
        <div id="slides" class="slides" style="width: 1200px;">
            <img src="images/photo/pic_banner1.jpg"/>
            <img src="images/photo/pic_banner2.jpg"/>
            <img src="images/photo/pic_banner3.jpg"/>
        </div>
        <div class="bannerBot" style="width: 1200px;"></div>
    </div>
    <div class="cMoBox zbCMo">
        <dl class="zbDl">
            <dt>
            <div class="fL dtTit"><strong>|&nbsp;直播课堂</strong></div>
            <a href="zbClass.html" class="fR">更多&raquo;</a></dt>
            <dd>
                <ul class="ul_Jlist zb_cList clearfix">


                    <s:iterator value="courses" status="status">
                        <s:if test="#status.index%4==3">
                            <li class="noMR">
                        </s:if>
                        <s:else>
                            <li>
                        </s:else>


                        <img src="<s:property value="logoUrl"/>"/>

                        <div class="cInfo">
                            <strong><s:property value="name"/><s:property value="classOnTheCorner.name"/></strong>

                            <p>老师：<s:property value="teacher.nickName"/></p>

                            <p>学校：<s:property value="organization.schoolName"/></p>

                            <p class="alignR" id="livep<s:property value='#status.index'/>" name="livep" date="<s:date  name="classOnTheCorner.finishDate" format="%{getText('dateformat.forclass')}"/>"><a href="lecturerClass.html?courseClass.id=<s:property value="classOnTheCorner.id"/>" class="abtn_1">直播<em class="icons icon_play_white"></em></a></p>

                        </div>
                        </li>
                    </s:iterator>


                </ul>
            </dd>
        </dl>
    </div>
    <div class="cMoBox dbCMo">
        <dl class="zbDl">
            <dt>
            <div class="fL dtTit"><strong>|&nbsp;点播课堂</strong></div>
            <a href="dbClass.html" class="fR">更多&raquo;</a></dt>
            <dd>
                <ul class="ul_Jlist db_cList clearfix">


                    <s:iterator value="records" status="status">
                        <s:if test="#status.index==0">


                    <li class="db_tag">
                        <img src="<s:property value="logoUrl"/>"/>

                        <div class="cInfo">
                            <div class="tagTxt clearfix"><strong class="fL"><s:property value="name"/><s:property value="lastRecordClass.name"/></strong>

                                <div class="fR">时长：<s:property value="lastRecordClass.duration"/>分钟</div>
                            </div>
                            <p>老师：<s:property value="teacher.nickName"/></p>

                            <p>学校：<s:property value="organization.schoolName"/></p>

                            <p>&nbsp;</p>

                            <p>&nbsp;</p>

                            <p>&nbsp;</p>

                            <p>&nbsp;</p>

                            <p class="alignR"><a href="playerClass.html?courseClass.id=<s:property value="lastRecordClass.id"/>" class="abtn_1">播放<em class="icons icon_play_white"></em></a></p>
                        </div>
                    </li>
                        </s:if>
                        <s:else>
                            <s:if test="#status.index==3 ||#status.index==6">
                                <li class="noMR">
                            </s:if>
                            <s:else>
                                <li>
                            </s:else>
                            <img src="<s:property value="logoUrl"/>"/>

                        <div class="cInfo">
                            <strong><s:property value="name"/><s:property value="lastRecordClass.name"/></strong>

                            <p>老师：<s:property value="teacher.nickName"/></p>

                            <p>学校：<s:property value="organization.schoolName"/></p>

                            <p class="alignR"><a href="playerClass.html?courseClass.id=<s:property value="lastRecordClass.id"/>" class="abtn_1">播放<em class="icons icon_play_white"></em></a></p>
                        </div>
                    </li>
                        </s:else>

                    </s:iterator>

                </ul>
            </dd>
        </dl>
    </div>
    <div class="thumbBox clearfix">
        <div class="fL thb_lCont">
            <div class="cMoBox msCMo">
                <dl class="msDl">
                    <dt>
                    <div class="fL dtTit"><strong>|&nbsp;授课名师</strong></div>
                    <a href="msList.html" class="fR">更多&raquo;</a></dt>
                    <dd>
                        <ul class="ms_cList clearfix">

                            <s:iterator value="teachers" status="status">
                                <s:if test="#status.index%4==3">
                                    <li class="noMR">
                                </s:if>
                                <s:else>
                                    <li>
                                </s:else>
                                <a href="msInfo.html?teacher.id=<s:property value="id"/>"><img src="<s:property value="pic"/>"/></a>

                                <div class="cInfo">
                                    <strong><s:property value="nickName"/></strong>

                                    <p><span class="sphalf">学科：数学</span>学段：高中 </p>

                                    <p>中学高级教师</p>
                                </div>
                            </li>
                            </s:iterator>

                        </ul>
                    </dd>
                </dl>
            </div>
        </div>
        <div class="fR thb_rCont">
            <div class="cMoBox newsCMo">
                <dl class="newsDl">
                    <dt>
                    <div class="fL dtTit"><strong>|&nbsp;教育资讯</strong></div>
                    <a href="news.html" class="fR">更多&raquo;</a></dt>
                    <dd>
                        <ul class="news_cList clearfix">
                            <li><span>•</span><a href="newsInfo.html">江苏太仓：做学生喜欢的智慧教育</a></li>
                            <li><span>•</span><a href="newsInfo.html">江苏太仓：做学生喜欢的智慧教育</a></li>
                            <li><span>•</span><a href="newsInfo.html">江苏太仓：做学生喜欢的智慧教育</a></li>
                            <li><span>•</span><a href="newsInfo.html">江苏太仓：做学生喜欢的智慧教育</a></li>
                            <li><span>•</span><a href="newsInfo.html">江苏太仓：做学生喜欢的智慧教育</a></li>
                            <li><span>•</span><a href="newsInfo.html">江苏太仓：做学生喜欢的智慧教育做学生喜欢的智慧教育做学生喜欢的智慧教育</a></li>
                        </ul>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
</div>
