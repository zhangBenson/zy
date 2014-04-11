<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/privateLive/privateLiveTip.css" rel="stylesheet"/>

<div id="prTipWrap" class="fl">
    <div id="tipContent" class="fl">
        <p><s:property value="%{getText('authorization.tip')}"/></p>
    </div>

    <s:if test="meMonitorAuthorizeTo.size != 0">
        <div class="tipHeader fl">
            <h3 class="h3_title"><s:property value="%{getText('authorization.existed')}"/></h3>
        </div>

        <table>
            <tbody>
            <s:iterator value="meMonitorAuthorizeTo">
                <tr>
                    <td><a href="userBlog.html?user.id=<s:property value="authorizeTo.id"/>" target="_blank"><img
                            src="<s:property value="authorizeTo.pic"/>"
                            alt="<s:property value="authorizeTo.nickName"/>"/></a></td>
                    <td><a href="userBlog.html?user.id=<s:property value="authorizeTo.id"/>" target="_blank"
                           class="other_more"><s:property value="authorizeTo.nickName"/></a></td>
                    <td><a onclick="cancelAuthority(this,<s:property value="authorizeTo.id"/>);"
                           class="other_more"><s:property value="%{getText('authorization.cancel')}"/></a></td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </s:if>

    <div class="tipHeader fl">
        <h3 class="h3_title"><s:property value="%{getText('authorization.new')}"/></h3>(<s:property
            value="%{getText('pls.valid.email')}"/>)&nbsp;&nbsp;
        <a class="other_more" onclick="addNewAuthority();"><s:property value="%{getText('interview.add')}"/></a>
    </div>

    <s:form method="post" id="authorizeForm">
        <ul class="fl" id="authorityList">
            <li><input name="authorityToEmails" type="text" class="authorityToEmails"
                       onblur="checkInvitedEmail(this);"/>&nbsp;&nbsp;&nbsp;<span class="tip_words"
                                                                                  id="emailTip0"></span></li>
            <li><input type="button" class="submit_btn_large" id="authorityConfirm" onclick="confirmAuthorization();"
                       value="<s:property value="%{getText('authorization.confirm')}"/>"/></li>
        </ul>
    </s:form>

</div>

<script type="text/javascript">
    var idIndex = 1;
    var emailEmpty = "<s:text name='emailEmpty'/>";
    var emailFormatWrong = "<s:text name='emailerror'/>";

    function cancelAuthority(obj, authorizeToId) {
        var confirmed = confirm("<s:text name="cancel.not.reverse"/>");
        if (!confirmed) return;

        $.post("cancelAuthority.html", {"authorizeTo.id": authorizeToId}, function (data) {
            $(obj).parents("tr").remove();
        });
    }
    function addNewAuthority() {
        var id = "emailTip" + idIndex++;
        //<![CDATA[
        var liStr = "<li><input name='authorityToEmails'  onblur='checkInvitedEmail(this);'  class='authorityToEmails'  type='text' />" +
                "<a class='other_more'  onclick='deleteThisRow(this);'><s:text name="course.class.delete"/></a>&nbsp;&nbsp;&nbsp;" +
                "<span class='tip_words' id=" + id + " ></span></li>";
        //]]>
        $("#authorityConfirm").parent().before(liStr);
    }
    function deleteThisRow(obj) {
        $(obj).parents("li").remove();
    }

    function checkInvitedEmail(obj) {
        var id = $(obj).siblings(".tip_words").attr("id");
        var email = $(obj).val();
//        alert("email->"+email+",id->"+id);
        return checkEmail(0, email, id);
    }

    function confirmAuthorization() {
        var result = true;
        var emails = $("input[name='authorityToEmails']");
        for (var i = 0; i < emails.size(); i++) {
            result = result && checkInvitedEmail(emails[i]);
        }
        if (result) {
            var authorizeInfo = $("#authorizeForm").serialize();
            $.post("monitorAuthorizeToOther.html", authorizeInfo, function (data) {
                alert("<s:text name="email.sent"/>");
            });
            $("#authorizeForm")[0].reset();
        }
    }

    function checkEmail(type, email, tipId) {
        document.getElementById(tipId).innerHTML = "";
        if (email == "") {
            if (type == 0) {
                document.getElementById(tipId).innerHTML = emailEmpty;
                return false;
            } else {
                return true;
            }
        } else {
            var emailPattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
            if (emailPattern.test(email)) {
                return true;
            } else {
                document.getElementById(tipId).innerHTML = emailFormatWrong;
                return false;
            }
        }
    }
</script>