<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link href="css/log_reg.css" rel="stylesheet"/>

<div class="lr_container">
    <%--<div class="lr_top fl">--%>
    <%--<a href="index.html">--%>
    <%--<img src="images/gogowise_logo_big_darkblue_error.png"/>--%>
    <%--</a>--%>
    <%--<span><s:property value="%{getText('share.happy.share.knowlege')}"/></span>--%>
    <%--</div>--%>
    <div class="lr_left fl">
        <a href="easyLogon.html"><s:property value="%{getText('button.log.in')}" /></a> <br/>
        <a href="javascript:;" class="stand_out"><s:property value="%{getText('user.info.identity.finish.reg')}" /></a>
    </div>
    <div class="lr_right lr_right_reg fr">
        <s:form validate="true" theme="css_xhtml" method="POST" action="teacherReg">
            <s:hidden name="reDirectUrl" id="reDirectUrl"/>
            <s:hidden name="baseUserRoleType.roleType.roleName" value="teacher"/>
            <s:hidden name="baseUserRoleType.roleType.id" value="5" />

            <div class="item_wrap item_wrap_reg">
                <div class="option_title_reg">Teacher's <s:property value="%{getText('email')}" /></div> &nbsp;&nbsp;
                <span id="log_email_tip" class="tip_words">*</span>
                <s:textfield cssClass="textfield" name="user.email" />
                <span class="email_img"></span>
            </div>


            <div class="item_wrap item_wrap_reg">
                <div class="option_title_reg"><s:property value="%{getText('password')}"/></div>  &nbsp;&nbsp;
                <span id="log_pwd_tip" class="tip_words">*</span>
                <s:password cssClass="textfield" name="user.password" />
                <span class="pwd_img"></span>
            </div>

            <div class="item_wrap item_wrap_reg">
                <div class="option_title_reg"><s:property value="%{getText('psdagain')}"/></div>  &nbsp;&nbsp;
                <span id="log_repwd_tip" class="tip_words">*</span>
                <s:password cssClass="textfield" name="duplicate" />
                <span class="repwd_img"></span>
            </div>

            <div class="item_wrap item_wrap_reg">
                <div class="option_title_reg"><s:property value="%{getText('menber.reg.nickName')}"/></div>  &nbsp;&nbsp;
                <span id="log_nickName_tip" class="tip_words">*</span>
                <s:textfield cssClass="textfield" name="user.nickName" />
                <span class="nick_img"></span>
            </div>

            <div class="submit submit_reg item_wrap item_wrap_reg">
                <div class="clause">
                    <span id="yxcheckbox" class="tip_words"></span> <br/>
                    <input name="checkbox" type="checkbox" value="checked" id="checkbox"/>
                    <a href="<%=request.getContextPath()%>/jsp/gogowise/Clause.htm" class="boxy" id="reg_clause"><s:property value="%{getText('read')}"/></a>
                </div>
                <input type="submit" class="subBtn" onclick="return checkRegForm();" value="<s:property value="%{getText('createButton')}"/>" />
            </div>

        </s:form>
    </div>
</div>

<script type="text/javascript">
    var pwdEmpty = "<s:text name='psdEmpty'/>";
    var pwdFormatWrong = "<s:text name='psdFormatWrong'/>";
    var repwdAgain = "<s:text name='psdagain'/>";
    var repwdNotEqual = "<s:text name='psdNOsame'/>";
    var emailEmpty = "<s:text name='emailEmpty'/>";
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
        $("input[name='user.email']").blur(function(){
            var email = $(this).val();
            checkEmail(1,email,"log_email_tip");
        });
        $("input[name='user.password']").blur(function(){
            var pwd = $(this).val();
            checkPwd(1,pwd,"log_pwd_tip");
        });
        $("input[name='duplicate']").blur(function(){
            var pwd = $("input[name='user.password']").val();
            var repwd = $(this).val();
            checkRepwd(1,pwd,repwd,"log_pwd_tip","log_repwd_tip");
        });
        $("#reg_clause").fancybox();
    });

    function checkEmail(type,email,tipId){
        document.getElementById(tipId).innerHTML = "*";
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

    function checkPwd(type,pwd,tipId){ //0表示提交表单时候的验证
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
                if(checkPwd(1,pwd,pwdTipId)){
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
                if(checkPwd(1,pwd,pwdTipId)){
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
        var email = $("input[name='user.email']").val();
        var pwd = $("input[name='user.password']").val();
        var repwd = $("input[name='duplicate']").val();
        var b1 = checkEmail(0,email,"log_email_tip");
        var b2 = checkPwd(0,pwd,"log_pwd_tip");
        var b3 = checkRepwd(0,pwd,repwd,"log_pwd_tip","log_repwd_tip");
        var b4 = checkCheckBox();

        return b1&&b2&&b3&&b4;
    }
</script>