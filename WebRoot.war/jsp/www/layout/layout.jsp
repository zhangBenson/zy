<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

        <link rel="stylesheet" href="/css/index/jquery.bxslider.css">
        <link rel="stylesheet" href="/css/course/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/css/course/gogowise.css">
        <link rel="stylesheet" type="text/css" href="/js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

        <link rel="stylesheet" href="/css/jiaxing/jiaxingBase.css">

        <script src="/js/common.js"></script>
        <script src="/js/jquery-1.7.2.min.js"></script>
        <script src="/js/course/bootstrap.min.js"></script>
        <script src="/js/index/jquery.bxslider.min.js"></script>

        <script src="/js/iscroll.js"></script>
        <script src="/js/swfobject.js"></script>
        <script type="text/javascript" src="/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
        <script type="text/javascript" src="/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>

        <%@ include file="includeForLayOut.jsp" %>
    </head>

    <body>
        <div class="container" style="background-color: #fff;width: 1200px;margin-left:auto;margin-right:auto;">
        <div id="top" style="width: 1200px;"><tiles:insertAttribute name="top"/></div>
        <div id="detailInfo" style="width: 1200px;"><tiles:insertAttribute name="contentBody"/></div>
        <div id="detailfooters" ><tiles:insertAttribute name="footer"/></div>
        </div>
    </body>
</html>
