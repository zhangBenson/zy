<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<s:form id="form1" name="form1" method="post" action="higSecSendEmailByAdmin">
    <table width="371" height="386" border="1">
        <tr>
            <th scope="col">email</th>
            <th scope="col"><label>
                <s:textfield name="user.email"></s:textfield>
                    <%--<input type="text" name="textfield" />--%>
            </label></th>
        </tr>
        <tr>
            <td>title</td>
            <td><s:textfield name="user.nickName"></s:textfield></td>
        </tr>
        <tr>
            <td>body</td>
            <td><label>
                <s:textarea name="user.password" rows="20" cols="50"/>
            </label></td>
        </tr>
    </table>
    <label></label>
    <s:submit></s:submit>
</s:form>
