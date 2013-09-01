<%@ page import="com.gogowise.utils.MD5" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<table id="message_table">
    <tr class="tr_x"><td colspan="3" class="td_0">课程信息</td></tr>

    <s:iterator value="courseReservationMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="fromUser.nickName"/>预订了您的<a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=1" target="_blank" onclick="deleteThisRow(this);"><s:property value="course.name"/></a>课程,具体信息请查看您的邮箱。</td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">确定</a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">忽略</a></td>
    </tr>
    </s:iterator>
    <s:iterator value="courseRegisterMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="fromUser.nickName"/>注册了您的<a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);"><s:property value="course.name"/></a>课程</td>
        <td class="td_2"><a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);">确定</a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">忽略</a></td>
    </tr>
    </s:iterator>
    <s:iterator value="courseResourceMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="fromUser.nickName"/>&nbsp;在您的<a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);"><s:property value="course.name"/></a>上传了课程资料</td>
        <td class="td_2"><a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);">去下载</a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">忽略</a></td>
    </tr>
    </s:iterator>


    <tr class="tr_x"><td colspan="3" class="td_0">留言信息</td></tr>
    <s:iterator value="CourseMessageMatters" status="idx">
     <tr>
        <td class="td_1"><s:property value="fromUser.nickName"/>&nbsp;给您的<a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);"><s:property value="course.name"/></a>课程留言了</td>
        <td class="td_2"><a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);">回复</a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">忽略</a></td>
    </tr>
    </s:iterator>


    <s:iterator value="myShowMessageMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="fromUser.nickName"/>&nbsp;给您的<a href="matterHandler.html?matter.id=<s:property value="id"/>&myShow.id=<s:property value="myShow.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);"><s:property value="myShow.name"/></a>个人秀留言了</td>
        <td class="td_2"><a href="matterHandler.html?matter.id=<s:property value="id"/>&myShow.id=<s:property value="myShow.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);">回复</a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">忽略</a></td>
    </tr>
    </s:iterator>
    <tr class="tr_x"><td colspan="3" class="td_0">邀请信息</td></tr>

      <s:iterator value="orgMeetingHostManMatters" status="idx">
     <tr>
        <td class="td_1"><s:property value="fromUser.nickName"/>&nbsp;邀请您主持<a href="matterHandler.html?matter.id=<s:property value="id"/>&orgMeeting.id=<s:property value="orgMeeting.id"/>&matter.type=<s:property value="type"/>&matter.email=<s:property value="email"/>&user.email=<s:property value="toEmail"/>" target="_blank" onclick="deleteThisRow(this);"><s:property value="orgMeeting.organization.schoolName"/></a>会议</td>
        <td class="td_2"><a href="matterHandler.html?matter.id=<s:property value="id"/>&orgMeeting.id=<s:property value="orgMeeting.id"/>&matter.type=<s:property value="type"/>&matter.email=<s:property value="email"/>&user.email=<s:property value="toEmail"/>" target="_blank" onclick="deleteThisRow(this);">接受</a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">忽略</a></td>
    </tr>
    </s:iterator>


     <s:iterator value="orgMeetingMatters" status="idx">
     <tr>
        <td class="td_1"><s:property value="fromUser.nickName"/>&nbsp;邀请您参加<a href="matterHandler.html?matter.id=<s:property value="id"/>&orgMeeting.id=<s:property value="orgMeeting.id"/>&matter.type=<s:property value="type"/>&matter.email=<s:property value="email"/>&user.email=<s:property value="toEmail"/>" target="_blank" onclick="deleteThisRow(this);"><s:property value="orgMeeting.organization.schoolName"/></a>会议</td>
        <td class="td_2"><a href="matterHandler.html?matter.id=<s:property value="id"/>&orgMeeting.id=<s:property value="orgMeeting.id"/>&matter.type=<s:property value="type"/>&matter.email=<s:property value="email"/>&user.email=<s:property value="toEmail"/>" target="_blank" onclick="deleteThisRow(this);">接受</a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">忽略</a></td>
    </tr>
    </s:iterator>
    <s:iterator value="courseTeacherMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="course.organization.schoolName"/>指定您为<s:property value="course.name"/>课程的老师，具体信息请查看邮件</td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">确定</a></td>
    </tr>
    </s:iterator>
    <s:iterator value="courseStudentMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="course.organization.schoolName"/>邀请您为<s:property value="course.name"/>课程的学生，具体信息请查看邮件</td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">确定</a></td>
    </tr>
    </s:iterator>

    <s:iterator value="courseStudentNoOrgMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="fromUser.nickName"/>邀请您为<s:property value="course.name"/>课程的学生，具体信息请查看邮件</td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">确定</a></td>
    </tr>
    </s:iterator>

    <s:iterator value="courseInviteMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="fromUser.nickName"/>邀请您参加<a href="voaCourseBlog.html?course.id=<s:property value="course.id"/>" target="_blank"><s:property value="course.name"/></a>实时在线课程</td>
        <td class="td_2"><a href="#" onclick="deleteThisRow(this);"><a href="matterHandler.html?matter.email=<s:property value="email"/>&matter.type=<s:property value="type"/>&matter.id=<s:property value="id"/>" target="_blank" onclick="deleteThisRow(this);">去看看</a></a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">忽略</a></td>
    </tr>
    </s:iterator>
    <s:iterator value="interviewerMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="fromUser.nickName"/>&nbsp;指定您为&nbsp;<s:property value="interview.organization.schoolName"/>&nbsp;面试的面试官</td>
        <td class="td_2"><a href="matterHandler.html?matter.id=<s:property value="id"/>&matter.type=<s:property value="type"/>&interview.id=<s:property value="interview.id"/>&identityType=0&user.email=<s:property value="toEmail"/>" onclick="deleteThisRow(this);">出席</a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">忽略</a></td>
    </tr>
    </s:iterator>
    <s:iterator value="intervieweeMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="fromUser.nickName"/>&nbsp;邀请您出席&nbsp;<s:property value="interview.organization.schoolName"/>&nbsp;面试</td>
        <td class="td_2"><a href="matterHandler.html?matter.id=<s:property value="id"/>&matter.type=<s:property value="type"/>&interview.id=<s:property value="interview.id"/>&identityType=1&user.email=<s:property value="toEmail"/>" onclick="deleteThisRow(this);">出席</a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');">忽略</a></td>
    </tr>
    </s:iterator>
    <tr><td class="td_1">&nbsp;</td><td colspan="2" class="td_3"><a href="#" onclick="deleteAllRow();">全部忽略</a></td></tr>
</table>

<script type="text/javascript">
    function deleteThatRow(obj,id){
        $(obj).parent().parent().remove();
        if(total_message_number>0){
            $("#message_tip_elipse").html(--total_message_number);
            if(total_message_number==0){
                $("#message_tip_elipse").hide();
                $(".message_box").hide();
            }
        }
         $.post('ignoreMatter.html',{"matter.id":id}, function(data) {
         });
    }

    function deleteThisRow(obj){
        $(obj).parent().parent().remove();
        if(total_message_number>0){
            $("#message_tip_elipse").html(--total_message_number);
            if(total_message_number==0){
                $("#message_tip_elipse").hide();
                $(".message_box").hide();
            }
        }


    }

    function deleteAllRow(){
//        if(total_message_number>0){
//            $("#message_tip_elipse").html(0);
//        }
        $("#message_tip_elipse").hide();
        $(".message_box").hide();
        $.post('ignoreAllMatter.html',{});
    }


</script>