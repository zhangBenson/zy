<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/usermenu.css" rel="stylesheet"/>

<div class="menu">
    <div class="portrait">
        <a class="por" href="userBlog.html?user.id=<s:property value="#session.userID"/>" title="<s:property value="%{getText('user.header.enter.my.blog')}"/>"><img id="usermenu_user_img" src="<s:property value="#session.userLogoUrl"/>" alt="<s:property value="#session.nickName"/>" /></a>
        <a class="nick" href="userBlog.html?user.id=<s:property value="#session.userID"/>" title="<s:property value="#session.nickName"/>"><s:property value="#session.nickName"/></a>
        <span class="num"><s:property value="#session.userFansNum"/>&nbsp;<s:property value="%{getText('user.add.focus')}"/><br/>0&nbsp;<s:property value="%{getText('course.consumptionType.true')}"/></span>
    </div>
    <div class="sidebar">

        <div class="start_monitor">
            <%--<a class="submit_btn_large" href="openUserChannelResult.html"><s:property value="%{getText('contentLeft.param1')}"/></a>--%>
            <a class="submit_btn_large" href="myfirstPage.html"><s:property value="%{getText('contentLeft.param1')}"/></a>
        </div>

        <div class="list">
            <h3 class="h3_title"><s:property value="%{getText('usermenu.item.mycourses')}"/></h3>
            <ul>
                <li><a href="myForcastClass.html"><s:property value="%{getText('usermenu.item.my.created.courses')}"/></a></li>
                <li><a href="myRegistration.html"><s:property value="%{getText('usermenu.item.my.reged.courses')}"/></a></li>

            <%--<li><a href="createCourse.html"><s:property value="%{getText('usermenu.item.createcourse')}"/></a></li>--%>
                <%--<li><a href="createCourseAllInOne.html"><s:property value="%{getText('usermenu.item.createcourse')}"/></a></li>--%>
            </ul>
        </div>

        <div class="list">
            <h3 class="h3_title">Online Meetings</h3>
            <ul>
                <%--<li><a href="myForcastClass.html"><s:property value="%{getText('usermenu.item.my.created.courses')}"/></a></li>--%>
                <%--<li><a href="myRegistration.html"><s:property value="%{getText('usermenu.item.my.reged.courses')}"/></a></li>--%>

                    <li><a href="initCreateMeeting.html">New Meeting</a></li>
                    <li><a href="meetingHome.html">Meeting List</a></li>
                    <%--<li><a href="createCourse.html"><s:property value="%{getText('usermenu.item.createcourse')}"/></a></li>--%>
                    <%--<li><a href="createCourseAllInOne.html"><s:property value="%{getText('usermenu.item.createcourse')}"/></a></li>--%>
            </ul>
        </div>


        <s:if test="#session.user_own_org != null">
            <div class="list">
                <h3 class="h3_title"><s:property value="%{getText('usermenu.item.organizationmatters')}"/></h3>
                <ul>

                    <%--<li><a href="manageStudents.html">Student Management</a></li>--%>
                    <li><a href="manageOrgUsers.html?roleType=6"><s:property value="%{getText('label.org.studentManagement')}"/></a></li>
                    <li><a href="manageOrgUsers.html?roleType=5"><s:property value="%{getText('label.org.teacherManagement')}"/></a></li>
                    <li><a href="createCourseAllInOne.html"><s:property value="%{getText('usermenu.item.createcourse')}"/></a></li>
                    <%--<li><a href="courseSupervise.html"><s:property value="%{getText('org.matters.course.supervisions')}"/></a></li>
                    <li><a href="orgInterview.html"><s:property value="%{getText('online.interview')}"/></a></li>
                    <li><a href="initOrgMeeting.html"><s:property value="%{getText('org.matters.video.meeting')}"/></a></li>--%>
                    <li><a href="orgInfoUpdate.html"><s:property value="%{getText('org.information.setting')}"/></a></li>
                </ul>
            </div>
        </s:if>




        <div class="list">
            <h3 class="h3_title"><s:property value="%{getText('usermenu.item.user.info.setting')}"/></h3>
            <ul>
                <li><a href="setting.html"><s:property value="%{getText('table.base.info')}"/></a></li>
                <li><a href="myGGWAccount.html"><s:property value="%{getText('usermenu.item.user.account')}"/></a></li>
            </ul>
        </div>
    </div>
</div>