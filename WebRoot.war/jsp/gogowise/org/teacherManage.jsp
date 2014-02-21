<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link href="css/org/orgAuthorization.css" rel="stylesheet" type="text/css"/>

<div class="org_authorization_container">
  <div class="auth_upper"><p>尊敬的组织负责人,您好！您可以在这里管理您的老师！</p></div>
  <div class="auth_left">
      <div class="auth_left_1">
          <div class="auth_list">
              <table width="760">
                  <tr>
                      <td>Email</td>
                      <td>Nick name</td>
                      <td>Real name</td>
                      <td>Telphone</td>
                      <td>Gender</td>
                      <td>Status</td>
                      <td>Operation</td>
                  </tr>

                  <s:iterator value="orgTeachers">
                  <tr>
                      <td><s:property value="teacher.email"/></td>
                      <td class="orangeWords"><s:property value="teacher.nickName"/> </td>
                      <td><s:property value="teacher.userName"/></td>
                      <td><s:property value="teacher.telphone"/></td>
                      <td><s:property value="teacher.sexy?getText('male'):getText('female')"/></td>
                      <td>
                          <s:if test="teacherStatus==1">
                            未确认
                          </s:if>
                          <s:elseif test="teacherStatus==3">
                            确认
                          </s:elseif>
                          <s:elseif test="teacherStatus==4">
                            Disabled
                          </s:elseif>
                          <s:else>
                             拒绝
                          </s:else>
                      </td>
                      <td>
                          <s:if test="teacherStatus in {1,3}">
                              <a href="javascript:;" onclick="disableTeacher(this);">Disable</a>&nbsp;
                              <a href="javascript:;" onclick="deleteTeacher(this);">Delete</a>
                          </s:if>
                          <s:elseif test="teacherStatus==4">
                              <a href="javascript:;" onclick="enableTeacher(this);">Enable</a>&nbsp;
                              <a href="javascript:;" onclick="deleteTeacher(this);">Delete</a>
                          </s:elseif>
                          <s:else>
                              <a href="javascript:;" onclick="reInviteTeacher(this);">重新邀请</a>&nbsp;
                          </s:else>
                      </td>
                  </tr>
                  </s:iterator>

              </table>
          </div>
      </div>

      <div class="auth_left_2">
          <tiles:insertTemplate template="../pagination.jsp">
              <tiles:putAttribute name="pagination" value="${pagination}"/>
          </tiles:insertTemplate>
      </div>

      <s:form  id="form1" method="POST" validate="false" theme="simple" action="saveOrgAuthorization" onsubmit="return checkAuthorizationEmails();">
      <div class="auth_left_2">
          <div class="addlist">
              <div>
                  <span class="_add_btn" id="add_one_btn">添加</span>&nbsp;<span>1位老师</span>
                  <span class="_add_btn" id="add_more_btn">添加&nbsp;</span>
                  <input type="text" id="more_teacher_input" style="width:50px;height:26px;margin-left:5px;"/>&nbsp;位老师&nbsp;
                  <span id="more_teacher_input_msg" style="color:red;"></span>
              </div>
              <table>
                  <tr class="tittle">
                      <td><span class="option_tittle">Email</span><span class="authorization_input_msg input_msg"></span></td>
                      <td>Real name</td>
                      <td></td>
                  </tr>
                  <tr class="addlist_msg_tr">
                      <td class="addlist_input">
                          <input type="text" name="orgTeachers[0].teacher.email"  onblur='checkAuthorizationEmail(this);' class="authorization_input" />
                      </td>
                      <td class="addlist_input">
                        <input type="text" name="orgTeachers[0].teacher.userName" />
                      </td>
                      <td class="author_td">
                      </td>
                  </tr>
              </table>
          </div>
          <div class="auth_left_4">
              <s:submit value="保存老师"/>
          </div>
      </div>
      </s:form>
  </div>
</div>

<script type="text/javascript">
    var teacherIndex = 1;
    var errorDiv = "<div class='tip_error'></div>";
    var warnDiv = "<div class='tip_warn'></div>";
    var rightDiv = "<div class='tip_right'></div>";
    var msgEmpty = "授权信息不能为空";
    var  emailEmpty="<s:text name='interview.email.invalid'/>";
    var emailError="<s:text name='interview.time.invalid1'/>";
    var officerAuthorizationSameError = "不能是学校负责人的邮箱";

    function disableTeacher(obj){
        if(!confirm("您确定要停用该学生吗？")){
            return;
        }
        var $teacherTds = $(obj).parents("tr").children("td");
        var teacherEmail = $teacherTds.eq(0).text();
        $.post("disableTeacher.html",{"user.email":teacherEmail},function(rd){
            if(rd.result==200){
                $teacherTds.eq(5).html("Disabled");
                $teacherTds.eq(6).html('<a href="javascript:;" onclick="enableTeacher(this);">Enable</a>&nbsp;<a href="javascript:;" onclick="deleteTeacher(this);">Delete</a>');
                return;
            }
            alert("停用失败，请稍后再试！");
        });
    }
    function enableTeacher(obj){
        if(!confirm("您确定要启用该学生吗？")){
            return;
        }
        var $teacherTds = $(obj).parents("tr").children("td");
        var teacherEmail = $teacherTds.eq(0).text();
        $.post("enableTeacher.html",{"user.email":teacherEmail},function(rd){
            if(rd.result==200){
                var teacherStatus;
                if(rd.data==1){
                    teacherStatus = "未确认";
                }else if(rd.data==2){
                    teacherStatus = "Unaccepted";
                }else{
                    teacherStatus = "已确认";
                }
                $teacherTds.eq(5).html(teacherStatus);
                $teacherTds.eq(6).html('<a href="javascript:;" onclick="disableTeacher(this);">Disable</a>&nbsp;<a href="javascript:;" onclick="deleteTeacher(this);">Delete</a>');
                return;
            }
            alert("启用失败，请稍后再试！");
        });
    }
    function deleteTeacher(obj){
        if(!confirm("您确定要删除该学生吗？")){
            return;
        }
        var $teacherTds = $(obj).parents("tr").children("td");
        var teacherEmail = $teacherTds.eq(0).text();
        $.post("deleteTeacher.html",{"user.email":teacherEmail},function(rd){
            if(rd.result==200){
                $teacherTds.eq(0).parent().remove();
                return;
            }
            alert("删除失败，请稍后再试！");
        });
    }
    function reInviteTeacher(obj){
        if(!confirm("您确定要重新邀请该学生吗？")){
            return;
        }
        var $teacherTds = $(obj).parents("tr").children("td");
        var teacherEmail = $teacherTds.eq(0).text();
        $.post("reInviteTeacher.html",{"user.email":teacherEmail},function(rd){
            if(rd.result==200){
                $teacherTds.eq(5).html("未确认");
                $teacherTds.eq(6).html('<a href="javascript:;" onclick="disableTeacher(this);">Disable</a>&nbsp;<a href="javascript:;" onclick="deleteTeacher(this);">Delete</a>');
                return;
                return;
            }
            alert("重新邀请失败，请稍后再试！");
        });
    }
    function removeInput(obj) {
        $(obj).parent().parent().remove();
    }
    function checkAuthorizationEmail(obj){
         $(".authorization_input_msg").html("");
        var emailContent = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
         if(emailContent==""){
             $(".authorization_input_msg").html(errorDiv +emailEmpty);
             return false;
         }else{
             var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
             if(!pattern.test(emailContent)){
                 $(".authorization_input_msg").html(errorDiv +emailError);
                  return false;
             }else{
                 var officer = "<s:property value="#session.email"/>";
                 if(emailContent == officer){
                    $(".authorization_input_msg").html(errorDiv+officerAuthorizationSameError);
                    return false;
                 }
                 var mySession = "<s:property value="#session.email"/>";
                 if(emailContent == mySession){
                     $(".authorization_input_msg").html(warnDiv + "<s:text name='course.email.input.myself'/>");
                     return false;
                 }
                 $(obj).attr("value",emailContent);
             }
         }
        $(".authorization_input_msg").html(rightDiv);
        return true;
    }
    function checkAuthorizationEmails(){
        var emails = document.getElementsByClassName("authorization_input");
        for(var index in emails){
            if(!checkAuthorizationEmail(emails[index])){
                return false;
            }
        }
        return true;
    }
    $(document).ready(function() {
        $("#add_one_btn").click(function() {
            $(".auth_left_2 .addlist table").append("<tr><td class='addlist_input'><input name='orgTeachers["+teacherIndex+"].teacher.email' onblur='checkAuthorizationEmail(this);' class='authorization_input' type='text'/></td>"
                    +"<td  class='addlist_input'><input name='orgTeachers["+teacherIndex+"].teacher.userName' type='text'/>"
                    +"<td class='author_td'><span onclick='removeInput(this);' class='delete_btn'>删除</span></td></tr>");
            teacherIndex++;
        });

        $("#add_more_btn").unbind("click");
        $("#add_more_btn").bind("click",function(){
            if(!checkNumber('more_teacher_input','more_teacher_input_msg','请输入有效正整数','请输入有效正整数')){
                return;
            }

            var number = $("#more_teacher_input").val();
            if(number>50){
                $("#more_teacher_input_msg").html("1次最多添加50个学生");
                return;
            }
            for(var i=0;i<number;i++){
                $(".auth_left_2 .addlist table").append("<tr><td class='addlist_input'><input name='orgTeachers["+teacherIndex+"].teacher.email' onblur='checkAuthorizationEmail(this);' class='authorization_input' type='text'/></td>"
                        +"<td  class='addlist_input'><input name='orgTeachers["+teacherIndex+"].teacher.userName' type='text'/>"
                        +"<td class='author_td'><span onclick='removeInput(this);' class='delete_btn'>删除</span></td></tr>");
                teacherIndex++;
            }
        });
    });
</script>