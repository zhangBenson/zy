<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<script src="js/dialog.js" type="text/javascript"></script>
<link type="text/css" href="css/dialog.css" rel="stylesheet"/>

<style type="text/css">
#mainEnter{ width:600px; margin:0px auto; margin-top:80px;margin-bottom: 60px;font-family:"微软雅黑", "宋体"; font-size:12px;}
#get_back_pwd{color:rgb(0,138,255);background:url(images/title_login_4.gif) left top no-repeat;padding-left:50px;text-align:left;height:57px;font-size: 18px;line-height: 40px;}
#center{ margin:0px auto; margin-top:40px; width:400px;}
#center table tr td{ height:30px;}
h1{ font-family: "微软雅黑", "宋体"; color:#333; font-size:12px;}
.tdleft{ text-align:right; width:150px;}
.con{ background:#EAEAEA;}
#question{ float:right; font-size:10px;}
#question a{ color:#666;}
.btn{ text-align:center;}
.btn a img{ border:none;}
.errorinfo{ color:#F00; font-size:10px;}
.repassword_submit_btn{border:none;color:#FFF;font-size:16px;display:block;float:left;background:#9acd32;height:30px;margin-top:8px;margin-left:20px;margin-bottom:10px;line-height: 30px;padding-left:15px;padding-right: 15px;box-shadow: 0px 1px 2px rgba(0,0,0,0.3);border-radius: 3px; }
</style>


<s:form action="yzRePasswordCode" id="form" method="POST" theme="css_xhtml" validate="true">
    <s:hidden name="user.email"/>
<div id="mainEnter">
<hr />
<div id="get_back_pwd"><span><s:property value="%{getText('label.get.back.password')}"/></span></div>
<div id="center">
<table width="400" cellpadding="0" cellspacing="0">
  <tr>
    <td class="tdleft"><h1><img src="images/safe.gif" width="17" height="19" /><s:property value="%{getText('label.safety.valid')}"/></h1></td>
    <td><span id="question"><a href="#"><s:property value="%{getText('link.feed.back')}"/></a></span></td>
  </tr>
  <tr>
    <td colspan="2"><s:property value="%{getText('message.protect.safety')}"/></td>
  </tr>
  <tr class="con">
    <td class="tdleft"><s:property value="%{getText('email')}"/></td>
    <td>
      <label>
        <s:textfield type="text" name="user.email" id="textfield" disabled="true"/>
      </label></td>
  </tr>
  <tr>
    <td colspan="2" class="btn"><a href="#"class="repassword_submit_btn" onclick="sendEmail();"><s:property value="%{getText('button.send.valid.code')}"/></a></td>
  </tr>
  <tr class="con">
    <td class="tdleft"><s:property value="%{getText('label.valid.code')}"/>：</td>
    <td><s:textfield name="rePasswordCode" id="textfield2" /></td>
  </tr>
    <tr>
    <td colspan="2" class="btn"><s:submit cssClass="repassword_submit_btn"  value="%{getText('button.submit')}"/></td>
    </tr>
</table>
</div>
</div>
</s:form>
<script type="text/javascript">
    var sent="<s:text name='message.valid.code.sent'/>";
    var getIn="<s:text name='message.click.get.in'/>";
    var gongxi="<s:text name='title.of.message.box'/>";
    function sendEmail(){
      // var timestamp = (new Date()).valueOf();
      $.post("sendPasswordEmail.html?user.email=<s:property value='user.email'/>");
      var email = '<s:property value="user.email" />';
      var emailBox = "";
      if(email == 'qq.com'){
        emailBox = 'http://www.'+ email.substr(email.lastIndexOf('@')+1,email.length);
      }else{
        emailBox = 'http://www.'+ email.substr(email.lastIndexOf('@')+1,email.length);
      }
      var context = "<h1 align='center'>"+sent+"</h1><br/><a href='"+emailBox+"' target='_blank'>"+getIn+emailBox+"</a>";
      new Dialog(context,{time:4000,title:gongxi,center:true}).show();
    }
    function goUrl(obj){

    }
</script>



