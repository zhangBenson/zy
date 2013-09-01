<%@ s:taglib prefix="s" uri="/struts-tags" %>

<s:iterator value="regAudiences">
    <li>      xxxxx
        <a class="img"><img src="<s:property value="pic"/>"/></a>
        <a class="title msg_nick"><s:property value="nickName"/></a>
    </li>
</s:iterator>