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
        margin: 150px 30px 5px 40px;;
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

<s:form validate="true" theme="css_xhtml" method="POST" action="orgBackEndUserConfirm">
    <s:hidden name="user.activeCode"/>
    <div id="register">
        <div id="regleft">
            <div id="regtitle">知元加盟</div>
            <div id="regtitle2">温馨提示</div>
            <div id="links">
                尊敬的用户，根据您同知元网签署的合作协议，贵机构已经成功加盟知元网，请设置您的机构密码，开始您的知元之旅！
            </div>
        </div>
        <div id="regright">
            <div id="regrightCont">
                <p class="inputTips">机构名称<span class="errorinfo"></span>
                    <s:textfield name="org.schoolName" cssClass="text" readonly="true"/>
                </p>

                <p class="inputTips"><s:property value="%{getText('msg.email')}"/><span class="errorinfo"
                                                                                        id="yzemail">*</span>
                    <s:textfield name="user.email" cssClass="text" readonly="true"/>
                </p>

                <p id="addnext" class="inputTips"><s:property value="%{getText('msg.pwd')}"/><span class="errorinfo"
                                                                                                   id="yzpwd">*<s:property
                        value="identityConfirmMsg"/></span><br/>
                    <s:password name="user.password" id="pwd" value="" cssClass="text"/>
                </p>

                <p class="inputTips"><s:property value="%{getText('identity.password.confirm')}"/><span
                        class="errorinfo" id="yzrepwd">*</span><br/>
                    <s:password name="duplicate" id="repwd" value="" cssClass="text"/>
                </p>

                <p class="inputTips"><input name="checkbox" type="checkbox" value="checked" id="checkbox"
                                            checked="checked"/>
                    <a href="<%=request.getContextPath()%>/jsp/gogowise/Clause.htm" class="boxy"><s:property
                            value="%{getText('read')}"/></a></p>
            </div>
            <p class="nextButton">
                <input type="submit" name="button" id="btn1" onclick="return checkForm();"
                       value="<s:property value="%{getText('button.next')}"/>"/>
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
    var notNickName = "<s:text name='menber.reg.nickName.no.empty'/>";
    var emailFormatError = "<s:text name='emailerror'/>";

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

    function checkForm() {

        if ($("#pwd").attr('value') == "") {
            $("#yzpwd").text(psdEmpty);
            return false;
        }

        if ($("#repwd").attr('value') != $("#pwd").attr('value')) {
            $("#yzrepwd").text(psdNOsame);
            return false;
        }
        if (!$("#checkbox").is(':checked')) {
            return false;
        }
        return true;
    }

</script>
