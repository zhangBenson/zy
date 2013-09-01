<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link href="css/about/aboutMenu.css" rel="stylesheet" type="text/css"/>

<div class="auleft">
    <h3 class="h3_title h_title"><s:property value="%{getText('link.about.us')}"/></h3>
    <ul class="handle">
        <li>•<a href="aboutUs.html"><s:property value="%{getText('nav.firm.info')}"/></a></li>
        <li>•<a href="team.html"><s:property value="%{getText('nav.team.info')}"/></a></li>
        <li>•<a href="history.html"><s:property value="%{getText('nav.development.history')}"/></a></li>
        <li>•<a href="contactUs.html"><s:property value="%{getText('nav.contact.us')}"/></a></li>
    </ul>
    <div class="split_bor"></div>
    <ul class="nothing">
        <li><s:property value="%{getText('system.contact.tel')}"/>4000-211-123</li>
        <li><s:property value="%{getText('label.our.number')}"/>：0773-28335500</li>
        <li>gogowise@hotmail.com</li>
    </ul>
</div>

<script type="text/javascript">
    $(function(){
        $(".menu_base_about").addClass("menu_base_current");
    });
</script>