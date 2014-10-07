<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>


<style type="text/css">

    #register {
        width: 860px;
        /*background: url(images/register/gogowise.gif) no-repeat;*/
        font-family: Arial, Helvetica, sans-serif;
        margin: 100px auto 50px;
    }

    #regleft {
        float: left;
        display: inline;
        width: 220px;
        margin: 150px 30px 5px 50px;;
    }

    #regright {
        margin-top: 100px;
        float: left;
        width: 470px;
        border-left: thin #CCC dotted;
        padding-left: 30px;
    }

    #regrightCont {
        float: left;
        display: inline;
        margin-left: 114px;
    }

    #regrightCont .inputTips {
        display: block;
        clear: both;
        text-align: left;
    }

    #regrightCont .nextButton {
        display: block;
        clear: both;
        text-align: center;
    }

    #regrightCont .sexList {
        display: block;
        text-align: left;
    }

    #regtitle {
        font-family: "华文隶书", "隶书", "宋体";
        font-size: 24px;
        font-style: normal;
        font-weight: bold;
        color: #CCC;
    }

    #regtitle2 {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 24px;
        font-style: oblique;
        color: #666;
    }

    .errorinfo {
        display: block;
        float: left;
        line-height: 16px;
        color: #F00;
        font-size: 12px;
    }

    #yxcheckbox {
        height: 20px;
        width: 310px;
        text-align: left;
    }

    .option_tittle {
        float: left;
        clear: left;
        margin-right: 6px;
        margin-bottom: 5px;
        font-size: 14px;
        text-align: left;
    }

    .tip_error {
        float: left;
        margin-right: 3px;
        background: url(images/input_msg_tip.png) 0 0;
        width: 16px;
        height: 16px;
    }

    .tip_warn {
        float: left;
        margin-right: 3px;
        background: url(images/input_msg_tip.png) 0px -150px;
        width: 16px;
        height: 16px;
    }

    .tip_right {
        float: left;
        margin-right: 3px;
        background: url(images/input_msg_tip.png) 0px -250px;
        width: 16px;
        height: 16px;
    }

    .text {
        display: block;
        float: left;
        margin-bottom: 8px;
        clear: both;
        width: 300px;
        height: 25px;
        background: #F7F7F7;
        border: 2px #E7E7E7 solid;
    }

    #btn1 {
        width: 125px;
        height: 42px;
        border: none;
        background: url(images/register/regbtn.gif);
        cursor: pointer;
        font-family: "微软雅黑", "宋体", "新宋体";
        font-size: 18px;
        color: #FFF;
        font-weight: bold;
    }

    #links {
        margin-top: 50px;
        font: 1.2em bold;
        color: #666;
    }

    #register a {
        text-decoration: underline;
    }

    .wwlbl {
        float: none;
        clear: both;
    }

    .wwctrl {
        float: none;
    }
</style>

<s:form validate="true" theme="css_xhtml" method="POST" action="reg">
    <s:hidden name="invitedCode"/>
    <s:hidden name="recTime"/>
    <s:hidden name="reDirectUrl" id="reDirectUrl"/>
    <div id="register">
        <div id="regleft">
                <%--<div id="regtitle"><s:property value="%{getText('CreateUser')}"/></div>--%>
            <div id="regtitle2"><s:property value="%{getText('CreateUser')}"/></div>
            <div id="links"><s:property value="%{getText('Registed')}"/><a href="#" onclick="goToLogon()"><s:property
                    value="%{getText('Login')}"/></a></div>
        </div>
        <div id="regright">
            <div id="regrightCont">

                <p class="inputTips">

                <div class="option_tittle"><s:property value="%{getText('email')}"/></div>
                <span class="errorinfo" id="yzemail">*</span><br/>
                <s:textfield name="user.email" id="email" cssClass="text"/>
                </p>

                <p class="inputTips">

                <div class="option_tittle"><s:property value="%{getText('password')}"/></div>
                <span class="errorinfo" id="yzpwd">*</span>
                <s:password name="user.password" id="pwd" type="password" cssClass="text"/>
                </p>


                <p class="inputTips">

                <div class="option_tittle"><s:property value="%{getText('psdagain')}"/></div>
                <span class="errorinfo" id="yzrepwd">*</span>
                <s:password name="duplicate" id="repwd" cssClass="text"/>
                </p>

                <p class="inputTips">

                <div class="option_tittle"><s:property value="%{getText('menber.reg.nickName')}"/></div>
                <span class="errorinfo" id="yzNickName">*</span><br/>
                <s:textfield name="user.nickName" id="nickName" cssClass="text"/>
                </p>

                <p class="inputTips">

                <div class="option_tittle">
                    <input name="checkbox" type="checkbox" value="checked" id="checkbox"/>
                    <a href="<%=request.getContextPath()%>/jsp/gogowise/Clause.htm" class="boxy"><s:property
                            value="%{getText('read')}"/></a>
                </div>
                <span class="errorinfo" id="yxcheckbox">&nbsp;</span>
                </p>

                <p class="nextButton"><input type="submit" name="button" id="btn1" onclick="return checkForm();"
                                             value="<s:property value="%{getText('createButton')}"/>"/>
                </p>
            </div>
        </div>
    </div>

</s:form>

<script type="text/javascript">
    var rule = "<s:text name='rule'/>";
    var emailerror = "<s:text name='emailerror'/>";
    var emailEmpty = "<s:text name='emailEmpty'/>";
    var psdEmpty = "<s:text name='psdEmpty'/>";
    var psdNOsame = "<s:text name='psdNOsame'/>";
    var nickEmpty = "<s:text name='menber.reg.nickName.no.empty'/>";
    var acceptClauseMsg = "<s:text name='message.accept.rule'/>";
    var errorMsg = "";
    $(function () {
        $(".boxy").boxy({title: rule, closeable: true, modal: true});
    });

    function goToLogon() {
        window.location.href = "easyLogon.html?user.email=" + $("#email").attr("value") + "&reDirectUrl=" + encodeURIComponent($("#reDirectUrl").attr("value"));
    }

    function InitAjax() {
        var ajax = false;
        try {
            ajax = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                ajax = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (E) {
                ajax = false;
            }
        }
        if (!ajax && typeof XMLHttpRequest != 'undefined') {
            ajax = new XMLHttpRequest();
        }
        return ajax;
    }
    function checkEmail() {
        $("#yzemail").html("");
        if ($("#email").attr('value') != "") {
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            var email = $("#email").val();
            if (!pattern.test(email)) {
                errorMsg = emailerror;
                $("#yzemail").html("<div class='tip_error'></div>" + errorMsg);
                return false;
            }
            <%--else{--%>
            <%--var url="identityConfirmEmailCheck.html";--%>
            <%--var postStr = "email="+email;--%>
            <%--var ajax = InitAjax();--%>
            <%--ajax.open("POST", url, true);--%>
            <%--ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");--%>
            <%--ajax.send(postStr);--%>
            <%--ajax.onreadystatechange = function() {--%>
            <%--if (ajax.readyState == 4) {--%>
            <%--var str = ajax.responseText;--%>
            <%--if(str.length!=0){--%>
            <%--$("#yzemail").html("<div class='tip_right'></div>");--%>
            <%--return true;--%>
            <%--}else{--%>
            <%--$("#yzemail").html("<div class='tip_warn'></div>"+"<s:text name="course.reg.email.exist"/>");--%>
            <%--return false;--%>
            <%--}--%>
            <%--}--%>
            <%--}--%>
            <%--}--%>
        } else {
            errorMsg = emailEmpty;
            $("#yzemail").html("<div class='tip_error'></div>" + errorMsg);
            return false;
        }
        $("#yzemail").html("<div class='tip_right'></div>");
        return true;
    }
    function checkPwd() {
        $("#yzpwd").html("");
        if ($("#pwd").attr('value') == "") {
            errorMsg = psdEmpty;
            $("#yzpwd").html("<div class='tip_error'></div>" + errorMsg);
            return false;
        }
        var pwd = $("#pwd").attr('value');
        if (pwd.length < 6) {
            $("#yzpwd").html("<div class='tip_error'></div>" + "<s:text name="member.reg.pwd.complex"/>");
            return false;
        }

        $("#yzpwd").html("<div class='tip_right'></div>");
        return true;
    }
    function checkRepwd() {
        $("#yzrepwd").html("");
        if ($("#pwd").attr('value') == "") {
            $("#yzrepwd").html("*");
            return true;
        }
        if ($("#repwd").attr('value') != $("#pwd").attr('value')) {
            errorMsg = psdNOsame;
            $("#yzrepwd").html("<div class='tip_error'></div>" + errorMsg);
            return false;
        }
        var pwd = $("#repwd").attr('value');
        if (pwd.length < 6) {
            $("#yzrepwd").html("<div class='tip_error'></div>" + "<s:text name="member.reg.pwd.complex"/>");
            return false;
        }
        $("#yzrepwd").html("<div class='tip_right'></div>");
        return true;
    }
    function checkNickName() {
        $("#yzNickName").html("");
        var nick = $("#nickName").attr('value').replace(/(^\s*)|(\s*$)/g, "");
        if (nick == "") {
            $("#yzNickName").html("<div class='tip_error'></div>" + nickEmpty);
            return false;
        } else {
            $("#nickName").attr('value', nick);
        }
        $("#yzNickName").html("<div class='tip_right'></div>");
        return true;
    }
    function checkCheckBox() {
        $("#yxcheckbox").html("");
        if ($("#checkbox").is(":checked"))
            return true;
        else {
            $("#yxcheckbox").html("<div class='tip_warn'></div>" + acceptClauseMsg);
            return false;
        }

    }

    function checkForm() {
        var b1 = checkEmail();
        var b2 = checkPwd();
        var b3 = checkRepwd();
        var b4 = checkNickName();
        var b5 = checkCheckBox();
        return b1 && b2 && b3 && b4 && b5;
    }


    $("#email").blur(function () {
        checkEmail();
    });
    $("#pwd").blur(function () {
        checkPwd();
    });
    $("#repwd").blur(function () {
        checkRepwd();
    });

    $("#nickName").blur(function () {
        checkNickName();
    });
    $("#checkbox").click(function () {
        checkCheckBox();
    });
</script>
