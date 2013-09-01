 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
    <!--
#all{ width:1280px; margin:0 auto;}
body{ background:#800040;  font-family:"微软雅黑", "宋体"; font-size:12px;}
#all{ width:1280px; margin:0 auto;}
#nav{ list-style:none; padding:0px; font-size:14px; margin-left:90px;font-weight:bold; margin-top:-4px;}
#nav li{ float:left; width:100px;}
#nav li a{ text-decoration:none; color:#FFFFFF; text-align:center; display:block; width:100px; line-height:20px;}
#nav li a:hover,#nav li a:active{ color:#FFFF00;}
#main{ width:1010px; margin-left:140px; margin-top:-2px; position:relative; background: url(images/mainback_32.gif) right top no-repeat #FFF; float:left;}
#mains{ width:1010px; position:relative;margin-top: -2px;}
#first{ width:290px; margin-left:8px;}
#inform{ width:280px; height:171px; background-image:url(images/index_29.gif); float:left;}
#inform span{ display:block;width:253px; height:130px; margin-top:30px;font-family:"微软雅黑", "宋体"; font-size:13px; color:#800040; line-height:16px;word-wrap:break-word;float:left; line-height:110%}
#movie{ width:282px; height:199px; float:left;}
#movie span{ color:#006600; text-decoration:underline; display:block; width:280px; float:left; text-align:center;}
#movie img{float:left; width:260px; border:none;}
#hotnews{ width:450px; height:360px; float:right; border:#CCCCCC solid 1px; position:absolute; left:300px; top:0px;}
#hotnews #left{ width:240px; height:360px; float:left; padding-left:4px; margin-right:3px;}
#hotnews #right{ width:195px; height:360px; float:right;}
#hotnews #right img{ width:190px; height:150px; border:2px #999999 solid; float:left; margin-right:2px; margin-top:3px;}
#firstnews{ list-style:none; padding:0px; margin:0px;}
#firstnews li a{ height:22px; display:block; color:#333; text-decoration:none;}
#firstnews li a:hover,#firstnews li a:active{ color:#999;}
#special a{ font-size:16px; color:#800040; display:block; margin-bottom:15px; font-weight: bold;}
#special a:hover,#special a:active{color:#F0F;}
#secondnews{ list-style:none; padding:0px; margin:0px; float:left; margin-top:10px;}
#secondnews li{ width:190px; float:left;}
#secondnews li a{ height:22px; display:block; color:#C06; text-decoration:none;}
#secondnews li a:hover,#firstnews li a:active{ color:#F0F;}
.ad{ height:67px; width:990px; background-color:#E76593; font-size:16px; color:#003366; vertical-align:middle; text-align:center; float:left; margin-top:3px;}
.newjoin{ width:725px; height: 277px; float:left; margin:4px 0;}
.newjoin .title1{ width:723px; height:24px;background-color:#E0E0E0;}
.title1 a{ font-size:14px; font-weight:bold; color:#669900; text-decoration:none;}
.title1 a:hover,#newjoin .title1 a:active{ color:#003300}
.newjoin .content1{ width:725px; height:250px; float:left; border:#E0E0E0 1px solid; position:relative;}
.photolist{ list-style:none; padding:0px; position:absolute; top:1px; left:0px; width:725px; margin: 0px;}
.photolist li{ float:left; margin:0px 5px;}
.photolist li a{ display:block; width:78px;  text-align:center; text-decoration:none; color:#333333; font-size:12px;}
.photolist li a:hover,.photolist li a:active{ color:#CCCCCC;}
.photolist a img{ display:block; width:75px; height:87px; border:2px #E0E0E0 solid; margin-bottom:2px;}
#suggest{ width:265px; height:270px; float:left; background:url(images/know.gif) no-repeat top; margin-top:4px; margin-left:1px;}
#suggest #title2{ width:265px; height:20px; text-align:center; font-size:14px; font-weight:bold; color:#669900; display:block; margin-top:1px;}
#songlist{ width:264px; height:255px; border:1px #FF68B4 solid; float:left; margin-left:1px; margin-top:-2px; background:url(images/Music.gif) no-repeat;}
#songlist li{ list-style-image:url(images/document_mp3.png); height:25px; margin-top:5px;}
#songlist li a{ text-decoration:none; color:#800040;}
#songlist li a:hover,#songlist li a:active{ text-decoration:underline; color:#CC0099;}
h1{height:24px; border-bottom: #006633 dotted 2px; padding-bottom:2px; margin-bottom:6px;}
h1 a{font-size:14px; font-weight:bold; color:#669900; text-decoration:none;}
h1 a:hover,h1 a:active{ color:#003300}
.h5{ font-size:14px; color:#800040; font-weight:bold; line-height:25px; height:25px; margin-left:20px;}
.h5 span{ font-size:12px; color:#FF66CC;}
.hot{ width:452px; float:left; position:relative; margin-right:6px;}
#bottoms{ width:995px;margin-top:5px; float:left;background:#E0E0E0; height:129px;}
#footer{ text-align:center; background:url(images/first_35.gif) bottom left no-repeat; float:left; margin:10px 0 10px 140px; height:30px; width:1010px; line-height:30px;text-align:center; color:#FFFFFF;}
#bottom{ width:1010px;margin-top:-1px; background: url(images/first_32.gif) top no-repeat; height:29px; float:left;}
        -->
</style>
</head>

<body>
<div id="all">
<table cellpadding="0" cellspacing="0">
<tr>
		<td  width="138" height="70"></td>
		<td colspan="2">
			<img src="images/first_02.gif" width="235" height="70" alt=""></td>
		<td>
			<img src="images/first_03.gif" width="359" height="70" alt=""></td>
		<td colspan="3">
			<img src="images/first_04.gif" width="426" height="70" alt=""></td>
		<td>
			<img src="images/first_05.gif" width="122" height="70" alt=""></td>
	</tr>
	<tr>
		<td  width="138" height="202"></td>
		<td>
			<img src="images/first_07.gif" width="2" height="202" alt=""></td>
		<td colspan="2">
			<img src="images/first_08.gif" width="592" height="202" alt=""></td>
		<td colspan="2">
			<img src="images/first_09.gif" width="237" height="202" alt=""></td>
		<td>
			<img src="images/first_10.gif" width="189" height="202" alt=""></td>
		<td>
			<img src="images/first_11.gif" width="122" height="202" alt=""></td>
	</tr>
	<tr>
		<td  width="138" height="198"></td>
		<td colspan="4">
			<img src="images/first_13.gif" width="801" height="198" alt=""></td>
		<td colspan="2">
			<img src="images/first_14.gif" width="219" height="198" alt=""></td>
		<td>
			<img src="images/first_15.gif" width="122" height="198" alt=""></td>
	</tr>
	<tr>
		<td  width="138" height="48"></td>
		<td colspan="6"  width="1020" height="48" style="padding-bottom:10px; background:url(images/first_17.gif) top no-repeat;">
		<ul id="nav">
		<li><a href="#">活动首页</a></li>
		<li><a href="#">大赛新闻</a></li>
		<li><a href="#">赛事直播</a></li>
		<li><a href="#">精彩回顾</a></li>
		<li><a href="#">赛事简介</a></li>
		<li><a href="#">报名须知</a></li>
		<li><a href="#">投票专区</a></li>
		<li><a href="#">参赛选手</a></li>

		</ul>
		</td>
		<td  width="122" height="48"></td>
	</tr>
	<tr>
		<td  width="138" height="25"></td>
		<td colspan="6">
			<img src="images/first_20.gif" width="1020" height="25" alt=""></td>
		<td  width="122" height="25" ></td>
	</tr>
    	<tr>
		<td bgcolor="#800040" width="138" height="1" ></td>
		<td bgcolor="#800040" width="2" height="1" ></td>
		<td bgcolor="#800040" width="233" height="1" ></td>
		<td bgcolor="#800040" width="359" height="1" ></td>
		<td bgcolor="#800040"width="207" height="1" ></td>
		<td bgcolor="#800040" width="30" height="1" ></td>
		<td bgcolor="#800040" width="189" height="1" ></td>
		<td bgcolor="#800040" width="122" height="1" ></td>
	</tr>
</table>
<div id="main">
<div id="mains">
		<div id="first">
		<div id="inform"><span><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 只要能上网，只要你想唱，足不出户，立马开启梦想之旅！小小的渴望，大大的梦想，让音乐于你我间记录，让音乐伴你我同成长！一个表演的舞台，一颗渴望歌唱的心灵，交汇碰撞出青春的最强音！用歌声表达情绪，用音乐宣泄情感，用激情撼动梦想的极限 ! </p></span></div>
		<span id="movie">
                        <s:if test="singUped">
                            <img src="images/smile.gif"/>
                        </s:if>
                        <s:else>
                            <s:a action="initSingUp"><img src="images/signup.gif"/>
                                <s:param name="competition.id" value="1"/>
                                <s:param name="type" value="1"/>
                            </s:a>
                        </s:else>
        </span>
		</div>
        <div style="clear:both; width:0px; height:0px;"></div>
		<div id="hotnews">
        <div id="left">
        <h1><img src="images/item2.gif" width="25" /><span id="title2" class="title1"><a href="#">最新热点</a></span></h1>
        <div id="special"><a href="#">网络歌手大赛第二场路演花絮</a></div>
        <ul id="firstnews">
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        </ul>

		</div>
        <div id="right"><img src="images/newspic_34.gif" />
        <div id="newsinfo">
        <ul id="secondnews">
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        <li><a href="#">网络歌手大赛第二场路演花絮</a></li>
        </ul>
        </div>
        </div>
        </div>
        <div style="clear:both; width:0px; height:0px;"></div>
		<div class="ad">广告位置</div>
        <div class="newjoin">
          <div class="title1"><img src="images/item.gif" width="19" height="18" /><a href="#">人气排行</a></div>
          <div class="content1">
        <ul class="photolist">
		<li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
		</ul>
          </div>
          </div><div id="suggest"><span id="title2" class="title1"><a href="#">推荐试听</a></span>
          <div id="songlist">
          <ul>
          <li><a href="#">陈奕迅——十年</a></li>
          <li><a href="#">陈奕迅——十年</a></li>
          <li><a href="#">陈奕迅——十年</a></li>
          <li><a href="#">陈奕迅——十年</a></li>
          </ul>
          </div>
          </div>
          <div class="ad">广告位置</div>
                  <div class="newjoin" style="width:1000px;">
                  <div class="hot">
          <div class="title1" style="width:452px;"><img src="images/item.gif" width="19" height="18" /><a href="#">最新加入</a></div>
          <div class="content1"  style="width:450px;">
        <ul class="photolist"  style="width:450px;">
		<li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
        <li><a href="#"><img src="images/content_53.gif"/>10000票</a></li>
		</ul>
          </div>
          </div>
          <div class="hot">
          <div class="title1" style="width:530px;"><img src="images/item.gif" width="19" height="18" /><a href="#">奖项设置</a></div>
          <div class="content1"  style="width:528px;">
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          </div>
          </div>
          </div>
		</div>
        <div id="bottoms">
          <h1><img src="images/item3.gif" /><span id="title2" class="title1"><a href="#">赛事相关单位</a></span></h1>
          <div id="bottomcontent">
          <div class="h5">&nbsp;&nbsp;&nbsp;主办方：<span>湖南大学社团联合会</span></div>
          <div class="h5">&nbsp;&nbsp;&nbsp;协办方：<span>长沙知金有限公司</span></div>
          <div class="h5">指导单位：<span>湖南文化广播局</span></div>
          </div>
</div><div id="bottom"></div>
</div>
<div id="footer">版权所有&copy; www.gogowise.com 请勿侵权</div>
</div>
</body>
</html>




