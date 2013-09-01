<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link href="css/global.css" type="text/css" rel="stylesheet">

<s:form action="saveGroup" validate="true">
    <s:hidden name="group.id"/>
    <table>
        <tr>
            <td>
                <s:fielderror cssClass="errorStyle"></s:fielderror>
            </td>
        </tr>
        <tr>
            <td>
                创建/修改 组
            </td>
        </tr>
        <tr>
            <td>
                组名
            </td>
            <td>
                <s:textfield name="group.name" size="50"/>
            </td>
        </tr>
        <tr>
            <td>
                描述
            </td>
            <td>
                <s:textarea name="group.comments" rows="10" cols="50"/>
            </td>
        </tr>

                <tr>
            <td>
                不让其他人看到这个组
            </td>
            <td>
               <s:checkbox value="false" name="group.isPrivate"  />
            </td>
        </tr>

        <tr>
            <td>
                <s:submit type="button">提交</s:submit>
            </td>
        </tr>

    </table>
</s:form>

