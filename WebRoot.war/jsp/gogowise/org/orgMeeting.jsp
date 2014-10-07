<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link href="css/orgInterview.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
    var maxCount = 1;
    var emailEmpty = "<s:text name='interview.email.invalid'/>";
    var timeEmpty = "<s:text name='org.meeting.time.empty'/>";
    var timeError = "<s:text name='org.meeting.time.before.now'/>";
    var desEmpty = "<s:text name='org.meeting.content.not.null'/>";
    var deleteEmail = "<s:text name='course.class.delete'/>";
    var emailError = "<s:text name='interview.time.invalid1'/>";
    var officerIntervieweeSameError = "<s:text name='org.meeting.hostman.member.the.same'/>";
    var twoOrMoreMemberAreSame = "<s:text name='org.meeting.two.more.member.same'/>";
    var TOTAL_WORDS_NUMBER = 400;
    var left_words_number = TOTAL_WORDS_NUMBER;
    var left_words_tip = "<s:text name='org.interview.description.text.number.input'/><span class='words_number'>" + TOTAL_WORDS_NUMBER + "</span><s:text name='org.interview.description.text.number.result'/>";
    var meetingMember_too_much = "<s:text name='org.meeting.member.too.much'/>";

    function deleteInterviewEmail(obj) {
        $(".interviewee_input_msg").html("");
        $(obj).parent().parent().remove();
        maxCount--;
    }
    function checkInterviewerEmail() {
        $(".interviewer_input_msg").html("");
        var emailContent = $(".interviewer_input").val().replace(/(^\s*)|(\s*$)/g, "");
        if (emailContent == "") {
            $(".interviewer_input_msg").html("<div class='error'></div>" + emailEmpty);
            return false;
        } else {
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            if (!pattern.test(emailContent)) {
                $(".interviewer_input_msg").html("<div class='error'></div>" + emailError);
                return false;
            }
            $(".interviewer_input").attr("value", emailContent);
        }
        $(".interviewer_input_msg").html("<div class='right'></div>");
        return true;
    }
    function checkIntervieweeEmail(obj) {
        $(".interviewee_input_msg").html("");
        var emailContent = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
        if (emailContent == "") {
            $(".interviewee_input_msg").html("<div class='error'></div>" + emailEmpty);
            return false;
        } else {
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            if (!pattern.test(emailContent)) {
                $(".interviewee_input_msg").html("<div class='error'></div>" + emailError);
                return false;
            } else {
                var officer = $(".interviewer_input").val().replace(/(^\s*)|(\s*$)/g, "");
                if (emailContent == officer) {
                    $(".interviewee_input_msg").html("<div class='error'></div>" + officerIntervieweeSameError);
                    return false;
                }
                <%--var mySession = "<s:property value="#session.email"/>";--%>
                <%--if(emailContent == mySession){--%>
                <%--$(".interviewee_input_msg").html("<div class='error'></div>"+"<s:text name='course.email.input.myself'/>");--%>
                <%--return false;--%>
                <%--}--%>
                $(obj).attr("value", emailContent);
            }
        }
        $(".interviewee_input_msg").html("<div class='right'></div>");
        return true;
    }
    function checkIntervieweeEmails() {

        var emails = $(".interviewee_input");
        for (var i = 0; i < emails.length; i++) {

            if (!checkIntervieweeEmail(emails[i])) {
                return false;
            }

            if (i != 0) {
                if ($(emails[i]).val() == $(emails[i - 1]).val()) {
                    $(".interviewee_input_msg").html("<div class='error'></div>" + twoOrMoreMemberAreSame);
                    return false;
                }
            }
        }
        return true;
    }
    function checkInterviewTextArea() {
        $(".interview_textarea_msg").html("");
        if ($(".interview_textarea").val().replace(/(^\s*)|(\s*$)/g, "") == "") {
            $(".interview_textarea_msg").html("<div class='error'></div>" + desEmpty);
            return false;
        }
        $(".interview_textarea_msg").html("<div class='right'></div>");
        return true;
    }
    function changeWordsNumber() {
        var existWordsNumber = $(".interview_textarea").val().length;
        left_words_number = TOTAL_WORDS_NUMBER - existWordsNumber;
        if (left_words_number < 0) {
            left_words_number = 0;
            var full_words = $(".interview_textarea").val().substring(0, TOTAL_WORDS_NUMBER);
            $(".interview_textarea").val(full_words);
        }
        left_words_tip = left_words_tip.replace(/\d{1,}/, left_words_number);
        $(".interview_content_wordsLeft").html(left_words_tip);
    }
    function checkInterviewTime() {
        $(".interviewTime_input_msg").html("");
        if ($(".interviewTime_input").val() == "") {
            $(".interviewTime_input_msg").html("<div class='error'></div>" + timeEmpty);
            return false;
        } else {
            var start = new Date($(".interviewTime_input").val().replace(/-/g, "/"));
            var end = new Date();
            // alert(start<end);
            if (start < end) {
                $(".interviewTime_input_msg").html("<div class='error'></div>" + timeError);
                return false;
            }
        }
        $(".interviewTime_input_msg").html("<div class='right'></div>");
        return true;
    }

    $(document).ready(function () {
        //表单验证
        $(".interviewer_input").blur(function () {
            checkInterviewerEmail();
        });
        $(".interview_textarea").blur(function () {
            $(".interview_content_wordsLeft").html("");
            checkInterviewTextArea();
        });
        $(".interviewTime_input").blur(function () {
            checkInterviewTime();
        });
        $(".interviewer_input").focus(function () {
            $(".interviewer_input_msg").text("");
        });
        $(".interviewee_input").focus(function () {
            $(".interviewee_input_msg").text("");
        });
        $(".interview_textarea").keyup(function () {
            changeWordsNumber();
        });
        $(".interview_textarea").focus(function () {
            $(".interview_textarea_msg").text("");
            $(".interview_content_wordsLeft").html(left_words_tip);
        });
        $(".interviewTime_input").focus(function () {
            $(".interviewTime_input_msg").text("");
        });
        $(".interviewer_add").click(function () {
            if (maxCount < 3) {
                $(".interviewee_email").append("<tr><td><input name='memberEmails' onblur='checkIntervieweeEmail(this)' type='text' class='interview_input interviewee_input' />&nbsp;&nbsp;<span onclick='deleteInterviewEmail(this)' class='interviewee_delete'>" + deleteEmail + "</span></td></tr>");
                maxCount++;
            } else {
                $(".interviewee_input_msg").html("<div class='error'></div>" + meetingMember_too_much);
            }
        });
    });

    function checkForm() {
        var b1 = checkInterviewerEmail();
        var b2 = checkIntervieweeEmails();
        var b3 = checkInterviewTextArea();
        var b4 = checkInterviewTime();
        return b1 && b2 && b3 && b4;
    }

</script>

<div class="interviewContainer">
    <div class="interviewTittle"><s:text name="label.meeting.center"/></div>
    <s:form action="saveOrgMeeting" validate="true" theme="simple" method="POST">
        <div class="interviewDetail">
            <ul>
                <li>
                    <div class="option_tittle"><s:text name="select.org"/></div>
                    <br/>

                    <p class="option_content"><s:select name="orgMeeting.organization.id" list="orgs" listKey="key"
                                                        cssClass="interview_input" listValue="value"/></p></li>
                <li>
                    <div class="option_tittle"><s:text name="label.meeting.host.email"/></div>
                    <span class="interviewer_input_msg input_msg"></span><br/>

                    <p class="option_content"><input name="orgMeeting.hostManEmail" type="text"
                                                     class="interview_input interviewer_input"/></p>
                </li>
                <li>
                    <div class="option_tittle"><s:text name="label.meeting.attendee.email"/></div>
                    <div class="interviewer_add"><s:text name="interview.add"/></div>
                    <span class="interviewee_input_msg input_msg"></span>

                    <p class="option_content">
                    <table>
                        <tr>
                            <td><input name="memberEmails" type="text" onblur='checkIntervieweeEmail(this)'
                                       class="interview_input interviewee_input"/></td>
                        </tr>
                        <tbody class="interviewee_email"></tbody>
                    </table>
                    </p>
                </li>
                <li>
                    <div class="option_tittle"><s:text name="label.meeting.description"/></div>
                    <span class="interview_textarea_msg input_msg"></span>

                    <div class="interview_content_wordsLeft"></div>
                    <br/>

                    <p class="option_content"><textarea class="interview_textarea" name="orgMeeting.content"></textarea>
                    </p>
                </li>
                <li>
                    <div class="option_tittle"><s:text name="label.meeting.time"/></div>
                    <span class="interviewTime_input_msg input_msg"></span><br/>

                    <p class="option_content"><s:textfield id="" name="orgMeeting.startTime" readonly="true"
                                                           cssClass="Wdatepicker interview_input interviewTime_input"
                                                           onfocus="WdatePicker({lang:'%{getText('language')}',startDate:'%y-%M-01 00:00:00',dateFmt:'%{getText('dateformat.forclass')}',alwaysUseStartDate:true})"/></p>
                </li>
                <li>
                    <input type="submit" onclick="return checkForm();" class="interview_submit"
                           value="<s:text name="button.publish.meeting"/>"/>
                </li>
            </ul>
        </div>
    </s:form>
</div>
