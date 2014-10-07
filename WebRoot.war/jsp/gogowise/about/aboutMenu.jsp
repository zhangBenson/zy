<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/about/aboutMenu.css" rel="stylesheet" type="text/css"/>

<div class="auleft">
    <h3 class="h3_title h_title"><s:text name="link.about.us"/></h3>
    <ul class="handle">
        <li>•<a href="aboutUs.html"><s:text name="nav.firm.info"/></a></li>
        <li>•<a href="team.html">Management Profile</a></li>
        <li>•<a href="history.html"><s:text name="nav.development.history"/></a></li>
        <li>•<a href="contactUs.html"><s:text name="nav.contact.us"/></a></li>
    </ul>
    <div class="split_bor"></div>
    <ul class="nothing">
        <li><s:text name="system.contact.tel"/>4000-211-123</li>
        <%--<li><s:text name="label.our.number"/>：0773-28335500</li>--%>
        <li>email:service@gogowise.com</li>
        <li>address: E4-06-12, Engineering drive 2, Singapore 117576</li>

    </ul>
</div>

<script type="text/javascript">
    $(function () {
        $(".menu_base_about").addClass("menu_base_current");
    });
</script>
