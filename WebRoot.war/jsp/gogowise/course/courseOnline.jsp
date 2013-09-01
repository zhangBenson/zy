<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link type="text/css" href="css/course/courseOnline.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript" src="js/jquery.rate.js"></script>


<div class="rightcontent">

             <%--<s:iterator value="courses" status="idx">--%>
              <div class="blogframe">
                  <img src="images/blogindex/courseframetop.gif" />

                  <div class="courseLogo"><img src="images/nopic.jpg" onerror="javascript:this.src='images/nopic.jpg'"/></div>
                  <div class="course_info">
                      <div class="course_tittle">
                          <h6><s:property value="name"/>课程标题--组织名（如果有）</h6>
                          <span class="type2"></span>
                      </div>
                      <div class="course_detail">
                          <table cellpadding="5" cellspacing="5">
                              <tr>
                                  <td>主讲人：<span class="orangeWords">那年此时</span></td>
                                  <td>已注册人数：<span class="orangeWords">20</span></td>
                              </tr>
                              <tr>
                                  <td>第二节课：<span class="orangeWords"><s:date name="finishDate" format="%{getText('dateformat')}"/>2014-3-12 07:00</span></td>
                                  <td>费用：<span class="orangeWords">20知币</span></td>
                              </tr>
                              <tr><td colspan=2>课程简介：<span class="orangeWords">知元网是全国首家致力于云教育的网络平台网络平台网络平台。</span></td></tr>
                          </table>
                      </div>
                      <div class="course_time_left">
                            <s:property value="%{getText('courses.time.left')}" />：<span class="orangeWords" id="timeLeft<s:property value="#idx.index"/>"></span>
                            <script type="text/javascript">
                               $(document).ready(function () {
                                $("#timeLeft<s:property value="#idx.index"/>").countdown({
                                    date:'<s:date name="classOnTheCorner.date" format="%{getText('date.formate.firstpage.course.startdate')}" />',
                                    onChange:function (event, timer) {
                                    },
                                    onComplete:function (event) {
                                        $(this).html("<s:text name='course.in.progress'/>");
                                    },
                                    htmlTemplate: "<span><b>%{d}</b><s:property value="%{getText('course.time.day')}" /><b> %{h}</b><s:property value="%{getText('course.time.hour')}" /><b>%{m}</b><s:property value="%{getText('course.time.minute')}" /><b>%{s}</b><s:property value="%{getText('course.tine.second')}" /></span>",
                                    leadingZero:true,
                                    direction:"down"
                                });
                            });
                            </script>
                      </div>
                      <div class="course_manipulate">
                           <s:a action="startSupervision" cssClass="course_supervise_btn"><s:param name="courseClass.id" value="classOnTheCorner.id"/>开始试听</s:a>
                           <div class="see_all_classes">[<s:property value="%{getText('span.all.course')}" />]</div>
                      </div>
                  </div>
                  <div class="classintro classintro<s:property value='#id.index'/>">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <%--<s:iterator value="forcastClasses">--%>
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
                                      <span class="orangeWords"><s:date name="date" format="%{getText('dateformat.forclass')}"/></span>
                                  </td>
                                  <td>
                                      <s:property value="%{getText('lable.course.endtime')}"/>：
                                      <%--<b><s:date name="finishDate" format="%{getText('dateformat.forclass')}"/></b>--%>
                                      <span class="orangeWords"><s:date name="finishDate" format="%{getText('dateformat.forclass')}"/></span>
                                  </td>
                              </tr>
                          <%--</s:iterator>--%>
                      </table>
                  </div>

                  <img src="images/blogindex/courseframebottom.gif" class="frame1bottom"/>
              </div>
             <%--</s:iterator>--%>

       <%--<tiles:insertTemplate template="../pagination.jsp">--%>
           <%--<tiles:putAttribute name="pagination" value="${pagination}"/>--%>
       <%--</tiles:insertTemplate>--%>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $(".see_all_classes").click(function(){
              $(this).parent().parent().next().slideToggle();
        });
    });
</script>