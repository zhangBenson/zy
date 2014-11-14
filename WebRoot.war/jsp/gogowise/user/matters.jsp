<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<table id="message_table">
    <tr class="tr_x"><td colspan="3" class="td_0"><s:text name="title.matters.courseRelated"/></td></tr>
    <tr><td class="td_1">&nbsp;</td><td colspan="2" class="td_3"><a href="#" onclick="deleteAllRow();"><s:text name="title.matters.markAllAsRead"/></a></td></tr>


    <s:iterator value="courseRegisterMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="%{getText('title.matters.course.register',{fromUser.nickName})}"/>
            <a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);"><s:property value="course.name"/></a></td>
        <td class="td_2"><a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);"><s:text name="title.matters.confim"/></a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');"><s:text name="title.matters.ignore"/></a></td>
    </tr>
    </s:iterator>
    <s:iterator value="courseResourceMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="%{getText('title.matters.course.upload',{fromUser.nickName})}"/>
            <a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);"><s:property value="course.name"/></a></td>
        <td class="td_2"><a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);">去下载</a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');"><s:text name="title.matters.ignore"/></a></td>
    </tr>
    </s:iterator>


    <tr class="tr_x"><td colspan="3" class="td_0"><s:text name="title.matters.messages"/></td></tr>
    <s:iterator value="CourseMessageMatters" status="idx">
     <tr>
        <td class="td_1"><s:property value="%{getText('title.matters.course.leave.message',{fromUser.nickName})}"/>
            <a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);"><s:property value="course.name"/></a></td>
        <td class="td_2"><a href="matterHandler.html?matter.id=<s:property value="id"/>&course.id=<s:property value="course.id"/>&matter.type=<s:property value="type"/>" target="_blank" onclick="deleteThisRow(this);">回复</a></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');"><s:text name="title.matters.ignore"/></a></td>
    </tr>
    </s:iterator>


    <tr class="tr_x"><td colspan="3" class="td_0"><s:text name="title.matters.invitations"/></td></tr>

    <s:iterator value="courseTeacherMatters" status="idx">
    <tr>
        <td class="td_1"><s:text name="title.matters.appointTeacher"/>&nbsp;
            <s:property value="course.name"/>
            <s:text name="title.matters.appointTeacherBy"/>
            <s:property value="course.organization.schoolName"/></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');"><s:text name="title.matters.confim"/></a></td>
    </tr>
    </s:iterator>
    <s:iterator value="courseStudentMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="%{getText('title.matters.course.invite',{course.organization.schoolName})}"/>&nbsp;
            <s:property value="course.name"/></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');"><s:text name="title.matters.confim"/></a></td>
    </tr>
    </s:iterator>

    <s:iterator value="courseStudentNoOrgMatters" status="idx">
    <tr>
        <td class="td_1"><s:property value="%{getText('title.matters.course.invite',{fromUser.nickName})}"/>&nbsp;
            <s:property value="course.name"/></td>
        <td class="td_2"><a href="#" onclick="deleteThatRow(this,'<s:property value="id"/>');"><s:text name="title.matters.confim"/></a></td>
    </tr>
    </s:iterator>


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
