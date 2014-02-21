<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link href="css/org/orgAuthorization.css" rel="stylesheet" type="text/css"/>

<div class="org_authorization_container">
  <div class="auth_upper"><p>尊敬的组织负责人,您好！<br/><br/>您可以将自己的组织开课权限授权给您组织内的可信任的老师，这样可以减轻您的业务负担！</p></div>
  <div class="auth_left">
      <div class="auth_left_1">
          <div class="auth_list">
              <table>
                  <tr class="teacher_tittle">
                      <%--<td class="td_portrait">头像</td>--%>
                      <td class="td_email">邮箱<td/>
                      <td class="td_nickname">昵称</td>
                      <td class="td_haveAuthor">已授权</td>
                      <td class="author_td">授权</td>
                      <td class="td_fire">开除</td>
                  </tr>

                  <s:iterator value="orgTeachers" >
                  <tr class="tearcher_content">
                      <%--<td class="td_portrait"><img width="54px" height="54px"--%>
                      <%--src="images/user/default_portrait.png"/></td>--%>
                      <td class="td_email"><s:property value="teacher.email"/> <td/>
                      <td class="td_nickname orangeWords"><s:property value="teacher.nickName"/> </td>
                      <td class="td_haveAuthor">组织开课、组织人事。。。</td>
                      <td class="author_td">
                          <span class="show_author"><span>授权</span><img src="images/arrow_down.gif"/></span>
                          <span class="hide_author_list">
                              <ul>
                                  <li><input name="" type="checkbox" value="">&nbsp;&nbsp;全部</li>
                                  <li><button >确定</button> </li>
                                  <%--<li><input name="" type="checkbox" value="">&nbsp;&nbsp;组织开课</li>--%>
                                  <%--<li><input name="" type="checkbox" value="">&nbsp;&nbsp;课程维护</li>--%>
                                  <%--<li><input name="" type="checkbox" value="">&nbsp;&nbsp;组织人事</li>--%>
                                  <%--<li><input name="" type="checkbox" value="">&nbsp;&nbsp;视频会议</li>--%>
                                  <%--<li><input name="" type="checkbox" value="">&nbsp;&nbsp;组织面试</li>--%>
                              </ul>
                          </span>
                      </td>
                      <td class="td_fire">开除该老师</td>
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

      <s:form  id="form1" method="POST" validate="true" theme="css_xhtml" action="saveOrgAuthorization">
      <div class="auth_left_2">
          <div class="addlist">
              <div>
                  <span class="_add_btn">添加老师</span>
              </div>
              <table>
                  <tr class="tittle">
                      <td><span class="option_tittle">邮箱</span><span class="authorization_input_msg input_msg"></span></td>
                      <td>昵称</td>
                      <td>授权</td>
                  </tr>
                  <tr class="addlist_msg_tr">
                      <td class="addlist_input">
                      <s:textfield name="orgTeacher.teacher.email"  onblur='checkAuthorizationEmail(this);' cssClass="authorization_input" />
                      <!--<input onblur='checkAuthorizationEmail(this);' class="authorization_input" type="text"/>-->
                      </td>
                      <td class="addlist_input">
                       <s:textfield name="orgTeacher.teacher.nickName" cssClass="authorization_input" />
                      <!--<input class="authorization_input" type="text"/>-->
                      </td>
                      <td class="author_td">
                          <span class="show_author"><span>授权</span><img src="images/arrow_down.gif"/></span>
                          <span class="hide_author_list">
                              <ul>
                                  <li>
                                      <s:checkbox name="orgTeacher.orgRoleType" />
                                      <%--<input name="" type="checkbox" value="0">--%>
                                      &nbsp;&nbsp;全部
                                  </li>
                                  <li><button >确定</button> </li>
                              </ul>
                          </span>
                      </td>
                  </tr>
              </table>
          </div>
          </s:form>
          <div class="auth_left_4"><input type="submit" value="保存修改" onclick="javascript:document.getElementById('form1').submit();" /></div>
      </div>
  </div>
</div>

<script type="text/javascript">
    var errorDiv = "<div class='tip_error'></div>";
    var warnDiv = "<div class='tip_warn'></div>";
    var rightDiv = "<div class='tip_right'></div>";
    var msgEmpty = "授权信息不能为空";
    var  emailEmpty="<s:text name='interview.email.invalid'/>";
    var emailError="<s:text name='interview.time.invalid1'/>";
    var officerAuthorizationSameError = "被授权老师的邮箱不能是自己的邮箱";


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
                 var officer = $(".authorization_input").val().replace(/(^\s*)|(\s*$)/g, "");
//                 if(emailContent == officer){
//                     alert($(".authorization_input")[0].outerHTML);
//                     alert(officer);
//                    $(".authorization_input_msg").html("<div class='error'></div>"+officerAuthorizationSameError);
//                    return false;
//                 }
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
        var flag = true;
        var emails = $(".interviewee_input");
        for(var i=0;i<emails.length;i++){
           flag = flag&&checkAuthorizationEmail(emails[i]);
        }
        return flag;
    }
    function showHideAuthList(obj){
        $(obj).next(".hide_author_list").toggle();
    }
    $(document).ready(function() {
        $("._add_btn").click(function() {
            $(".auth_left_2 .addlist table").append("<tr><td class='addlist_input'><input onblur='checkAuthorizationEmail(this);' class='authorization_input' type='text'/></td>"
                    +"<td  class='addlist_input'><input class='authorization_input' type='text'/>"
                    +"<td class='author_td'><span class='show_author' onclick='showHideAuthList(this);'><span>授权</span><img src='images/arrow_down.gif'/></span>"
                    +"<span class='hide_author_list'><ul><li><input name='' type='checkbox' value=''>&nbsp;&nbsp;全部</li><li><input name='' type='checkbox' value=''>&nbsp;&nbsp;组织开课</li><li><input name='' type='checkbox' value=''>&nbsp;&nbsp;课程维护</li>"
                    +"<li><input name='' type='checkbox' value=''>&nbsp;&nbsp;组织人事</li><li><input name='' type='checkbox' value=''>&nbsp;&nbsp;视频会议</li><li><input name='' type='checkbox' value=''>&nbsp;&nbsp;组织面试</li></ul></span>"
                    +"<span onclick='removeInput(this);' class='delete_btn'>删除</span></td></tr>");
        });

        $(".show_author").click(function(){
            $(this).next(".hide_author_list").toggle();
        });

    });
</script>