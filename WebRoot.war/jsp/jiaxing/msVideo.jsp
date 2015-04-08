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
            <div class="cMoBox mainTopBar">
                <dl class="zbDl">
                    <dt>
                    <div class="fL dtTit"><strong>|&nbsp;"<span class="fontc"><s:property value="teacher.nickName"/></span>"的公开课</strong></div>
                    </dt>
                </dl>
            </div>
            <ul class="zbCList clea   rfix">

                <s:iterator value="records" status="status">
                    <li>
                        <a href="playerClass.html?courseClass.id=<s:property value="lastRecordClass.id"/>" class="cImg">
                            <img src="<s:property value="logoUrl"/>"/>

                            <div class="vTip"><span class="vTime">时长：<s:property value="lastRecordClass.duration"/>分钟</span><span class="abtn_1">播放<em class="icons icon_play_white"></em></span></div>
                        </a>

                        <div class="cInfo">
                            <strong><a href="voaCourseBlog.html?course.id=<s:property value="id"/>"><s:property value="name"/></a>----<s:property value="lastRecordClass.name"/></strong>

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

