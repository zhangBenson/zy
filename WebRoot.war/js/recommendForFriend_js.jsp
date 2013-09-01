<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<script type="text/javascript">
     var friendEmail="<s:text name='label.email.friend'/>";
     var  del = "<s:text name='course.class.delete'/>";
     var right_div = "<div class='tip_right'></div>";
    function checkEmail(object,index){
        var content = $(object).attr('value');
        var reMail = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
        var emailContent = content.replace(/(^\s*)|(\s*$)/g, "");
        $("#recommendMsg"+index).text("");
        if (!reMail.test(emailContent)) {
            $("#recommendMsg"+index).text("<s:text name='course.email.input.error'/>");
            return false;
        }
        var mySession = "<s:property value="#session.email"/>";

        if (emailContent == mySession) {
            $("#recommendMsg"+index).text("<s:text name='course.email.input.myself'/>");
            return false;
        }
        $(object).attr('value', emailContent);
        return true;
    }
    function addFriendEmail(index){
        $("#added_line"+index).append("<tr><td align='right' valign='top'>"+friendEmail+"&nbsp;&nbsp;</td><td><input class='recommdate_email' type ='text' name='emails' onblur='checkEmail(this,"+index+");'>&nbsp;&nbsp;<span class='recommdate_delete' onclick='deleteRow(this)'>"+del+"</span></td></tr>");

    }
     function deleteRow(obj){
        $(obj).parent().parent().remove();
     }
</script>