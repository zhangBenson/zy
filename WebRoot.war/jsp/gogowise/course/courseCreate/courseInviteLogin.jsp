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
</style>

<s:form validate="true" theme="css_xhtml" method="POST" action="courseInviteIdentityLogin">

    <div id="register">
        <div id="regleft">
            <div id="regtitle"><s:text name="course.creation"/></div>
            <div id="regtitle2"><s:text name="identity.confirm"/></div>

            <div id="links"></div>
        </div>
        <div id="regright">
            <div id="regrightCont">
                <p class="inputTips"><s:text name="email"/><span class="errorinfo"
                                                                                    id="yzemail">*</span><br/><br/>
                    <input type="text" name="user.email" value="<s:property value="email"/>" id="email" class="text"
                           readonly="true"/>
                </p>

                <p id="addnext" class="inputTips"><s:text name="password"/><span class="errorinfo"
                                                                                                    id="yzpwd">*<s:property
                        value="identityConfirmMsg"/></span><br/>
                    <s:password name="user.password" id="pwd" cssClass="text"/>
                </p>

                <p class="nextButton"><input type="submit" name="button" id="btn1" onclick="return checkForm();"
                                             value="<s:text name="button.next"/>"/> <a
                        href="initRepassword.html"><span><s:text name="link.forget.pwd"/>？</span></a>
                </p>
            </div>
        </div>
    </div>

</s:form>

<script type="text/javascript">
    var pswNotEmpty = "<s:text name='psdEmpty'/>";
    $("#pwd").blur(function () {
        $("#yzpwd").text("*");
        var pwd = $("#pwd").attr('value');
        if (pwd == "") {
            $("#yzpwd").text(pswNotEmpty);
        }
    });
    function checkForm() {
        if ($("#pwd").attr('value') == "") {
            $("#yzpwd").text(pswNotEmpty);
            return false;
        }
        return true;
    }
</script>
