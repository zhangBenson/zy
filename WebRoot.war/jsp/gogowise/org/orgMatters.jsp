<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link href="css/org/orgMatters.css" rel="stylesheet" type="text/css"/>

<div id="orgmatter_container">
  <div class="orgmatter_innerContainer">
    <div class="orgm_headerWords">
      <p><s:property value="%{getText('welcome.to.organization.center')}"/><span class="welcome_org_name">&nbsp;<s:property value="org.schoolName" /></span></p>
    </div>
    <div class="orgm_options">
      <ul>
        <li>
          <s:a action="orgInterview"><h3><img src="images/org/arrow.png"  /><span><s:property value="%{getText('online.interview')}"/></span></h3></s:a>
          <p><s:property value="%{getText('online.remote.interview')}"/></p>
        </li>
        <li>
          <s:a action="initOrgCourseCreation"><h3><img src="images/org/arrow.png" /><span><s:property value="%{getText('org.create.course')}"/></span></h3></s:a>
          <p><s:property value="%{getText('create.organization.courses')}"/></p>
        </li>
        <%--<li>--%>
          <%--<s:a action="initOrgAuthorization"><h3><img src="images/org/arrow.png" /><span><s:property value="%{getText('human.resourse.management')}"/></span></h3></s:a>--%>
          <%--<p><s:property value="%{getText('manage.all.the.teachers')}"/></p>--%>
        <%--</li>--%>
        <li>
           <s:a action="maintenanceSearchResult"><h3><img src="images/org/arrow.png"  /><span><s:property value="%{getText('usermenu.item.coursemaintenance')}"/></span></h3></s:a>
          <p><s:property value="%{getText('adjust.your.organization.courses')}"/></p>
        </li>
         <li>
          <s:a action="courseSupervise"><h3><img src="images/org/arrow.png"  /><span><s:property value="%{getText('org.matters.course.supervisions')}"/></span></h3></s:a>
          <p><s:property value="%{getText('org.matters.course.supervisions.description')}"/></p>
        </li>
         <li>
          <s:a action="initOrgMeeting"><h3><img src="images/org/arrow.png" /><span><s:property value="%{getText('org.matters.video.meeting')}"/></span></h3></s:a>
          <p><s:property value="%{getText('org.matters.video.meeting.description')}"/></p>
        </li>
        <%--<li>--%>
           <%--<s:a action="orgAuthorization" id="iniOrgLink" ><h3><img src="images/org/arrow.png" /><span>组织授权</span></h3></s:a>--%>
          <%--<p><s:property value="%{getText('join.us')}"/></p>--%>
        <%--</li>--%>
         <li>
               <s:a action="orgInfoUpdate"><h3><img src="images/org/arrow.png" /><span><s:property value="%{getText('org.information.setting')}"/></span></h3></s:a>
               <p><s:property value="%{getText('org.information.setting.content')}"/></p>
         </li>
      </ul>
    </div>
  </div>
</div>
<s:if test="1 == orgRoleType">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#iniOrgLink').attr('disabled', true)
        })
    </script>
</s:if>