<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link href="css/log_reg.css" rel="stylesheet"/>

<div style="clear: both;"></div>

<div style="text-align: center; width: 40%; margin-left: 30%; margin-bottom: 5%; margin-top: 1%;">

    <div class="basePanelTextLeft">

        <h1 class = "courseSubject"><s:text name="button.log.in"/></h1>
        <h1 class = "courseSynopsis"><s:text name="label.log.in.info"/></h1>
        <span class="errorinfo"><s:property value="actionErrors[0]"/></span>

        <s:form validate="true" theme="css_xhtml" cssClass="form-horizontal"  method="POST" action="logon">

            <s:hidden name="reDirectUrl" id="reDirectUrl"/>
            <div class="form-group">
                <label class="col-sm-2 control-label"> <s:text name="login.username"/></label>
                <div class="col-sm-10">
                    <span class="errorinfo" id="yzemail"></span>
                    <s:textfield name="user.email" id="logonemail" cssClass="form-control" placeholder="Phone #"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"> <s:text name="password"/></label>

                <div class="col-sm-10">
                    <span class="errorinfo" id="yzpwd"><s:property value="identityConfirmMsg"/></span>
                    <s:password name="user.password" id="pwd" cssClass="form-control" placeholder="Password"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"><s:text name="label.log.in.remember.me.info"/></label>
                            <a href="initRepassword.html" style="float: right;"><span><s:text name="link.forget.pwd"/>？</span></a>
                    </div>

                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input class = "btn btn-success  btn-lg btn-block" type="submit" name="button" id="btn1" onclick="return checkForm();" value="<s:text name="button.log.in"/>"/>
                </div>
            </div>
        </s:form>

    </div>
</div>

<div style="clear: both;"></div>

<script type="text/javascript">
    var pwdEmpty = "<s:text name='psdEmpty'/>";
    var pwdFormatWrong = "<s:text name='psdFormatWrong'/>";
    var repwdAgain = "<s:text name='psdagain'/>";
    var repwdNotEqual = "<s:text name='psdNOsame'/>";
    var emailEmpty = "<s:text name='messege.phone.empty'/>";
    var emailFormatWrong = "<s:text name='emailerror'/>";
    var acceptClauseMsg = "<s:text name='message.accept.rule'/>";


    function goToReg(){
        window.location.href = "initReg.html?user.email="+$("#logonemail").attr("value")+"&reDirectUrl="+encodeURIComponent($("#reDirectUrl").attr("value"));
    }

    $("#logonemail").blur(function(){
        checkEmail();
    });

    $("#logonemail").focus(function(){
        $("#yzemail").text("*");
        $("#wwerr_email .errorMessage").html("");
    });

    $("#pwd").focus(function(){
        $("#yzpwd").text("*");
        $("#wwerr_pwd .errorMessage").html("");
    });

    $("#pwd").blur(function() {
        checkPwd();
    });

    function checkForm() {
        return checkEmail()&&checkPwd();
    }

    function checkEmail(){
        $("#yzemail").text("*");
        if($("#logonemail").attr('value')!="" ){
            <%--var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;--%>
            <%--var email = $("#logonemail").val();--%>
            <%--if(!pattern.test(email)){--%>
            <%--$("#yzemail").text("<s:text name="emailerror"/>");--%>
            <%--return false;--%>
            <%--}--%>
        }else{
            $("#yzemail").text("<s:text name="messege.phone.empty"/>");
            return false;
        }

        return true;
    }

    function checkPwd(){
        $("#yzpwd").text("*");
        var pwd = $("#pwd").attr('value');
        if (pwd == "") {
            $("#yzpwd").text("<s:text name="psdEmpty"/>");
            return false;
        }
        return true;
    }
</script>
