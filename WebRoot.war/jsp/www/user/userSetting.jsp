<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script src="gogowisestyle/js/bootstrap-datepicker.js"></script>
<script src="gogowisestyle/js/icheck.min.js"></script>
<link rel="stylesheet" href="gogowisestyle/css/datepicker3.css">
<link rel="stylesheet" href="css/room/bootstrap.min.css">
<link rel="stylesheet" href="gogowisestyle/skins/all.css">

<style type="text/css">
    .input_msg{color:red;font-size:12px;margin-left:5px;}
</style>

<div class="container">

    <div class="thinline"></div>
    <br/>

    <div class="col-sm-7">

        <div class="basePanelTextLeft">
            <h1 class="courseSubject"><s:property value="%{getText('table.base.info')}"/></h1>

            <form class="form-horizontal" action="updateUserInfo.html" method="post">
                <div class="form-group">
                    <label><s:property value="%{getText('menber.reg.nickName')}"/></label>
                    <span class="input_msg" id="nick_name_msg"></span>
                    <input type="text" class="form-control" id="nick_name_input" placeholder="<s:property value="%{getText('menber.reg.nickName')}"/>"
                           onblur="checkEmpty('nick_name_input','nick_name_msg','<s:text name='menber.reg.nickName.no.empty'/>')"
                           name="user.nickName" value="<s:property value="user.nickName"/>" />
                </div>
                <div class="form-group">
                    <label><s:property value="%{getText('label.realname')}"/></label>
                    <span class="input_msg" id="real_name_msg"></span>
                    <input type="text" class="form-control" id="real_name_input" placeholder="<s:property value="%{getText('label.realname')}"/>"
                           onblur="checkEmpty('real_name_input','real_name_msg','<s:text name='messege.realname.empty'/>')"
                           name="user.userName" value="<s:property value="user.userName"/>" />
                </div>
                <div class="form-group">
                    <label><s:property value="%{getText('orgleague.info.birth')}"/></label>
                    <input type="text" class="form-control" placeholder="<s:property value="%{getText('orgleague.info.birth')}"/>"
                           name="user.birthDay" value="<s:date name="user.birthDay" format="MM/dd/yyyy"/>" readonly
                           class="form_datetime" id="txtBirthday" />
                </div>

                <div class="form-group">
                    <label><s:property value="%{getText('sex')}"/></label>
                    <br/>
                    <label style="width: 100px;">
                        <input type="radio" name="user.sexy" value="true" <s:if test="user.sexy">checked="checked"</s:if> >
                        <span><s:property value="%{getText('male')}"/></span>
                    </label>

                    <label>
                        <input type="radio" name="user.sexy" value="false" <s:if test="!user.sexy">checked="checked"</s:if> >
                        <span><s:property value="%{getText('female')}"/></span>
                    </label>
                </div>

                <div class="form-group">
                    <label><s:property value="%{getText('label.user.self.introduction')}"/></label>
                    <span class="input_msg" id="self_desc_msg"></span>
                    <textarea type="text" class="form-control" placeholder="Self introduction" id="self_desc_area" onkeyup="changeWordNumber('self_desc_area','self_desc_msg',5000)"
                              rows="3" name="user.selfDescription"><s:property value="user.selfDescription"/></textarea>
                </div>
                <div class="form-group">
                    <label><s:property value="%{getText('email')}"/></label>
                    <input type="email" class="form-control" placeholder="Email" disabled value="<s:property value="user.email"/>"></div>

                <div class="form-group">
                    <label>Registration Time：</label>
                    <input type="email" class="form-control" placeholder="Registration Time" disabled value="<s:date name="user.regDate" format="yyyy-MM-dd HH:mm"/>">
                </div>
                <div class="form-group">
                    <label>Last Logging in Time：</label>
                    <input type="email" class="form-control" placeholder="Last Logging in Time" disabled value="<s:date name="user.lastLoginDate" format="yyyy-MM-dd HH:mm"/>">
                </div>
                <button type="submit" class="btn btn-primary btn-block" onclick="return checkInfoForm();"><s:property value="%{getText('button.account.submit')}"/></button>
            </form>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="basePanelshadow">

            <%-- TODO:以后删除 --%>
            <img src="" style="display: none;" id="usermenu_user_img"/>
            <input type="hidden" id="picHidden"/>

            <img src="<s:property value='#session.userLogoUrl'/>" style="width: 100px;height: 100px;border-radius: 12px;" id="reImg"/>

            <br/>
            <br/>
            <a class="btn btn-success" id="change_portrait" href="userPortraitCrop.html"><s:property value="%{getText('button.change.head')}"/></a>
        </div>
        <br/>

        <div class="basePanelTextLeft">
            <span style="color:red;" id="submit_msg1"></span>
            <span style="color:green;" id="submit_msg2"></span>
            <h1 class="courseSubject"><s:property value="%{getText('table.change.password')}"/></h1>

            <div class="form-group">
                <label><s:property value="%{getText('label.old.password')}"/></label>
                <span class="old_password_msg input_msg"></span>
                <input type="password" class="form-control old_password" id="pwd_old" onblur="checkOld()"
                       placeholder="<s:property value="%{getText('label.old.password')}"/>" name='user.password'>
            </div>
            <div class="form-group">
                <label><s:property value="%{getText('label.new.password')}"/></label>
                <span class="new_password_msg input_msg"></span>
                <input type="password" class="form-control new_password" id="pwd_new" onblur="checkNew()"
                       placeholder="<s:property value="%{getText('label.new.password')}"/>" name='newPassword'>
            </div>
            <div class="form-group">
                <label><s:property value="%{getText('label.new.password.confirm')}"/></label>
                <span class="new_password_repeat_msg input_msg"></span>
                <input type="password" class="form-control new_password_repeat" id="pwd_confirm" onblur="checkRepeat()"
                       placeholder="<s:property value="%{getText('label.new.password.confirm')}"/>" name='newPasswordConfirm'>
            </div>
            <button type="button" class="btn btn-danger btn-block" id="chgPwdBtn"><s:property value="%{getText('button.submit')}"/></button>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $('#txtBirthday').datepicker({
            orientation: "top left",
            autoclose: true
        });

        $('input').iCheck({
            checkboxClass: 'icheckbox_polaris',
            radioClass: 'iradio_square red',
            increaseArea: '20%' // optional
        });

        $("#chgPwdBtn").click(function(){
            if(!checkPwdForm()) return;

            var url="updatePassword.html";
            var params = {"user.password":$("#pwd_old").val(),"newPassword":$("#pwd_new").val()};
            $.post(url,params,function(data){
                $("#submit_msg1").html("");
                $("#submit_msg2").html("");
                if(data.length != 0){
                    $("#submit_msg2").html("<s:property value="%{getText('message.change.pwd.success')}"/>");
                }else{
                    $("#submit_msg1").html("<s:property value="%{getText('message.old.pwd.error')}"/>");
                }
            },"text");
            $(".old_password").val("");
            $(".new_password").val("");
            $(".new_password_repeat").val("");
        });

        //更换头像
        $("#change_portrait").fancybox({
            type:'iframe',
            width:730,
            height:490,
            padding:10,
            scrolling:"no",
            modal:true
        });
    });

    function checkInfoForm(){
        var r1 = checkEmpty('nick_name_input','nick_name_msg','<s:text name='menber.reg.nickName.no.empty'/>');
        var r2 = checkEmpty('real_name_input','real_name_msg','<s:text name='messege.realname.empty'/>');
        if(!r1 || !r2){
            moveToExact(50);
        }
        return r1&&r2;
    }

    function checkPwdForm(){
        if(!checkOld()) return false;
        if(!checkNew()) return false;
        if(!checkRepeat()) return false;
        return true;
    }

    function checkOld(){
        if($(".old_password").val() == ""){
            $(".old_password_msg").html(password_empty);
            return false;
        }

        $(".old_password_msg").html("");
        return true;
    }


    function checkNew(){
        var oldPassword = $(".old_password").val();
        var newPassword = $(".new_password").val();
        if(newPassword == ""){
            $(".new_password_msg").html(password_empty);
            return false;
        }

        if(oldPassword == newPassword){
            $(".new_password_msg").html(old_new_repeat);
            return false;
        }

        $(".new_password_msg").html("");
        return true;
    }
    function checkRepeat(){
        var newPasswordRepeat = $(".new_password_repeat").val();
        if(newPasswordRepeat == ""){
            $(".new_password_repeat_msg").html(password_empty);
            return false;
        }
        var newPassword = $(".new_password").val();
        if(newPassword != newPasswordRepeat){
            $(".new_password_repeat_msg").html(new_repeat_differ);
            return false;
        }

        $(".new_password_repeat_msg").html("");
        return true;
    }

    var password_empty = "<s:text name='psdEmpty'/>";
    var old_new_repeat ="<s:text name='message.old.same.new'/>";
    var new_repeat_differ = "<s:text name='psdNOsame'/>";
    var update_success =  "<s:text name='message.change.pwd.success'/>";
    var update_old_wrong =  "<s:text name='message.old.pwd.error'/>";
    var changeLogo="<s:text name='button.change.head'/>";
    var close="<s:text name='button.close'/>";
</script>
