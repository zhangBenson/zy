<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/usermenu.css" rel="stylesheet"/>

<div class="menu">
    <div class="portrait">
        <a class="por" href="userBlog.html?user.id=<s:property value="#session.userID"/>" title="<s:text name="user.header.enter.my.blog"/>"><img id="usermenu_user_img" src="<s:property value="#session.userLogoUrl"/>" alt="<s:property value="#session.nickName"/>" /></a>
        <a class="nick" href="userBlog.html?user.id=<s:property value="#session.userID"/>" title="<s:property value="#session.nickName"/>"><s:property value="#session.nickName"/></a>
    </div>
    <div class="sidebar">

        <div class="start_monitor">
            <a class="submit_btn_large" href="myfirstPage.html"><s:text name="title.user.my.gogowise"/></a>
        </div>

        <div class="list">
            <h3 class="h3_title"><s:text name="usermenu.item.mycourses"/></h3>
            <ul>
                <li><a href="createCourseAllInOne.html"><s:text name="usermenu.item.createcourse"/></a></li>
                <li><a href="myForcastClass.html"><s:text name="usermenu.item.my.created.courses"/></a></li>
                <li><a href="myRegistration.html"><s:text name="usermenu.item.my.reged.courses"/></a></li>
            </ul>
        </div>

        <div class="list">
            <h3 class="h3_title"><s:text name="title.game"/></h3>
            <ul>
                <%--<li><a href="myForcastClass.html"><s:text name="usermenu.item.my.created.courses"/></a></li>--%>
                <%--<li><a href="myRegistration.html"><s:text name="usermenu.item.my.reged.courses"/></a></li>--%>

                    <li>
                        <a href="http://games.gogowise.com/VerificationUser.aspx?userid=<s:property value="secUid"/>"
                           target="_blank"><s:text name="title.game.management"/></a></li>
            </ul>
        </div>


        <s:if test="#session.user_own_org != null">
            <div class="list">
                <h3 class="h3_title"><s:text name="usermenu.item.organizationmatters"/></h3>
                <ul>

                    <%--<li><a href="manageStudents.html">Student Management</a></li>--%>
                    <li><a href="manageOrgUsers.html?roleType=6"><s:text name="label.org.studentManagement"/></a></li>
                    <li><a href="manageOrgUsers.html?roleType=5"><s:text name="label.org.teacherManagement"/></a></li>


                        <li><a href="orgInfoUpdate.html"><s:text name="org.information.setting"/></a></li>
                </ul>
            </div>
        </s:if>




        <div class="list">
            <h3 class="h3_title"><s:text name="usermenu.item.user.info.setting"/></h3>
            <ul>
                <li><a href="initUpdate.html"><s:text name="table.base.info"/></a></li>
                <li><a href="myGGWAccount.html"><s:text name="usermenu.item.user.account"/></a></li>
            </ul>
        </div>
    </div>
</div>
