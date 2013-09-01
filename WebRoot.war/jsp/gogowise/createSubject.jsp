<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>


<s:fielderror cssStyle="color: red"/>
<s:form>

    <s:hidden name="subject.id"/>
    <p>
        创建大赛主题：</p>

    <p>
        主题名称：<s:textfield name="subject.name"/>
    </p>
    <%--<p>--%>
        <%--email：<s:textfield name="subject.name"/>--%>
    <%--</p>--%>


    </p>
    <s:submit name="subject" action="saveSubject" value="提交"></s:submit></p>

</s:form>