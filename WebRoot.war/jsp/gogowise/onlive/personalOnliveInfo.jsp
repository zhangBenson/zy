<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="!personalOnlive.finished">
    <div class="watch">
        <span><s:property value="%{getText('live.term.host.is.living')}"/></span> <br/>
        <a href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="personalOnlive.id"/>"><s:property
                value="%{getText('watch.the.live.term')}"/></a>
    </div>
    <%--<a href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="personalOnlive.id"/>">观看直播</a>--%>
</s:if>
<s:else>
    <div class="watch">
        <span><s:property value="%{getText('live.term.host.is.sleeping')}"/></span> <br/>
        <a href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="personalOnlive.id"/>"><s:property
                value="%{getText('live.term.live.room')}"/></a>
    </div>
</s:else>