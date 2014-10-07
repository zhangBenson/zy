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



        <div id="pop_live_message_tip" style='width:100%;position: fixed;left:0;bottom:10px;display: none;'>
            <div style="width:970px;margin:0 auto;">
                <div style="float:right;width:280px;border:1px solid #dadada;background:#fff;padding-bottom: 10px;" id="tip_msg_inner">
                    <div style="float:left;padding:0 10px;background:#ebebeb;width:260px;height:26px;line-height: 26px;">
                        <span  style="float:left;font-size: 12px;font-weight: lighter;"><s:text name="live.new.message"/></span>
                        <a id="close_btn" style="float:right;font-size: 16px;font-weight: bold;cursor: pointer;background:#add8e6;">&nbsp;X&nbsp;</a>
                    </div>
                    <div style="float:left;width:260px;padding:10px;font-size:12px;font-weight: lighter;word-wrap: break-word;">
                        <img id="user_pic" style="float:left;width:30px;height:30px;border:none;margin-right: 7px;" src="" alt="picture" />
                        <div style="float:left;">
                            <span style="color:#008b8b;" id="userName_perHost"></span>&nbsp;<s:text name="live.ongoing.live"/> &nbsp;&nbsp;&nbsp;<br/>
                            <a href="javaScript:;" style="color:#f60;line-height: 18px;" id="linkAddress_perHost">&lt;&lt;<s:text name="click.to.watch"/></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
