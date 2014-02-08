<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    var errorDiv = "<div class='tip_error'></div>";
    var warnDiv = "<div class='tip_warn'></div>";
    var rightDiv = "<div class='tip_right'></div>";
    var bank_empty_msg = errorDiv+"<s:text name='label.account.no.empty'/>";
    var bank_name_empty= errorDiv+"<s:text name='label.bank.name.empty'/>";
    var disposeName_empty_msg =  errorDiv+"<s:text name='label.account.name.empty'/>";
    var selfDescription_empty_msg = warnDiv+"输入您对自己的介绍好让别人更好的了解您";
    var modifiedMsg =  false;
    var nickNameEmpty= errorDiv+"<s:text name='menber.reg.nickName.no.empty'/>";
    var realnameEmpty= errorDiv+"<s:text name='messege.realname.empty'/>";
    var idNo= errorDiv+"<s:text name='label.id.no.empty'/>" ;
    var idformat= errorDiv+"<s:text name='label.id.no.error'/>";
    var accountBankempty= errorDiv+"<s:text name='label.account.name.empty'/>";
    var accountBankformat= errorDiv+"<s:text name='message.bank.no.error'/>";

    var password_empty = "<s:text name='psdEmpty'/>";
    var old_new_repeat ="<s:text name='message.old.same.new'/>";
    var new_repeat_differ = "<s:text name='psdNOsame'/>";
    var updating_password = "<s:text name='message.changing'/>";
    var update_success =  "<s:text name='message.change.pwd.success'/>";
    var update_old_wrong =  "<s:text name='message.old.pwd.error'/>";
    var changeLogo="<s:text name='button.change.head'/>";
    var close="<s:text name='button.close'/>";
    var userPortraitName;
    var exist_words_number;
    $(document).ready(function(){
        $(document).ready(function() {
            for (var i = 0; i < $("input[name='user.sexy']").length; i++) {
                if ($($("input[name='user.sexy']")[i]).val() == "<s:property value='user.sexy'/>") {
                    $($("input[name='user.sexy']")[i]).attr('checked', "checked");
                }
            }
        });

        $("._change_userinfo").click(function(){
         if(modifiedMsg == false){
            $("._nickname").html("<input type='text' class='_nickname_input input_field' onblur='checkNickName();' name='user.nickName' value='" + $("._nickname").text() + "'/><span class='_nickname_Msg input_msg'></span>");
            $("._username").html("<input type='text' class='_username_input input_field'  onblur='checkUserName();' name='user.userName' value='" + $("._username").text() + "'/><span class='_username_Msg input_msg'></span>");
            $("._cardID").html("<input type='text' class='_cardID_input input_field'  onblur='checkCardID();' name='user.cardId' value='" + $("._cardID").text() + "'/><span class='_cardID_Msg input_msg'></span>");
            $("._bankName").html("<input type='text' class='_bankName_input input_field'  onblur='checkBankName();' name='userAccountInfo.bankName' value='" + $("._bankName").text() + "'/><span class='_bankName_Msg input_msg'></span>");
            $("._disposeName").html("<input type='text' class='_disposeName_input input_field'  onblur='checkDisposeName();' name='userAccountInfo.disposeName' value='" + $("._disposeName").text() + "'/><span class='_disposeName_Msg input_msg'></span>");
            $("._bankAccount").html("<input type='text' class='_bankAccount_input input_field'  onblur='checkBankAccount();' name='userAccountInfo.bankAccount' value='" + $("._bankAccount").text() + "'/><span class='_bankAccount_Msg input_msg'></span>");
            var selfDescription = $("._self_description").text();
            /*$("._self_description").html("<textarea  class='_selfDescription_input input_area' onkeyup='changeWordNumberAnyway();' name='user.selfDescription' onblur='checkSelfDescription();'/>");*/
            $("._self_description").html("<textarea  class='_selfDescription_input input_area' name='user.selfDescription' onblur='checkSelfDescription();'/>");
            $("._selfDescription_input").val(selfDescription);
            $(this).attr("disabled","true");
            modifiedMsg = true;
            $(".userinfo_commit").css("display","inline");
          }
        });


        function getFullPath(obj) {    //得到图片的完整路径
            if (obj) {
                //ie
                if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
                    obj.select();
                    return document.selection.createRange().text;
                }
                //firefox
                else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
                    if (obj.files) {
                        return window.URL.createObjectURL(obj.files.item(0));
                    }
                    return obj.value;
                }
                return obj.value;
            }
        }
        $("#updateFile1").change(function () {
                    $("._file_Msg").text("");
                    var strSrc = this.value;
                    img = new Image();
                    var href1 = getFullPath(this);
                    img.src = href1;
                    //验证上传文件格式是否正确
                    var pos = strSrc.lastIndexOf(".");
                    var lastname = strSrc.substring(pos, strSrc.length);
                    if (lastname.toLowerCase() != ".jpg" ) {
                    $("._file_Msg").text(fileType + lastname + "，"+mustBeJpg);
    //                    $("._file_Msg").text("图片类型必须为 JPG 类型");
                    return false;
                    }//验证上传文件宽高比例
                       if (img.fileSize / 1024 > 150) {
                        $("._file_Msg").text(fileSize);
                        return false;
                     }
                   //  href1 = href1+"&v="+new Date().getTime();
                   //  href1 = href1+"&v="+new Date().getTime();
                     document.getElementById("reImg").src = href1;
         } );
    });
    function changeWordNumberAnyway(){
        changeWordNumber($("._selfDescription_input"),$("._self_description_Msg"),50000)/*把账号设置中的自我介绍文本长度最大值设成最后一个参数*/
    }
    function checkForm(){
        var nicknameBool = checkNickName();
        var usernameBool = checkUserName();
        var cardIDBool = checkCardID();
        //var accountBool = checkAccount();

        if(nicknameBool&&usernameBool&&cardIDBool){
            $(".userinfo_form").submit();
        }
    }
    function checkNickName(){
        $("._nickname_Msg").text("");
        if($("._nickname_input").attr("value")==null)return true;
        if($("._nickname_input").attr("value")==""){
            $("._nickname_Msg").html(nickNameEmpty);
            return false;
        }
        $("._nickname_Msg").html(rightDiv);
        return true;
    }
    function checkUserName(){
        $("._username_Msg").text("");
        if($("._username_input").attr("value")==null)return true;
        if($("._username_input").attr("value")==""){
            $("._username_Msg").html(realnameEmpty);
            return false;
        }
         $("._username_Msg").html(rightDiv);
        return true;
    }
    function checkCardID(){
        $("._cardID_Msg").text("");
        if($("._cardID_input").attr("value")==null)return true;
        if($("._cardID_input").attr("value")==""){
            $("._cardID_Msg").html(idNo);
            return false;
        }else{
            var pattern = /^[1-9][0-9]{5}(19[0-9]{2}|200[0-9]|2010)(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])[0-9]{3}[0-9xX]$/ ;
            var cardID = $("._cardID_input").attr("value");
            if(!pattern.test(cardID)){
                 $("._cardID_Msg").html(idformat);
                 return false;
            }
        }
        $("._cardID_Msg").html(rightDiv);
        return true;
    }
    function checkSelfDescription(){
        $("._self_description_Msg").html("");
        var selfDescription =  $("._selfDescription_input").val().replace(/(^\s*)|(\s*$)/g, "");
        if(selfDescription == ""){
           $("._self_description_Msg").html(selfDescription_empty_msg);
            return false;
        }
        $("._self_description_Msg").html(rightDiv);
        return true;
    }
    function checkBankName(){
        $("._bankName_Msg").text("");
        var bankName = $("._bankName_input").val().replace(/(^\s*)|(\s*$)/g, "");
        if(bankName==""){
            $("._bankName_Msg").html(bank_name_empty);
            return false;
        }
        $("._bankName_Msg").html(rightDiv);
        return true;
    }
    function checkDisposeName(){
        $("._disposeName_Msg").html("");
        var disposeName =  $("._disposeName_input").val().replace(/(^\s*)|(\s*$)/g, "");
        if(disposeName == ""){
           $("._disposeName_Msg").html(disposeName_empty_msg);
            return false;
        }
        $("._disposeName_Msg").html(rightDiv);
        return true;
    }
    function checkBankAccount(){
         $("._bankAccount_Msg").html("");
        var bankAccount = $("._bankAccount_input").attr("value").replace(/(^\s*)|(\s*$)/g, "");
        if($("._bankAccount_input").attr("value")==null) return true;
        $("._bankAccount_Msg").text("");
        if(bankAccount==""){
            $("._bankAccount_Msg").html(bank_empty_msg);
            return false;
        }
        var reNo = /^\d{8,30}$/;
        if(!reNo.test(bankAccount)){
            $("._bankAccount_Msg").html(accountBankformat);
            return false;
        }
         $("._bankAccount_Msg").html(rightDiv);
        return true;
    }

    /* 与头像图片弹出box相关代码 */
    $(document).ready(function(){
        $("#change_portrait").fancybox({
            type:'iframe',
            width:720,
            height:480
        });
    });

    //设置基本信息框和密码Div切换的代码
    $(document).ready(function(){
        //切换之后颜色变化
        $("#tabtag2 ul li").click(function(){
                $(this).parent().find("li").removeClass("cur");
                $(this).addClass("cur");
        });
        //Div切换
        $("#tabtag2 .basic_info").click(function(){
            $(".userinfo_content").show();
            $(".password_change_content").hide();
        });
        $("#tabtag2 .password_change").click(function(){
            $(".password_change_content").show();
            $(".userinfo_content").hide();
        });
    });


    //提交密码修改申请 ,及其验证
    $(document).ready(function(){
        $(".old_password").blur(function(){
            if($(".old_password").val() == "")
                $(".old_password_msg").html(password_empty);
        });
         $(".new_password").blur(function(){
             var oldPassword = $(".old_password").val();
             var newPassword = $(".new_password").val();
             if(newPassword == "")
                    $(".new_password_msg").html(password_empty);
             else if(oldPassword == newPassword){
                   $(".new_password_msg").html(old_new_repeat);
             }
        });
         $(".new_password_repeat").blur(function(){
            var newPasswordRepeat = $(".new_password_repeat").val();
            if(newPasswordRepeat == ""){
                $(".new_password_repeat_msg").html(password_empty);
                return;
            }
            var newPassword = $(".new_password").val();
            if(newPassword != newPasswordRepeat){
                $(".new_password_repeat_msg").html(new_repeat_differ);
            }
        });

         $(".old_password").focus(function(){
            $(".old_password_msg").html("");
        });
         $(".new_password").focus(function(){
            $(".new_password_msg").html("");
        });
         $(".new_password_repeat").focus(function(){
            $(".new_password_repeat_msg").html("");
        });

        $(".password_change_submit input").click(function(){
            $("#submit_msg1").html(updating_password);
            var url="updatePassword.html";
            var params = {"user.password":$(".old_password").val(),"newPassword":$(".new_password").val()};
            $.post(url,params,function(data){
                if(data.length != 0){
                    $("#save_pop").fadeIn("slow");
                    $("#save_pop .save_done").show();
                    setTimeout(function(){
                        $("#save_pop").fadeOut("slow");
                        $("#save_pop .save_done").hide();
                    },2000);
                }else{
                    $("#save_pop").fadeIn("slow");
                    $("#save_pop .save_fail").show();
                    setTimeout(function(){
                        $("#save_pop").fadeOut("slow");
                        $("#save_pop .save_fail").hide();
                    },2000);
                }
            },"text");
            $(".old_password").val("");
            $(".new_password").val("");
            $(".new_password_repeat").val("");
        });
    });

</script>