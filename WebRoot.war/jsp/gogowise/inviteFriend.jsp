<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<s:if test="competitionSessions.size >0">
    <s:form method="POST" id="form" action="inviteFriends">
        <table width="680" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>欢迎进入邀请界面</td>
            </tr>
            <tr>
                <td>选择邀请场次：<s:select name="sessionId" list="competitionSessions" listKey="key"
                                     listValue="value"/></td>
            </tr>
            <s:iterator value="myFriends" status="st">
                <s:if test="#st.index%4 == 0">
                    <tr> <td>
                </s:if>
                <s:checkbox name="checkBox[%{#st.index}]" value="false"/>
                <input type="hidden" name="invitedUsers[<s:property value="%{#st.index}"/>]"
                       value="<s:property value="id"/>"/>
                <s:if test="nickName == null || nickName==\"\"">
                    <s:property value="email"/>
                </s:if>
                <s:else><s:property value="nickName"/></s:else> &nbsp;&nbsp; &nbsp; &nbsp;

                <s:if test="#st.index % 4 == 3 || #st.last">
                    </td>
                    </tr>
                </s:if>
            </s:iterator>
            <tr id="add">
                <td><input type="button" value="添加" id="button"/><input type="button" value="邀请"
                                                                        onclick="showSubmit();"/></td>
            </tr>
        </table>
    </s:form>
</s:if><s:else>
    <h1 align="center">没有比赛可以邀请</h1><br/>

    <h2 style="text-align: center;"><a href="myfirstPage.html" style="font-size:18pt;">返回</a></h2>
</s:else>
<script type="text/javascript">
    $("#button").click(function () {
        $("#add").before(function () {
            return "<tr><td>Email:<input type='text' name='friendEmails' /><input type='button' value='删除' onclick='deleteInput(this);'></td></tr>";
        });
    });
    function deleteInput(obj) {
        $(obj).parent().remove();
    }
    function showSubmit() {
        new Dialog("邀请中，请稍等......", {time: 30000, title: "邀请好友"}).show();
        $("#form").submit();
    }
    //如果用户禁用脚本怎么办  那么后台无法获得数据了
    //   $("#invite").click(function(){
    //      $("#form").submit();
    //});
</script>
