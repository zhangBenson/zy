<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
    #aftermail {
        margin: 80px 20px;
        color: #0060BF;
        font-size: 16px;
    }
</style>
<link rel="stylesheet" type="text/css" href="css/view.css" media="all">

<div id="sinupfirst">
    <img id="top" src="form/top.png" alt="">

    <div id="form_container">
        <h1><a>GoGoWise</a></h1>

        <div id="aftermail"><s:property value="%{getText('text.qqq.4.support')}"/></div>
        <div id="footer" style="font-size:14px; color:#666;">
            <s:property value="%{getText('text.backto')}"/> <a href="http://www.gogowise.com"
                                                               style="color:#333;"><s:property
                value="%{getText('menu.item.index')}"/></a>
        </div>
    </div>
    <img id="bottom" src="form/bottom.png" alt="">
</div>

