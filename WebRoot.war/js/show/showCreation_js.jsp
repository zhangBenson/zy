<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<script type="text/javascript">
    var warn_div = "<div class='tip_warn'></div>";
    var error_div = "<div class='tip_error'></div>";
    var right_div = "<div class='tip_right'></div>";
    var showNameEmpty = "个人秀名称不能为空";
    var showDespEmpty = "个人秀说明不能为空";
    var showDateEmpty = "开始日期不能为空";
    var showDateWrong = "开始日期不能早于当前日期";
    var showStartTimeEmpty = "开始时间不能为空";
    var showFixedModelEmpty = "请选择一天";
    var showLogoEmpty = "请上传您的个人秀Logo";
    var showLogoUploadSuccess = "个人秀Logo上传成功";
    var words_on_uploadButton = "Browse";

    $(document).ready(function () {

        $("#show_showName").blur(checkShowName);
        $("#show_showName").focus(function () {
            $(".show_name_input_msg").html("");
        });
        $("#show_showName").keyup(function () {
            changeWordNumber(this, $(".show_name_input_msg"), 50);
        });

        $("#show_showDesp").blur(checkShowDescription);
        $("#show_showDesp").focus(function () {
            $(".show_desp_input_msg").html("");
        });
        $("#show_showDesp").keyup(function () {
            changeWordNumber(this, $(".show_desp_input_msg"), 250)
        });

        $("#show_showDate").blur(checkShowDate);
        $("#show_showDate").focus(function () {
            $(".show_date_input_msg").html("");
        });

        $("#show_startTime").blur(checkShowStartTime);
        $("#show_startTime").focus(function () {
            $(".show_startTime_input_msg").html("");
        });

        $("#show_showLogo_upload").uploadify({
            /*注意前面需要书写path的代码*/
            'uploader': 'js/uploadify/uploadify.swf',
            'script': 'utils/uploadFile.html',
            'cancelImg': 'js/uploadify/cancel.png',
            'queueID': 'fileQueue1', //和存放队列的DIV的id一致
            'fileDataName': 'fileupload', //和以下input的name属性一致
            'auto': true, //是否自动开始
            'multi': false, //是否支持多文件上传
            'buttonText': words_on_uploadButton, //按钮上的文字
            'simUploadLimit': 1, //一次同步上传的文件数目
            'sizeLimit': 2000000, //设置单个文件大小限制
            'queueSizeLimit': 1, //队列中同时存在的文件个数限制
            //'scriptData'     : $("#userInfoForm").serialize(),
//            'fileDataName' : 'uploads',
            'folder': 'upload/file/tmp',
            'fileDesc': 'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
            'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
            onComplete: function (event, queueID, fileObj, response, data) {
                var jsonRep = $.parseJSON(response);
                var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
                document.getElementById('show_showLogo').value = jsonRep.genFileName;
                $("#show_log_preview").attr("src", real_path);
                $(".show_logo_input_msg").html(right_div + showLogoUploadSuccess);
            },
            onError: function (event, queueID, fileObj) {
                $(".show_logo_input_msg").html("file:" + fileObj.name + "upload failed");
            },
            onCancel: function (event, queueID, fileObj) {
                $(".show_logo_input_msg").html("cancel " + fileObj.name);
            },
            onUploadStart: function (event, queueID, fileObj) {
                $(".show_logo_input_msg").html(warn_div + "开始上传");
            }
        });

        $("#show_showLogo").blur(checkShowLogo);
        $("#show_showLogo").focus(function () {
            $(".show_logo_input_msg").html("");
        });


    });

    function checkShowName() {
        var showName = $("#show_showName").val().replace(/(^\s*)|(\s*$)/g, "");
        if (showName.length == 0) {
            $(".show_name_input_msg").html(error_div + showNameEmpty);
            return false;
        } else {
            $(".show_name_input_msg").html(right_div);
            return true;
        }
    }

    function checkShowDescription() {
        var showDesp = $("#show_showDesp").val().replace(/(^\s*)|(\s*$)/g, "");
        if (showDesp.length == 0) {
            $(".show_desp_input_msg").html(error_div + showDespEmpty);
            return false;
        } else {
            $(".show_desp_input_msg").html(right_div);
            return true;
        }
    }

    function checkShowDate() {
        var showDate = $("#show_showDate").val().replace(/(^\s*)|(\s*$)/g, "");
        var currentTime = new Date(showDate.replace(/-/g, '/'));
        var nowTime = new Date();
        if (showDate.length == 0) {
            $(".show_date_input_msg").html(error_div + showDateEmpty);
            return false;
        } else if (nowTime > currentTime) {
            $(".show_date_input_msg").html(error_div + showDateWrong);
            return false;
        } else {
            $(".show_date_input_msg").html(right_div);
            return true;
        }
    }

    function checkShowStartTime() {
        var showStartTime = $("#show_startTime").val().replace(/(^\s*)|(\s*$)/g, "");
        if (showStartTime.length == 0) {
            $(".show_startTime_input_msg").html(error_div + showStartTimeEmpty);
            return false;
        } else {
            $(".show_startTime_input_msg").html(right_div);
            return true;
        }
    }

    function checkShowFixedModel() {
        var showWeekDays = $("input[name='showWeekDays']:checked");
        if (showWeekDays.length == 0) {
            $(".show_fixedModel_input_msg").html(error_div + showFixedModelEmpty);
            return false;
        }
        $(".show_fixedModel_input_msg").html(right_div);
        return true;
    }

    function checkShowLogo() {
        var showLogo = $("#show_showLogo").val().replace(/(^\s*)|(\s*$)/g, "");
        if (showLogo.length == 0) {
            $(".show_logo_input_msg").html(error_div + showLogoEmpty);
            return false;
        } else {
            $(".show_logo_input_msg").html(right_div + showLogoUploadSuccess);
            return true;
        }
    }

    function checkShowInfoForm() {
        var b1 = checkShowName();
        var b2 = checkShowDescription();
        var b3 = checkShowDate();
        var b4 = checkShowStartTime();
        var b5 = checkShowFixedModel();
        var b6 = checkShowLogo();
        return b1 && b2 && b3 && b4 && b5 && b6;
    }


    function dateComparator(Obj) {     //the current time  bigger than startTime which without H:m:s  return true
        var startTime = new Date($(Obj).val().replace(/-/g, "/"));
        var currTime = new Date();
        if (startTime.getYear() < currTime.getYear() || startTime.getYear() == currTime.getYear() && startTime.getMonth() < currTime.getMonth() ||
                startTime.getYear() == currTime.getYear() && startTime.getMonth() == currTime.getMonth() && startTime.getDate() < currTime.getDate()) {
            return false;
        }
        return true
    }
</script>