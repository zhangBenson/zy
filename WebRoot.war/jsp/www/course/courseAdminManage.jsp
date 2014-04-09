<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="container" text-align="center">
    <table style="width: 95%; height: 136;" >
        <tr >
            <td colspan="100">
            </td>
        </tr>
        <tr style="border-bottom: 1px dashed;">
            <th width="124" scope="col">LOGO</th>
            <th width="120" scope="col">Course Name</th>
            <th width="120" scope="col">Lecturer</th>
            <th width="120" scope="col">Lecturer's Email</th>
            <th width="120" scope="col">Organization</th>
            <th width="101" scope="col">Introduction</th>

            <th width="80" scope="col">Edit|Delete</th>
        </tr>

        <s:iterator value="courses" status="#status">
            <tr style="border-bottom: 1px dotted" onmouseover="this.style.backgroundColor='lightgreen'"
                onmouseout="this.style.backgroundColor='#FFFFFF'">
                <td height="72"><img src="<s:property value="logoUrl"/>" width="124" height="62" /></td>
                <td><s:property value="name" /> </td>
                <td><s:property value="teacher.nickName" /> </td>
                <td><s:property value="teacher.email" /> </td>
                <td><s:property value="organization.schoolName" /> </td>
                <td>
                <s:if test="description.length() < 80"><s:property value="description"/></s:if>
                <s:else><s:property value="description.substring(0,80)+'...'" /></s:else>
                </td>

                <td>
                    <a href="javascript:;" style="cursor: hand;text-align: center" onclick="confirmRemoveCourse('<s:property value="id"/>', '<s:property value="name" />')"> Delete</a>
                </td>
            </tr>

        </s:iterator>
    </table>

    <tiles:insertTemplate template="/jsp/gogowise/pagination.jsp">
        <tiles:putAttribute name="pagination" value="${pagination}"/>
    </tiles:insertTemplate>
</div>


<s:form id="removeCourseConfirm" action="removeCourseConfirm">
    <s:hidden name="course.id" id="courseIDRemove" />
    <s:hidden name="redirectURL" id="redirectURL"/>
</s:form>

<script type="text/javascript">
    function confirmRemoveCourse (id,isRemove) {
        if(confirm("Delete this course: " + isRemove))
        {
            var redirectURL = "courseAdminManage.html?pagination.pageNow=<s:property value="pagination.pageNow"/>";
            document.getElementById("courseIDRemove").value = id;
            document.getElementById("redirectURL").value = redirectURL;
            document.getElementById("removeCourseConfirm").submit();
        }
    }
</script>