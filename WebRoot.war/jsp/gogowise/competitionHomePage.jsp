<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="sjr" uri="/struts-jquery-richtext-tags" %>
<link href="css/index.css" type="text/css" rel="stylesheet"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>无标题文档</title>
    <style type="text/css">
        <!--
        body {
            font-family: "微软雅黑", "宋体";
            font-size: 12px;
        }

        a {
            color: #800040;
            text-decoration: none;
        }

        a:hover, a:active {
            color: #FFFFFF;
        }

        #all {
            width: 1000px;
            margin: 0px auto;
        }

        #nav {
            margin: 0px;
            float: left;
        }

        .lefttop {
            width: 790px;
            margin-top: 10px;
            float: left;
        }

        .title1 {
            text-align: center;
            width: 100px;
            vertical-align: middle;
            height: 30px;
        }

        .title1 a {
            font-size: 14px;
            height: 20px;
            font-weight: bold;
        }

        .title1 a:hover, .title1 a:active {
            color: #FFFFFF;
        }

        .content1 {
            font-size: 12px;
            color: #000000;
            background-color: #CCCCCC;
            width: 770px;
            line-height: 20px;
        }

        .content2 {
            font-size: 12px;
            color: #000000;
            background-color: #CCCCCC;
            padding: 0 10px;
            width: 300px;
        }

        .content3 {
            font-size: 12px;
            color: #000000;
            background-color: #CCCCCC;
            padding: 0 10px;
            width: 440px;
        }

        #rights {
            float: right;
            width: 198px;
            height: 300px;
            margin-top: 40px;
        }

        #rights a {
            display: block;
            margin-bottom: 2px;
        }

        #lefts {
            width: 795px;
        }

        .rightcontent {
            vertical-align: top;
        }

        .logintitle {
            background-color: #888888;
            color: #FFFFFF;
            height: 25px;
            text-align: center;
            vertical-align: middle;
            font-weight: bold;
            font-size: 13px;
        }

        .logincontent1 {
            height: 25px;
            color: #800040;
            padding-left: 4px;
            vertical-align: middle;
        }

        .more {
            background-color: #CCCCCC;
            text-align: right;
        }

        #footer p {
            color: #800040;
            text-align: center;
            height: 15px;
        }

        #footer p a:hover, #footer p a:active {
            color: #800040;
            text-decoration: underline;
        }

        .table1 tr {
            height: 20px;
            line-height: 1.5em;
            text-align: center;
        }

        .tabel2 tr td {
            padding: 0 2px;
        }

        .STYLE1 {
            font-size: 9px
        }

        -->
    </style>
</head>

<body>
<div id="all">
<table width="1000" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td width="795px"><span class="lefttop"> <a href="#"><img src="images/introduce.png" border="0"/> </a>
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
                    <td colspan="8" class="content1">
                        <hr width="770px" color="#800040" align="center" size="0.5px"/>
                        1、为营造清新文明的网络文化氛围，倡导积极向上的网络文化，挖掘网络文化内涵，传播新媒体主流价值，引导积极向上的网络文化主旋律，促进网络坏境健康和谐发展。<br/>
                        2、以新技术为向导，利用高性能计算机平台，开辟新的公共文化服务阵地，引领休闲娱乐网络化、云端化的新潮流。<br/>
                        3、制造娱乐元素，丰富人民的文化娱乐生活，积极发掘优秀的网络作品和网络歌手，培养本土化娱乐新星。<br/>
                        4、引领广大网民积极参与健康的网上文化生活，促进文化与网络的相互渗透和融合，满足人民精神文化需要。
                        <hr width="770px" color="#800040" align="center" size="0.5px"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" class="more"><a href="#">点击查看更多>></a></td>
                </tr>
            </table>
		</span>
    </td>
    <td rowspan="3" class="rightcontent">
        <div id="rights">
            <s:if test="singUped">
                <%--<img src="images/join.png" width="190" height="48" border="0"/>--%>
                已报名
            </s:if>
            <s:else>
                <s:a action="initSingUp"><img src="images/join.png" width="190" height="48" border="0"/> <s:param
                        name="competition.id" value="1"/>
                    <s:param name="type" value="1"/>
                </s:a>
            </s:else>
            <table width="198" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                <tr>
                    <td colspan="4" class="logintitle">大赛组委会</td>
                </tr>
                <tr>
                    <td colspan="4"><p>&nbsp;</p>

                        <p>&nbsp;</p>

                        <p>&nbsp;</p></td>
                </tr>
                <tr>
                    <td colspan="4" class="logintitle">赞助单位</td>
                </tr>
                <tr>
                    <td colspan="4"><p>&nbsp;</p>

                        <p>&nbsp;</p>

                        <p>&nbsp;</p></td>
                </tr>
            </table>
        </div>
    </td>
</tr>
<tr>
    <td>
		<span class="lefttop">
			<table width="792" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><a href="#"><img src="images/process.png" width="128" height="31" border="0"/></a></td>
                    <td align="right"><a href="#"><img src="images/competitor.png" width="128" height="31" border="0"/></a>
                    </td>
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
                        <hr width="300px" color="#800040" align="center" size="0.5px"/>
                    </td>
                    <td class="content3">
                        <hr width="450px" color="#800040" align="center" size="0.5px"/>
                        <table width="450" height="125" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>第一场</td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>

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
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
                                <td><img src="images/t1.jpg" width="32" height="35"/></td>
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

                        <hr width="450px" color="#800040" align="center" size="0.5px"/>
                    </td>
                </tr>
                <tr>
                    <td class="more"><a href="#">点击查看更多&gt;&gt;</a></td>
                    <td class="more"><a href="#">点击查看更多&gt;&gt;</a></td>
                </tr>
            </table>
		  </span></td>
</tr>
<tr>
    <td><span class="lefttop">
			<table width="792" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><a href="#"><img src="images/vote.png" width="128" height="31" border="0"/></a></td>
                    <td align="right"><a href="#"><img src="images/review.png" width="128" height="31" border="0"/></a>
                    </td>
                </tr>
            </table>
			<table width="785" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="content2">

                        <table width="300" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <hr width="227px" color="#800040" align="center" size="0.5px"/>
                                    人气之星
                                </td>
                                <td><img src="images/select.png" width="73" height="21"/></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table width="300" border="0" cellspacing="0" cellpadding="0" class="table2">
                                        <tr>
                                            <td><a href="#"><img src="images/t1.jpg" width="46"/></a></td>
                                            <td><a href="#"><img src="images/t1.jpg" width="46"/></a></td>
                                            <td><a href="#"><img src="images/t1.jpg" width="46"/></a></td>
                                            <td><a href="#"><img src="images/t1.jpg" width="46"/></a></td>
                                            <td><a href="#"><img src="images/t1.jpg" width="46"/></a></td>
                                            <td><a href="#"><img src="images/t1.jpg" width="46"/></a></td>
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

                        <hr width="300px" color="#800040" align="center" size="0.5px"/>
                    </td>
                    <td class="content3">
                        <hr width="450px" color="#800040" align="center" size="0.5px"/>
                        <table width="450" cellspacing="0" cellpadding="2px">
                            <tr>
                                <td><a href="#"><img src="images/movie.gif" width="100px" border="0"/></a></td>
                                <td><a href="#"><img src="images/movie.gif" width="100px" border="0"/></a></td>
                                <td><a href="#"><img src="images/movie.gif" width="100px" border="0"/></a></td>
                                <td><a href="#"><img src="images/movie.gif" width="100px" border="0"/></a></td>
                            </tr>
                        </table>
                        <hr width="450px" color="#800040" align="center" size="0.5px"/>
                    </td>
                </tr>
                <tr>
                    <td class="more"><a href="#">点击查看更多&gt;&gt;</a></td>
                    <td class="more"><a href="#">点击查看更多&gt;&gt;</a></td>
                </tr>
            </table>
		  </span></td>
</tr>
</table>
<div id="footer">
    <p><a href="#">首页</a> | <a href="#">关于我们</a> | <a href="#">联系我们</a> | <a href="#">法律事务部</a> | <a
            href="#">在线搜课</a><br/>长沙知金电子科技有限公司版权所有 客服信箱:gogowise@hotmail.com<br/>
        公司地址:株洲市天顺楼1908 电话:0731-28335500 QQ:644140517<br/>
        投诉电话:13762272506 投诉邮箱:zeng_zeng@hotmail.com<br/>
        Copyright 1997 - 2012 All Rights Reserved 备案中</p>
</div>
</div>
</body>
</html>
