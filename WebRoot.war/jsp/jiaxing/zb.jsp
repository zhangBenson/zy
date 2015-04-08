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
        <div class="zbClassBox">
            <div class="cMoBox mainTopBar">
                <dl class="zbDl">
                    <dt>
                    <div class="fL dtTit"><strong>|&nbsp;直播课堂</strong></div>
                    </dt>
                </dl>
            </div>
            <div class="zb_c_sear">
                <p><span>学段：</span>
                    <a href="dbClass.html" class="on">全部</a><a href="dbClass.html?studentAgeType=1">高三</a>
                    <a href="dbClass.html?studentAgeType=2">高二</a><a href="dbClass.html?studentAgeType=3">高一</a>
                    <a href="dbClass.html?studentAgeType=4">初三</a><a href="dbClass.html?studentAgeType=5">初二</a>
                    <a href="dbClass.html?studentAgeType=6">初一</a><a href="dbClass.html?studentAgeType=7">小学</a>
                    <a href="dbClass.html?studentAgeType=8">其它</a>
                </p>

                <p>
                    <span>学科：</span>
                    <a href="zbClass.html" class="on">全部</a>
                    <a href="zbClass.html?courseType=1">语文</a><a href="zbClass.html?courseType=2">数学</a>
                    <a href="zbClass.html?courseType=3">英语</a><a href="zbClass.html?courseType=4">物理</a>
                    <a href="zbClass.html?courseType=5">化学</a><a href="zbClass.html?courseType=6">生物</a>
                    <a href="zbClass.html?courseType=7">地理</a>
                    <a href="zbClass.html?courseType=8">历史</a><a href="zbClass.html?courseType=9">其它</a>
                </p>
            </div>
            <ul class="zbCList clearfix">
                <s:iterator value="courses" status="status">
                    <li>
                        <a href="lecturerClass.html?courseClass.id=<s:property value="classOnTheCorner.id"/>" class="cImg">
                            <img src="<s:property value="logoUrl"/>"/>

                            <div class="vTip"><span class="abtn_1">直播<em class="icons icon_play_white"></em></span></div>
                        </a>

                        <div class="cInfo">
                            <strong><a href="voaCourseBlog.html?course.id=<s:property value="id"/>"><s:property
                                    value="name"/></a><s:property value="classOnTheCorner.name"/></strong>

                            <p>老师：<s:property value="teacher.nickName"/></p>

                            <p>学校：<a href="orgBlog.html?org.id=<s:property value="organization.id"/>"><s:property value="organization.schoolName"/></a></p>
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

