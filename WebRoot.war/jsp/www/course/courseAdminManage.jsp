<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div>
    <table width="881" height="136" border="1">
        <tr >
            <td colspan="100">
            </td>
        </tr>
        <tr>
            <th width="234" scope="col">LOGO</th>
            <th width="120" scope="col">Course Name</th>
            <th width="120" scope="col">Lecturer</th>
            <th width="120" scope="col">Lecturer's Email</th>
            <th width="101" scope="col">Introduction</th>

            <th width="100" scope="col">??</th>
        </tr>

        <s:iterator value="courses" status="#status">
            <tr>
                <td height="72"><img src="<s:property value="logoUrl"/>" width="196" height="62" /></td>
                <td><s:property value="name" /> </td>
                <td><s:property value="teacher.nickName" /> </td>
                <td><s:property value="teacher.email" /> </td>

                <td>
                <s:if test="description.length() < 200"><s:property value="description"/></s:if>
                <s:else><s:property value="description.substring(0,200)+'...'" /></s:else>
                </td>

                <td>
                    <a onclick="confirmRemoveOrg('<s:property value="id"/>')"> Delete</a>
                </td>
            </tr>

        </s:iterator>
    </table>
</div>


<s:form id="hidFormFroRemove" action="higSecRemoveConfirm">
    <s:hidden name="course.id" id="courseIDRemove" />
</s:form>

<script type="text/javascript">
    function confirmRemoveOrg (id,isRemove) {
        if(confirm("Delete this course?")){
            document.getElementById("courseIDRemove").value = id;
            document.getElementById("hidFormFroRemove").submit();
        }
    }
</script>