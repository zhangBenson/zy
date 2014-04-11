<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/newEvents.css" rel="stylesheet" type="text/css"/>

<div class="dfz-nav fl">
    <div class="fl">

        <p class="bnav">
            <a href="showManageResult.html"><s:property value="%{getText('usermenu.item.my.created.shows')}"/></a>
            <i>&gt;</i>
            <s:property value="%{getText('event.manage.management')}"/>
        </p>
    </div>
</div>

<br/>
<br/>


<div class="info_class">
    <table>
        <tr>
            <td class="htitle"><s:property value="%{getText('event.manage.title')}"/></td>
            <td class="htitle"><s:property value="%{getText('event.manage.publish.time')}"/></td>
            <td class="htitle"></td>
            <td class="htitle"></td>
        </tr>
        <tbody>
        <s:iterator value="showNewEvents">
            <tr id="newEvents<s:property value="id"/>">
                <td><s:property value="title"/></td>
                <td><s:date name="createTime" format="%{getText('dateformat.forclass')}"/></td>
                <td><a href="initEditShowNewEvent.html?showNewEvent.id=<s:property value="id"/>"><s:property
                        value="%{getText('event.manage.edit')}"/></a></td>
                <td><a href="javascript:;" onclick="deleteNewEvent('newEvents<s:property value="id"/>',<s:property
                        value="id"/>);"><s:property value="%{getText('event.manage.delete')}"/></a></td>
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
        var hasAccepted = confirm("<s:property value="%{getText('event.manage.sure.to.delete')}"/>");
        if (hasAccepted) {
            $.post("deleteShowNewEvent.html", {'showNewEvent.id': eventID})
            $("#" + lineID).remove();
        }
    }
</script>