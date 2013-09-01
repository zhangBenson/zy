 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<s:form  method="POST" id="form" action="recomondFriends">
 <table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>欢迎进入邀请界面</td>
  </tr>
 <tr><td>邀请人 可以获得知券 知券可以消费 谢谢</td></tr>   <tr><td></td></tr>   <tr><td></td></tr>
     <tr id="add"><td><input type="button" value="添加" id="button"/><input type="button" value="邀请"  onclick="showSubmit();"/>   </td>  </tr>
</table>
</s:form>

<script type="text/javascript">
    $("#button").click(function(){
          $("#add").before(function(){
              return "<tr><td>Email:<input type='text' name='friendEmails' /><input type='button' value='删除' onclick='deleteInput(this);'></td></tr>";
          });
    });
    function deleteInput(obj){
        $(obj).parent().remove();
    }
    function showSubmit(){
        new Dialog("邀请中，请稍等......",{time:30000,title:"邀请好友"}).show();
        $("#form").submit();
    }
    //如果用户禁用脚本怎么办  那么后台无法获得数据了
 //   $("#invite").click(function(){
   //      $("#form").submit();
    //});
</script>