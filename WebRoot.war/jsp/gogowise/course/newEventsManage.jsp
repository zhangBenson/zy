<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link href="css/newEvents.css" rel="stylesheet" type="text/css"/>

<div class="dfz-nav fl">
    <div class="fl">

        <p class="bnav">
            <a href="myForcastClass.html"><s:text name="usermenu.item.my.created.courses"/></a>
            <i>&gt;</i>
            <s:text name="event.manage.management"/>
        </p>
    </div>
</div>

<div class="info_class">
    <table>
        <tr>
            <td class="htitle"><s:text name="event.manage.title"/></td>
            <td class="htitle"><s:text name="event.manage.publish.time"/></td>
            <td class="htitle"></td>
            <td class="htitle"></td>
        </tr>
        <tbody>
        <s:iterator value="courseNewEvents">
            <tr id="newEvents<s:property value="id"/>">
                <td><s:property value="title"/></td>
                <td><s:date name="createTime" format="%{getText('dateformat.forclass')}"/></td>
                <td><a href="initEditCourseNewEvent.html?courseNewEvent.id=<s:property value="id"/>"><s:text name="event.manage.edit"/></a></td>
                <td><a href="javascript:;" onclick="deleteNewEvent('newEvents<s:property value="id"/>',<s:property value="id"/>);"><s:text name="event.manage.delete"/></a></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<tiles:insertTemplate template="../pagination.jsp">
    <tiles:putAttribute name="pagination" value="${pagination}"/>
</tiles:insertTemplate>

<script type="text/javascript">
    function deleteNewEvent(lineID, eventID) {
        var hasAccepted = confirm("<s:text name="event.manage.sure.to.delete"/>?");
        if (hasAccepted) {
            $.post("deleteCourseNewEvent.html", {'courseNewEvent.id': eventID})
            $("#" + lineID).remove();
        }
    }

</script>
