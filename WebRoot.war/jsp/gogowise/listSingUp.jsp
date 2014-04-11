<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
                    <s:textfield name="singUpInfo.user.userId"/>
                    <s:select
                            list="#{1:{getText('singup.type.1')},2:{getText('singup.type.2')},3:{getText('singup.type.3')}}"
                            name="singUpInfo.type" listKey="key"
                            listValue="value" headerKey="" headerValue="请选择类型"/>
                    <s:select
                            list="#{0:{getText('singup.status.0')},1:{getText('singup.status.1')},2:{getText('singup.status.2')}}"
                            name="singUpInfo.status" listKey="key"
                            listValue="value" headerKey="" headerValue="请选择状态"/>


                    <s:submit name="method" value="index" type="button">查找</s:submit>
                </TD>
            </TR>
        </table>

        <table width="100%" height="100%" id="tabList">

            <tr style="background-color:#8fbc8f;font-weight:bold">
                <td width="20%">用户名</td>
                <td width="20%">email</td>
                <td width="20%">类别</td>
                <td width="20%">状态</td>
                <td width="20%">操作</td>
            </tr>

            <s:iterator value="singUpInfos" id="singUp" var="singUp">
                <tr>
                    <td>
                        <s:property value="user.userId"/>
                    </td>
                    <td>
                        <s:property value="user.email"/>
                    </td>
                    <td>
                        <s:property value="%{getText('singup.status.'+status)}"/>
                    </td>
                    <td>
                        <s:property value="%{getText('singup.type.'+type)}"/>
                    </td>
                </tr>
            </s:iterator>
        </table>
        <s:property value="%{@com.opensymphony.xwork2.ActionContext@context.name}"/>
        <tiles:insertTemplate template="pagination.jsp">
            <tiles:putAttribute name="pagination" value="${pagination}"/>
        </tiles:insertTemplate>

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
