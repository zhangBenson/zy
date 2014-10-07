<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>


<style type="text/css">

    #register {
        height: 560px;
        width: 860px;
        background: url(images/register/gogowise.gif) no-repeat;
        font-family: Arial, Helvetica, sans-serif;
        margin: 100px auto 50px;
    }

    #regleft {
        float: left;
        width: 220px;
        margin: 150px 30px 5px 100px;;
    }

    #regright {
        margin-top: 100px;
        float: left;
        width: 470px;
        border-left: thin #CCC dotted;
        padding-left: 30px;
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
        color: #F00;
        font-size: 12px;
    }

    .text {
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

<s:form validate="true" theme="css_xhtml" method="POST" action="regSecLogon">

    <div id="register">
        <div id="regleft">
            <div id="regtitle"><s:text name="member.login.label"/></div>
            <div id="regtitle2"><s:property value="%{getText(member.login.center')}"/></div>

            <div id="links"></div>
        </div>
        <div id="regright">
            <p><s:text name="email"/>&nbsp;&nbsp;<span class="errorinfo"
                                                                          id="yzemail">*</span><br/><br/>
                <input type="text" name="user.email" id="email" class="text"/>
            </p>
            <br/>

            <p id="addnext"><s:text name="password"/>&nbsp;&nbsp;<span class="errorinfo" id="yzpwd">*<s:property
                    value="identityConfirmMsg"/></span><br/><br/>
                <s:password name="user.password" id="pwd" cssClass="text"/>
            </p>
            <br/>

            <p><input type="submit" name="button" id="btn1" onclick="return checkForm();"
                      value="<s:text name="Login"/>"/> <a
                    href="initRepassword.html"><span><s:text name="link.forget.pwd"/>？</span></a>
            </p>
        </div>
    </div>

</s:form>

<script type="text/javascript">

    $("#email").blur(function () {
        checkEmail();
    });

    $("#email").focus(function () {
        $("#yzemail").text("*");
    });

    $("#pwd").focus(function () {
        $("#yzpwd").text("*");
    });

    $("#pwd").blur(function () {
        checkPwd();
    });

    function checkForm() {
        return checkEmail() && checkPwd();
    }

    function checkEmail() {
        $("#yzemail").text("*");
        if ($("#email").attr('value') != "") {
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            var email = $("#email").val();
            if (!pattern.test(email)) {
                $("#yzemail").text("<s:text name="emailerror"/>");
                return false;
            }
        } else {
            $("#yzemail").text("<s:text name="emailEmpty"/>");
            return false;
        }

        return true;
    }

    function checkPwd() {
        $("#yzpwd").text("*");
        var pwd = $("#pwd").attr('value');
        if (pwd == "") {
            $("#yzpwd").text("<s:text name="psdEmpty"/>");
            return false;
        }
        return true;
    }
</script>
