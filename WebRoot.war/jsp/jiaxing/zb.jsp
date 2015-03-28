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
<div class="container">
    <div class="bgee">
        <div class="zbClassBox">
            <div class="cMoBox mainTopBar">
                <dl class="zbDl">
                    <dt>
                    <div class="fL dtTit"><strong>|&nbsp;直播课堂</strong></div>
                    </dt>
                </dl>
            </div>
            <div class="zb_c_sear">
                <p><span>学段：</span><a href="#" class="on">全部</a><a href="#">高三</a><a href="#">高二</a><a href="#">高一</a><a href="#">初三</a><a href="#">初二</a><a href="#">初一</a><a href="#">小学</a><a href="#">其它</a></p>

                <p><span>学科：</span><a href="#" class="on">全部</a><a href="#">语文</a><a href="#">数学</a><a href="#">英语</a><a href="#">物理</a><a href="#">化学</a><a href="#">生物</a><a href="#">地理</a><a href="#">历史</a><a href="#">其它</a></p>
            </div>
            <ul class="zbCList clearfix">
                <s:iterator value="courses" status="status">
                    <li>
                        <a href="lecturerClass.html?courseClass.id=<s:property value="classOnTheCorner.id"/>" class="cImg">
                            <img src="<s:property value="logoUrl"/>"/>

                            <div class="vTip"><span class="abtn_1">直播<em class="icons icon_play_white"></em></span></div>
                        </a>

                        <div class="cInfo">
                            <strong><s:property value="name"/><s:property value="classOnTheCorner.name"/></strong>

                            <p>老师：<s:property value="teacher.nickName"/></p>

                            <p>学校：<s:property value="organization.schoolName"/></p>
                        </div>
                    </li>
                </s:iterator>

            </ul>

            <tiles:insertTemplate template="common/pagination.jsp">
                <tiles:putAttribute name="pagination" value="${pagination}"/>
            </tiles:insertTemplate>

        </div>
    </div>
</div>

