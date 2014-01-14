<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <title>
            <tiles:importAttribute name="title"/>
            <s:text name="%{#attr['title']}"/>
        </title>

        <META content="MSHTML 6.00.2800.1106" name=GENERATOR>
        <%@ include file="includeForLayOut.jsp" %>
    </head>

    <body>
        <div class="together" style="width:970px;margin:0 auto;min-height: 100%;">
            <tiles:insertAttribute name="right"/>
        </div>
    </body>
</html>
