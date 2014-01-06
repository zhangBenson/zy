<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>


<style type="text/css">
    #register {
        width: 860px;
        background: url(images/register/gogowise.gif) no-repeat;
        font-family: Arial, Helvetica, sans-serif;
        margin: 120px auto 50px;
    }

    #regleft {
        float: left;
        width: 320px;
        margin: 150px 20px 5px 10px;
    }

    #regright {
        margin-top: 100px;
        float: left;
        width: 420px;
        border-left: thin #CCC dotted;
        padding-left: 30px;
    }

    #regright p{
        float:left;
        width:100%;
        text-align: left;
    }
    #regright p.addnext{
        display: inline;
        width:auto;
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
        float:left;
        clear:both;
        width: 300px;
        height: 25px;
        line-height: 25px;
        margin-top: 7px;
        margin-bottom: 10px;
        padding-left: 2px;
        background: #F7F7F7;
        border: 1px #E7E7E7 solid;
    }

    #btn1 {
        width: 125px;
        height: 42px;
        margin-right: 10px;
        border: none;
        background: url(images/register/regbtn.gif);
        cursor: pointer;
        font-family: "微软雅黑", "宋体", "新宋体";
        font-size: 18px;
        color: #FFF;
        font-weight: bold;
    }

    #links {
        font-family:"宋体";
        float:left;
        font-size: 16px;
    }
    #links .no_account{
        color:#888;
        font-size: 14px;
        font-family: "微软雅黑";
    }
     #links1 {
        color:rgb(29, 160, 236);
        text-decoration: none;
        font-family: "华文行楷";
        font-size:24px;
        font-weight: bold;
        cursor: pointer;
     }
    #links1:hover{
        color:#f90;
        text-decoration: underline;
    }



    #register a {
        text-decoration: underline;
    }
    .wwgrp{
        display: inline;
    }
    .wwerr{
        float:left;
    }
    .errorMessage{
        display: inline;
    }
    .wwctrl{
        float:left;
        clear:both;
    }
</style>

<s:form validate="true" theme="css_xhtml" method="POST" action="logon">
     <s:hidden name="reDirectUrl" id="reDirectUrl"/>
    <div id="register">
        <div id="regleft">
            <div id="regtitle"><s:property value="%{getText('member.login.label')}" /></div>
            <div id="regtitle2"><s:property value="%{getText('member.login.center')}" /></div>

            <div id="links">
                <br/>
                <span class="no_account"><s:property value="%{getText('user.info.identity.confirm.no.account')}"/></span>
                <span id="links1" class="linksClick" onclick="goToReg();"><s:property value="%{getText('user.info.identity.confirm.register.now')}"/></span>
            </div>
        </div>
        <div id="regright">
            <p class="addnext">
                <s:property value="%{getText('email')}" />&nbsp;&nbsp;<span class="errorinfo" id="yzemail">*</span>
                <s:textfield name="user.email" id="email" cssClass="text"/>
            </p>
            <br/>

            <p class="addnext">
                <s:property value="%{getText('password')}"/>&nbsp;&nbsp;<span class="errorinfo" id="yzpwd">*<s:property value="identityConfirmMsg"/></span>
                <s:password name="user.password" id="pwd" cssClass="text"/>
            </p>
            <p>
                <input type="submit" name="button" id="btn1" onclick="return checkForm();" value="<s:property value="%{getText('button.log.in')}" />"/> <a
                    href="initRepassword.html"><span><s:property value="%{getText('link.forget.pwd')}" />？</span></a>
            </p>
        </div>
    </div>

</s:form>

<script type="text/javascript">
    function goToReg(){
       window.location.href = "initReg.html?user.email="+$("#email").attr("value")+"&reDirectUrl="+encodeURIComponent($("#reDirectUrl").attr("value"));
    }

     $("#email").blur(function(){
         checkEmail();
    });

    $("#email").focus(function(){
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
        if($("#email").attr('value')!="" ){
           var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
           var email = $("#email").val();
            if(!pattern.test(email)){
                $("#yzemail").text("<s:text name="emailerror"/>");
                return false;
            }
        }else{
                 $("#yzemail").text("<s:text name="emailEmpty"/>");
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
