<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>嘉兴移动公开课堂</title>


    <%@ include file="includeForLayOut.jsp" %>

    <link rel="stylesheet" href="/css/course/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" href="/css/jiaxing/jiaxingBase.css">

    <script language="javascript" type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.slides.min.js"></script>
    <script src="/js/course/bootstrap.min.js"></script>

    <meta name='viewport' content='width=1270'>

</head>

    <body>
        <div id="top"><tiles:insertAttribute name="top"/></div>
        <div id="detailInfo"><tiles:insertAttribute name="contentBody"/></div>
        <div id="detailfooters"><tiles:insertAttribute name="footer"/></div>
    </body>
</html> 