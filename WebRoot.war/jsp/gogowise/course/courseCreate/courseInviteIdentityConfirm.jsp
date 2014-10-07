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

<s:form validate="true" theme="css_xhtml" method="POST" action="courseInviteIdentityConfirm">
    <s:hidden name="course.id"/>
    <div id="register">
        <div id="regleft">
            <div id="regtitle"><s:property value="%{getText('course.creation')}"/></div>
            <div id="regtitle2"><s:property value="%{getText('identity.confirm')}"/></div>

            <div id="links"><s:property value="%{getText('identity.remind.registe')}"/>.</div>
        </div>
        <div id="regright">
            <div id="regrightCont">
                <p class="inputTips"><s:property value="%{getText('email')}"/><span class="errorinfo"
                                                                                    id="yzemail">*</span><br/>
                    <input type="text" name="user.email" value="<s:property value="email"/>" id="email" class="text"
                           readonly="true"/>
                </p>

                <p id="addnext" class="inputTips"><s:property value="%{getText('password')}"/><span class="errorinfo"
                                                                                                    id="yzpwd">*<s:property
                        value="identityConfirmMsg"/></span><br/>
                    <s:password name="user.password" id="pwd" cssClass="text"/>
                </p>

                <p class="inputTips"><s:property value="%{getText('psdagain')}"/><span class="errorinfo"
                                                                                       id="yzrepwd">*</span><br/>
                    <s:password name="duplicate" id="repwd" cssClass="text"/>
                </p>

                <p class="inputTips"><s:property value="%{getText('menber.reg.nickName')}"/><span class="errorinfo"
                                                                                                  id="yznickName">*</span><br/>
                    <s:textfield name="user.nickName" id="nickName" cssClass="text"/>
                </p>

                <p class="inputTips"><input name="checkbox" type="checkbox" value="checked" id="checkbox"/>
                    <a href="<%=request.getContextPath()%>/jsp/gogowise/Clause.htm" class="boxy"><s:property
                            value="%{getText('course.creation.document.rule')}"/></a>
                </p>
                    <%--</div>--%>

                <p class="nextButton"><input type="submit" name="button" id="btn1" onclick="return checkForm();"
                                             value="<s:property value="%{getText('button.next')}"/>"/>
                </p>
            </div>
        </div>
    </div>

</s:form>

<script type="text/javascript">
    var rule = "<s:text name='rule'/>";
    var pswNotEmpty = "<s:text name='psdEmpty'/>";
    var pswNotSameTwice = "<s:text name='password.is.not.the.same'/>";
    var nickNameEmpty = <s:text name='menber.reg.nickName.no.empty'/>";"
    $(function () {
        $(".boxy").boxy({title: rule, closeable: true, modal: true});
    });

    $("#pwd").blur(function () {
        $("#yzpwd").text("*");
        var pwd = $("#pwd").attr('value');
        if (pwd == "") {
            $("#yzpwd").text(pswNotEmpty);
        }
    });
    $("#repwd").blur(function () {
        $("#yzrepwd").text("*");
        if ($("#repwd").attr('value') != $("#pwd").attr('value')) {
            $("#yzrepwd").text(pswNotSameTwice);
        }
    });

    $("#nickName").blur(function () {
        $("#yznickName").text("*");
        var nick = $("#nickName").attr('value').replace(/(^\s*)|(\s*$)/g, "");
        if (nick == "") {
            $("#yznickName").text(nickNameEmpty);
        } else {
            $("#nickName").attr('value', nick);
        }

    });

    function checkForm() {

        if ($("#pwd").attr('value') == "") {
            $("#yzpwd").text(pswNotEmpty);
            return false;
        }
        if ($("#repwd").attr('value') != $("#pwd").attr('value')) {
            $("#yzrepwd").text(pswNotSameTwice);
            return false;
        }
        if ($("#nickName").attr('value') == "") {
            $("#yznickName").text(nickNameEmpty);
            return false;
        }
        if (!$("#checkbox").is(':checked')) {
            return false;
        }
        return true;
    }
</script>
