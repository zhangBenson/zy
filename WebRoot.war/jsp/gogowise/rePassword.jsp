<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<s:head/>

<style type="text/css">
#mainRe{text-align: center; width:600px; margin-top:80px; margin-bottom: 60px; margin-left:auto;margin-right: auto;   font-family:"微软雅黑", "宋体"; font-size:10px;}
#get_back_pwd{color:rgb(0,138,255);background:url(images/title_login_4.gif) left top no-repeat;padding-left:50px;text-align:left;height:57px;font-size: 18px;line-height: 40px;}
#center{ margin:0px auto; margin-top:40px; width:400px;}
#center table tr td{ height:30px;text-align: left;}
h1{ font-family: "微软雅黑", "宋体"; color:#333; font-size:12px; color:#666;}
.tdleft{ text-align:right; width:150px;}
.con{ background:#EAEAEA;}
.errorinfo{ color:#F00; font-size:10px; float: left;}
.btn{ text-align:center;}
.btn a img{ border:none;}
#repassword_submit_btn{cursor:pointer;border:none;text-align:center;color:#FFF;font-size:16px;display:block;float:left;background:#9acd32;height:30px;margin-top:8px;margin-left:100px;line-height: 30px;padding-left:15px;padding-right: 15px;box-shadow: 0px 1px 2px rgba(0,0,0,0.3);border-radius: 3px; }
</style>

<s:form action="findEmailUser" theme="css_xhtml" validate="true" method="post" id="form">
<div id="mainRe">
<hr />
<div id="get_back_pwd"><span><s:property value="%{getText('label.get.back.password')}"/></span></div>
<div id="center">
<table width="400" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2"><h1><s:property value="%{getText('label.insert.email')}"/></h1></td>
    </tr>
  <tr class="con">
    <td class="tdleft"><s:property value="%{getText('email')}"/>：</td>
    <td>
      <label>
        <s:textfield  name="user.email" id="textfield" />
      </label></td>
  </tr>

  <tr>
    <td colspan="2"><h1><s:property value="%{getText('label.insert.valid.code')}"/></h1></td>
  </tr>
  <tr class="con">
    <td>&nbsp;</td>
    <td><a href="#" onclick="changeImg();" ><img id="imgObj" src="textCode.html?time=<%=System.currentTimeMillis()%>" width="120px" height="44px" /></a></td>
  </tr>
  <tr class="con">
    <td class="tdleft"><s:property value="%{getText('label.valid.code')}"/>：</td>
    <td><s:textfield name="yzmCode" id="textfield2"/></td>
  </tr>
    <tr>
    <td colspan="2" class="btn"><s:submit id="repassword_submit_btn" value="%{getText('button.submit')}" /></td>
    </tr>
</table>
</div>
</s:form>

<script type="text/javascript">
    function changeImg(){
    var src1 = document.getElementById("imgObj").src;
    document.getElementById("imgObj").src = chgUrl(src1);
    }
//时间戳
//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url){
      var timestamp = (new Date()).valueOf();
      url = url.substring(0,url.indexOf('?'));
      if((url.indexOf("&")>=0)){
        url = url + "×tamp=" + timestamp;
     }else{
        url = url + "?timestamp=" + timestamp;
     }
     return url;
    }
</script>