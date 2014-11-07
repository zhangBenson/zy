<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <title>
            <tiles:importAttribute name="title"/>
            <s:text name="%{#attr['title']}"/>
        </title>
        <style type="text/css">
            #together{
                width:970px;
                min-height: 100%;
                height: auto !important;
                /*height: 100%;*/
                margin: 0 auto;
            }
            .ggw_tile{float:left;width: 970px;position: relative;}
        </style>

        <%--<META content="MSHTML 6.00.2800.1106" name=GENERATOR>--%>
        <%@ include file="includeForLayOut.jsp" %>
    </head>

    <body>
        <div id="together">
            <div id="ggw_header" class="ggw_tile"><tiles:insertAttribute name="header"/></div>
            <div id="ggw_userheader" class="ggw_tile" style="z-index: 5;"><tiles:insertAttribute name="contentHeader"/></div>
            <div id="ggw_content" class="ggw_tile" style="z-index: 0;"><tiles:insertAttribute name="contentBody"/></div>
            <div id="ggw_footer" class="ggw_tile"><tiles:insertAttribute name="bottom"/></div>
        </div>


    </body>
</html>
