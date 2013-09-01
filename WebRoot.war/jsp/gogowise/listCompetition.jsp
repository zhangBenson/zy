<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>


<style type="text/css" media="screen,print">


    .striped {
        background-color: #CCE8CF;
    }
</style>


<s:form>

    <div class="tabwidth">
        <table width="100%" height="30">
            <TR>
                <TD align="center">
                    <s:textfield name="searchValue"/>
                    <s:submit name="method" value="index" type="button">查找</s:submit>
                </TD>
            </TR>
        </table>

            <%--<table width="100%">--%>
            <%--<tr style="background-color:#8fbc8f;font-weight:bold">--%>
            <%--<td width="25%">比赛阶段</td>--%>
            <%--<td width="15%">场次</td>--%>
            <%--<td width="15%">主持人</td>--%>
            <%--<td width="15%">评委</td>--%>
            <%--<td width="15%">歌手</td>--%>
            <%--<td width="25%">操作</td>--%>
            <%--</tr>--%>
            <%--</table>--%>
        <table width="100%" height="100%" id="tabList">
            <tr style="background-color:#8fbc8f;font-weight:bold">
                <td width="20%">比赛阶段</td>
                <td width="15%">场次</td>
                <td width="15%">主持人</td>
                <td width="15%">评委</td>
                <td width="15%">歌手</td>
                <td width="15%">操作</td>
            </tr>

            <s:iterator value="competitionPhases" id="cp" var="cp">
                <tr>
                    <td class="style2" width="20%">
                        <table style="border-color: Green">
                            <tr>
                                <td>
                                    比赛阶段名称: <br/>
                                    <b><s:property value="name"></s:property></b> <br/>
                                    比赛类别:<br/>
                                    <b>
                                        <s:select list="#{2:'评委',3:'主持人'}" name="type" disabled="true" listKey="key"
                                                  listValue="value" headerKey="1" headerValue="歌手"/>
                                    </b>
                                </td>
                            </tr>
                        </table>

                    </td>

                    <td colspan="4" width="80%">
                        <table width="100%">
                            <tr>
                                <td width="25%"></td>
                                <td width="25%"></td>
                                <td width="25%"></td>
                                <td width="25%"></td>
                            </tr>
                            <s:iterator value="competitionSessions" id="co" var="co">
                                <tr>
                                    <td>

                                        <table style="border-color: Green">
                                            <tr>
                                                <td>
                                                    场次名称: <br/>
                                                    <s:property value="name"/> <br/>
                                                    开始日期：<br/>
                                                    <s:property value="date"/> <br/>
                                                    开始时间: <br/>
                                                    <s:property value="startTime"/> <br/>
                                                    结束时间： <br/>
                                                    <s:property value="endTime"/> <br/>
                                                    <s:a action="initCompetitionSession" encode="true">
                                                        编辑具体场次
                                                        <s:param name="competitionSession.id" value="id"/>
                                                        <%--<s:param name="competitionSession.competitionPhase.name"--%>
                                                        <%--value="competitionPhase.name"/>--%>
                                                        <%--&lt;%&ndash;value="@java.net.URLEncoder@encode(competitionPhase.name,'UTF-8')"/>&ndash;%&gt;--%>
                                                        <%--<s:param name="competitionSession.competitionPhase.type"--%>
                                                        <%--value="competitionPhase.type"/>--%>
                                                    </s:a>
                                                        <%--<a href="initCompetitionSession.html?competitionSession.id=<s:property value='id'/>&competitionSession.competitionPhase.type=<s:property value='competitionPhase.type'/>&competitionSession.competitionPhase.name=<s:property value="#%{java.net.URLEncoder.encode(competitionPhase.name,'UTF-8')}"/>">dddddddddd </a>--%>

                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="style1">
                                        <table style="border-color: Green">
                                            <tr>
                                                <td>
                                                    主持人：<br/>
                                                    <s:property value="hostAllocation.singUpInfo.user.email"/><br/>
                                                        <%--<s:if test=""--%>

                                                </td>
                                            </tr>

                                        </table>
                                    </td>
                                    <td>
                                        <table style="border-color: Green">
                                            <%--<tr>--%>
                                                <%--<td>--%>
                                                    <%--评委1：<br/>--%>
                                                    <%--<s:property value="judgeAllocation1.singUpInfo.user.email"/> <br/>--%>
                                                    <%--<input id="Button2" type="button" value="发送确认信"/><br/>--%>
                                                    <%--评委2： <br/>--%>
                                                    <%--<s:property value="judgeAllocation2.singUpInfo.user.email"/> <br/>--%>
                                                    <%--<input id="Button2" type="button" value="发送确认信"/>--%>
                                                <%--</td>--%>
                                            <%--</tr>--%>

                                            <s:iterator value="judgeAllocations" id="ja" var="sa">
                                                <tr>
                                                    <td>
                                                        评委：<br/>
                                                        <s:property value="singUpInfo.user.email"/> <br/>


                                                    </td>
                                                </tr>
                                            </s:iterator>

                                        </table>
                                    </td>
                                    <td>
                                        <table style="border-color: Green">
                                            <s:iterator value="singerAllocations" id="sa" var="sa">
                                                <tr>
                                                    <td>
                                                        歌手：<br/>
                                                        <s:property value="singUpInfo.user.email"/> <br/>


                                                    </td>
                                                </tr>
                                            </s:iterator>
                                        </table>
                                    </td>
                                </tr>
                            </s:iterator>
                        </table>

                    </td>
                    <td>
                        <s:a action="initCompetitionPhase" name="edit" label="eidt"> 编辑
                            <s:param name="competitionPhase.id" value="id"></s:param>
                        </s:a>
                        <s:a action="initCompetitionPhase" name="edit" label="eidt"> 增加新的阶段
                            <s:param name="competitionPhase.competition.id" value="competition.id"></s:param>
                        </s:a>
                        <s:a action="initCompetitionSession">
                            增加具体场次
                            <s:param name="competitionSession.competitionPhase.id" value="id"/>
                            <%--<s:param name="competitionSession.competitionPhase.name"--%>
                            <%--value="name"/>--%>
                            <%--<s:param name="competitionSession.competitionPhase.type"--%>
                            <%--value="type"/>--%>
                        </s:a>
                    </td>
                </tr>


            </s:iterator>


        </table>


            <%--<table>--%>
            <%--<tr>--%>
            <%--<td>--%>
            <%--<s:if test="pagination.hasPre">--%>
            <%--<s:url id="url_pre" value="search.html">--%>
            <%--<s:param name="pagination.pageNow" value="pagination.pageNow-1"></s:param>--%>
            <%--<s:param name="searchValue" value="searchValue"></s:param>--%>
            <%--</s:url>--%>
            <%--<s:a href="%{url_pre}">上一页</s:a>--%>
            <%--</s:if>--%>
            <%--<s:if test="pagination.hasNext">--%>
            <%--<s:url id="url_next" value="search.html">--%>
            <%--<s:param name="pagination.pageNow" value="pagination.pageNow+1"></s:param>--%>
            <%--<s:param name="searchValue" value="searchValue"></s:param>--%>
            <%--</s:url>--%>
            <%--<s:a href="%{url_next}">下一页</s:a>--%>
            <%--</s:if>--%>
            <%--</td>--%>
            <%--</tr>--%>
            <%--</table>--%>

    </div>


    <script type="text/javascript">
        $("table#tabList tr:nth-child(even)").addClass("striped")
    </script>
</s:form> 
