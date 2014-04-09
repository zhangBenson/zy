<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:iterator value="regs">
    <li>
        <s:a action="userBlog" target="_blank"><s:param name="user.id" value="id"></s:param>
            <img class="portraitImg" src="<s:property value="pic" />" title="<s:property value="nickName"/>">
            <span><s:property value="nickName"/></span>
        </s:a>
    </li>
</s:iterator>
