<script type="text/javascript">
    var text_refused = "<s:text name='title.user.invite.status.refused'/>";
    var text_confirmed = "<s:text name='title.user.invite.status.confirmed'/>";
    var text_unconfirmed = "<s:text name='title.user.invite.status.unconfirmed'/>";
    var text_delete = "<s:text name='title.delete'/>";
    var text_resend = "<s:text name='title.user.invite.user.reinvite'/>";


    $(".add_student_btn").click(function () {
        $("#invitedStudents").append("<input class='long_text_field_for_student' onblur='checkStudentMail(this);' name='emails' type='text' /><span class='del_student_btn' onclick='remove_student(this);'>" + deleteEmail + "</span><br/>");
    });

    function covertStatus(statusValue) {
        if (statusValue == true) {
            return text_confirmed;
        } else if (statusValue == false) {
            return text_refused;
        } else {
            return text_unconfirmed;
        }

    }
    function fillInvitationArea(courseId) {
        if (!courseId)
            return;
        $.get("getStudentInvitation.html", {'course_id': courseId}, function (dataInfo) {
            var htmlString = "";
            var htmlStringModify = "";
            for (var i = 0; i < dataInfo.invitationVOs.length; i++) {
                var dataVo = dataInfo.invitationVOs[i];
                htmlString += "<tr class='invite" + dataVo.id + "'> <td width='150px' name='emails' value='" + dataVo.invitedStudentEmail
                        + "'>" + dataVo.invitedStudentEmail + "</td><td width='80px' class='inviteStatus" + dataVo.id + "'>" + covertStatus(dataVo.acceptInvite) + "</td><td width='200px'></td></tr>";
                var optString = "";
                if (dataVo.acceptInvite != true)
                    optString = "<a href='javascript:;' onclick='reInvite(" + dataVo.id + ");'>" + text_resend + "</a>&nbsp;<a href='javascript:;' onclick='deleteInvite( " + dataVo.id + ");'>" + text_delete + "</a>";
                htmlStringModify += "<tr class='invite" + dataVo.id + "'> <td width='150px' name='emails' value='" + dataVo.invitedStudentEmail
                        + "'>" + dataVo.invitedStudentEmail + "</td><td width='80px' class='inviteStatus" + dataVo.id + "'>" + covertStatus(dataVo.acceptInvite) + "</td><td width='200px'>" +
                        optString + "</td></tr>";
            }
            $("#invitationList").html(htmlString);
            $("#invitationListModify").html(htmlStringModify);
        });
    }

    $("#step2_store").click(function () {
        if (!yzSaveCourseForm()) return;
        var course_info = $("#course_main_info_form").serialize();
        $.post("ajaxSaveCourse.html", course_info, function (data) {
            $("#course_id").attr('value', data.course_id);
            $("#self_class_courseID").attr('value', data.course_id);
            $("#auto_class_courseID").attr('value', data.course_id);
            fillInvitationArea(data.course_id);
        })
        step2Stored = true;

        $(this).parent().parent().hide();
        var name = $("input[type='text'][name='course.name']").val();
        var access = $("[name='course.isPublic']:checked").next().html();
        var courseTags = getTag();
        var description = $("textarea[name='course.description']").val();
        //var studentAgeTypeVal = $("select[name='course.studentAgeType']").val();
        var studentAgeType = $("#step2_studentAge_type").find("option:selected").text();
        var courseTypeVal = $("select[name='course.courseType']").val();
        var courseType = $("option[value='" + courseTypeVal + "']").text();
        var startDate = $("input[type='text'][name='course.startDate']").val();
        var charges = $("input[type='text'][name='course.charges']").val();
        var teacherEmail = $("[name='teacherIds']:checked").next().html();
        var emails = $("input[type='text'][name='emails']");
        var courseLogo = $("#show_log_preview").attr("src");

        $("#store_name").html(name);
        $("#store_course_access").html(access);
        $("#store_courseTag").html(courseTags);
        $("#store_description").html(description);
        $("#store_studentType").html(studentAgeType);
        $("#store_courseType").html(courseType);
        $("#store_startDate").html(startDate);
        $("#store_charges").html(charges + "&nbsp;<s:text name="label.zhibi.true"/>");
        $("#obv_course_logo").attr("src", courseLogo);
        $("#store_teacherEmail").html(teacherEmail);

        $("#invitedStudents").html("<input class='long_text_field_for_student' onblur='checkStudentMail(this);' name='emails' type='text' /><br/>");


        $(this).parent().parent().next().show();
    });


    function remove_student(del_btn) {
        $(del_btn).prev().remove();
        $(del_btn).next().remove();
        $(del_btn).remove();
        count--;
        if (count <= maxStudentCount) {
            $(".invite_student_input_msg").html("");
            $("#step2_store_msg").html("");
        }
    }

    function reInvite(id) {
        $.post("resendInvitation.html", {'id': id}, changeToPending);
        function changeToPending() {
            $(".inviteStatus" + id).html('<s:text name='title.user.invite.status.unconfirmed'/>');
        }
    }

    function deleteInvite(id) {
        $.post("deleteInvitation.html", {'id': id}, removeInviteCell);
        function removeInviteCell() {
            $(".invite" + id).remove();
        }
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


            var teacherEmails = $("[name='teacherIds']:checked");
            for (var i = 0; i < teacherEmails.length; i++) {
                if (emailContent == teacherEmails[i].value) {
                    $(".invite_student_input_msg").html(warn_email_teacher_student_same);
                    return false;
                }
            }
//            var teacherEmail = $("[name='teacherIds']:checked").next().attr("tag");
//            if (emailContent == teacherEmail) {
//                $(".invite_student_input_msg").html(warn_email_teacher_student_same);
//                return false;
//            }


            $(obj).attr('value', emailContent);
            $(".invite_student_input_msg").html("");
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

    $(document).ready(function () {
        fillInvitationArea($("#course_id").val());
    });
</script>
