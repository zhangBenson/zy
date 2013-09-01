 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<s:form  method="POST" id="form" action="addFriend">
 <s:iterator value="myFriends" status="st" var="friend">
 <table width="680"  height="120" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td width="110" height="120" rowspan="3">
    <s:if test="pic!= null && pic!=\"\"">
        <img  src="images/user/<s:property value="pic"/>" width="100" height="120" />
    </s:if><s:else>
        <img  src="images/user/default.gif" width="100" height="120" />
    </s:else>
    </td>
  </tr>
  <tr>
      <s:if test="nickName == null || nickName==\"\"">
         <td rowspan="2" valign="top"><br/>邮箱：</td>
        <td width="348" rowspan="2" valign="top"><br/><s:property value="email"/></td>
      </s:if>
      <s:else>
        <td rowspan="2" valign="top"><br/>昵称：</td>
        <td width="348" rowspan="2" valign="top"><br/><s:property value="nickName"/></td>
      </s:else>
        <td width="170" valign="top">
        <a href="blog.html?singUpInfo.id=<s:property value="singUpInfo.id"/> ">查看资料</a>
    </td>
  </tr>
  <tr>
    <td valign="top"><a href="#" id="deleteFriend" userid="<s:property value='id'/>">删除好友</a>
      </td>
  </tr>

</table>
     <hr/>
 </s:iterator>
    <table>
     <tr id="add"><td><input type="button" value="添加" id="button"/>  </td>  </tr>
    </table>
    <s:submit value="添加好友"/>
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


    $("#deleteFriend").each(
            function(){
                $(this).click(
                    function(){
                        alert(this.id);
                    }
                );

            }
        );


</script>