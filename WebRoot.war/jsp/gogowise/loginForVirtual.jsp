<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <link rel="stylesheet" href="css/login.css" type="text/css"/>
    <style type="text/css">

    </style>
    <script type="text/javascript">
        //            $(function(){
        //                $("#user_email").blur(function(){
        //                   $("#login_tip").html("");
        //                   checkUnnecessaryEmail(this,"login_tip");
        //                });
        //            });

        function checkUnnecessaryEmail(obj, tipSpanId) {
            var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
            var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
            if (email != "" && !pattern.test(email)) {
                $("#" + tipSpanId).html("<s:text name='emailerror'/>");
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 class="log_head"><span><s:property value="%{getText('button.log.in')}"/></span>&nbsp;&nbsp;<a
            href="javascript:;" onclick="parent.window.location.href='index.html';"></a></h3>

    <form id="user_login_form">
        <div class="log_center">
            <label for="user_email"><s:property value="%{getText('msg.email')}"/></label><span id="login_tip"></span>
            <input type="text" id="user_email" class="text_field" name="user.email"/>
            <label for="user_pwd"><s:property value="%{getText('msg.pwd')}"/></label><span id="pws_tip"></span>
            <input type="password" id="user_pwd" class="text_field" name="user.password"/>
            <input type="button" class="log_btn" value="<s:property value="%{getText('Login')}"/>"/>
            <a href="javascript:;" onclick="parent.window.location.href='initRepassword.html';"><s:property
                    value="%{getText('link.forget.pwd')}"/>？</a>
        </div>
    </form>
    <div class="log_tip"><s:property value="%{getText('user.do.not.have.gogowise.account')}"/><a href="javascript:;"
                                                                                                 onclick="parent.window.location.href='initReg.html';"><s:property
            value="%{getText('createButton')}"/>！</a></div>
</div>
<script type="text/javascript">
    $(".log_btn").click(function () {
        if (checkForm()) {
            var userData = $("#user_login_form").serialize();
            $.post("ajaxLogin.html", userData, function (data) {
                if (data.loginMessage == "success") {
                    var currHref = parent.window.location.href;
                    if (currHref.substring(currHref.lastIndexOf('/')) == '/exitSystem.html') {
                        currHref = currHref.substring(0, currHref.lastIndexOf('/') + 1);
                    }
                    parent.window.getGirlOjbect().LogIn("1");
                    //  parent.window.location.href = currHref;
                } else {
                    $("#login_tip").text(data.loginMessage);
                }
            });
        }
    });
    function checkForm() {

        return checkEmail() && checkPwd();
    }
    function checkEmail() {
        $("#login_tip").text("");
        if ($("#user_email").attr('value') != "") {
            var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
            var email = $("#user_email").val();
            if (!pattern.test(email)) {
                $("#login_tip").text("<s:text name="emailerror"/>");
                return false;
            }
        } else {
            $("#login_tip").text("<s:text name="emailEmpty"/>");
            return false;
        }

        return true;
    }

    function checkPwd() {
        if ($("#user_pwd").val() == "") {
            $("#login_tip").text("<s:text name="psdEmpty"/>");
            return false;
        }
        return true;
    }
</script>
</body>
</html>






