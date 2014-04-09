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
        width: 800px;
    }

    #all {
        width: 800px;
    }

    #alls {
        width: 800px;
    }

    #mains {
        width: 800px;
        float: left;
        border-color: #999;
        border-style: dotted;
        border-width: 1px;
        margin: 4px 0;
        float: left;
    }

    #mainss {
        width: 800px;
        float: left;
        border-color: #999;
        border-style: dotted;
        border-width: 1px;
        margin: 4px 0;
        float: left;
    }

    .mycompetition {
        width: 800px;
        background: #F6F6F6;
        font-family: "微软雅黑", "宋体";
        color: #444;
        font-size: 13px;
    }

    .mycompetition td {
        height: 30px;
    }

    .tdleft {
        text-align: right;
        width: 80px;
        padding-right: 6px;
        color: #000;
    }

    .tdright {
        text-align: left;
        width: 130px;
        color: #069;
    }

</style>


<div id="rightcontent">
    <ul id="tabtitle">
        <li><a href="liveSession.html">正在直播</a></li>
        <li id="now">我的赛事</li>
        <li><a href="forcastSession.html">节目预告</a></li>
        <li><a href="groupCompetition.html">组织比赛</a></li>
        <li><a href="ageSession.html">节目花絮</a></li>
    </ul>
    <div id="html_1">

        <s:iterator value="sessions">
            <div id="all">
                <div id="mains">
                    <table cellspacing="0" cellpadding="0" class="mycompetition">
                        <tr>
                            <td rowspan="3" align="center"><img src="images/organization256.png" width="65"/></td>
                            <td rowspan="3"><img src="images/seperate.gif" height="100"/></td>
                            <td class="tdleft">大赛名称：</td>
                            <td class="tdright">
                                <s:property value="competitionPhase.competition.subject.name"/>
                                <s:property value="competitionPhase.competition.name"/>
                                <s:property value="competitionPhase.name"/>
                                <s:property value="name"/></td>
                            <td class="tdleft">开始时间：</td>
                            <td class="tdright">
                                <s:date name="date" format="yyyy年MM月dd日"/>
                                <s:property value="startTime"/></td>
                            <td rowspan="3" align="center"><img src="images/seperate.gif" height="100"/>
                            </td>
                            <td rowspan="3" align="center">
                                <a href="openSession.html?competitionSession.id=<s:property value="id"/>&<s:if test="allocationType==3">fromHost=true</s:if><s:else>fromHost=false</s:else>">
                                    <img src="images/<s:property value="allocationType"/>.gif" width="120" border="0"/>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdleft">参赛类型：</td>
                            <td class="tdright"><s:property value="%{getText('singup.type.'+allocationType)}"/></td>
                            <td class="tdleft">倒计时：</td>
                            <td class="tdright"><s:property value="remainTime"/></td>
                        </tr>
                        <tr>
                            <td class="tdleft">内容：</td>
                            <td colspan="3" class="tdright"><s:property
                                    value="competitionPhase.competition.description"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </s:iterator>

        <s:iterator value="competitionAudiences">

            <div id="alls">
                <div id="mainss">
                    <table cellspacing="0" cellpadding="0" class="mycompetition">
                        <tr>
                            <td rowspan="3" align="center"><img src="images/organization256.png" width="65"/></td>
                            <td rowspan="3"><img src="images/seperate.gif" height="100"/></td>
                            <td class="tdleft">大赛名称：</td>
                            <td class="tdright">
                                <s:property value="competitionSession.competitionPhase.competition.subject.name"/>
                                <s:property value="competitionSession.competitionPhase.competition.name"/>
                                <s:property value="competitionSession.competitionPhase.name"/>
                                <s:property value="competitionSession.name"/></td>
                            <td class="tdleft">开始时间：</td>
                            <td class="tdright">
                                <s:date name="competitionSession.date" format="yyyy年MM月dd日"/>
                                <s:property value="competitionSession.startTime"/></td>
                            <td rowspan="3" align="center"><img src="images/seperate.gif" height="100"/>
                            </td>
                            <td rowspan="3" align="center">
                                <a href="openSession.html?competitionSession.id=<s:property value="competitionSession.id"/>">
                                    <img src="images/watching.gif" width="120" border="0"/>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdleft">参赛类型：</td>
                            <td class="tdright"><s:property
                                    value="%{getText('singup.type.'+competitionSession.allocationType)}"/></td>
                            <td class="tdleft">倒计时：</td>
                            <td class="tdright"><s:property value="competitionSession.remainTime"/></td>
                        </tr>
                        <tr>
                            <td class="tdleft">内容：</td>
                            <td colspan="3" class="tdright"><s:property
                                    value="competitionSession.competitionPhase.competition.description"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

        </s:iterator>
    </div>
</div>
