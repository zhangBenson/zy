<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Page</title>
    <style type="text/css">
        .style1 {
            width: 152px;
        }

        .style2 {
            width: 142px;
        }

        .style3 {
            background-color: #CCCCCC;
        }

        .style4 {
            width: 152px;
            background-color: #CCCCCC;
        }

        .style5 {
            width: 142px;
            background-color: #CCCCCC;
        }
    </style>

</head>
<body>
<s:form><p>
    安排赛场：</p>

<p>
    大赛演播厅地址：<a href="http://www.gogowise.com">http://www.gogowise.com</a>&nbsp;&nbsp;&nbsp;&nbsp; </p>
<s:hidden name="competitionSession.id"/>
<s:hidden name="competitionSession.competitionPhase.id"/>
<s:hidden name="competitionSession.competitionPhase.name"/>
<s:hidden name="competitionSession.competitionPhase.type"/>
<table width="100%" height="100%" id="tabList">
<tr style="background-color:#8fbc8f;font-weight:bold">
    <td width="20%">比赛阶段</td>
    <td width="15%">场次</td>
    <td width="15%">主持人</td>
    <td width="15%">评委</td>
    <td width="15%">歌手</td>
    <td width="15%">操作</td>
</tr>


<tr>
    <td class="style2" width="20%">
        <table style="border-color: Green">
            <tr>
                <td>
                    比赛阶段名称: <br/>
                    <b><s:property value="competitionSession.competitionPhase.name"/></b> <br/>
                    比赛类别:<br/>
                    <b>
                            <%--<s:textfield name="competitionSession.competitionPhase.type"/> --%>
                        <s:select list="#{2:'评委',3:'主持人'}" name="competitionSession.competitionPhase.type"
                                  disabled="true" listKey="key"
                                  listValue="value" headerKey="1" headerValue="歌手"/>
                    </b>

                </td>
            </tr>
        </table>

    </td>

    <td colspan="4" width="80%">
        <table width="100%">
            <tr>
                <td width="30%"></td>
                <td width="20%"></td>
                <td width="25%"></td>
                <td width="25%"></td>
            </tr>

            <tr>
                <td>

                    <table style="border-color: Green">


                        <tr>
                            <td>
                                场次名称: <br/>
                                第<s:textfield name="competitionSession.name" maxLength="3" size="3"/>场 <br/>
                                开始日期：<br/>
                                <table>
                                    <tr>
                                        <td>
                                            <div>
                                                <s:textfield name="competitionSession.date"
                                                             value="%{getText('global.date',{competitionSession.date})}"
                                                             cssClass="date"
                                                             readonly="true" id="date"/>
                                            </div>

                                        </td>
                                    </tr>
                                </table>
                                开始时间: <br/>
                                <s:textfield name="competitionSession.startTime"/> <br/>
                                结束时间： <br/>
                                <s:textfield name="competitionSession.endTime"/>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="style1">
                    <table style="border-color: Green">
                        <tr>
                            <td>
                                主持人：<br/>
                                <s:textfield
                                        name="competitionSession.hostAllocation.singUpInfo.user.email"/><br/>
                                <s:hidden name="competitionSession.hostAllocation.id"/>

                            </td>
                        </tr>

                    </table>
                </td>
                <td>
                    <table style="border-color: Green">
                            <%--<tr>--%>
                            <%--<td>--%>
                            <%--评委1：<br/>--%>
                            <%--<s:textfield name="competitionSession.judgeAllocation1.singUpInfo.user.email"/>--%>
                            <%--<s:hidden name="competitionSession.judgeAllocation1.id"/>--%>
                            <%--<br/>--%>
                            <%--<input id="Button2" type="button" value="发送确认信"/><br/>--%>
                            <%--评委2： <br/>--%>
                            <%--<s:textfield name="competitionSession.judgeAllocation2.singUpInfo.user.email"/>--%>
                            <%--<s:hidden name="competitionSession.judgeAllocation2.id"/>--%>
                            <%--<br/>--%>
                            <%--<input id="Button2" type="button" value="发送确认信"/>--%>
                            <%--</td>--%>
                            <%--</tr>--%>


                        <tr>
                            <td>
                                评委1：<br/>
                                <s:textfield
                                        name="competitionSession.judgeAllocations[0].singUpInfo.user.email"/>
                                <br/>
                                <s:hidden name="competitionSession.judgeAllocations[0}].id"
                                          value="%{id}"/>


                            </td>
                        </tr>

                        <tr>
                            <td>
                                评委2：<br/>
                                <s:textfield
                                        name="competitionSession.judgeAllocations[1].singUpInfo.user.email"/>
                                <br/>
                                <s:hidden name="competitionSession.judgeAllocations[1}].id"
                                          value="%{id}"/>



                            </td>
                        </tr>


                    </table>
                </td>
                <td>
                    <table id="singerTable" style="border-color: Green">

                            <%--<s:if test="{#competitionSession.singerAllocations==0}"></s:if>--%>
                            <%--<s:if test="competitionSession.singerAllocations.size()==0">--%>
                            <%--<tr>--%>
                            <%--<td>--%>
                            <%--<s:textfield--%>
                            <%--name="competitionSession.singerAllocations[0].singUpInfo.user.email"--%>
                            <%--value="%{singUpInfo.user.email}"/> <br/>--%>
                            <%--<s:hidden name="competitionSession.singerAllocations[0].id"--%>
                            <%--value="%{id}"/>--%>
                            <%--<input id="Button3" type="button" value="发送确认信"/>--%>
                            <%--</td>--%>
                            <%--</tr>--%>
                            <%--</s:if>--%>

                        <s:bean name="org.apache.struts2.util.Counter" id="counter">
                            <s:param name="first" value="1"/>
                            <s:param name="last" value="%{@com.gogowise.utils.Constants@MAX_SINGER_SIZE}"/>
                        </s:bean>
                        <s:iterator value="counter" status="su">
                            <tr>
                                <td>
                                    <s:textfield
                                            name="competitionSession.singerAllocations[%{#su.index}].singUpInfo.user.email"/>
                                    <br/>
                                    <s:hidden name="competitionSession.singerAllocations[%{#su.index}].id"
                                              value="%{id}"/>



                                </td>
                            </tr>

                        </s:iterator>

                            <%--<s:iterator value="competitionSession.singerAllocations" status="su">--%>
                            <%--<tr>--%>
                            <%--<td>--%>
                            <%--<s:textfield--%>
                            <%--name="competitionSession.singerAllocations[%{#su.index}].singUpInfo.user.email"--%>
                            <%--value="%{singUpInfo.user.email}"/> <br/>--%>
                            <%--<s:hidden name="competitionSession.singerAllocations[%{#su.index}].id"--%>
                            <%--value="%{id}"/>--%>
                            <%--<input id="Button3" type="button" value="发送确认信"/>--%>
                            <%--</td>--%>
                            <%--</tr>--%>
                            <%--</s:iterator>--%>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <a onclick="javascript:addSinger()">增加新的</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <script language="javascript" type="text/javascript">
            function addSinger() {
                var curSiz = $('#singerTable tr').size();
                var newElement = $('#singerTable tr :first').clone();
                var str = newElement.html();
                var reStr = "singerAllocations[" + curSiz + "]";
                str = str.replace(/singerAllocations\[0\]/g, reStr);
                str = str.replace(/value=[\s\S]+?id/g, 'id');
                $('<tr><td>' + str + '</td></tr>').appendTo($('#singerTable'))
                return false;
            }
        </script>
    </td>
    <td>
        <s:a action="initCompetitionPhase" name="edit" label="eidt"> 编辑
            <s:param name="competitionPhaseId" value="id"></s:param>
        </s:a>

    </td>
</tr>


</table>
<s:submit name="submit" action="saveCompetitionSession" value="提交"></s:submit>
</s:form>


</body>
</html>
