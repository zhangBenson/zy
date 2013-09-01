<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>


<style type="text/css">
#main {
    width: 1000px;
    font-family: "微软雅黑", "宋体";
    font-size: 12px;
    color: #3333333;
    margin: 0 auto;
    position: relative;
    border: #D0D0D0 1px solid;
}

#left {
    width: 190px;
    background: #F2F2F2;
    vertical-align: top;
}

#myphoto {
    text-align: center;
    padding-top: 10px;
}

#myphoto img {
    width: 140px;
    height: 180px;
    border: 2px #DFDFDF solid;
    margin-bottom: 20px;
}

.tdleft {
    width: 50px;
    height: 30px;
    font-size: 12px;
    color: #333;
    padding: 0 5px 0 5px;
}

#info {
    padding: 0px;
    width: 190px;
}

#info td {
    height: 30px;
    padding: 4px 5px 0 5px;
}

#swear {
    padding: 5px 0;
    color: #666666;
}

#links a {
    color: #800040;
    text-decoration: none;
}

#links a:hover, #links a:active {
    color: #FF0099;
    text-decoration: underline;
}

#right {
    width: 805px;
    margin-left: 5px;
}

.title1 {
    background-color: #F2F2F2;
    font-size: 14px;
    color: #333;
    height: 28px;
    padding-bottom: 2px;
    width: 805px;
    font-weight: bold;
}

#movie {
    width: 805px;
    float: left;
    border: #D0D0D0 1px solid;
    margin: 0 0 6px 0;
}

#allmovie {
    width: 805px;
    float: left;
}

#con1 {
    width: 805px;
    height: 400px;
    float: left
}

#allmessage {
    width: 805px;
    float: left;
    margin: 5px 0;
    border: #D0D0D0 1px solid;
}

#msg {
    width: 805px;
    margin-bottom: 3px;
    border: #D0D0D0 1px solid;
}

#msg #personphoto {
    width: 100px;
    height: 120px;
}

#msg #personphoto img {
    border: 2px #CCCCCC solid;
    width: 96px;
    height: 116px;
}

#msg #personinfo {
    height: 25px;
    text-align: center;
}

#msg #msginfo {
    height: 20px;
    width: 695px;
    border-bottom: 1px #999999 dotted;
    display: block;
    margin-left: 5px;
    float: left;
}

#msg #msgcontent {
    margin-left: 5px;
    margin-top: 4px;
    float: left;
    width: 695px;
    display: block;
}

#textin {
    width: 805px;
    float: left;
    border: #D0D0D0 1px solid;
}

#textin h1 {
    background-color: #F2F2F2;
    font-size: 14px;
    color: #666666;
    height: 28px;
    padding-bottom: 2px;
    text-align: left
}

#text1 {
    width: 600px;
    margin-left: 50px;
    float: left;
}

.none {
    display: none;
}

.tab {
    float: left;
    width: 800px;
}

.tabTitle {
    overflow: hidden;
    zoom: 1;
    list-style: none;
    margin: 0;
    padding: 0;
    width: 400px;
}

.tabTitle li a {
    width: 130px;
    line-height: 30px;
    text-decoration: none;
    height: 30px;
    float: left;
    text-align: center;
    background: #E1E1E1;
    border: #999 1px solid;
    margin-right: 4px;
    font-size: 14px;
    font-weight: bold;
    display: block;
    color: #333;
}

.tabTitle li a:hover, .tabTitle li a:active {
    color: #666;
    background: #ffffff;
}

#html_1, #html_2 {
    border-top: 1px #999 solid;
    width: 795px;
    word-wrap: break-word;
    padding: 3px;
    float: left;
}

#rightcontent {
    border: 0px;
}

#photolist {
    list-style: none;
    padding: 0px;
    width: 800px
}

#photolist li {
    float: left;
    margin: 4px 15px;
    height: 240px;
}

#photolist li a {
    display: block;
    width: 220px;
    text-align: center;
    text-decoration: none;
    color: #333333;
    font-size: 12px;
    background: none;
}

#photolist li a:hover, .photolist li a:active {
    color: #CCCCCC;
    border: 4px #CCC solid;
    width: 216px;
}

#photolist a img {
    display: block;
    width: 210px;
    height: 160px;
    border: 2px #E0E0E0 solid;
    margin-bottom: 10px;
    text-align: center;
}

.moviename {
    color: #603;
    font-size: 14px;
    font-weight: bold;
}

-->
</style>

<script type="text/javascript">
    function changeTab(id, minId, topCount) {

        for (var i = minId; i < minId + topCount; i++) {
            if (id == i) {
                document.getElementById("html_" + i).style.display = "block";
            }
            else {
                document.getElementById("html_" + i).style.display = "none";
            }
        }
    }
</script>

<s:form action="saveBlog.html" method="POST">
    <s:hidden name="singUpInfo.id"/>

    <div id="main">
        <table width="1000" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td id="left">
                    <table id="info" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="2" id="myphoto"><img id="topphoto"
                                                              src="<s:property value="singUpInfo.user.pic"/>"/>
                                <hr width="170px" color="#BEBEBE"/>
                            </td>
                        </tr>
                        <tr>
                            <td>昵称：</td>
                            <td><s:property value="singUpInfo.user.nickName"/></td>
                        </tr>
                        <tr>
                            <td>性别：</td>
                            <td><s:property value="%{getText('lable.sex.'+singUpInfo.user.sexy)}"/></td>
                        </tr>
                        <tr>
                            <td>年龄：</td>
                            <td><s:property value="singUpInfo.age"/></td>
                        </tr>
                        <tr>
                            <td>演唱形式：</td>
                            <td><s:property value="%{getText('singup.singType.'+singUpInfo.singType)}"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">参赛宣言：</td>
                        </tr>
                        <tr>
                            <td colspan="2" id="swear"><s:property value="singUpInfo.enounce"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">个人链接：</td>
                        </tr>
                        <tr>
                            <td colspan="2" id="links">
                                <a href="#"><s:property value="singUpInfo.blogUrl"/></a></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" id="links">
                                <a href="#">详细信息&gt;&gt;</a></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <div id="right">
                        <div id="movie">
                            <div class="title1">&nbsp;&nbsp;<img src="images/imovie.png" width="25"/>&nbsp;我的视频</div>
                            <div id="allmovie">
                                <div class="tab">
                                    <ul class="tabTitle">
                                        <li id="li_1" class="on" onclick="changeTab(1, 1, 2);"><a href="#">已参加节目</a>
                                        </li>
                                        <li id="li_2" onclick="changeTab(2, 1, 2);"><a href="#">即将参加节目</a></li>

                                    </ul>
                                    <div id="html_1">
                                        <ul id="photolist">
                                            <s:iterator value="sessionAge" id="sessionAge" status="idx">
                                                <li><a href="#"><img
                                                        src="images/<s:property value="competitionPhase.competition.logoUrl"/>"/><span
                                                        class="moviename"><s:property
                                                        value="competitionPhase.competition.name"/> </span>&nbsp;&nbsp;&nbsp;<span
                                                        class="datetime"><s:date name="date"
                                                                                 format="%{getText('global.display.date')}"/></span></a>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                    </div>
                                    <div id="html_2" class="none">
                                        <ul id="photolist">
                                            <s:iterator value="sessionForcast" id="sessionForcast" status="idx">
                                                <li><a href="#"><img
                                                        src="images/<s:property value="competitionPhase.competition.logoUrl"/>"/><span
                                                        class="moviename"><s:property
                                                        value="competitionPhase.competition.name"/> </span>&nbsp;&nbsp;&nbsp;<span
                                                        class="datetime"><s:date name="date"
                                                                                 format="%{getText('global.display.date')}"/></span></a>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="allmessage">
                            <div class="title1"><img src="images/catalog256.png" width="25"/>查看留言</div>
                            <s:iterator value="commentList" id="commentList" status="indexNum">
                                <table id="msg" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td id="personphoto">
                                                <%-- TODO UBG <a href="blog.html?singUpInfo.id=<s:property value="owner.singUpInfo.id"/> ">--%>
                                                <%--<img src="<s:property value="owner.pic"/>"/></a>--%>
                                        </td>
                                        <td rowspan="2" valign="top"><span id="msginfo">第&nbsp;<s:property
                                                value="#indexNum.index+1"/>&nbsp;楼&nbsp;&nbsp;&nbsp;<s:date
                                                name="createDate" format="%{getText('global.display.datetime')}"/>&nbsp;&nbsp;留言</span>

                                            <div id="msgcontent"><s:property value="description"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                            <%--TODO UBG  <td id="personinfo"><a href="blog.html?singUpInfo.id=<s:property value="owner.singUpInfo.id"/> "><s:property value="owner.nickName"/></a></td>--%>
                                    </tr>
                                </table>
                            </s:iterator>
                        </div>
                        <div id="textin">
                            <div class="title1"><img src="images/comment_write.png" width="25"/>我要留言</div>
                            <div>留言内容：</div>

                            <div id="text1">
                                <label>
                                    <textarea name="comments.description" id="textarea" cols="45" rows="5"></textarea>
                                </label>
                                <br/>
                                <label>
                                    <input type="submit" name="button" id="button" value="留言"/>
                                </label>
                            </div>

                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</s:form>
