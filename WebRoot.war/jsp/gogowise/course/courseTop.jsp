<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>


<div class="thickline"></div>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="topLogo"></div>
        </div>
        <div class="col-md-6">
            <ul class="nav nav-pills">
                <li>
                    <a href="index.html" class="navlink"><s:property value="%{getText('menu.item.index')}"/></a>
                </li>
                <li>
                    <%--<a href="#" class="navlink"><s:property value="%{getText('frame.course.center')}"/></a>--%>
                    <s:a action="courseSquare" cssClass="navlink"><s:property
                            value="%{getText('frame.course.center')}"/></s:a>
                </li>
                <li>
                    <a href="#" class="navlink">SCHOOLS</a>
                </li>
            </ul>
        </div>

        <div class="col-md-3">

        </div>

    </div>
</div>