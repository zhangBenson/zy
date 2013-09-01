<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<s:form action="higSecGrantPermission">
<table   border="1">
    <tr>
        <th scope="col"><s:property value="email"/><s:hidden name="email"/> </th>
    </tr>
    <tr>
        <td>
            
            <s:checkboxlist list="roles" listKey="key" listValue="value" name="myRoles"/>
            
        </td>
    </tr>
  
</table>

 <s:submit></s:submit>
</s:form>
















































