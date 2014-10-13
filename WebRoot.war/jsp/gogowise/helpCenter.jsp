<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/help_center.css" rel="stylesheet" type="text/css"/>

<div class="content_container">
    <div class="content_body">
        <ul>
            <li class="help_question" onclick="showAnswer(this);"><span class="num">1</span><s:text name="faq1"/></li>
            <li class="help_answer">
                <div class="pic_1"></div>
                <div class="pic_2">
                    <p><s:text name="faq1.1"/><br/><br/>
                        <img width="552" height="310" src="images/helpCenter/helpCenter_clip_image002.jpg"/><br/><br/>
                        <s:text name="faq1.2"/><br/><br/>
                        <img width="334" height="209" src="images/helpCenter/helpCenter_clip_image003.jpg"/> <br/><br/>
                        <s:text name="faq1.3"/>
                    </p>

                    <p><s:text name="faq1.4"/></p>
                </div>
                <div class="pic_3"></div>
            </li>
            <li class="help_question" onclick="showAnswer(this);"><span class="num">2</span><s:text name="faq2"/></li>
            <li class="help_answer">
                <div class="pic_1"></div>
                <div class="pic_2">
                    <p>
                        <s:text name="faq2.1"/><br/><br/>
                        <img width="552" height="310" src="images/helpCenter/helpCenter_clip_image002.jpg"/><br/><br/>
                        <s:text name="faq2.2"/><br/><br/>
                        <img src="images/helpCenter/q2_1.jpg" alt="q2_1" width="558" height="313"/><br/><br/>
                        <s:text name="faq2.3"/><br/><br/>
                        <img src="images/helpCenter/q2_2.jpg" alt="q2_2" width="558" height="423"/><br/><br/>
                    </p>
                </div>
                <div class="pic_3"></div>
            </li>
            <li class="help_question" onclick="showAnswer(this);"><span class="num">3</span><s:text name="faq3"/></li>
            <li class="help_answer">
                <div class="pic_1"></div>
                <div class="pic_2">
                    <ul>
                        <li><s:text name="faq3.1"/><br/><br/></li>
                        <li><s:text name="faq3.2"/><br/><br/></li>
                        <li><s:text name="faq3.3"/><br/></li>
                    </ul>
                </div>
                <div class="pic_3"></div>
            </li>
            <li class="help_question" onclick="showAnswer(this);"><span class="num">4</span><s:text name="faq4"/></li>
            <li class="help_answer">
                <div class="pic_1"></div>
                <div class="pic_2">
                    <ul>
                        <li><s:text name="faq4.1"/><br/><br/></li>
                        <li><s:text name="faq4.2"/><br/><br/></li>
                        <li><s:text name="faq4.3"/><br/><br/>
                        </li>
                    </ul>
                </div>
                <div class="pic_3"></div>
            </li>
            <%--<li class="help_question" onclick="showAnswer(this);"><span class="num">5</span>如何创建直播栏目？</li>--%>
            <%--<li class="help_answer">--%>
            <%--<div class="pic_1"></div>--%>
            <%--<div class="pic_2">--%>
            <%--<ul>--%>
            <%--<li>（1）	登录系统之后点击系统左边菜单栏的“我的直播”按键，并选择创建直播栏目选项。进入直播栏目创建系统。<br/><br/></li>--%>
            <%--<li>（2）	根据填写要求，用户输入直播栏目信息，填写完毕之后，用户可以选择第一时间发布栏目信息，也可以选择继续填写属于栏目的第一期节目的信息。<br/><br/></li>--%>
            <%--<li>（3）	填写节目信息时需要用户输入节目的开始时间，节目名称，节目描述，以及相关的人员邀请，节目主持人系统默认为您自己，您也可以选择输入其他人的email，作为节目的主持人，同时，你还可以邀请节目的选手和嘉宾。所邀请的选手可以是作为节目的比赛选手也可以是各个地区的录播人员。确认发布之后，系统会发送相应的email到相应的用户，通知告诉其节目信息。<br/><br/>--%>
            <%--</li>--%>
            <%--</ul>--%>
            <%--</div>--%>
            <%--<div class="pic_3"></div>--%>
            <%--</li>--%>
            <li class="help_question" onclick="showAnswer(this);"><span class="num">5</span><s:text name="faq5"/></li>
            <li class="help_answer">
                <div class="pic_1"></div>
                <div class="pic_2">
                    <ul>
                        <li><s:text name="faq5.1"/><br/><br/></li>
                        <li><s:text name="faq5.2"/><br/><br/></li>
                        <li><s:text name="faq5.3"/><br/><br/>
                        </li>
                    </ul>
                </div>
                <div class="pic_3"></div>
            </li>
        </ul>
    </div>
</div>


<script type="text/javascript">
    function showAnswer(obj) {
        if ($(obj).next().is(":visible")) {
            $(obj).css("background-position", "0px 0px");
        } else {
            $(obj).css("background-position", "0px -36px");
            $(obj).siblings(".help_question").css("background-position", "0px 0px");
            $(obj).siblings(".help_answer").hide();
        }
        $(obj).next().toggle();
    }
</script>
