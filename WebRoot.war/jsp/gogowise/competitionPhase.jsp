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
    <script language="javascript" type="text/javascript">

    </script>
</head>
<body>
<s:form><p>
    安排赛场：</p>

    <p>
        大赛演播厅地址：<a href="http://www.gogowise.com">http://www.gogowise.com</a>&nbsp;&nbsp;&nbsp;&nbsp; </p>

    <table width="100%" height="100%" id="tabList">

           <s:hidden name="competitionPhase.id" />
          <s:hidden name="competitionPhase.competition.id" />
        <tr>
            <td class="style2" width="20%">
                <table style="border-color: Green">
                    <tr>
                        <td>
                            比赛阶段名称: <br/>
                            <b><s:textfield name="competitionPhase.name"></s:textfield></b> <br/>
                            比赛类别:<br/>
                            <b>
                                <s:select list="#{2:'评委',3:'主持人'}" name="competitionPhase.type" listKey="key"
                                          listValue="value" headerKey="1" headerValue="歌手"/>
                            </b>
                        </td>
                    </tr>
                </table>

            </td>

        </tr>


    </table>
    <s:submit name="submit" action="saveCompetitionPhase" value="提交"></s:submit>
    <s:a action="">修改具体场次</s:a>
</s:form>


</body>
</html>
