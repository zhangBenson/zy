<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%--<link rel="stylesheet" href="css/course/bootstrap.min.css"/>--%>
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

<div class="container">
    <div class="bgee">
        <div class="skmsBox clearfix">
            <dl class="cMoBox fL msMainCont">
                <dt>
                <div class="fL dtTit"><strong>|&nbsp;授课名师</strong></div>
                </dt>
                <dd>
                    <div class="zb_c_sear">

                        <p><span>学段：</span>
                            <a href="msList.html" class="on" id="xueduan">全部</a><a href="msList.html?studentAgeType=1" id="xueduan1">高三</a>
                            <a href="msList.html?studentAgeType=2" id="xueduan2">高二</a><a href="msList.html?studentAgeType=3" id="xueduan3">高一</a>
                            <a href="msList.html?studentAgeType=4" id="xueduan4">初三</a><a href="msList.html?studentAgeType=5" id="xueduan5">初二</a>
                            <a href="msList.html?studentAgeType=6" id="xueduan6">初一</a><a href="msList.html?studentAgeType=7" id="xueduan7">小学</a>
                            <a href="msList.html?studentAgeType=8" id="xueduan8">其它</a>
                        </p>

                        <p>
                            <span>学科：</span>
                            <a href="msList.html" class="on" id="xueke">全部</a>
                            <a href="msList.html?courseType=1" id="xueke1">语文</a><a href="msList.html?courseType=2" id="xueke2">数学</a>
                            <a href="msList.html?courseType=3" id="xueke3">英语</a><a href="msList.html?courseType=4" id="xueke4">物理</a>
                            <a href="msList.html?courseType=5" id="xueke5">化学</a><a href="msList.html?courseType=6" id="xueke6">生物</a>
                            <a href="msList.html?courseType=7" id="xueke7">地理</a>
                            <a href="msList.html?courseType=8" id="xueke8">历史</a><a href="msList.html?courseType=9" id="xueke9">其它</a>
                        </p>

                    </div>
                    <ul class="msList clearfix">

                        <s:iterator value="teachers" status="status">
                            <s:if test="#status.index%2==1">
                                <li class="liNobg">
                            </s:if>
                            <s:else>
                                <li>
                            </s:else>
                            <div class="msPhoto"><a href="msVideo.html?teacher.id=<s:property value="id"/>"><img src="<s:property value="pic"/>"/></a></div>
                            <div class="msTxt">
                                <strong><s:property value="nickName"/></strong>

                                <p><span>学科：<em class="fontc">数学</em></span><span>学段：<em class="fontc">高中</em></span></p>

                                <p>职称：中学高级教师、高中英语评价小组成员</p>

                                <p>简介： <s:property value="user.selfDescription"/> <a href="msInfo.html?teacher.id=<s:property value="id"/>">[详细]</a></p>

                                <p>视频：<span class="abtn_2">直播<em class="icons icon_play_gray"></em></span><a href="msVideo.html?teacher.id=<s:property value="id"/>" class="abtn_1">点播<em class="icons icon_play_white"></em></a></p>
                            </div>
                            </li>
                        </s:iterator>


                    </ul>
                    <div class="clearfix"></div>

                    <tiles:insertTemplate template="common/pagination.jsp">
                        <tiles:putAttribute name="pagination" value="${pagination}"/>
                    </tiles:insertTemplate>


                </dd>
            </dl>
            <dl class="cMoBox fR msRecom">
                <dt>
                <div class="fL dtTit"><strong>|&nbsp;课堂推荐</strong></div>
                </dt>
                <dd>
                    <div class="recClass">
                        <ul class="recClassList">

                            <s:iterator value="records" status="status">
                                <li>
                                    <div class="classPic"><a href="playerClass.html?courseClass.id=<s:property value="lastRecordClass.id"/>">
                                        <img src="<s:property value="logoUrl"/>"/>
                                    </a>
                                    </div>
                                    <div class="cInfo">
                                        <strong><s:property value="name"/><s:property value="classOnTheCorner.name"/></strong>

                                        <p>主讲老师：<s:property value="teacher.nickName"/></p>

                                        <p>学校：<s:property value="organization.schoolName"/></p>
                                    </div>
                                </li>
                            </s:iterator>


                        </ul>
                    </div>
                </dd>
            </dl>
        </div>
    </div>
</div>
<script type="text/javascript">

    <s:if test="studentAgeType >0 ">
    document.getElementById("xueduan").className = 'temp';
    document.getElementById("xueduan<s:property value="studentAgeType"/>").className = 'on';
    </s:if>

    <s:if test="courseType >0">
    document.getElementById("xueke").className = 'temp';
    document.getElementById("xueke<s:property value="courseType"/>").className = 'on';
    </s:if>
</script>

