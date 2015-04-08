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
        <div class="skmsBox clearfix">
            <dl class="cMoBox fL msMainCont">
                <dt>
                <div class="fL dtTit"><strong>|&nbsp;教育资讯</strong></div>
                </dt>
                <dd>
                    <div class="newsBox">
                        <ul class="newsList">
                            <li><a href="newsInfo.html"><span>•</span>江苏太仓：做学生喜欢的智慧教育<span
                                    class="pubTime">[2015-03-24]</span></a></li>
                            <li><a href="newsInfo.html"><span>•</span>江苏太仓：做学生喜欢的智慧教育<span
                                    class="pubTime">[2015-03-24]</span></a></li>
                            <li><a href="newsInfo.html"><span>•</span>江苏太仓：做学生喜欢的智慧教育<span
                                    class="pubTime">[2015-03-24]</span></a></li>
                            <li><a href="newsInfo.html"><span>•</span>江苏太仓：做学生喜欢的智慧教育<span
                                    class="pubTime">[2015-03-24]</span></a></li>
                            <li><a href="newsInfo.html"><span>•</span>江苏太仓：做学生喜欢的智慧教育江苏太仓：做学生喜欢的智慧教育江苏太仓：做学生喜欢的智慧教育<span
                                    class="pubTime">[2015-03-24]</span></a></li>
                            <li><a href="newsInfo.html"><span>•</span>江苏太仓：做学生喜欢的智慧教育<span
                                    class="pubTime">[2015-03-24]</span></a></li>
                            <li><a href="newsInfo.html"><span>•</span>江苏太仓：做学生喜欢的智慧教育<span
                                    class="pubTime">[2015-03-24]</span></a></li>
                            <li><a href="newsInfo.html"><span>•</span>江苏太仓：做学生喜欢的智慧教育<span
                                    class="pubTime">[2015-03-24]</span></a></li>
                            <li><a href="newsInfo.html"><span>•</span>江苏太仓：做学生喜欢的智慧教育<span
                                    class="pubTime">[2015-03-24]</span></a></li>
                            <li><a href="newsInfo.html"><span>•</span>江苏太仓：做学生喜欢的智慧教育江苏太仓：做学生喜欢的智慧教育江苏太仓：做学生喜欢的智慧教育<span
                                    class="pubTime">[2015-03-24]</span></a></li>
                        </ul>
                        <div class="clearfix"></div>
                        <div class="pagebreak"><span>每页10条记录</span><a title="首页" href="#!">首页</a><a class="pre"
                                                                                                    title="上一页"
                                                                                                    href="#!">上一页</a><a
                                href="#!">1</a><a href="#!">2</a><a class="cur" href="#!">3</a> <span
                                class="nums">...</span> <a href="#!">8</a><a href="#!">9</a><a href="#!">10</a><a
                                class="next" title="下一页" href="#!">下一页</a><a title="末页" href="#!">末页</a><input
                                type="text" class="pgb_jump"><a title="跳转" href="#!">跳转</a></div>
                    </div>
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
                                    <div class="classPic"><a
                                            href="playerClass.html?courseClass.id=<s:property value="lastRecordClass.id"/>">
                                        <img src="<s:property value="logoUrl"/>"/>
                                    </a>
                                    </div>
                                    <div class="cInfo">
                                        <strong><s:property value="name"/><s:property
                                                value="classOnTheCorner.name"/></strong>

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
