<script type="text/javascript">

    $(".add_student_btn").click(function () {
        $("#invitedStudents").append("<input class='long_text_field_for_student' onblur='checkStudentMail(this);' name='emails' type='text' /><span class='del_student_btn' onclick='remove_student(this);'>" + deleteEmail + "</span><br/>");
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
            $("#inviteStatus" + id)[0].innerHTML = '<s:text name='title.user.invite.status.unconfirmed'/>';
        }
    }

    function deleteInvite(id) {
        $.post("deleteInvitation.html", {'id': id}, removeInviteCell);
        function removeInviteCell() {
            $("#invite" + id)[0].style.display = 'none';
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
                if(emailContent == teacherEmails[i].value){
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
</script>