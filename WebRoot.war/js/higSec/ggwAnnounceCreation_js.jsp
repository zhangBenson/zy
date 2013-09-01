<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<script type="text/javascript">
    var warn_div = "<div class='tip_warn'></div>";
    var error_div = "<div class='tip_error'></div>";
    var right_div = "<div class='tip_right'></div>";
    var showNameEmpty = "公告名称不能为空";
    var showDespEmpty = "公告内容不能为空";

    var showLogoEmpty = "请上公告图片";
    var showLogoUploadSuccess = "上传成功";
    var words_on_uploadButton = "Browse";

    $(document).ready(function() {

        $("#show_showName").blur(checkShowName);
        $("#show_showName").focus(function(){
            $(".show_name_input_msg").html("");
        });
        $("#show_showName").keyup(function(){
            changeWordNumber(this, $(".show_name_input_msg"), 50);
        });

        $("#show_showDesp").blur(checkShowDescription);
        $("#show_showDesp").focus(function(){
            $(".show_desp_input_msg").html("");
        });
        $("#show_showDesp").keyup(function(){
            changeWordNumber(this, $(".show_desp_input_msg"), 15000)
        });

        $("#show_showLogo_upload").uploadify({
            /*注意前面需要书写path的代码*/
            'uploader':'js/uploadify/uploadify.swf',
            'script':'utils/uploadFile.html',
            'cancelImg':'js/uploadify/cancel.png',
            'queueID':'fileQueue1', //和存放队列的DIV的id一致
            'fileDataName':'fileupload', //和以下input的name属性一致
            'auto':true, //是否自动开始
            'multi':false, //是否支持多文件上传
            'buttonText':words_on_uploadButton, //按钮上的文字
            'simUploadLimit':1, //一次同步上传的文件数目
            'sizeLimit':2000000, //设置单个文件大小限制
            'queueSizeLimit':1, //队列中同时存在的文件个数限制
            //'scriptData'     : $("#userInfoForm").serialize(),
//            'fileDataName' : 'uploads',
            'folder':'upload/file/tmp',
            'fileDesc':'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
            'fileExt':'*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
            onComplete:function (event, queueID, fileObj, response, data) {
                var jsonRep = $.parseJSON(response);
                var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
                document.getElementById('show_showLogo').value = jsonRep.genFileName;
                $("#show_log_preview").attr("src", real_path);
                $(".show_logo_input_msg").html(right_div + showLogoUploadSuccess);
            },
            onError:function (event, queueID, fileObj) {
                $(".show_logo_input_msg").html("file:" + fileObj.name + "upload failed");
            },
            onCancel:function (event, queueID, fileObj) {
                $(".show_logo_input_msg").html("cancel " + fileObj.name);
            },
            onUploadStart:function (event, queueID, fileObj) {
                $(".show_logo_input_msg").html(warn_div + "开始上传");
            }
        });

        $("#show_showLogo").blur(checkShowLogo);
        $("#show_showLogo").focus(function(){
            $(".show_logo_input_msg").html("");
        });


    });

    function checkShowName(){
        var showName = $("#show_showName").val().replace(/(^\s*)|(\s*$)/g, "");
        if(showName.length==0){
           $(".show_name_input_msg").html(error_div+showNameEmpty);
           return false;
        }else{
           $(".show_name_input_msg").html(right_div);
           return true;
        }
    }

    function checkShowDescription(){
        var showDesp = $("#show_showDesp").val().replace(/(^\s*)|(\s*$)/g, "");
        if(showDesp.length==0){
           $(".show_desp_input_msg").html(error_div+showDespEmpty);
           return false;
        }else{
           $(".show_desp_input_msg").html(right_div);
           return true;
        }
    }



    function checkShowLogo(){
        var showLogo = $("#show_showLogo").val().replace(/(^\s*)|(\s*$)/g, "");
        if(showLogo.length==0){
           $(".show_logo_input_msg").html(error_div+showLogoEmpty);
           return false;
        }else{
            $(".show_logo_input_msg").html(right_div + showLogoUploadSuccess);
            return true;
        }
    }

    function checkShowInfoForm(){
        var b1 = checkShowName();
        var b2 = checkShowDescription();
        return b1&&b2;
    }

</script>