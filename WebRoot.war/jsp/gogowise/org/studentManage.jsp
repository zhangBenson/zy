<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link href="css/org/orgAuthorization.css" rel="stylesheet" type="text/css"/>

<div class="org_authorization_container">
    <div class="auth_upper">
        <h3><s:property value="%{getText('org.student.management')}"/></h3>
        <br/>

        <p><s:property value="%{getText('org.student.regret')}"/></p>
    </div>
    <div class="auth_left">
        <div class="auth_left_1">
            <div class="auth_list">
                <table width="760">
                    <tr>
                        <td><s:property value="%{getText('email')}"/></td>
                        <td><s:property value="%{getText('menber.reg.nickName')}"/></td>
                        <td><s:property value="%{getText('label.realname')}"/></td>
                        <td><s:property value="%{getText('orgleague.info.mobile')}"/></td>
                        <td><s:property value="%{getText('sex')}"/></td>
                        <td><s:property value="%{getText('label.status')}"/></td>
                        <td><s:property value="%{getText('label.operation')}"/></td>
                    </tr>

                    <s:iterator value="orgUsers">
                        <tr>
                            <td><s:property value="email"/></td>
                            <td class="orangeWords"><s:property value="user.nickName"/></td>
                            <td><s:property value="realName"/></td>
                            <td><s:property value="user.telphone"/></td>
                            <td><s:property value="user.sexy?getText('male'):getText('female')"/></td>
                            <td>
                                <s:if test="userStatus==1">
                                    <s:property value="%{getText(titile.user.invite.status.unconfirmed)}"/>
                                </s:if>
                                <s:elseif test="userStatus==3">
                                    <s:property value="%{getText(title.user.status.confirmed)}"/>
                                </s:elseif>
                                <s:elseif test="userStatus==4">
                                    <s:property value="%{getText(title.user.status.disabled)}"/>
                                </s:elseif>
                                <s:else>
                                    <s:property value="%{getText(title.user.status.refused)}"/>
                                </s:else>
                            </td>
                            <td>
                                <s:if test="userStatus == 1">
                                    <a href="javascript:;" onclick="reInviteUser(this);"><s:property
                                            value="%{getText(title.org.user.reinvite)}"/></a>&nbsp;
                                    <a href="javascript:;"
                                       onclick="deleteUser(this,  <s:property value="id"/>);"><s:property
                                            value="%{getText('course.class.delete')}"/></a>
                                </s:if>
                                <s:elseif test="userStatus==3">
                                    <a href="javascript:;"
                                       onclick="deleteUser(this, <s:property value="id"/>);"><s:property
                                            value="%{getText('course.class.delete')}"/></a>
                                </s:elseif>
                            </td>
                        </tr>
                    </s:iterator>

                </table>
            </div>
        </div>

        <div class="auth_left_2" <s:if test="orgUsers.size<=30"> style="margin-top:15px;"</s:if> >
            <s:if test="orgUsers.size>30">
                <tiles:insertTemplate template="../pagination.jsp">
                    <tiles:putAttribute name="pagination" value="${pagination}"/>
                </tiles:insertTemplate>
            </s:if>
        </div>

        <s:form id="form1" method="POST" validate="false" theme="simple" action="saveOrgUser"
                onsubmit="return checkAuthorizationEmails();">
            <s:hidden name="roleType" value="6"/>
            <div class="auth_left_2">
                <div class="addlist">
                    <div>
                        <span class="_add_btn" id="add_one_btn"><s:property value="%{getText('interview.add')}"/></span>&nbsp;<span><s:property
                            value="%{getText('org.student.one')}"/></span>
                        <span class="_add_btn" id="add_more_btn"><s:property
                                value="%{getText('interview.add')}"/>&nbsp;</span>
                        <input type="text" id="more_user_input"
                               style="width:50px;height:26px;margin-left:5px;"/>&nbsp;<s:property
                            value="%{getText('org.student.unit')}"/>&nbsp;
                        <span id="more_user_input_msg" style="color:red;"></span>
                    </div>
                    <table>
                        <tr class="tittle">
                            <td><span class="option_tittle"><s:property value="%{getText('email')}"/></span><span
                                    class="authorization_input_msg input_msg"></span></td>
                            <td><span class="option_tittle"><s:property
                                    value="%{getText('label.realname')}"/></span><span
                                    class="authorization_realName_input_msg input_msg"></span></td>
                            <td></td>
                        </tr>
                        <tr class="addlist_msg_tr">
                            <td class="addlist_input">
                                <input type="text" name="orgUsers[0].email" onblur='checkAuthorizationEmail(this);'
                                       class="authorization_input"/>
                            </td>
                            <td class="addlist_input">
                                <input type="text" name="orgUsers[0].realName" class='authorization_realName_input'/>
                            </td>
                            <td class="author_td">
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="auth_left_4">
                    <s:submit value="%{getText('org.student.store')}"/>
                </div>
            </div>
        </s:form>
    </div>
</div>

<script type="text/javascript">
    var userIndex = 1;
    var errorDiv = "<div class='tip_error'></div>";
    var warnDiv = "<div class='tip_warn'></div>";
    var rightDiv = "<div class='tip_right'></div>";
    var emailEmpty = "<s:text name='interview.email.invalid'/>";
    var realNameEmpty = "<s:text name='messege.realname.empty'/>";
    var emailError = "<s:text name='interview.time.invalid1'/>";
    var officerAuthorizationSameError = "<s:text name='org.user.tip.not.responser'/>";
    var label_not_empty = "<s:text name='label.not.empty'/>";
    var label_pls_valid_number = "<s:text name='label.pls.valid.number'/>";
    var org_student_disable_tip = "<s:text name='org.student.disable.tip'/>";
    var org_student_enable_tip = "<s:text name='org.student.enable.tip'/>";
    var org_student_delete_tip = "<s:text name='org.student.delete.tip'/>";
    var org_student_reinvite_tip = "<s:text name='org.student.reinvite.tip'/>"
    var org_student_store = "<s:text name='org.student.store'/>";
    var org_student_tip_number_limit = "<s:text name='org.student.tip.number.limit'><s:param>30</s:param></s:text>";
    var org_user_disable_fail_tip = "<s:text name='org.user.disable.fail.tip'/>";
    var org_user_enable_fail_tip = "<s:text name='org.user.enable.fail.tip'/>";
    var org_user_delete_fail_tip = "<s:text name='org.user.delete.fail.tip'/>";
    var org_user_reinvite_fail_tip = "<s:text name='org.user.reinvite.fail.tip'/>";
    var org_user_tip_not_responser = "<s:text name='org.user.tip.not.responser'/>";

    var user_status_unconfirmed = "<s:text name='title.user.invite.status.unconfirmed'/>";
    var user_status_confirmed = "<s:text name='title.user.invite.status.confirmed'/>";
    var user_status_disabled = "<s:text name='title.user.invite.status.disabled'/>";
    var user_status_refused = "<s:text name='title.user.invite.status.refused'/>";

    var org_user_reinvite = "<s:text name='title.user.invite.user.reinvite'/>";
    var org_user_disable = "<s:text name='org.user.disable'/>";
    var org_user_enable = "<s:text name='org.user.enable'/>";
    var org_user_delete = "<s:text name='course.class.delete'/>";

    function disableUser(obj) {
        if (!confirm(org_student_disable_tip)) {
            return;
        }
        var $userTds = $(obj).parents("tr").children("td");
        var userEmail = $userTds.eq(0).text();
        $.post("disableUser.html", {"user.email": userEmail, "roleType": 6}, function (rd) {
            if (rd.result == 200) {
                $userTds.eq(5).html("Disabled");
                $userTds.eq(6).html('<a href="javascript:;" onclick="enableUser(this);">' + org_user_enable + '</a>&nbsp;<a href="javascript:;" onclick="deleteUser(this);">' + org_user_delete + '</a>');
                return;
            }
            alert(org_user_disable_fail_tip);
        });
    }
    function enableUser(obj) {
        if (!confirm(org_student_enable_tip)) {
            return;
        }
        var $userTds = $(obj).parents("tr").children("td");
        var userEmail = $userTds.eq(0).text();
        $.post("enableUser.html", {"user.email": userEmail, "roleType": 6}, function (rd) {
            if (rd.result == 200) {
                var userStatus;
                if (rd.data == 1) {
                    userStatus = user_status_unconfirmed;
                } else if (rd.data == 2) {
                    userStatus = user_status_refused;
                } else {
                    userStatus = user_status_confirmed;
                }
                $userTds.eq(5).html(userStatus);
                $userTds.eq(6).html('<a href="javascript:;" onclick="disableUser(this);">' + org_user_disable + '</a>&nbsp;<a href="javascript:;" onclick="deleteUser(this);">' + org_user_delete + '</a>');
                return;
            }
            alert(org_user_enable_fail_tip);
        });
    }
    function deleteUser(obj, id) {
        if (!confirm(org_student_delete_tip)) {
            return;
        }
        var $userTds = $(obj).parents("tr").children("td");
        var userEmail = $userTds.eq(0).text();
        $.post("deleteUser.html", {"user.email": userEmail, "roleType": 6, 'orgUser.id': id}, function (rd) {
            if (rd.result == 200) {
                $userTds.eq(0).parent().remove();
                return;
            }
            alert(org_user_delete_fail_tip);
        });
    }
    function reInviteUser(obj) {
        if (!confirm(org_student_reinvite_tip)) {
            return;
        }
        var $userTds = $(obj).parents("tr").children("td");
        var userEmail = $userTds.eq(0).text();
        $.post("reInviteUser.html", {"user.email": userEmail, "roleType": 6}, function (rd) {
            if (rd.result == 200) {
                $userTds.eq(5).html(user_status_unconfirmed);
//                $userTds.eq(6).html('<a href="javascript:;" onclick="disableUser(this);">' + org_user_disable + '</a>&nbsp;<a href="javascript:;" onclick="deleteUser(this);">' + org_user_delete + '</a>');
                return;
                return;
            }
            alert(org_user_reinvite_fail_tip);
        });
    }
    function removeInput(obj) {
        $(obj).parent().parent().remove();
    }
    function checkAuthorizationEmail(obj) {
        $(".authorization_input_msg").html("");
        var emailContent = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
        if (emailContent == "") {
            $(".authorization_input_msg").html(errorDiv + emailEmpty);
            return false;
        } else {
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            if (!pattern.test(emailContent)) {
                $(".authorization_input_msg").html(errorDiv + emailError);
                return false;
            } else {
                var officer = "<s:property value="#session.email"/>";
                if (emailContent == officer) {
                    $(".authorization_input_msg").html(errorDiv + officerAuthorizationSameError);
                    return false;
                }
                var mySession = "<s:property value="#session.email"/>";
                if (emailContent == mySession) {
                    $(".authorization_input_msg").html(warnDiv + "<s:text name='course.email.input.myself'/>");
                    return false;
                }
                $(obj).attr("value", emailContent);
            }
        }
        $(".authorization_input_msg").html(rightDiv);
        return true;
    }
    function checkAuthorizationEmails() {
        var emails = document.getElementsByClassName("authorization_input");
        for (var i = 0; i < emails.length; i++) {
            if (!checkAuthorizationEmail(emails[i])) {
                return false;
            }
        }
        var realNames = document.getElementsByClassName("authorization_realName_input");
        for (var j = 0; j < realNames.length; j++) {
            if ($(realNames[j]).val() == "") {
                $(".authorization_realName_input_msg").html(errorDiv + realNameEmpty);
                return false;
            }
        }

        return true;
    }
    $(document).ready(function () {
        $("#add_one_btn").click(function () {
            $(".auth_left_2 .addlist table").append("<tr><td class='addlist_input'><input name='orgUsers[" + userIndex + "].email' onblur='checkAuthorizationEmail(this);' class='authorization_input' type='text'/></td>"
                    + "<td  class='addlist_input'><input name='orgUsers[" + userIndex + "].realName' class='authorization_realName_input' type='text'/>"
                    + "<td class='author_td'><span onclick='removeInput(this);' class='delete_btn'>" + org_user_delete + "</span></td></tr>");
            userIndex++;
        });

        $("#add_more_btn").unbind("click");
        $("#add_more_btn").bind("click", function () {
            if (!checkNumber('more_user_input', 'more_user_input_msg', label_not_empty, label_pls_valid_number)) {
                return;
            }

            var number = $("#more_user_input").val();
            if (number > 30) {
                $("#more_user_input_msg").html(org_student_tip_number_limit);
                return;
            }
            for (var i = 0; i < number; i++) {
                $(".auth_left_2 .addlist table").append("<tr><td class='addlist_input'><input name='orgUsers[" + userIndex + "].email' onblur='checkAuthorizationEmail(this);' class='authorization_input' type='text'/></td>"
                        + "<td  class='addlist_input'><input name='orgUsers[" + userIndex + "].realName' class='authorization_realName_input' type='text'/>"
                        + "<td class='author_td'><span onclick='removeInput(this);' class='delete_btn'>" + org_user_delete + "</span></td></tr>");
                userIndex++;
            }
        });
    });
</script>