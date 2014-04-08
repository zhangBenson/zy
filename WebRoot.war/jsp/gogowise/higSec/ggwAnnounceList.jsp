<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
    .info_class {

        float: left;
        margin-top: 10px;
        width: 100%;
    }

    h1 {
        font-size: 400%
    }
</style>

<h1 align="center"><a href="higSecAddAnnounceInit.html">写公告</a></h1>

<div class="info_class" align="center">
    <table border="4" width="500px">
        <tr>
            <td class="htitle">标题</td>
            <td class="htitle">时间</td>
            <td class="htitle"></td>
            <td class="htitle"></td>
            <td class="htitle"></td>
        </tr>
        <tbody>
        <%--<s:iterator value="course.classes">--%>
        <%--<tr>--%>
        <%--<td><s:property value="name"/></td>--%>
        <%--<td><s:property value="nickName"/></td>--%>
        <%--<td><s:date name="date" format="%{getText('global.display.hour.minute')}"/></td>--%>
        <%--<td><s:property value="duration"/></td>--%>
        <%--</tr>--%>
        <%--</s:iterator>--%>
        <s:iterator value="goGoWiseAnnounceList">
            <tr>
                <td><s:property value="title"/></td>
                <td><s:date name="publishTime" format="%{getText('global.display.hour.minute')}"/></td>
                <td><a href="javascript:;" onclick="editeAnnounce(<s:property value="id"/>);">编辑</a></td>
                <td><a href="javascript:;" onclick="deleteAnnounce(<s:property value="id"/>);">删除</a></td>
                <td><a href="announceRead.html?goGoWiseAnnounce.id=<s:property value="id"/>">预览</a></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    function deleteAnnounce(ggwAnnounceID) {
        window.location.href = "deleteAnnounce.html?goGoWiseAnnounce.id=" + ggwAnnounceID;
    }

    function editeAnnounce(ggwAnnounceID) {
        window.location.href = "higSecAddAnnounceInit.html?goGoWiseAnnounce.id=" + ggwAnnounceID;
    }
</script>