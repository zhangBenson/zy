<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<style type="text/css">
<!--
   #message{ color:#800040; font-size:16px; text-align:center;}
 -->
</style>



   <table width="680" border="0" cellspacing="0" cellpadding="0">
 <tr>
   <td align="center" valign="middle"><p><img src="images/StudentReg.jpg" width="361" height="27" /><br />
     <br />
   </p>
   <p>&nbsp; </p></td>
 </tr>
 <tr>

   <td id="message"><p>系统正在给您发送激活邮件，请稍候...！还有<span id="time">10</span>秒</p><a href="" id="href">点击此处直接转向邮箱</a>

 </tr>
   </table>
   <script type="text/javascript">

   $("#href").click(function(){
       $("#href").attr('href','<s:property value="emailBoxUrl"/>');
   });
    var time = 10;

    setTimeout(goUrl,10000)//500是0.5秒 \
    setInterval('descTime()',1000);

   function descTime(){
        time = time -1;
        if(time < 0){
            time = 0;
        }
       $("#time").text(time);
    }

   function goUrl(){
        window.location.href='<s:property value="emailBoxUrl"/>';
   }

   </script>

