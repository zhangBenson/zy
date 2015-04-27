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
                    <div class="fL dtTit" style="margin-left: 10px;"><strong>|&nbsp;点播课堂</strong></div>
                    </dt>
                </dl>
            </div>
            <div class="zb_c_sear">
                <p><span>学段：</span>
                    <a href="dbClass.html" class="on" id="xueduan">全部</a><a href="dbClass.html?studentAgeType=1" id="xueduan1">高三</a>
                    <a href="dbClass.html?studentAgeType=2" id="xueduan2">高二</a><a href="dbClass.html?studentAgeType=3" id="xueduan3">高一</a>
                    <a href="dbClass.html?studentAgeType=4" id="xueduan4">初三</a><a href="dbClass.html?studentAgeType=5" id="xueduan5">初二</a>
                    <a href="dbClass.html?studentAgeType=6" id="xueduan6">初一</a><a href="dbClass.html?studentAgeType=7" id="xueduan7">小学</a>
                    <a href="dbClass.html?studentAgeType=8" id="xueduan8">其它</a>
                </p>

                <p>
                    <span>学科：</span>
                    <a href="dbClass.html" class="on" id="xueke">全部</a>
                    <a href="dbClass.html?courseType=1" id="xueke1">语文</a><a href="dbClass.html?courseType=2" id="xueke2">数学</a>
                    <a href="dbClass.html?courseType=3" id="xueke3">英语</a><a href="dbClass.html?courseType=4" id="xueke4">物理</a>
                    <a href="dbClass.html?courseType=5" id="xueke5">化学</a><a href="dbClass.html?courseType=6" id="xueke6">生物</a>
                    <a href="dbClass.html?courseType=7" id="xueke7">地理</a>
                    <a href="dbClass.html?courseType=8" id="xueke8">历史</a><a href="dbClass.html?courseType=9" id="xueke9">其它</a>
                </p>
            </div>
            <ul class="zbCList dbCList clearfix">
                <s:iterator value="courses" status="status">
                    <li>
                        <a href="playerClass.html?courseClass.id=<s:property value="lastRecordClass.id"/>" class="cImg">
                            <img src="<s:property value="logoUrl"/>"/>

                            <div class="vTip"><span class="vTime">时长：<s:property value="lastRecordClass.duration"/>分钟</span><span class="abtn_1">播放<em class="icons icon_play_white"></em></span></div>
                        </a>

                        <div class="cInfo">
                            <strong>课程：<a href="voaCourseBlog.html?course.id=<s:property value="id"/>"><s:property
                                    value="name"/></a><s:property value="lastRecordClass.name"/></strong>

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
