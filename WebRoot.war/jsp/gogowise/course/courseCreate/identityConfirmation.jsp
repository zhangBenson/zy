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
        width: 280px;
        margin: 150px 30px 5px 40px;
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
        margin-left: 114px;
    }

    #regrightCont .inputTips {
        text-align: left;
    }

    #regrightCont .nextButton {
        text-align: center;
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

    #links {
        font-family: "宋体";
        float: left;
        font-size: 14px;
    }

    #links .linksClick {
        color: orange;
        font-size: 16px;
        font-family: "微软雅黑";
        text-decoration: none;
    }

    #links .linksClick:hover {
        text-decoration: underline;
    }
</style>

<s:form validate="true" theme="css_xhtml" method="POST" action="identityConfirm">
    <s:hidden name="course.id"/>
    <div id="register">
        <div id="regleft">
            <div id="regtitle"><s:text name="course.creation"/></div>
            <div id="regtitle2"><s:text name="identity.confirm"/></div>
            <div id="links">
                <s:text name="user.info.identity.confirm.first"/><a class="linksClick" href="####"
                                                                    onclick="addRepswAndnickName();">
                <s:text name="here"/></a>
                <s:text name="user.info.identity.finish.reg"/>
            </div>
        </div>
        <div id="regright">
            <div id="regrightCont">
                <p class="inputTips"><s:text name="email"/><span class="errorinfo"
                                                                 id="yzemail">*</span>
          <span id="emailNotExist" style="display: none;">
               <img src="images/courseImages/error.gif"/><s:text name="identity.not.exist.click"/><a
                  href="####" onclick="addRepswAndnickName();" style="color:#ff0000;">
              <s:text name="here"/></a>
              <s:text name="identity.finish.regist"/>
          </span>
                    <s:textfield name="user.email" id="email" type="password" cssClass="text"/>
                </p>

                <p id="addnext" class="inputTips"><s:text name="password"/><span class="errorinfo"
                                                                                 id="yzpwd">*<s:property value="identityConfirmMsg"/></span><br/>
                    <s:password name="user.password" id="pwd" cssClass="text"/>
                </p>

                <div id="addMsg" style="display:none;">
                    <p class="inputTips"><s:text name="psdagain"/><span class="errorinfo"
                                                                        id="yzrepwd">*</span><br/>
                        <s:password name="duplicate" id="repwd" cssClass="text"/>
                    </p>

                    <p class="inputTips"><s:text name="menber.reg.nickName"/><span class="errorinfo"
                                                                                   id="yznickName">*</span><br/>
                        <s:textfield name="user.nickName" id="nickName" cssClass="text"/>
                    </p>

                    <p class="inputTips"><input name="checkbox" type="checkbox" value="checked" id="checkbox"/>
                        <a href="<%=request.getContextPath()%>/jsp/gogowise/Clause.htm" class="boxy"><s:text name="read"/></a></p>
                </div>

                <p class="nextButton"><input type="submit" name="button" id="btn1" onclick="return checkForm();"
                                             value="<s:text name="button.next"/>"/> <a
                        href="initRepassword.html"><span id="forgotPwd" style="display:inline;">忘记密码？</span></a>
                </p>
            </div>
        </div>
    </div>

</s:form>

<script type="text/javascript">
    var rule = "<s:text name='rule'/>";

    var emailEmpty = "<s:text name='emailEmpty'/>";
    var psdEmpty = "<s:text name='psdEmpty'/>";
    var psdNOsame = "<s:text name='psdNOsame'/>";
    var emailError = "<s:text name='emailerror'/>";
    var nickNameEmpty = "<s:text name='menber.reg.nickName.no.empty'/>";


    $(function () {
        $(".boxy").boxy({title: rule, closeable: true, modal: true});
    });
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
    var errorMsg = "";
    $("#email").blur(function () {
        $("#yzemail").text("");
        if ($("#email").attr('value') != "") {
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            var email = $("#email").val();
            if (!pattern.test(email)) {
                $("#yzemail").text(emailError);
            } else {
                var url = "identityConfirmEmailCheck.html";
                var postStr = "email=" + email;
                var ajax = InitAjax();
                ajax.open("POST", url, true);
                ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                ajax.send(postStr);
                ajax.onreadystatechange = function () {
                    if (ajax.readyState == 4) {
                        var str = ajax.responseText;
                        if (str.length != 0) {
                            $("#emailNotExist").css("display", "inline");
                        } else {
                            $("#emailNotExist").css("display", "none");
                            $("#addMsg").css("display", "none");
                            $("#repwd").attr("value", "");
                            $("#nickName").attr("value", "");
                            $("#forgotPwd").css("display", "inline");
                        }
                    }
                }
            }
        } else {

            $("#yzemail").text(emailEmpty);
        }

    });

    function addRepswAndnickName() {
        $("#addMsg").css("display", "block");
        $("#emailNotExist").css("display", "none");
        $("#forgotPwd").css("display", "none");
    }


    $("#pwd").blur(function () {
        $("#yzpwd").text("");
        if ($("#pwd").attr('value') == "") {
            errorMsg = psdEmpty;
            $("#yzpwd").text(errorMsg);
        }
    });
    $("#repwd").blur(function () {
        $("#yzrepwd").text("");
        if ($("#repwd").attr('value') != $("#pwd").attr('value')) {
            errorMsg = psdNOsame;
            $("#yzrepwd").text(errorMsg);
        }
    });

    $("#nickName").blur(function () {
        $("#yznickName").text("");
        if ($("#nickName").attr('value') == "") {
            $("#yznickName").text(nickNameEmpty);
        }

    });

    function checkForm() {
        if ($("#email").attr('value') != "") {
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            var email = $("#email").val();
            if (!pattern.test(email)) {
                $("#yzemail").text(emailError);
                return false;
            }
        } else {
            $("#yzemail").text(emailEmpty);
            return false;
        }
        if ($("#pwd").attr('value') == "") {
            $("#yzpwd").text(psdEmpty);
            return false;
        }


        // alert($("#addMsg").css("display"));
        if ($("#addMsg").css("display") == "block") {
            // alert("OK");
            if ($("#repwd").attr('value') != $("#pwd").attr('value')) {
                $("#yzrepwd").text(psdNOsame);
                return false;
            }
            if ($("#nickName").attr('value') == "") {
                $("#yznickName").text(nickNameEmpty);
                return false;
            }
            if (!$("#checkbox").is(':checked')) {
                return false;
            }
        }
        return true;
    }

</script>
