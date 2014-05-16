<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type='text/javascript' src='js/wokaobox/wokaobox.min.js'></script>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
<script type="text/javascript">
var warn_div = "<div class='tip_warn'></div>";
var error_div = "<div class='tip_error'></div>";
var right_div = "<div class='tip_right'></div>";
var rule = "<s:text name='rule'/>";
var acceptRuleFirst = "<s:text name='course.creation.document.accept.rule.first'/>";

$(document).ready(function () {
    $("#course_creation_clause").fancybox({
        "type": "iframe",
        "width": 630
    });

    $(".content_style li").click(function () {
        if (!$(this).hasClass("checked_li")) {
            $(this).addClass("checked_li");
            $(this).siblings("li").removeClass("checked_li");
            $(this).children("input").attr("checked", "checked");
            $(this).siblings("li").children("input").removeAttr("checked");
        }
        if ($(this).children("input").attr("value") != 5) {
            $("#form1").attr('action', "initSaveCourse.html");
        } else {
            $("#form1").attr('action', "myAgeCourses.html");
        }
    });
});
function yszCheck() {
    $("#checkboxMsg").text('');
    if (!$("#checkbox").is(':checked')) {
        $("#checkboxMsg").text(acceptRuleFirst);
        return false;
    }
    return true;
}

function goback2step1() {
    window.location.href = "goback2firstStep.html?course.id=<s:property value="course.id"/>&courseType=<s:property value="courseType"/>";
}
function modifygoback2step2() {
    window.location.href = "initCourseInfoModify.html?course.id=<s:property value="course.id"/>&courseType=<s:property value="courseType"/>";
}
function goback2step2() {
    window.location.href = "goback2saveCourse.html?course.id=<s:property value="course.id"/>&courseType=<s:property value="courseType"/>";
}
function goback2step3() {
    window.location.href = "goback2saveClass.html?course.id=<s:property value="course.id"/>&courseType=<s:property value="courseType"/>";
}

var count = 1;
<s:if test="identity!=null">
var maxStudentCount =<s:property value="identity"/>;
</s:if>
<s:elseif test="course != null">
var maxStudentCount =<s:property value="course.teachingNum"/>;
</s:elseif>
<s:else>
var maxStudentCount = 0;
</s:else>
var exist_words_number = 0;

var warn_course_name_empty = error_div + "<s:text name='course.name'/>";
var warn_course_intro_empty = error_div + "<s:text name='course.description'/>";
var warn_course_date_empty = error_div + "<s:text name='course.startdate'/>";
var warn_email_empty = error_div + "<s:text name='interview.email.invalid'/>";
var warn_email_format_wrong = error_div + "<s:text name='interview.time.invalid1'/>";
var warn_email_can_not_be_yourself = error_div + "<s:text name='course.email.input.myself'/>";
var warn_email_teacher_student_same = error_div + "<s:text name='course.teacher.student.email.same.error'/>";
var warn_start_time_error = error_div + "<s:text name='msg.course.startdate.error'/>";
var warn_student_number_overflow = error_div + "<s:text name="invite.student.number"/>" + maxStudentCount;
var warn_class_startTime_litter_than_course_time = error_div + "<s:text name="msg.courseclass.date.error"/>";
var warn_choose_correct_course_type = error_div + "<s:text name="choose.correct.course.type"/>";
var warn_upload = error_div + "<s:text name="upload"/>";
var deleteEmail = "<s:text name='course.class.delete'/>";
var oneClass = "<s:text name='course.classes.more.than.one'/>";
var words_on_uploadButton = "Browse";
var showLogoUploadSuccess = "上传成功";
//js of step2
$(document).ready(function () {

    $("#course_logo_upload").uploadify({
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
        'folder': 'upload/file/tmp',
        'fileDesc': 'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
        'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
        onComplete: function (event, queueID, fileObj, response, data) {
            var jsonRep = $.parseJSON(response);
            var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
            document.getElementById('course_logo').value = jsonRep.genFileName;
            $("#show_log_preview").attr("src", real_path);
            $("#course_logo_input_msg").html(right_div + showLogoUploadSuccess);
        },
        onError: function (event, queueID, fileObj) {
            $("#course_logo_input_msg").html("file:" + fileObj.name + "upload failed");
        },
        onCancel: function (event, queueID, fileObj) {
            $("#course_logo_input_msg").html("cancel " + fileObj.name);
        },
        onUploadStart: function (event, queueID, fileObj) {
            $("#course_logo_input_msg").html(warn_div + "开始上传");
        }
    });

    $("#step2_course_name").blur(function () {
        var course_name = $(this).val().replace(/(^\s*)|(\s*$)/g, "");
        if (course_name.length == 0)
            $(".course_name_input_msg").html(warn_course_name_empty);
        else {
            $(this).attr('value', course_name);
            $(".course_name_input_msg").html(right_div);
        }
    });
    $("#step2_course_name").focus(function () {
        $(".course_name_input_msg").html(getStrLength($(this).val()) + "/" + 40);
    });
    $("#step2_course_name").keyup(function () {
        changeWordNumber(this, $(".course_name_input_msg"), 40);
    });
    $("#step2_course_intro").blur(function () {
        var course_intro = $(this).val().replace(/(^\s*)|(\s*$)/g, "");
        if (course_intro.length == 0)
            $(".course_intro_input_msg").html(warn_course_intro_empty);
        else {
            $(this).attr('value', course_intro);
            $(".course_intro_input_msg").html(right_div);
        }
    });
    $("#step2_course_intro").focus(function () {
        $(".course_intro_input_msg").html(getStrLength($(this).val()) + "/" + 2000);
    });
    $("#step2_course_intro").keyup(function () {
        changeWordNumber(this, $(".course_intro_input_msg"), 2000);
    });
    $("#step2_course_type").change(function () {
        if ($("#step2_course_type").val() == -1) {
            $(".course_type_input_msg").html(warn_choose_correct_course_type);
            return false;
        } else {
            $(".course_type_input_msg").html(right_div);
        }
    });

    $("#courseStartDate").blur(function () {
        $(".course_date_input_msg").html("");
        if ($(this).val() == "") {
            $(".course_date_input_msg").html(warn_course_date_empty);
        } else if (!dateComparator(this)) {
            $(".course_date_input_msg").html(warn_start_time_error);
        } else {
            $(".course_date_input_msg").html(right_div);
        }

    });
    $(".add_student_btn").click(function () {
//        if (maxStudentCount < 4 && count >= maxStudentCount) {
//            $(".invite_student_input_msg").html(warn_student_number_overflow);
//            return;
//        }
        $("#invitedStudents").append("<input class='long_text_field_for_student' onblur='checkStudentMail(this);' name='emails' type='text' /><span class='del_student_btn' onclick='remove_student(this);'>" + deleteEmail + "</span>");
        count++;
    });

    $("#add_student_btn_for_course_repeat").click(function () {
        $("#invitedStudents").append("<input class='long_text_field_for_student' onblur='checkRepeatStudentMail(this);' name='emails' type='text' /><span class='del_student_btn' onclick='remove_student(this);'><s:text name="course.class.delete"/></span>");
    });

    $(".del_student_btn").click(function () {
        $(".invite_student_input_msg").html("");
        $(this).prev().remove();
        $(this).remove();
    });

    $("#course_logo_btn").fancybox({
        'width': 695,
        'height': 480,
        'type': 'iframe',
        'href': 'userPortraitCrop.html'
    });
});


function dateComparator(Obj) {     //the current time  bigger than startTime which without H:m:s  return true
    var startTime = new Date($(Obj).val().replace(/-/g, "/"));
    var currTime = new Date();
    if (startTime.getYear() < currTime.getYear() || startTime.getYear() == currTime.getYear() && startTime.getMonth() < currTime.getMonth() ||
            startTime.getYear() == currTime.getYear() && startTime.getMonth() == currTime.getMonth() && startTime.getDate() < currTime.getDate()) {
        return false;
    }
    return true
}
function remove_student(del_btn) {
    $(".invite_student_input_msg").html("");
    $(del_btn).prev().remove();
    $(del_btn).remove();
    count--;
}
function checkStudentMail(obj) {
    $(".invite_student_input_msg").html("");
    var email = $(obj).val();
    var emailContent = email.replace(/(^\s*)|(\s*$)/g, "");
    var mySessionEmail = "<s:property value="#session.email"/>";
    var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
    if (emailContent.length != 0) {
        if (!pattern.test(emailContent)) {
            $(".invite_student_input_msg").html(warn_email_format_wrong);
            return false;
        }
        <s:if test="courseType != 1 && courseType != 2">         //if the course is a personal internet course
        if (emailContent == mySessionEmail) {
            $(".invite_student_input_msg").html(warn_email_can_not_be_yourself);
            return false;
        }
        </s:if>
        <s:else>
        var teacherEmail = $("#course_teacherEmail").val().replace(/(^\s*)|(\s*$)/g, "");
        if (emailContent == teacherEmail) {
            $(".invite_student_input_msg").html(warn_email_teacher_student_same);
            return false;
        }
        </s:else>
        $(obj).attr('value', emailContent);
        $(".invite_student_input_msg").html(right_div);
        return true;
    }
    return true;
}
function checkStudentEmails() {
    var flag = true;
    var emails = $(".long_text_field_for_student");
    for (var i = 0; i < emails.length; i++) {
        flag = flag && checkStudentMail(emails[i]);
    }
    return flag;
}
function checkTeacherMail(obj) {
    var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
    var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
    if (email.length == 0) {
        $(".invite_teacher_input_msg").html(warn_email_empty);
        return false;
    } else if (email.length != 0) {
        if (!pattern.test(email)) {
            $(".invite_teacher_input_msg").html(warn_email_format_wrong);
            return false;
        } else {
            $(obj).attr('value', email);
            $(".invite_teacher_input_msg").html(right_div);
            return true;
        }
    }
}

function yzSaveCourseForm() {
    var b1 = true, b2 = true, b3 = true, b4 = true, b5 = true, b6 = true, b7 = true, b8 = true, b9 = true;
    if ($("#step2_course_name").val().replace(/(^\s*)|(\s*$)/g, "").length == 0) {
        $(".course_name_input_msg").html(warn_course_name_empty);
        b1 = false;
    } else b1 = true;
    if ($("#step2_course_intro").val().replace(/(^\s*)|(\s*$)/g, "").length == 0) {
        $(".course_intro_input_msg").html(warn_course_intro_empty);
        b2 = false;
    } else b2 = true;

    if ($("#step2_course_type").val() == -1) {
        $(".course_type_input_msg").html(warn_choose_correct_course_type);
        b3 = false;
    } else {
        $(".course_type_input_msg").html(right_div);
        b3 = true;
    }

    if ($("#courseStartDate").val().length == 0) {
        $(".course_date_input_msg").html(warn_course_date_empty);
        b4 = false;
    } else if (!dateComparator("#courseStartDate")) {
        $(".course_date_input_msg").html(warn_start_time_error);
        b4 = false;
    } else b4 = true;

    if ($("#course_logo").val().length == 0) {
        $("#course_logo_input_msg").html(warn_upload);
        b5 = false;
    } else b5 = true;
    <s:if test="courseType == 1 || courseType == 2">
    if (!checkTeacherMail($("#course_teacherEmail"))) b6 = false;
    else b7 = true;
    </s:if>
    if (!checkStudentEmails()) b7 = false;
    else b7 = true;

    var result = b1 && b2 && b3 && b4 && b5 && b6 && b7;

    return result;
}


//js of step3
var warn_class_name_empty = error_div + "课堂名不能为空";
var warn_class_nickname_empty = error_div + "<s:text name='message.class.content.empty'/>";
var warn_start_time_empty = error_div + "<s:text name='course.start.time.of.class'/>";
var editClass = "<s:text name='course.class.edit'/>";
var saveClass = "<s:text name='course.class.save'/>";
var minute = "<s:text name='label.minute'/>"
$(document).ready(function () {
    $(".system_ul_list li").click(function () {
        $(this).removeClass("wait");
        $(this).siblings("li").addClass("wait");

        if ($(this).attr("id") == "self_click_li") {
            $("#self_show_ul").show();
            $("#auto_show_ul").hide();
        } else {
            $("#self_show_ul").hide();
            $("#auto_show_ul").show();
        }
    });
    $("#class_name_input").blur(function () {
        var className = $(this).val();
        if (className.length == 0) {
            $("#class_name_msg").html(warn_class_name_empty);
        } else {
            $("#class_name_msg").html(right_div);
        }
    });
    $("#class_name_input").focus(function () {
        $("#class_name_msg").html($(this).val().length + "/" + 30);
    });
    $("#class_name_input").keyup(function () {
        changeWordNumber(this, $("#class_name_msg"), 30);
    });
    $("#class_nickname_input").blur(function () {
        var className = $(this).val();
        if (className.length == 0) {
            $("#class_nickname_msg").html(warn_class_nickname_empty);
        } else {
            $("#class_nickname_msg").html(right_div);
        }
    });
    $("#class_nickname_input").focus(function () {
        $("#class_nickname_msg").html($(this).val().length + "/" + 30);
    });
    $("#class_nickname_input").keyup(function () {
        changeWordNumber(this, $("#class_nickname_msg"), 30);
    });

    $("#class_start_time_input").blur(function () {
        checkSaveClassForm1();
    });

    function checkSaveClassForm1() {
        var startTime = $("#class_start_time_input").val();
        var time123 = "<s:date name="course.startDate" format="%{getText('dateformat.forclass')}"/>";
        var courseStartTime = new Date(time123.replace(/-/g, '/'));
        var currentTime = new Date(startTime.replace(/-/g, '/'));
        if (startTime.length == 0) {
            $("#class_start_time_msg").html(warn_start_time_empty);
            return false;
        } else if (currentTime < courseStartTime) {
            $("#class_start_time_msg").html(warn_class_startTime_litter_than_course_time);
            return false;
        } else {
            $("#class_start_time_msg").html(right_div);
            return true;
        }
    }


    $("#class_start_time_input").focus(function () {
        $("#class_start_time_msg").html("");
    });
    $(".add_class_btn").click(function () {
        var cloneObj = $($("#urFirst")[0]).clone();
        var addTdObj = cloneObj.children(".add_class_btn");
        var timePicker = cloneObj.children(".time_td").children(".short_text_field");
        addTdObj.removeClass("add_class_btn");
        addTdObj.addClass("delete_class_btn");
        addTdObj.html(deleteEmail);
        $(addTdObj).attr("onclick", "deleteAddedClass(this);");
        var id = "f" + new Date().getMilliseconds() + "";
        timePicker.attr('id', id);
        $("#add_class_table").append(cloneObj);
        createTimePicker($(timePicker).attr('id'));
    });
});
function deleteAddedClass(lineId, id) {
    $.post("deleteClasses.html", {'courseClass.id': id}, function (data) {
    });
    var idx = "#" + lineId;
    $(idx).remove();
}

function editSpecifiedClass(lineId) {
    var course_nameObj = $("#course_name" + lineId);
    var course_nickNameObj = $("#course_nickName" + lineId);
    var course_dateObj = $("#course_date" + lineId);
    var course_durationObj = $("#course_duration" + lineId);

    var unit = minute;
    var timeStr = "<select name='durations'><option value=60 selected='true'>60"
            + unit + "</option><option value=55>55"
            + unit + "</option><option value=50>50"
            + unit + "</option><option value=45>45"
            + unit + "</option><option value=40>40"
            + unit + "</option><option value=35>35"
            + unit + "</option><option value=30>30"
            + unit + "<option></select>";

    if ($("#course_edit" + lineId).html() == editClass) {
        $($("#course_edit" + lineId)).html(saveClass);

        course_nameObj.html("<input value='" + course_nameObj.html() + "' readonly='true'/>");
        course_nickNameObj.html("<input  value='" + course_nickNameObj.html() + "'/>");
        course_dateObj.html("<input id='course_date_input" + lineId + "' value='" + course_dateObj.html() + "'/>");
        course_durationObj.html(timeStr);
        createDateTimePicker('course_date_input' + lineId);
    } else if ($("#course_edit" + lineId).html() == saveClass) {
        $.post("editClassInfo.html", {'courseClass.id': lineId, 'courseClass.nickName': course_nickNameObj.children("input").val(), 'courseClass.date': course_dateObj.children("input").val(), 'courseClass.duration': course_durationObj.children("select").val()}, function (data) {
        });
        $($("#course_edit" + lineId)).html(editClass);
        course_nameObj.html(course_nameObj.children("input").val());
        course_nickNameObj.html(course_nickNameObj.children("input").val());
        course_dateObj.html(course_dateObj.children("input").val());
        course_durationObj.html(course_durationObj.children("select").val());
    }
}


function checkTimeError(obj) {
    var time = $(obj).val();
    if (time.length == 0) {
        $("#form2_start_time_msg").html(warn_start_time_empty);
        return false;
    }
    $("#form2_start_time_msg").html(right_div);
    return true;
}

function checkClasses() {
    var countofClasses = 0;
    <s:iterator value="course.classes">
    countofClasses++;
    </s:iterator>
    if (countofClasses == 0) {
        $("#classesMsg").text(oneClass);
        return false;
    }
    window.location.href = "presentation.html?course.id=<s:property value="course.id"/>&courseType=<s:property value="courseType"/>";
}
function checkRepeatClasses() {
    var countofClasses = 0;
    <s:iterator value="course.classes">
    countofClasses++;
    </s:iterator>
    if (countofClasses == 0) {
        $("#classesMsg").text(oneClass);
        return false;
    }
    window.location.href = "repeatPresentation.html?course.id=<s:property value="course.id"/>&courseType=<s:property value="courseType"/>";
}
function checkModifyClasses() {
    var countofClasses = 0;
    <s:iterator value="course.classes">
    countofClasses++;
    </s:iterator>
    if (countofClasses == 0) {
        $("#classesMsg").text(oneClass);
        return false;
    }
    window.location.href = "presentation4Modify.html?course.id=<s:property value="course.id"/>&courseType=<s:property value="courseType"/>&teacherChange=<s:property value="teacherChange"/>";
}

//js of step4
var share_link_copy = "课程地址已复制到剪切板";
$(document).ready(function () {
    $("#share_link_3").click(function () {
        $.copy(document.getElementById("#share_link_2"));
        $(".share_link_4").html(share_link_copy);
    });
});
function fabu(id) {
    window.location.href = "courseGet2public.html?course.id=" + id;
}

function personalModifyFabu(id, teacherChange) {
    window.location.href = "modifyGet2public.html?course.id=" + id + "&teacherChange=" + teacherChange;
}
function goback2personalModify() {
    window.location.href = "goback2classesModify.html?course.id=<s:property value="course.id"/>";
}

function goback2repeatCourse() {
    <%--window.location.href = "myAgeCourses.html?course.id=<s:property value="course.id"/>";--%>
    window.location.href = "myAgeCourses.html";
}

function goback2repeatClass() {
    window.location.href = "goback2repeatClass.html?course.id=<s:property value="course.id"/>";
}
function checkRepeatStudentMail(obj) {
    $(".invite_student_input_msg").html("");
    var email = $(obj).val();
    var emailContent = email.replace(/(^\s*)|(\s*$)/g, "");
    var mySessionEmail = "<s:property value="#session.email"/>";
    var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
    if (emailContent.length != 0) {
        if (!pattern.test(emailContent)) {
            $(".invite_student_input_msg").html(warn_email_format_wrong);
            return false;
        }
        if (courseType == 0) {         //if the course is a personal internet course
            if (emailContent == mySessionEmail) {
                $(".invite_student_input_msg").html(warn_email_can_not_be_yourself);
                return false;
            }
        } else {
            var teacherEmail = $("#course_teacherEmail").val().replace(/(^\s*)|(\s*$)/g, "");
            if (emailContent == teacherEmail) {
                $(".invite_student_input_msg").html(warn_email_teacher_student_same);
                return false;
            }
        }
        $(obj).attr('value', emailContent);
        $(".invite_student_input_msg").html(right_div);
        return true;
    }
    return true;
}
function checkRepeatStudentEmails() {
    var flag = true;
    var emails = $(".long_text_field_for_student");
    for (var i = 0; i < emails.length; i++) {
        flag = flag && checkRepeatStudentMail(emails[i]);
    }
    return flag;
}

function yzRepeatCourseForm() {
    if ($("#courseStartDate").val().length == 0) {
        $(".course_date_input_msg").html(warn_course_date_empty);
        return false;
    } else if (!dateComparator("#courseStartDate")) {
        $(".course_date_input_msg").html(warn_start_time_error);
        return false;
    }
    if (courseType == 1) {
        if (!checkTeacherMail($("#course_teacherEmail"))) return false
    }
    if (!checkRepeatStudentEmails()) return false;
    return true;
}

//js of course quick reg
function checkRegStudentEmail() {
    var email = $("#reg_email_input").val().replace(/(^\s*)|(\s*$)/g, "");
    var emailExp = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
    if (email.length == 0) {
        $(".email_input_msg").html(error_div + "<s:text name="interview.email.invalid"/>");
        return false;
    } else if (!emailExp.test(email)) {
        $(".email_input_msg").html(error_div + "<s:text name="interview.time.invalid1"/>");
        return false;
    } else {
        var creatorEmail = "";
        <s:if test="course.organization != null" >
        creatorEmail = "<s:property value="course.teacherEmail"/>";
        </s:if>
        <s:else>
        creatorEmail = "<s:property value="course.teacher.email"/>";
        </s:else>
        if (email == creatorEmail) {
            $(".email_input_msg").html(error_div + "<s:text name="warm.big.course.email.input.error"/>");
            return false;
        }
        $("#reg_email_input").attr('value', email);
        $(".email_input_msg").html(right_div);
        return true;
    }
}
$(document).ready(function () {
    $("#reg_email_input").blur(function () {
        checkRegStudentEmail();
    });
});

function yzQuickReg() {
    if (!checkRegStudentEmail()) {
        return false;

    } else {
        var email = $("#reg_email_input").val();
        $("#user_free_reg_email").html(email);
        $(".gotoIndex").show("slow");
        $.post("courseRegForBigCourse.html", {'course.id': "<s:property value="course.id"/>", 'email': email}, function (data) {
        });

        <%--window.location.href = "courseRegForBigCourse.html?course.id=<s:property value="course.id"/>&email=" + email;--%>
    }
}


var hash = {
    'qq.com': 'http://mail.qq.com',
    'gmail.com': 'http://mail.google.com',
    'sina.com': 'http://mail.sina.com.cn',
    '163.com': 'http://mail.163.com',
    '126.com': 'http://mail.126.com',
    'yeah.net': 'http://www.yeah.net/',
    'sohu.com': 'http://mail.sohu.com/',
    'tom.com': 'http://mail.tom.com/',
    'sogou.com': 'http://mail.sogou.com/',
    '139.com': 'http://mail.10086.cn/',
    'hotmail.com': 'http://www.hotmail.com',
    'live.com': 'http://login.live.com/',
    'live.cn': 'http://login.live.cn/',
    'live.com.cn': 'http://login.live.com.cn',
    '189.com': 'http://webmail16.189.cn/webmail/',
    'yahoo.com.cn': 'http://mail.cn.yahoo.com/',
    'yahoo.cn': 'http://mail.cn.yahoo.com/',
    'eyou.com': 'http://www.eyou.com/',
    '21cn.com': 'http://mail.21cn.com/',
    '188.com': 'http://www.188.com/',
    'foxmail.coom': 'http://www.foxmail.com'
};
function gotoEmailHost() {
    var email = $("#reg_email_input").val();
    var url = email.split('@')[1];
    window.location.href = hash[url];
}

</script>