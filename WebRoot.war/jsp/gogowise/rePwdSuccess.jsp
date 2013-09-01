<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<style type="text/css">
#passsucessmain{ width:600px; margin-left: auto; margin-right:auto; margin-top: 80px;margin-bottom: 60px; text-align: center; padding-top:60px;font-family:"微软雅黑", "宋体"; font-size:12px;}
#get_back_pwd{color:rgb(0,138,255);background:url(images/title_login_4.gif) left top no-repeat;padding-left:50px;text-align:left;height:57px;font-size: 18px;line-height: 40px;}
#centers{ margin-top:40px; width:400px; height: 40px;  }
#centers a:link {color: #ff6666;}
#centers a:visited{color: #ff6666;}
#centers a:hover{color: #ff00ff; text-decoration: underline;}
#centers a:active{color: #cc0000;}
</style>



<div id="passsucessmain">
<div id="get_back_pwd"><span><s:property value="%{getText('label.get.back.password')}"/></span></div>
<hr />
<div id="centers">
<img src="images/succeed.gif" width="30"/><s:property value="%{getText('messge.change.success1')}"/><a href="easyLogon.html"><s:property value="%{getText('Login')}"/></a><s:property value="%{getText('messge.change.success2')}"/><a href="index.html"><s:property value="%{getText('menu.item.index')}"/><s:property value="%{getText('messge.change.success3')}"/></a> </div>
</div>