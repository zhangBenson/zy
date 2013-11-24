<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link href="favicon.ico" rel="icon" type="images/course/x-icon" />
        <link href="favicon.ico" rel="shortcut icon" type="images/course/x-icon" />
        <title>
            <tiles:importAttribute name="title"/>
            <s:text name="%{#attr['title']}"/>
        </title>

     </head>
	
    <link type="text/css" href="/css/course/gogowise.css" rel="stylesheet">
	<link type="text/css" href="/css/course/bootstrap.min.css" rel="stylesheet">
	<script src="/js/jquery-1.7.2.min.js"></script>
	<script src="/js/course/bootstrap.min.js"></script>


    <body>
        <div id="top"><tiles:insertAttribute name="top"/></div>
        <div id="detailInfo"><tiles:insertAttribute name="contentBody"/></div>
        <div id="detailfooters"><tiles:insertAttribute name="footer"/></div>
    </body>
</html>
