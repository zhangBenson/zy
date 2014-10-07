<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link type="text/css" href="css/org/courseSupervise.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>

<div class="rightcontent">

    <s:iterator value="courses" status="idx">
        <div class="blogframe">
            <img src="images/blogindex/courseframetop.gif"/>

            <div class="courseLogo"><img src="<s:property value="logoUrl"/>"
                                         onerror="javascript:this.src='images/nopic.jpg'"/></div>
            <div class="course_info">
                <div class="course_tittle">
                    <h6><s:property value="name"/></h6>

                    <div class="check_teacher_student"><s:property value="%{getText('button.check.persons')}"/></div>
                    <div class="teacher_student_list">
                        <table cellpadding="0" cellspacing="0">
                            <tr class="table_tittle">
                                <td colspan="3" width="370px;"><s:property
                                        value="%{getText('label.forcast.lecturer')}"/></td>
                            </tr>
                            <tr>
                                <td width="150px"><s:property value="%{getText('msg.email')}"/></td>
                                <td width="140px"><s:property value="%{getText('menber.reg.nickName')}"/></td>
                                <td width="70px"><s:property value="%{getText('label.status')}"/></td>
                            </tr>
                            <tr>
                                <td width="150px"><span class="orangeWords"><s:property value="teacher.email"/></span>
                                </td>
                                <td width="140px"><span class="orangeWords"><s:property
                                        value="teacher.nickName"/></span></td>
                                <td width="70px"><span class="orangeWords"><s:property
                                        value="%{getText('label.interviewee.accept.'+teacherAccept)}"/></span></td>
                            </tr>
                            <br/>
                            <tr class="table_tittle">
                                <td colspan="3" width="370px;"><s:property value="%{getText('label.student')}"/></td>
                            </tr>
                            <tr>
                                <td width="150px"><s:property value="%{getText('msg.email')}"/></td>
                                <td width="140px"><s:property value="%{getText('menber.reg.nickName')}"/></td>
                                <td width="70px"><s:property value="%{getText('label.status')}"/></td>
                            </tr>

                            <s:iterator value="courseInviteStudents">
                                <tr>
                                    <td width="150px"><span class="orangeWords"><s:property
                                            value="invitedStudentEmail"/></span></td>
                                    <td width="140px"><span class="orangeWords"><s:property
                                            value="student.nickName"/></span></td>
                                    <td width="70px"><span class="orangeWords"><s:property
                                            value="%{getText('label.interviewee.accept.'+acceptInvite)}"/></span></td>
                                </tr>
                            </s:iterator>

                        </table>
                    </div>
                </div>
                <div class="course_detail">
                    <table cellpadding="5" cellspacing="5">
                        <tr>
                            <td><s:property value="%{getText('label.online.class.startdate')}"/>：<span
                                    class="orangeWords"><s:date name="startDate"
                                                                format="%{getText('dateformat')}"/></span></td>
                            <td><s:property value="%{getText('label.online.class.enddate')}"/>：<span
                                    class="orangeWords"><s:date name="finishDate"
                                                                format="%{getText('dateformat')}"/></span></td>
                        </tr>
                        <tr>
                            <td><s:property
                                    value="%{getText('course.sequence.latest',{classOneTheCornerSequence})}"/>：<span
                                    class="orangeWords"><s:date name="classOnTheCorner.date"
                                                                format="%{getText('dateformat.forclass')}"/></span></td>
                            <td><s:property value="%{getText('label.salary.status')}"/>：<span
                                    class="orangeWords"><s:property value="%{getText('label.payed')}"/></span></td>
                        </tr>
                    </table>
                </div>
                <div class="course_time_left">
                    <s:property value="%{getText('courses.time.left')}"/>：<span class="orangeWords"
                                                                                id="timeLeft<s:property value="#idx.index"/>"></span>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#timeLeft<s:property value="#idx.index"/>").countdown({
                                date: '<s:date name="classOnTheCorner.date" format="%{getText('date.formate.firstpage.course.startdate')}"/>',
                                onChange: function (event, timer) {
                                },
                                onComplete: function (event) {
                                    $(this).html("<s:text name='course.in.progress'/>");
                                },
                                htmlTemplate: "<span><b>%{d}</b><s:property value="%{getText('course.time.day')}"/><b> %{h}</b><s:property value="%{getText('course.time.hour')}"/><b>%{m}</b><s:property value="%{getText('course.time.minute')}"/><b>%{s}</b><s:property value="%{getText('course.tine.second')}"/></span>",
                                leadingZero: true,
                                direction: "down"
                            });
                        });
                    </script>
                </div>
                <div class="course_manipulate">
                    <s:a action="startSupervision" cssClass="course_supervise_btn"><s:param name="courseClass.id"
                                                                                            value="classOnTheCorner.id"/><s:property
                            value="%{getText('button.start.supervision')}"/></s:a>
                    <div class="see_all_classes">[<s:property value="%{getText('span.all.course')}"/>]</div>
                </div>
            </div>
            <div class="classintro classintro<s:property value='#id.index'/>">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <s:iterator value="forcastClasses">
                        <tr>
                            <td class="td1">
                                <s:property value="name"/>
                            </td>
                            <td>
                                    <%--<b><s:property value="nickName"/></b>--%>
                                <span class="orangeWords"><s:property value="nickName"/></span>
                            </td>
                            <td>
                                <s:property value="%{getText('lable.course.starttime')}"/>：
                                    <%--<b><s:date name="date" format="%{getText('dateformat.forclass')}"/></b>--%>
                                <span class="orangeWords"><s:date name="date"
                                                                  format="%{getText('dateformat.forclass')}"/></span>
                            </td>
                            <td>
                                <s:property value="%{getText('lable.course.endtime')}"/>：
                                    <%--<b><s:date name="finishDate" format="%{getText('dateformat.forclass')}"/></b>--%>
                                <span class="orangeWords"><s:date name="finishDate"
                                                                  format="%{getText('dateformat.forclass')}"/></span>
                            </td>
                        </tr>
                    </s:iterator>
                </table>
            </div>

            <img src="images/blogindex/courseframebottom.gif" class="frame1bottom"/>
        </div>
    </s:iterator>

    <tiles:insertTemplate template="../pagination.jsp">
        <tiles:putAttribute name="pagination" value="${pagination}"/>
    </tiles:insertTemplate>
</div>

<script type="text/javascript">
    jQuery.fn.isChildAndSelfOf = function (b) {
        return (this.closest(b).length > 0);
    };
    $(document).ready(function () {


        $(".see_all_classes").click(function () {
            $(this).parent().parent().next().slideToggle();
        });

        $(".check_teacher_student").mouseenter(function () {
            $(this).next().show();
        });

        $(document).click(function (event) {
            if ($(".teacher_student_list").is(":visible") && !$(event.target).isChildAndSelfOf($(".teacher_student_list"))) {
                $(".teacher_student_list").hide();
            }
        });
    });
</script>