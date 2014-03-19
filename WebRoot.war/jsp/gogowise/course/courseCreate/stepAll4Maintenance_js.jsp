<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<script type="text/javascript">
    $(document).ready(function(){
      document.getElementById("courseStartDate").value = "<s:date  name="course.startDate" format="%{getText('global.display.date')}"/>";
    });

    $(function(){
        $(".stepWrap h3").click(function(){
            if($(this).next("div").is(":visible")) return;

            var stepNum = $(this).attr("alt");
            if(stepNum == 2 && !step1Stored){
                $("#step1_store_msg").html(plsSelectType);
                 $(".stepWrap h3[alt='1']").trigger("click");
                return;
            }
            if(stepNum == 3){
                if(!step1Stored){
                    $("#step1_store_msg").html(plsSelectType);
                    $(".stepWrap h3[alt='1']").trigger("click");
                    return;
                }
                if(!step2Stored){
                    $("#step2_store_msg").html(plsFillCourseInfo);
                    $(".stepWrap h3[alt='2']").trigger("click");
                    window.location.href="#step2_store_msg";
                    return;
                }
            }
            $(".stepWrap h3").next("div").hide();
            $(this).next("div").slideDown();
        });


       $("#step1_store").click(function(){
            $(this).parent().parent().hide();
            var radioObj = $("input[name='course.identity']:checked");
            var courseType = radioObj.val();

            $.post("updateCourseTeachingNum.html",{'course.id':<s:property value="course.id"/>,'course.teachingNum':courseType});


            maxStudentCount = courseType;
            var courseTypeLabel = radioObj.next("label").html();
            $("#step1_store_cont .store_course_type").html(courseTypeLabel);
            $(this).parent().parent().next().show();
            step1Stored = true;

           //判断第二步邀请的人数是否与此冲突
           if(count > maxStudentCount){
               $("#step2_store_msg").html(messageOver+maxStudentCount+plsDeleteOther);
               $(".stepWrap h3[alt='2']").trigger("click");
               if(step2Stored){
                    $("#step2_modify").trigger("click");
               }
           }
        });



        $("#step2_store").click(function(){
            if(!yzSaveCourseForm()) return;
            var course_info = $("#course_main_info_form").serialize();
            $.post("ajaxUpdateCourse.html",course_info);
            step2Stored = true;

            $(this).parent().parent().hide();
            var name = $("input[type='text'][name='course.name']").val();
            var description =  $("textarea[name='course.description']").val();
            var studentType = $("input[type='text'][name='course.studentType']").val();
            var courseTeachingBook = $("input[type='text'][name='course.courseTeachingBook']").val();
            var courseTypeVal = $("select[name='course.courseType']").val();
            var courseType = $("option[value='"+courseTypeVal+"']").text();
            var startDate = $("input[type='text'][name='course.startDate']").val();
            var charges = $("input[type='text'][name='course.charges']").val();
            var teacherEmail =  $("input[type='text'][name='course.teacherEmail']").val();
            var emails = $("input[type='text'][name='emails']");
            var courseLogo = $("#show_log_preview").attr("src");
            var invitedEamils = "";

            $("#store_name").html(name);
            $("#store_description").html(description);
            $("#store_studentType").html(studentType);
            $("#store_courseTeachingBook").html(courseTeachingBook);
            $("#store_courseType").html(courseType);
            $("#store_startDate").html(startDate);
            $("#store_charges").html(charges+"&nbsp;<s:text name="%{getText('label.zhibi.true')}"/>");
            $("#obv_course_logo").attr("src",courseLogo);
            $("#store_teacherEmail").html(teacherEmail);
            for(var i=0;i<emails.length;i++){
                if($(emails[i]).val())
                    invitedEamils += ("["+$(emails[i]).val()+"]  ");
            }
            $("#store_emails").html(invitedEamils);
            $(this).parent().parent().next().show();
        });

        $("#step3_self_store").click(function(){

            if(!yzSaveCourseClassForm()) return;

             var classInfo = $("#self_class_system_form").serialize();
             $.post("selfSaveClass.html",classInfo,function(data){
                   $("#list_tbody").html(data)
             });
             $(".self_system_wrap input[name='courseClass.nickName']").attr('value',"");
             $(".self_system_wrap input[type='text'][name='courseClass.date']").attr('value',"");
             step3Stored = true;
        });

        $("#step3_auto_store").click(function(){
            var classInfo = $("#auto_class_system_form").serialize();
            $.post("autoSaveClasses.html",classInfo,function(data){
                $("#list_tbody").html(data);
            });
            $(".auto_system_wrap input[name='startTimes']").attr('value',"");
            step3Stored = true;
        });

        $("#course_charges").blur(function(){
            $(".course_charges_msg").html("*");
            var charges = $(this).val();
            var chargesExp = /^(\d+)(\.?)(\d{0,2})$/;
             if(charges == ""){
               $(".course_charges_msg").html(warn_charges_empty);
             }else if(!charges.match(chargesExp)){
                $(".course_charges_msg").html(warn_charges_format_wrong);
             }else if(charges > 1000){
                 $(".course_charges_msg").html(warn_charges_amount_wrong);
             }

        });
    });

     function modifyStepMsg(modifyObj,step){
           $(modifyObj).parent().hide();
           $(modifyObj).parent().prev().show();
           if(step == 1){
               step1Stored = false;
           }else if(step == 2){
               step2Stored = false;
           }else{
               step3Stored = false;
           }
     }

    function yzSaveCourseClassForm(){
        var result = true;
        if( $("#class_nickname_input").val().length == 0 )
        {
            result = false;
            $("#class_start_time_msg").html(warn_course_name_empty);
        }
        if( $("#class_start_time_input").val().length == 0 )
        {
            result = false;
            $("#class_start_time_msg").html(warn_start_time_error);
        }
        if( $("#class_durations_input").val().length == 0 )
        {
            result = false;
        }

        return result;
    }

     function yzSaveCourseForm(){
         var b1=true,b2=true,b3=true,b4=true,b5=true,b6=true,b7=true,b8=true,b9=true;
         if($("#step2_course_name").val().replace(/(^\s*)|(\s*$)/g, "").length == 0){
             $(".course_name_input_msg").html(warn_course_name_empty);
             b1 = false;
         } else b1 = true;
         if($("#step2_course_intro").val().replace(/(^\s*)|(\s*$)/g, "").length == 0){
             $(".course_intro_input_msg").html(warn_course_intro_empty);
             b2 = false;
         } else b2 = true;

         if($("#step2_course_type").val() == -1){
             $(".course_type_input_msg").html(warn_choose_correct_course_type);
             b3 = false;
         }else{
             $(".course_type_input_msg").html("");
             b3 = true;
         }

          if($("#courseStartDate").val().length==0){
              $(".course_date_input_msg").html(warn_course_date_empty);
              b4 = false;
          }
          //else if(!dateComparator("#courseStartDate")){
          //    $(".course_date_input_msg").html(warn_start_time_error);
          //    b4 = false;
          //}
          else b4 = true;

          /*if($("#course_logo").val().length==0){
              $("#course_logo_input_msg").html(warn_upload);
              b5 = false;
          }else b5 = true;*/

          var charges = $("#course_charges").val().replace(/(^\s*)|(\s*$)/g, "");
          var chargesExp = /^(\d+)(\.?)(\d{0,2})$/;
          if(charges.length == 0){
              $(".course_charges_msg").html(warn_charges_empty);
              b8 = false;
          }else if(!charges.match(chargesExp)){
              $(".course_charges_msg").html(warn_charges_format_wrong);
              b8 = false;
          }else if(charges > 1000){
              $(".course_charges_msg").html(warn_charges_amount_wrong);
          } else b8 = true;


          if(!checkStudentEmails()) b7 = false;
          else b7 = true;

          var result = b1&&b2&&b3&&b4&&b5&&b6&&b7&&b8;

          return result;
      }
     function publishCourse(){
         if(step1Stored && step2Stored && step3Stored && $("#clauseCheckbox").is(":checked")){
             var courseID = $("#course_id").val();
              window.location.href = "courseGet2public.html?course.id="+courseID;
         }else{
             if(!step1Stored){
                 $("#step1_store_msg").html(plsSelectType);
                 $(".stepWrap h3[alt='1']").trigger("click");
                 return ;
             }
             if(!step2Stored){
                 $("#step2_store_msg").html(plsFillCourseInfo);
                 $(".stepWrap h3[alt='2']").trigger("click");
                 return ;
             }
              if(!step3Stored){
                  $("#step3_store_msg").html(plsFillClassInfo);
                 $(".stepWrap h3[alt='3']").trigger("click");
                  $("#self_click_li").trigger("click");
                 return ;
             }
             if(!$("#clauseCheckbox").is(":checked")){
                 $("#checkboxMsg").html(readClauseFirst);
             }
         }
     }


    $(function(){
        $(".system_ul_list li").click(function(){
            if($(this).hasClass("stand_out"))return;
            $(this).siblings("li").removeClass("stand_out");
            $(this).addClass("stand_out");

            if($(this).attr("id")=="self_click_li"){
                $(".self_system_wrap").show();
                $(".auto_system_wrap").hide();
            }else{
                $(".auto_system_wrap").show();
                $(".self_system_wrap").hide();
            }
        });
        $("#change_portrait").fancybox({
            type:'iframe',
            width:720,
            height:490
        });
        $("#course_creation_clause").fancybox({
            type:'iframe',
            width:720,
            height:490
        });


        // step2 js
         $("#step2_course_name").blur(function(){
            var course_name = $(this).val().replace(/(^\s*)|(\s*$)/g, "");
            if(course_name.length==0)
                $(".course_name_input_msg").html(warn_course_name_empty);
            else{
              $(this).attr('value',course_name);
              $(".course_name_input_msg").html("*");
            }
        });
        $("#step2_course_name").focus(function(){
            $(".course_name_input_msg").html(getStrLength($(this).val())+"/"+40);
        });
        $("#step2_course_name").keyup(function(){
            changeWordNumber(this,$(".course_name_input_msg"),40);
        });
        $("#step2_course_intro").blur(function(){
            var course_intro = $(this).val().replace(/(^\s*)|(\s*$)/g, "");
            if(course_intro.length==0)
                $(".course_intro_input_msg").html(warn_course_intro_empty);
            else {
                $(this).attr('value',course_intro);
                $(".course_intro_input_msg").html("*");
            }
        });
        $("#step2_course_intro").focus(function(){
            $(".course_intro_input_msg").html(getStrLength($(this).val())+"/"+2000);
        });
        $("#step2_course_intro").keyup(function(){
            changeWordNumber(this,$(".course_intro_input_msg"),2000);
        });
        $("#step2_course_student_type").keyup(function(){
            changeWordNumber(this,$(".course_student_type_input_msg"),50);
        });
        $("#step2_course_teaching_book").keyup(function(){
            changeWordNumber(this,$(".course_teaching_book_input_msg"),50);
        });
        $("#step2_course_type").change(function(){
                 if($("#step2_course_type").val() == -1){
                     $(".course_type_input_msg").html(warn_choose_correct_course_type);
                     return false;
                 }else{
                     $(".course_type_input_msg").html("*");
                 }
        });
        $("#courseStartDate").blur(function(){
             $(".course_date_input_msg").html("");
             if($(this).val() == ""){
               $(".course_date_input_msg").html(warn_course_date_empty);
             }else if(!dateComparator(this)){
                //$(".course_date_input_msg").html(warn_start_time_error);
             }else{
                 $(".course_date_input_msg").html("*");
             }

        });

        $(".add_student_btn").click(function(){
            if (maxStudentCount < 4 && count >= maxStudentCount) {
                 $(".invite_student_input_msg").html(warn_student_number_overflow+maxStudentCount);
                 return;
            }
            $("#invitedStudents").append("<input class='long_text_field_for_student' onblur='checkStudentMail(this);' name='emails' type='text' /><span class='del_student_btn' onclick='remove_student(this);'>"+deleteEmail+"</span><br/>");
            count ++;
        });
        $(".del_student_btn").click(function(){
            $(".invite_student_input_msg").html("");
            $(this).prev().remove();
            $(this).remove();
        });


        // step3 js
        $(".course_nick_name").keyup(function(){
            changeWordNumber(this,$("#class_nickname_msg"),40);
        });
        $(".add_class_btn").click(function(){
            var timePickerId = "f"+new Date().getMilliseconds()+"";
            var tdTime = '<input type="text" name="startTimes" id="'+timePickerId+'" onblur="checkTimeError(this);" readonly="true" class="WTime short_text_field"/>';
            var timeStr = "<select name='durations' class='long_select'><option value=60 selected='true'>60"
                    + minute + "</option><option value=55>55"
                    + minute + "</option><option value=50>50"
                    + minute + "</option><option value=45>45"
                    + minute + "</option><option value=40>40"
                    + minute + "</option><option value=35>35"
                    + minute + "</option><option value=30>30"
                    + minute + "<option></select>";
            var addedTr = "<tr><td>" + tdTime
                    + "</td><td>" + timeStr
                    +  "</td><td class='delete_class_btn class_btn' onclick='deleteClassInThisRow(this);'>"+ deleteEmail
                    +"</td></tr>";

            $("#add_class_table").append(addedTr);
            createTimePicker(timePickerId);
        });

    });

    function changeWordNumInHTML(obj){
        changeWordNumber(obj,$("#class_nickname_msg"),40);
    }

    function checkStudentMail(obj){
        $(".invite_student_input_msg").html("");
        var email = $(obj).val();
        var emailContent = email.replace(/(^\s*)|(\s*$)/g, "");
        var mySessionEmail = "<s:property value="#session.email"/>";
        var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
        if(emailContent.length != 0 ){
             if(!pattern.test(emailContent)){
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
                 if(emailContent == teacherEmail){
                    $(".invite_student_input_msg").html(warn_email_teacher_student_same);
                    return false;
                 }
             </s:else>
             $(obj).attr('value',emailContent);
             $(".invite_student_input_msg").html("");
             return true;
        }
        return true;
    }
    function checkStudentEmails(){
       var flag = true;
       var emails = $(".long_text_field_for_student");
       for(var i=0;i<emails.length;i++){
            flag = flag&&checkStudentMail(emails[i]);
       }
       return flag;
    }
    function checkTeacherMail(obj){
         var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
         var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
         if(email.length == 0){
             $(".invite_teacher_input_msg").html(warn_email_empty);
             return false;
         }else if(email.length != 0 ){
             if(!pattern.test(email)){
                 $(".invite_teacher_input_msg").html(warn_email_format_wrong);
                 return false;
             }else{
                 $(obj).attr('value',email);
                 $(".invite_teacher_input_msg").html("^_^");
                 return true;
             }
         }
    }
    function dateComparator(Obj){     //the current time  bigger than startTime which without H:m:s  return true
        var startTime = new Date($(Obj).val().replace(/-/g,"/"));
        var currTime =  new Date();
        if(startTime.getYear()<currTime.getYear()||startTime.getYear()==currTime.getYear()&&startTime.getMonth()<currTime.getMonth()||
                startTime.getYear()==currTime.getYear()&&startTime.getMonth()==currTime.getMonth()&&startTime.getDate()<currTime.getDate()){
            return false;
        }
        return true
    }
    function remove_student(del_btn){
        $(del_btn).prev().remove();
        $(del_btn).next().remove();
        $(del_btn).remove();
        count--;
        if(count <= maxStudentCount){
            $(".invite_student_input_msg").html("");
            $("#step2_store_msg").html("");
        }
    }


    function deleteAddedClass(lineId,id){
        $.post("deleteClasses.html",{'courseClass.id':id},function (data) {});
        var idx = "#"+lineId;
        $(idx).remove();
    }
    function editSpecifiedClass(lineId){
        var course_nameObj = $("#course_name"+lineId);
        var course_nickNameObj = $("#course_nickName"+lineId);
        var course_dateObj = $("#course_date"+lineId);
        var course_durationObj = $("#course_duration"+lineId);

        var unit = minute;
        var timeStr = "<select name='durations'><option value=60 selected='true'>60"
                    + unit + "</option><option value=55>55"
                    + unit + "</option><option value=50>50"
                    + unit + "</option><option value=45>45"
                    + unit + "</option><option value=40>40"
                    + unit + "</option><option value=35>35"
                    + unit + "</option><option value=30>30"
                    + unit + "<option></select>";
         if($("#course_edit"+lineId).html()==editClass){
            $("#course_edit"+lineId).html(saveClass);
            course_nameObj.html(course_nameObj.html());
            course_nickNameObj.html("<input  type='text' onkeyup='changeWordNumInHTML(this);' value='"+course_nickNameObj.html()+"' />");
            course_dateObj.html("<input type='text' id='course_date_input"+lineId+"' value='"+course_dateObj.html()+"'/>");
            course_durationObj.html(timeStr);
            createDateTimePicker('course_date_input'+lineId);
        }else if($("#course_edit"+lineId).html()==saveClass){
             $.post("editClassInfo.html", {'courseClass.id':lineId, 'courseClass.nickName':course_nickNameObj.children("input").val(), 'courseClass.date':course_dateObj.children("input").val(), 'courseClass.duration':course_durationObj.children("select").val()}, function (data) {});
             $($("#course_edit"+lineId)).html(editClass);
             course_nameObj.html(course_nameObj.children("input").val());
             course_nickNameObj.html(course_nickNameObj.children("input").val());
             course_dateObj.html(course_dateObj.children("input").val());
             course_durationObj.html(course_durationObj.children("select").val());
        }
    }
    function checkTimeError(obj){
        var time = $(obj).val();
        if(time.length == 0){
            $("#form2_start_time_msg").html(warn_start_time_empty);
            return false;
        }
        $("#form2_start_time_msg").html("*");
        return true;
    }
    function deleteClassInThisRow(obj){
        $(obj).parent().remove();
    }

    var courseClassNum = 0;
    var step1Stored = true;
    var step2Stored = true;
    var step3Stored = true;

    var plsSelectType = "<s:text name="pls.select.type"/>";
    var plsFillCourseInfo = "<s:text name="pls.fill.course.info"/>";
    var plsFillClassInfo = "<s:text name="pls.fill.class.info"/>";
    var messageOver = "<s:text name="message.over"/>";
    var plsDeleteOther = "<s:text name="pls.delete.other"/>";
    var warn_charges_empty = "<s:text name="charge.empty"/>";
    var warn_charges_format_wrong = "<s:text name="charges.amount.wrong"/>";
    var warn_charges_amount_wrong = "<s:text name="pls.select.type"/>";
    var words_on_uploadButton = "<s:text name="word.browse"/>";
    var showLogoUploadSuccess = "<s:text name="upload.success"/>";
    var warn_class_name_empty = "<s:text name="class.name.empty"/>";

    var readClauseFirst = "<s:text name="course.creation.document.accept.rule.first"/>";
    var maxStudentCount = 0;
    var count = <s:property value="course.teachingNum"/>;
    var exist_words_number = 0;
    var warn_course_name_empty = "<s:text name='course.name'/>";
    var warn_course_intro_empty = "<s:text name='course.description'/>";
    var warn_course_date_empty = "<s:text name='course.startdate'/>";
    var warn_email_empty = "<s:text name='interview.email.invalid'/>";
    var warn_email_format_wrong = "<s:text name='interview.time.invalid1'/>";
    var warn_email_can_not_be_yourself = "<s:text name='course.email.input.myself'/>";
    var warn_email_teacher_student_same = "<s:text name='course.teacher.student.email.same.error'/>";
    var warn_start_time_error = "<s:text name='msg.course.startdate.error'/>";
    var warn_student_number_overflow = "<s:text name="invite.student.number"/> ";
    var warn_class_startTime_litter_than_course_time = "<s:text name="msg.courseclass.date.error"/>";
    var warn_choose_correct_course_type =  "<s:text name="choose.correct.course.type"/>";
    var warn_upload = "<s:text name="upload"/>";
    var deleteEmail="<s:text name='course.class.delete'/>";
    var oneClass = "<s:text name='course.classes.more.than.one'/>";
    var warn_class_nickname_empty = "<s:text name='message.class.content.empty'/>";
    var warn_start_time_empty = "<s:text name='course.start.time.of.class'/>";
    var editClass = "<s:text name='course.class.edit'/>";
    var saveClass = "<s:text name='course.class.save'/>";
    var minute = "<s:text name='label.minute'/>"
</script>