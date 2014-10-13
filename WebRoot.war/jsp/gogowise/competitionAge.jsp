<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<style type="text/css">
    #photoshow {
        list-style: none;
        padding: 0px;
    }

    #photoshow li {
        float: left;
        height: 90px;
        width: 70px;
        display: block;
        text-align: center;
        margin: 2px;
    }

    #photoshow li a {
        display: block;
        width: 68px;
        height: 86px;
        text-align: center
    }

    #header {
        text-align: left;
        background-color: #CCCCCC;
        font-size: 14px;
        height: 25px;
    }

    #photoshow li a img {
        display: block;
        width: 66px;
        height: 75px;
    }

</style>

<s:iterator value="sessions">

    <table width="841" border="1px" cellspacing="0" cellpadding="0" bordercolor="#CCCCCC">
        <tr>
            <td colspan="3" id="header">&nbsp<s:property value="competitionPhase.competition.subject.name"/><s:property value="competitionPhase.competition.name"/><s:property value="competitionPhase.name"/><s:property value="displayName"/>;</td>
        </tr>
        <tr>
            <td width="103" height="131"><img src="Blog.jpg" width="140" height="111"/></td>
            <td width="250">
                <table width="250" height="110" cellspacing="0">
                    <tr>
                        <td width="117" align="left">
                            <div>主持人：</div>
                        </td>
                        <td width="159" align="left">
                            <div>你好<s:property value="hostAllocation.singUpInfo.user.userName"/></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>嘉 宾：</div>
                        </td>
                        <td>
                            <div><s:iterator value="judgeAllocations">汪涵<s:property value="singUpInfo.user.userName"/>&nbsp;&nbsp;</s:iterator></div>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <div>开始时间：</div>
                        </td>
                        <td align="left">
                            <div><s:date name="date" format="yyyyy年MM月dd日"/>&nbsp;&nbsp;<s:property value="startTime"/>点
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <div>结束时间：</div>
                        </td>
                        <td align="left">
                            <div><s:date name="date" format="yyyy年MM月dd日"/>&nbsp;&nbsp;<s:property value="endTime"/>点
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="480" rowspan="2" align="center" valign="middle">

                <ul id="photoshow">
                    <s:iterator value="singerAllocations">
                        <li><a><img src="#"/>11<s:property value="singUpInfo.user.userName"/></a></li>
                    </s:iterator>
                </ul>
            </td>
        </tr>
        <tr>
            <td height="102"><img src="我要观看.gif" width="80" height="40"/></td>
            <td>简介：</td>
        </tr>
    </table>

</s:iterator>
