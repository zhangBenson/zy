<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<script type="text/javascript\" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript\" src="js/uploadify/swfobject.js"></script>
<script type="text/javascript">
    var uploading = false;
    var uploaded = false;
    var uploading1 = false;
    var uploaded1 = false;
    var uploading2 = false;
    var uploaded2 = false;
    var name_blank_msg = "<s:text name='messege.realname.empty'/>";
    var name_length_msg = "<s:text name='message.name.of.person.in.change.too.long'/>";
    var orgName_blank_msg = "<s:text name='message.org.name.empty'/>";
    var orgName_length_msg = "<s:text name='message.org.name.too.long'/>";
    var orgName_exist_msg = "<s:text name='message,org.exist'/>";
    var content_blank_msg = "说明不能为空";
    var content_length_msg = "请不要超过40个字";
    var accountName_blank_msg = "银行账户不能为空";
    var accountName_form_msg = "";
    var accountNo_blank_msg = "银行账号不能为空";
    var accountNo_form_msg = "银行账号填写错误";
    var fixedTel_blank_msg = "固定电话不能为空,eg:010-43892437";
    var fixedTel_form_msg = "固定电话填写错误,eg:010-43892437";
    var  mobile_blank_msg = "移动电话不能为空";
    var mobile_form_msg = "";
    var address_blank_msg = "地址不能为空";
    var address_length_msg = "";
    var postCode_blank_msg = "邮编不能为空";
    var postCode_form_msg = "邮编填写错误";
    var contact_blank_msg = "<s:text name='message.contact.no.empty'/>";
    var contact_form_msg = "<s:text name='message.contact.number.error'/>";
    var birth_blank_msg = "请选择您的生日";
    var id_blank_msg = "身份证号不能为空";
    var id_form_msg = "身份证号格式不正确";
    var upload_idCard_msg = "请上传身份证复印件电子档";
    var upload_orgLogo_msg = "<s:text name='message.upload.org.logo'/>";
    var uploaded__msg = "<s:text name='message.upload.success'/>";
    var uploading__msg = "<s:text name='message.file.uploading'/>";
    var words_on_uploadButton = "Browse";
    var errorDiv = "<div class='tip_error'></div>";
    var warnDiv = "<div class='tip_warn'></div>";
    var rightDiv = "<div class='tip_right'></div>";
    var aCity = {11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "}
    var orgNameNotExisted = false;

    function InitAjax(){
            var ajax=false;
            try {
                ajax = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    ajax = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (E) {
                    ajax = false;
                }
            }
            if (!ajax && typeof XMLHttpRequest!='undefined') {
                ajax = new XMLHttpRequest();
            }
            return ajax;
    }
    //second step checking
    $(document).ready(function () {
        $("#fileupload").uploadify({
            /*注意前面需要书写path的代码*/
            'uploader':'js/uploadify/uploadify.swf',
            'script':'utils/uploadFile.html',
            'cancelImg':'js/uploadify/cancel.png',
            'queueID':'fileQueue', //和存放队列的DIV的id一致
            'fileDataName':'fileupload', //和以下input的name属性一致
            'auto':true, //是否自动开始
            'multi':false, //是否支持多文件上传
            'buttonText':words_on_uploadButton, //按钮上的文字
            'simUploadLimit':1, //一次同步上传的文件数目
            'sizeLimit':2000000, //设置单个文件大小限制
            'queueSizeLimit':1, //队列中同时存在的文件个数限制
            //'scriptData'     : $("#userInfoForm").serialize(),
    //            'fileDataName' : 'uploads',
    //        'folder':'upload/file/tmp',
            'fileDesc':'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
            'fileExt':'*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
            onComplete:function (event, queueID, fileObj, response, data) {
                uploading = false;
                uploaded = true;
                $("#secondStepFileWarn").html(rightDiv+uploaded__msg);
                var jsonRep = $.parseJSON(response);
    //            var real_path = fileObj.filePath.replace(fileObj.name,jsonRep.genFileName);
    //            $("#secondStepFile_browse").attr("src",real_path);
                document.getElementById('idCardUrl').value = jsonRep.genFileName;
                $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
            },
            onError:function (event, queueID, fileObj) {
                $("#secondStepFileWarn").html("file:" + fileObj.name + "upload failed");
            },
            onCancel:function (event, queueID, fileObj) {
                $("#secondStepFileWarn").html("cancel " + fileObj.name);
            },
            onUploadStart:function (event, queueID, fileObj) {
                uploading = true;
                $("#secondStepFileWarn").html(warnDiv+uploading__msg);
            }
        });
        $("#secondStepName").focus(function() {
            $("#secondStepNameWarn").html("");
        });
        $("#birday").focus(function() {
            $("#secondStepBirthdayWarn").html("");
        });
        $("#secondStepName").blur(function() {
            checkPrincipalName();
        });
        $("#birday").blur(function(){
            checkBirthday();
        });
        $("#secondStepID").blur(function() {
            checkID();
        });
        $("#secondStepID").focus(function() {
            $("#secondStepIDWarn").html("");
        });
        $("#secondStepName").blur(function() {
            checkPrincipalName();
        });
        $("#secondStepContact").blur(function() {
            checkContact();
        });
        $("#secondStepContact").focus(function() {
            $("#secondStepContactWarn").html("");
        });
    });

    function submitSecondStepForm(){
        if(checkPrincipalName() && checkOrgName()){
              $("#responserForm").submit();
        }

    }
    function checkPrincipalName() {
        if ($("#secondStepName").val() == "") {
            $("#secondStepNameWarn").html(errorDiv+name_blank_msg);
            return false;
        }else if($("#secondStepName").val().length>30){
            $("#secondStepNameWarn").html(errorDiv+name_length_msg);
            return false;
        }
        $("#secondStepNameWarn").html(rightDiv);
        return true;
    }
    function checkBirthday() {
        if ($("#birday").val() == "") {
            $("#secondStepBirthdayWarn").html(errorDiv+birth_blank_msg);
            return false;
        }
        $("#secondStepBirthdayWarn").html(rightDiv);
        return true;
    }
    function checkContact() {
        var reContact = /^(1[3,4,5,8,7]{1}[\d]{9})|(((400)-(\d{3})-(\d{4}))|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{3,7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)$/;
        var content = $("#secondStepContact").val();
        var contactContent = content.replace(/(^\s*)|(\s*$)/g, "");
        if (contactContent == "") {
            $("#secondStepContactWarn").html(errorDiv+contact_blank_msg);
            return false;
        }else if (!reContact.test(contactContent)) {
            $("#secondStepContactWarn").html(errorDiv+contact_form_msg);
            return false;
        }
        $("#secondStepContactWarn").html(rightDiv);
        return true;
    }
    function checkID() {
        /* var iSum = 0
         var info = ""
         var sId = $("#secondStepID").attr('value');
         if ($("#secondStepID").val() == "") {
         $("#secondStepIDWarn").text("身份证不能为空");
         return false;
         }
         //        if (!/^d{17}(d|x)$/i.test(sId))return false;
         sId = sId.replace(/x$/i, "a");
         if (aCity[parseInt(sId.substr(0, 2))] == null){
         $("#secondStepIDWarn").text("非法地区");
         return false;
         };
         sBirthday = sId.substr(6, 4) + "-" + Number(sId.substr(10, 2)) + "-" + Number(sId.substr(12, 2));
         var d = new Date(sBirthday.replace( /-/g, "/"))
         if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate())){
         $("#secondStepIDWarn").text("非法生日");
         return false;
         };
         for (var i = 17; i >= 0; i --) iSum += (Math.pow(2, i) % 11) * parseInt(sId.charAt(17 - i), 11)
         if (iSum % 11 != 1){
         $("#secondStepIDWarn").text("非法证件");
         return false;
         };
         return true;*/
        if ($("#secondStepID").attr("value") == null)return true;
        $("#secondStepIDWarn").text("");
        if ($("#secondStepID").attr("value") == "") {
            $("#secondStepIDWarn").html(errorDiv+id_blank_msg);
            return false;
        } else {
            var pattern = /^[1-9][0-9]{5}(19[0-9]{2}|200[0-9]|2010)(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])[0-9]{3}[0-9xX]$/;
            var cardID = $("#secondStepID").attr("value");
            if (!pattern.test(cardID)) {
                $("#secondStepIDWarn").html(errorDiv+id_form_msg);
                return false;
            }
        }
        $("#secondStepIDWarn").html(rightDiv);
        return true;
    }
    function checkSecondStepForm(){
        var flag1 = checkPrincipalName();
        var flag2 = checkBirthday();
        var flag3 = checkID();
        var flag4 = checkContact();
        if(!uploaded){
            $("#secondStepFileWarn").html(errorDiv+upload_idCard_msg);
        }else if(uploading){
           $("#secondStepFileWarn").html(errorDiv+uploading__msg);
        }
        return flag1&&flag2&&flag3&&flag4&&uploaded;
    }


    //third step form checking
    $(document).ready(function () {
        $("#fileupload1").uploadify({
            /*注意前面需要书写path的代码*/
            'uploader':'js/uploadify/uploadify.swf',
            'script':'utils/uploadFile.html',
            'cancelImg':'js/uploadify//cancel.png',
            'queueID':'fileQueue', //和存放队列的DIV的id一致
            'fileDataName':'fileupload', //和以下input的name属性一致
            'auto':true, //是否自动开始
            'multi':false, //是否支持多文件上传
            'buttonText':words_on_uploadButton, //按钮上的文字
            'simUploadLimit':1, //一次同步上传的文件数目
            'sizeLimit':2000000, //设置单个文件大小限制
            'queueSizeLimit':1, //队列中同时存在的文件个数限制
    //'scriptData'     : $("#userInfoForm").serialize(),
    //            'fileDataName' : 'uploads',
            'fileDesc':'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
            'fileExt':'*.jpg;*.gif;*.jpeg;*.png;*.bmp', //允许的格式
            onComplete:function (event, queueID, fileObj, response, data) {
                uploading1 = false;
                uploaded1 = true;
                $(".file_upload_msg1").html(rightDiv+uploaded__msg);
                var jsonRep = $.parseJSON(response)
                document.getElementById('hidFile1').value = jsonRep.genFileName;
                $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
            },
            onError:function (event, queueID, fileObj) {
                alert("file:" + fileObj.name + "upload failed");
            },
            onCancel:function (event, queueID, fileObj) {
                alert("cancel " + fileObj.name);
            },
            onUploadStart:function (event, queueID, fileObj) {
                uploading1 = true;
                $(".file_upload_msg1").html(warnDiv+uploading__msg);
            }
        });
        $("#fileupload2").uploadify({
            /*注意前面需要书写path的代码*/
            'uploader':'js/uploadify/uploadify.swf',
            'script':'utils/uploadFile.html',
            'cancelImg':'js/uploadify//cancel.png',
            'queueID':'fileQueue', //和存放队列的DIV的id一致
            'fileDataName':'fileupload', //和以下input的name属性一致
            'auto':true, //是否自动开始
            'multi':false, //是否支持多文件上传
            'buttonText':words_on_uploadButton, //按钮上的文字
            'simUploadLimit':1, //一次同步上传的文件数目
            'sizeLimit':2000000, //设置单个文件大小限制
            'queueSizeLimit':1, //队列中同时存在的文件个数限制
    //'scriptData'     : $("#userInfoForm").serialize(),
    //            'fileDataName' : 'uploads',
            'fileDesc':'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
            'fileExt':'*.jpg;*.gif;*.jpeg;*.png;*.bmp', //允许的格式
            onComplete:function (event, queueID, fileObj, response, data) {
                uploading2 = false;
                uploaded2 = true;
                $(".file_upload_msg2").html(rightDiv+uploaded__msg);
                var jsonRep = $.parseJSON(response)
                document.getElementById('hidFile2').value = jsonRep.genFileName;
                $('<li></li>').appendTo('.files').text(jsonRep.genFileName);
            },
            onError:function (event, queueID, fileObj) {
                $(".file_upload_msg2")("file:" + fileObj.name + "upload failed");
            },
            onCancel:function (event, queueID, fileObj) {
                $(".file_upload_msg2")("cancel " + fileObj.name);
            },
            onUploadStart:function (event, queueID, fileObj) {
                uploading2 = true;
                $(".file_upload_msg2").html(warnDiv+uploading__msg);
            }
        });
        $("#thirdStepName").blur(function() {
            checkOrgName();
        });
        $("#thirdStepName").focus(function() {
            orgNameNotExisted = false;
            $("#orgNameWarn").text("");
        });
        $("#thirdStepOrgShuoming").blur(function() {
            checkOrgShuoming();
        });
        $("#thirdStepOrgShuoming").focus(function() {
            $("#orgShuomingWarn").text("");
        });
        $("#thirdStepAccount").blur(function() {
            checkAccountName();
        });
        $("#thirdStepAccount").focus(function() {
            $("#accountNameWarn").text("");
        });
        $("#thirdStepAccountNo").blur(function() {
            checkAccountNo();
        });
        $("#thirdStepAccountNo").focus(function() {
            $("#accountNoWarn").text("");
        });
        $("#thirdStepOfficerName").blur(function() {
            checkOfficerName();
        });
        $("#thirdStepOfficerName").focus(function() {
            $("#thirdStepOfficerNameWarn").text("");
        });
        $("#thirdStepfixedTel").blur(function() {
            checkFixedTel();
        });
        $("#thirdStepfixedTel").focus(function() {
            $("#thirdStepfixedTelWarn").text("");
        });
        $("#thirdStepMobile").blur(function() {
            checkMobile();
        });
        $("#thirdStepMobile").focus(function() {
            $("#thirdStepMobileWarn").text("");
        });
        $("#thirdStepAddress").blur(function() {
            checkAddress();
        });
        $("#thirdStepAddress").focus(function() {
            $("#thirdStepAddressWarn").text("");
        });
        $("#thirdStepPostCode").blur(function() {
            checkPostCode();
        });
        $("#thirdStepPostCode").focus(function() {
            $("#thirdStepPostCodeWarn").text("");
        });
        $(".thirdStepNext").click(function(){
            if(checkThirdStepForm())
                $("#orgForm").submit();
        });
    });
    function checkOrgName() {
        if ($("#thirdStepName").val() == "") {
            $("#orgNameWarn").html(errorDiv+orgName_blank_msg);
            return false;
        }else if($("#thirdStepName").val().length > 30)  {
            $("#orgNameWarn").html(errorDiv+orgName_length_msg);
            return false;
        }
        return true;
    }
    function checkOrgShuoming() {
        if ($("#thirdStepOrgShuoming").val() == "") {
            $("#orgShuomingWarn").html(errorDiv+content_blank_msg);
            return false;
        }

        if ($("#thirdStepOrgShuoming").val().length > 200) {
            $("#orgShuomingWarn").html(errorDiv+content_length_msg);
            return false;
        }
        $("#orgShuomingWarn").html(rightDiv);
        return true;
    }
    function checkAccountName() {
        if ($("#thirdStepAccount").val() == "") {
            $("#accountNameWarn").html(errorDiv+accountName_blank_msg);
            return false;
        }
        $("#accountNameWarn").html(rightDiv);
        return true;
    }
    function checkAccountNo() {
        if ($("#thirdStepAccountNo").val() == "") {
            $("#accountNoWarn").html(errorDiv+accountNo_blank_msg);
            return false;
        }

        var reNo = /^[0-9]+$/;
        var NoContent = $("#thirdStepAccountNo").attr('value');

        if(!reNo.test(NoContent)){
            $("#accountNoWarn").html(errorDiv+accountNo_form_msg);
            return false;
        }
        $("#accountNoWarn").html(rightDiv);
        return true;
    }
    function checkOfficerName() {
        if ($("#thirdStepOfficerName").val() == "") {
            $("#thirdStepOfficerNameWarn").html(errorDiv+name_blank_msg);
            return false;
        }

        if ($("#thirdStepOfficerName").val().length > 30) {
            $("#thirdStepOfficerNameWarn").html(errorDiv+name_length_msg);
            return false;
        }
        $("#thirdStepOfficerNameWarn").html(rightDiv);
        return true;
    }
    function checkFixedTel() {
        if ($("#thirdStepfixedTel").val() == "") {
            $("#thirdStepfixedTelWarn").html(errorDiv+fixedTel_blank_msg);
            return false;
        }

        var reNo = /\d{3}-\d{8}|\d{4}-\d{7}/;
        var NoContent = $("#thirdStepfixedTel").attr('value');

        if (!reNo.test(NoContent)) {
            $("#thirdStepfixedTelWarn").html(errorDiv+mobile_form_msg);
            return false;
        }
        $("#thirdStepfixedTelWarn").html(rightDiv);
        return true;
    }
    function checkMobile() {
        if ($("#thirdStepMobile").val() == "") {
            $("#thirdStepMobileWarn").html(errorDiv+mobile_blank_msg);
            return false;
        }

        var reNo = /^0{0,1}(13[0-9]|15[0-9])[0-9]{8}$/ ;
        var NoContent = $("#thirdStepMobile").attr('value');

        if (!reNo.test(NoContent)) {
            $("#thirdStepMobileWarn").html(errorDiv+mobile_form_msg);
            return false;
        }
        $("#thirdStepMobileWarn").html(rightDiv);
        return true;
    }
    function checkAddress() {
        if ($("#thirdStepAddress").val() == "") {
            $("#thirdStepAddressWarn").html(errorDiv+address_blank_msg);
            return false;
        }
        $("#thirdStepAddressWarn").html(rightDiv);
        return true;
    }
    function checkPostCode() {
        if ($("#thirdStepPostCode").val() == "") {
            $("#thirdStepPostCodeWarn").html(errorDiv+postCode_blank_msg);
            return false;
        }

        var reNo = /[1-9]{1}(\d+){5}/
        var NoContent = $("#thirdStepPostCode").attr('value');

        if (!reNo.test(NoContent)) {
            $("#thirdStepPostCodeWarn").html(errorDiv+postCode_form_msg);
            return false;
        }
        $("#thirdStepPostCodeWarn").html(rightDiv);
        return true;
    }
    function checkThirdStepForm() {
        checkOrgName();
        var b1 = checkAccountName();
        var b2 = checkAccountNo();
        var b3 = checkAddress();
        var b4 = checkPostCode();
        var b5 = checkFixedTel();
        var b6 = checkMobile();
        var b8 = checkOfficerName();
        var b9 = checkOrgShuoming();
        if(uploading1) $(".file_upload_msg1").html(errorDiv+uploading__msg);
        else if(!uploaded1)  $(".file_upload_msg1").html(errorDiv+upload_orgLogo_msg);
        if(uploading2) $(".file_upload_msg2").html(errorDiv+uploading__msg);
        else if(!uploaded2)   $(".file_upload_msg2").html(errorDiv+upload_certificate_msg);
        return b1&&b2&&b3&&b4&&b5&&b6&&orgNameNotExisted&&b8&&b9&&uploaded1&&uploaded2;
    }
</script>