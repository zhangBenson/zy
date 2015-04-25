<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link href="css/log_reg.css" rel="stylesheet"/>

<div style="clear: both;"></div>

<div style="text-align: center; width: 40%; margin-left: 30%; margin-bottom: 5%; margin-top: 3%;">
    <div class="basePanelTextLeft">
        <h1 class = "courseSubject"><s:text name="button.log.in.teacher"/></h1>
        <h1 class = "courseSynopsis"><s:text name="label.log.in.info"/></h1>
        <span class="errorinfo"><s:property value="actionErrors[0]"/></span>
        <s:form validate="true" theme="css_xhtml" cssClass="form-horizontal"  method="POST" action="teacherLoginProcess">
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
                            <%-- <input type="checkbox"><s:text name="label.log.in.remember.me.info"/></label> --%>
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
    function checkCheckBox(){
        if($("#checkbox").is(":checked"))
            return true;
        else{
            $("#yxcheckbox").html(acceptClauseMsg);
            return false;
        }
    }

    $(function(){
        $("#registeremail").blur(function(){
            var email = $(this).val();
            //alert("email : " + email);
            checkRegisterEmail(1,email,"log_email_tip");
        });
        $("#registerpwd").blur(function(){
            var pwd = $(this).val();
            checkRegisterPwd(1,pwd,"log_pwd_tip");
        });
        $("input[name='duplicate']").blur(function(){
            var pwd = $("input[name='user.password']").val();
            var repwd = $(this).val();
            checkRepwd(1,pwd,repwd,"log_pwd_tip","log_repwd_tip");
        });
        $("#reg_clause").fancybox();
    });

    function checkRegisterEmail(type,email,tipId){
        document.getElementById(tipId).innerHTML = "*";
        //alert("checkRigisterEmail : " + email);
        if(email == ""){
            if(type == 0){
                document.getElementById(tipId).innerHTML = emailEmpty;
                return false;
            }else{
                return true;
            }
        }else{
            var emailPattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
            if(emailPattern.test(email)){
                return true;
            }else{
                document.getElementById(tipId).innerHTML = emailFormatWrong;
                return false;
            }
        }
    }

    function checkRegisterPwd(type,pwd,tipId){ //0表示提交表单时候的验证
        document.getElementById(tipId).innerHTML = "*";
        if(pwd == ""){
            if(type == 0){
                document.getElementById(tipId).innerHTML = pwdEmpty;
                return false;
            }else{
                return true;
            }
        }else{
            var pwdPattern = /[\d|\w]{8,}/;
            if(!pwdPattern.test(pwd)){
                $("#"+tipId).text(pwdFormatWrong);

                document.getElementById(tipId).innerHTML = pwdFormatWrong;
                return false;
            }else{
                return true;
            }
        }
    }
    function checkRepwd(type,pwd,repwd,pwdTipId,repwdTipId){
        var repwdTipObj = document.getElementById(repwdTipId);
        repwdTipObj.innerHTML = "*";
        if(type == 0){    //提交表单时
            if(pwd == ""){
                return false;
            }else{
                if(checkRegisterPwd(1,pwd,pwdTipId)){
                    if(repwd == ""){
                        repwdTipObj.innerHTML = repwdAgain;
                        return false;
                    }else if(pwd != repwd){
                        repwdTipObj.innerHTML = repwdNotEqual;
                        return false;
                    }else{
                        return true;
                    }
                }else{

                    return false;
                }
            }
        }else{
            if(pwd == ""){
                return false;
            }else{
                if(checkRegisterPwd(1,pwd,pwdTipId)){
                    if(repwd == ""){
                        return true;
                    }else if(pwd != repwd){
                        repwdTipObj.innerHTML = repwdNotEqual;
                        return false;
                    }else{
                        return true;
                    }
                }else{
                    return false;
                }
            }
        }
    }

    function checkRegForm(){
        var email = $("#registeremail").attr('value');
        var pwd = $("#registerpwd").attr('value');
        var repwd = $("input[name='duplicate']").val();
        var b1 = checkRegisterEmail(0,email,"log_email_tip");
        var b2 = checkRegisterPwd(0,pwd,"log_pwd_tip");
        var b3 = checkRepwd(0,pwd,repwd,"log_pwd_tip","log_repwd_tip");
        var b4 = checkCheckBox();
        //alert (b1 + "--" + b2 + "--" + b3 + "--" + b4);
        return b1&&b2&&b3&&b4;
    }



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
            <%--$("#yzemail").text("<s:text name="messege.phone.empty"/>");--%>
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
