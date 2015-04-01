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
                        <p><span>学段：</span><a href="#" class="on">全部</a><a href="#">高三</a><a href="#">高二</a><a href="#">高一</a><a href="#">初三</a><a href="#">初二</a><a href="#">初一</a><a href="#">小学</a><a href="#">其它</a></p>

                        <p><span>学科：</span><a href="#" class="on">全部</a><a href="#">语文</a><a href="#">数学</a><a href="#">英语</a><a href="#">物理</a><a href="#">化学</a><a href="#">生物</a><a href="#">地理</a><a href="#">历史</a><a href="#">其它</a></p>
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

