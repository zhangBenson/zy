<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<style type="text/css">

#now {
    background: url(images/navigation-menu2.gif) bottom repeat-x;
    color: #fff;
}

#tabtitle {
    float: left;
    overflow: hidden;
    list-style: none;
    margin: 0;
    padding: 0;
    margin-left: 5px;
}

#tabtitle li {
    width: 120px;
    height: 25px;
    line-height: 24px;
    float: left;
    text-align: center;
    margin-right: 2px;
    list-style: none;
    font-size: 14px;
    font-weight: bold;
}

#tabtitle li a:link, #tabtitle li a:visited {
    text-decoration: none;
    background: url(images/navigation-menu4.gif) repeat-x bottom;
    display: block;
    width: 120px;
    height: 25px;
    color: #fff;
}

#tabtitle li a:hover, #tabtitle li a:active {
    background: url(images/navigation-menu5.gif) bottom repeat-x;
    color: #fff;
}

#html_1 {
    border-top: 1px solid #68CEFF;
    width: 800px;
    word-wrap: break-word;
    padding: 3px;
    float: left;
}

#rightcontent {
    border: 0px;
    width: 810px;
}

#cmptall {
    width: 810px;
    background: #CCC;
    float: left;
    padding-left: 5px;
}

#cmptall img {
    display: block;
}

#cmptall a {
    text-decoration: none;
    color: #06F;
}

#cmptall a:hover, #cmptall a:active {
    color: #039;
}

#cmptitem {
    width: 800px;
    margin: 10px auto;
    background: #FFF;
    font-family: "宋体";
    float: left;
}

#cmpthead {
    height: 35px;
    border-bottom: 1px solid #cc6600;
    color: #cc6600;
    font-size: 16px;
    line-height: 35px;
    background: url(images/personInfo/cmptheadicon.gif) no-repeat left;
    width: 772px;
    padding-left: 28px;
    float: left;
}

#cmptup {
    height: 115px;
    width: 800px;
    float: left;
}

#cmptlogo {
    width: 170px;
    height: 115px;
    float: left;
}

#cmptlogo img {
    margin: 5px;
    width: 160px;
    height: 105px;
    border: #D8D8D8 2px solid;
    float: left;
}

#cmptinfo {
    width: 250px;
    font-size: 12px;
    color: #cc6600;
    float: left;
}

#cmptinfo ul {
    margin: 0px;
    float: left;
    padding: 0px;
}

#cmptinfo li {
    height: 25px;
    list-style-position: inside;
    line-height: 25px;
}

#li1 {
    list-style-image: url(images/personInfo/host_02.gif);
}

#li2 {
    list-style-image: url(images/personInfo/jiabin_02.gif);
}

#li3 {
    list-style-image: url(images/personInfo/starttime.gif);
}

#li4 {
    list-style-image: url(images/personInfo/endtime.gif);
}

#host {
    width: 100px;
    height: 90px;
    text-align: center;
    color: #06F;
    font-size: 12px;
    float: left;
}

#host img {
    width: 85px;
    height: 88px;
    border: #D8D8D8 2px solid;
}

.name {
    text-align: center;
    color: #06F;
    font-size: 12px;
}

.customer {
    padding-top: 26px;
    width: 69px;
    height: 88px;
    text-align: center;
    color: #06F;
    font-size: 12px;
}

.customer img {
    width: 60px;
    height: 60px;
    border: #D8D8D8 2px solid;
}

#cmptdown {
    width: 800px;
    height: 134px;
    float: left;
}

#cmptorhead {
    height: 30px;
    border-bottom: 1px dotted #cc6600;
    color: #cc6600;
    font-size: 14px;
    line-height: 30px;
    background: url(images/personInfo/cmpttitle.gif) no-repeat left;
    width: 220px;
    padding-left: 28px;
    float: left;
}

.photolist {
    list-style: none;
    padding: 0px;
    width: 800px;
    margin: 0px;
    margin-top: 5px;
    float: left;
}

.photolist li {
    float: left;
    margin: 0px 5px;
}

.photolist li a {
    display: block;
    width: 77px;
    text-align: center;
    text-decoration: none;
    color: #06F;
    font-size: 12px;
}

.photolist li a:hover, .photolist li a:active {
    color: #039;
}

.photolist a img {
    display: block;
    width: 73px;
    height: 76px;
    border: 1px #cc6600 solid;
    margin-bottom: 2px;
}
</style>

<script type="text/javascript">
    function InitAjax() {
    　            var ajax = false;
         　try {
        　          　ajax = new ActiveXObject("Msxml2.XMLHTTP");
 　
        } catch (e) {
        　           try {
            　　　           ajax = new ActiveXObject("Microsoft.XMLHTTP");
 　         　
            } catch (E) {
            　　           　ajax = false;
 　         　
            }
 　
        }
 　    if (!ajax && typeof XMLHttpRequest != 'undefined') {
        　   　ajax = new XMLHttpRequest();
 　
        }
 　   return ajax;
    }

    function saveReservation(idx, id) {

    　//获取接受返回信息层
    　var msg = document.getElementById("msg" + idx);

    　var url = "saveReservation.html";

    　//需要POST的值，把每个变量都通过&来联接
    　var postStr = "competitionAudience.competitionSession.id=" + id;

    　//实例化Ajax
    　var ajax = InitAjax();
    　
    　//通过Post方式打开连接
    　ajax.open("POST", url, true);
    　//定义传输的文件HTTP头信息
    　ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    　//发送POST数据
    　ajax.send(postStr);

    　//获取执行状态
    　ajax.onreadystatechange = function () {
            　　//如果执行状态成功，那么就把返回信息写到指定的层里
            　　if (ajax.readyState == 4) {

            　　　msg.innerHTML = ajax.responseText;
    　　
            }
    　
        }
    }
</script>


<div id="rightcontent">
    <ul id="tabtitle">
        <li><a href="liveSession.html"> 正在直播</a></li>
        <li><a href="mySession.html">我的赛事</a></li>
        <li id="now"> 节目预告</li>
        <li><a href="groupCompetition.html">组织比赛</a></li>
        <li><a href="ageSession.html">节目花絮</a></li>
    </ul>
    <div id="html_1">
        <div id="cmptall">
            <s:iterator value="sessions" status="idx">
                <div id="cmptitem">
                    <div id="cmpthead">
                        <s:property value="competitionPhase.competition.subject.name"/>
                        <s:property value="competitionPhase.competition.name"/>
                        <s:property value="competitionPhase.name"/>
                        <s:property value="name"/>
                    </div>
                    <div id="cmptup">
                        <table width="800" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td id="cmptlogo"><a href="#"><img
                                        src="<s:property value="competitionPhase.competition.logoUrl"/> "/></a></td>
                                <td id="cmptinfo">
                                    <ul>
                                        <li id="li1">主持人：<s:property value="hostAllocation.singUpInfo.user.userName"/></li>
                                        <li id="li2">嘉宾：<s:iterator value="judgeAllocations"><s:property value="singUpInfo.user.userName"/>&nbsp;&nbsp; </s:iterator></li>
                                        <li id="li3">开始时间：<s:date name="date" format="yyyy年MM月dd日"/><s:property value="startTime"/>时
                                        </li>
                                        <li id="li4">结束时间：<s:date name="date" format="yyyy年MM月dd日"/><s:property value="endTime"/>时
                                        </li>
                                    </ul>
                                </td>
                                <td id="host"><a
                                        href="blog.html?singUpInfo.id=<s:property value="hostAllocation.singUpInfo.id"/>">
                                    <s:if test="hostAllocation.singUpInfo.user.pic!=null">
                                        <img src="<s:property value="hostAllocation.singUpInfo.user.pic"/>"/>
                                    </s:if>
                                    <s:else>
                                        <img src="images/50.png"/>
                                    </s:else>
                                    <s:property value="hostAllocation.singUpInfo.user.userName"/></a></td>
                                <s:iterator value="judgeAllocations">
                                    <td class="customer"><a
                                            href="blog.html?singUpInfo.id=<s:property value="singUpInfo.id"/>">
                                        <s:if test="singUpInfo.user.pic!=null">
                                            <img src="<s:property value="singUpInfo.user.pic"/> "/>
                                        </s:if>
                                        <s:else>
                                            <img src="images/50.png"/>
                                        </s:else>
                                        <s:property value="singUpInfo.user.userName"/> </a></td>
                                </s:iterator>
                                <td align="center" valign="middle"><a onclick="saveReservation(
                                    <s:property value="#idx.index"/> ,
                                    <s:property value="id"/> )"><img src="images/reservation.gif" width="120px"
                                                                     border="0"/></a><br/><span
                                        id="msg<s:property value="#idx.index"/>" style="color:#06F;"></span></td>
                            </tr>
                        </table>
                    </div>
                    <div id="cmptdown">
                        <div id="cmptorhead">参赛选手</div>
                        <div id="cmptlist">
                            <ul class="photolist">
                                <s:iterator value="singerAllocations">
                                    <li><a href="blog.html?singUpInfo.id=<s:property value="singUpInfo.id"/>">
                                        <s:if test="singUpInfo.user.pic!=null">
                                            <img src="<s:property value="singUpInfo.user.pic"/> "/>
                                        </s:if>
                                        <s:else>
                                            <img src="images/50.png"/>
                                        </s:else>
                                        <s:property value="singUpInfo.user.userName"/> </a></li>
                                </s:iterator>
                            </ul>
                        </div>
                    </div>
                </div>

            </s:iterator>
        </div>
    </div>
</div>





