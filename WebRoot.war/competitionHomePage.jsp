<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="sjr" uri="/struts-jquery-richtext-tags" %>
<link href="css/index.css" type="text/css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
body{ font-family:"微软雅黑", "宋体"; font-size:12px;}
a{ color:#800040; text-decoration:none;}
a:hover,a:active{ color:#FFFFFF;}
#all{ width:1000px; margin:0px auto;}
#nav{ margin:0px; float:left;}
.lefttop{width:790px; margin-top:10px; float:left;}
.title1{ text-align:center; width:100px; vertical-align:middle; height:30px;}
.title1 a{ font-size:14px;  height:20px; font-weight:bold;}
.title1 a:hover,.title1 a:active{ color:#FFFFFF;}
.content1{ font-size:12px; color:#000000; background-color:#CCCCCC; padding:0 10px;}
.content2{ font-size:12px; color:#000000; background-color:#CCCCCC; padding:0 10px; width:300px;}
.content3{ font-size:12px; color:#000000; background-color:#CCCCCC; padding:0 10px; width:440px;}
#rights{ float:right; width:198px; height:300px; margin-top:40px;}
#lefts{ width:795px;}
.rightcontent{ vertical-align:top;}
.logintitle{ background-color:#888888; color:#FFFFFF; height:25px; text-align:center; vertical-align:middle; font-weight:bold; font-size:13px;}
.logincontent1{ height:25px; color:#800040; padding-left:4px; vertical-align:middle;}
.more{background-color:#CCCCCC; text-align:right;}
#footer p{ color:#800040; text-align:center; height:15px;}
#footer p a:hover,#footer p a:active{ color:#800040; text-decoration:underline;}
.table1 tr{ height:20px; line-height:1.5em; text-align:center;}
.tabel2 tr td{ padding:0 2px;}
.STYLE1 {font-size:9px}
-->
</style>
</head>

<body>
<div id="all">
	<img src="大赛banner-01.jpg" width="1000" height="170" />
		<table width="1000" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td width="795px"><span class="lefttop"><a href="#"><img src="赛事简介.png" border="0" /></a>
			<table width="790" border="0" cellspacing="0" cellpadding="0">
			  <tr bgcolor="#888888">
				<td class="title1"><a href="#">大赛宗旨</a></td>
				<td class="title1"><a href="#">活动内容</a></td>
				<td class="title1"><a href="#">组织机构</a></td>
				<td class="title1"><a href="#">赛事综述</a></td>
				<td class="title1"><a href="#">报名条件</a></td>
				<td class="title1"><a href="#">报名方式</a></td>
				<td class="title1"><a href="#">参赛歌曲要求</a></td>
				<td class="title1"><a href="#">参赛选手约定</a></td>
			  </tr>
			  <tr>
				<td colspan="8" class="content1"><hr width="770px" color="#800040" align="center" size="0.5px"/>
					<p>1、为营造清新文明的网络文化氛围，倡导积极向上的网络文化，挖掘网络文化内涵，传播新媒体主流价值，引导积极向上的网络文化主旋律，促进网络坏境健康和谐发展。</p>
				  <p>2、以新技术为向导，利用高性能计算机平台，开辟新的公共文化服务阵地，引领休闲娱乐网络化、云端化的新潮流。</p>
				  <p>3、制造娱乐元素，丰富人民的文化娱乐生活，积极发掘优秀的网络作品和网络歌手，培养本土化娱乐新星。</p>
				  <p>4、引领广大网民积极参与健康的网上文化生活，促进文化与网络的相互渗透和融合，满足人民精神文化需要。</p>
				  <hr width="770px" color="#800040" align="center" size="0.5px"/>
				 </td>
			  </tr>
			  	<td colspan="8" class="more"><a href="#">点击查看更多>>
			    </a></td>
			  </tr>
			</table>
		</span></td>
		<td rowspan="3" class="rightcontent">
		<div id="rights"><a href="initSingUp.html?competition.id=1&type=1"><img src="images/singup.png" width="190" height="48" border="0" /></a>
		<table width="198" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
  <tr>
    <td colspan="2" class="logintitle">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</td>
    </tr>
  <tr>
    <td class="logincontent1">邮&nbsp;&nbsp;&nbsp;箱</td>
    <td><form id="form1" name="form1" method="post" action="">
      <label>
        <input name="textfield" type="text" size="15" />
		</label>
    </form>    </td>
  </tr>
  <tr>
    <td class="logincontent1">密&nbsp;&nbsp;&nbsp;码</td>
    <td><form id="form1" name="form1" method="post" action="">
      <label>
        <input name="textfield" type="password" size="14" />
		</label>
    </form></td>
  </tr>
  <tr>
    <td class="logincontent1">验证码</td>
    <td><form id="form1" name="form1" method="post" action="">
      <label>
        <input name="textfield" type="text" size="10" />
		</label>
    </form></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td> <p><img width="60px" height="20px" style="background-color: #FF00FF" /><a href="#" class="STYLE1">&nbsp;&nbsp;看不清，换一张</a></p></td>
  </tr>
  <tr>
    <td style="text-align:center; vertical-align:middle; height:25px; " colspan="2"><a href="#"><img src="loginbtn.gif" width="61" height="26" border="0" /></a>&nbsp;&nbsp;<a href="#">注册</a>&nbsp;&nbsp;<a href="#">忘记密码</a></td>
    </tr>
  <tr>
    <td colspan="2" class="logintitle">大赛组委会</td>
    </tr>
  <tr>
    <td colspan="2"><p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
    </tr>
  <tr>
    <td colspan="2" class="logintitle">赞助单位</td>
    </tr>
    <tr>
    <td colspan="2"><p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
    </tr>
</table>
</div></td>
	  </tr>
	  <tr>
		<td>
		<span class="lefttop">
			<table width="792" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td><a href="#"><img src="赛事进程.png" width="128" height="31" border="0" /></a></td>
				<td align="right"><a href="#"><img src="选手秀场.png" width="128" height="31" border="0" /></a></td>
			  </tr>
			</table>
			<table width="785" border="0" cellspacing="0" cellpadding="0">
				  <tr>
				  <td class="content2">
					<hr width="300px" color="#800040" align="center" size="0.5px"/>
					<table width="300" cellspacing="0" class="table1">

            <tr>
              <td>初赛001场</td>
              <td>初赛007场</td>
              <td>初赛013场</td>
              <td>半决赛04场</td>
            </tr>
            <tr>
              <td>初赛002场</td>
              <td>初赛008场</td>
              <td>初赛014场</td>
              <td>半决赛05场</td>
            </tr>
            <tr>
              <td>初赛002场</td>
              <td>初赛008场</td>
              <td>初赛014场</td>
              <td>半决赛05场</td>
            </tr>
            <tr>
              <td>初赛002场</td>
              <td>初赛008场</td>
              <td>初赛014场</td>
              <td>半决赛05场</td>
            </tr>
             <tr>
              <td>初赛002场</td>
              <td>初赛008场</td>
              <td>初赛014场</td>
              <td>半决赛05场</td>
            </tr>
            <tr>
              <td>初赛002场</td>
              <td>初赛008场</td>
              <td>初赛014场</td>
              <td>半决赛05场</td>
            </tr>
        </table>
					<hr width="300px" color="#800040" align="center" size="0.5px"/>					</td>
						  <td class="content3">
					<hr width="450px" color="#800040" align="center"size="0.5px"/>
					<table width="450" height="125" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>第一场</td>
    <td><img src="t1.jpg" width="32" height="35" /></td>
    <td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
								
  </tr>
  <tr>
    <td>&nbsp;</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
  </tr>
  <tr>
    <td>第二场</td>
    <td><img src="t1.jpg" width="32" height="35" /></td>
    <td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
	<td><img src="t1.jpg" width="32" height="35" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
	<td>赵海燕</td>
  </tr>
</table>

					<hr width="450px" color="#800040" align="center" size="0.5px"/>					</td>
				  </tr>
				  <tr>
				    <td  class="more"><a href="#">点击查看更多&gt;&gt;</a></td>
				    <td  class="more"><a href="#">点击查看更多&gt;&gt;</a></td>
		      </tr>
			</table>
		  </span></td>
		</tr>
	  <tr>
		<td><span class="lefttop">
			<table width="792" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td><a href="#"><img src="粉丝投票.png" width="128" height="31" border="0" /></a></td>
				<td align="right"><a href="#"><img src="精彩回顾.png" width="128" height="31" border="0" /></a></td>
			  </tr>
			</table>
			<table width="785" border="0" cellspacing="0" cellpadding="0">
				  <tr>
				  <td class="content2">
					
					<table width="300" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><hr width="227px" color="#800040" align="center"  size="0.5px"/>
	人气之星</td>
    <td><img src="我要投票.png" width="73" height="21" /></td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="300" border="0" cellspacing="0" cellpadding="0" class="table2">
  <tr>
    <td><a href="#"><img src="t1.jpg" width="46" /></a></td>
	<td><a href="#"><img src="t1.jpg" width="46" /></a></td>
	<td><a href="#"><img src="t1.jpg" width="46" /></a></td>
	<td><a href="#"><img src="t1.jpg" width="46" /></a></td>
	<td><a href="#"><img src="t1.jpg" width="46" /></a></td>
	<td><a href="#"><img src="t1.jpg" width="46" /></a></td>
  </tr>
  <tr>
    <td>20000票</td>
    <td>20000票</td>
    <td>20000票</td>
    <td>20000票</td>
    <td>20000票</td>
    <td>20000票</td>
  </tr>
</table>
</td>
    </tr>
</table>

					<hr width="300px" color="#800040" align="center" size="0.5px"/>					</td>
						  <td class="content3">
					<hr width="450px" color="#800040" align="center" size="0.5px"/>
					<table width="450" cellspacing="0" cellpadding="2px">
              <tr>
                <td><a href="#"><img src="大赛艳色-01视频_03.gif" width="100px" border="0"/></a></td>
				<td><a href="#"><img src="大赛艳色-01视频_03.gif" width="100px" border="0"/></a></td>
				<td><a href="#"><img src="大赛艳色-01视频_03.gif" width="100px" border="0"/></a></td>
				<td><a href="#"><img src="大赛艳色-01视频_03.gif" width="100px" border="0"/></a></td>
              </tr>
            </table>
					<hr width="450px" color="#800040" align="center" size="0.5px"/>					</td>
				  </tr>
				  <tr>
				    <td  class="more"><a href="#">点击查看更多&gt;&gt;</a></td>
		            <td  class="more"><a href="#">点击查看更多&gt;&gt;</a></td>
			  </tr>
			</table>
		  </span></td>
		</tr>
	</table>
	<div id="footer">
	<p><a href="#">首页</a>  | <a href="#">关于我们</a>  | <a href="#">联系我们</a>  | <a href="#">法律事务部</a>  | <a href="#">在线搜课</a><br />长沙知金电子科技有限公司版权所有    客服信箱:gogowise@hotmail.com<br />
	  公司地址:株洲市天顺楼1908    电话:0731-28335500    QQ:644140517<br />
	  投诉电话:13762272506    投诉邮箱:zeng_zeng@hotmail.com<br />
	  Copyright 1997 - 2012 All Rights Reserved    备案中</p>
	</div>
</div>
</body>
</html>
