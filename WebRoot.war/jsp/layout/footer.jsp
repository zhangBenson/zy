<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/footer.css" rel="stylesheet"/>

<div id="footer">
    <p class="p_0">
        <a href="index.html"></a>
        <span><s:property value="%{getText('share.happy.share.knowlege')}"/></span>
    </p>

    <p class="p_1">
        <a href="index.html"><s:property value="%{getText('menu.item.index')}"/></a> |
        <a href="aboutUs.html"><s:property value="%{getText('link.about.us')}"/></a> |
        <a href="aboutUs.html"><s:property value="%{getText('link.contact.us')}"/></a> |
        <a href="aboutUs.html"><s:property value="%{getText('link.legal.dept')}"/></a> |
        <a href="courseSelection.html"><s:property value="%{getText('link.online.search')}"/></a> <br/>

        <%--<s:property value="%{getText('text.rights.reserved')}"/> |--%>
        <s:property value="%{getText('text.service.email')}"/>&nbsp;&nbsp;&nbsp;
        <s:property value="%{getText('text.copyright')}"/>
    </p>

</div>
<div style="display: none;">
    <div id="fancybox" style="float:left;">
        <s:property value="%{getText('frame.operation.success')}"/>
    </div>
</div>