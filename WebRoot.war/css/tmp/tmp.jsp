<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div id="banner">
    <div class="contentdiv">
        <ul class="contentul">
            <li class="leftli">
                <ul class="leftcontentul">
                    <li class="peopleli">
                        <span class="peoplephoto">
                            <s:a action="initUpdate" target="_blank"><img src="<s:property value='#session.userLogoUrl'/>" id="usermenu_user_img" class="portraitImg"/></s:a>
                        </span>
                        <span class="peoplename">
                            <s:a action="userBlog"><s:param name="user.id" value="#session.userID"/><s:property value="#session.nickName"/></s:a>
                        </span>
                        <span class="peopleaddress"></span>
                        <%--<span class="attention">276<br/>关注</span>--%>
                        <%--<span class="split"></span>--%>
                        <%--<span class="students">276<br/>学生</span>--%>
                    </li>
                    <li class="leftmenuli1">
                        <ul>
                            <%--<div class="menuItems">--%>
                                <%--<s:a action="myfirstPage">--%>
                                <%--<li class="menuli" <s:if test="operaType==1">style="color: #cc6600;"</s:if>>--%>
                                    <%--&lt;%&ndash;<img src="images/usermenu/icon_14.png"/>&ndash;%&gt;<s:property value="%{getText('usermenu.item.myhomepage')}" />--%>
                                <%--</li>--%>
                            <%--</s:a></div>--%>
                            <div class="menuItems">
                                <s:a action="showMatters">
                                <li class="menuli" <s:if test="operaType==13">style="color: #cc6600;"</s:if>>
                                    <%--<img src="images/usermenu/icon_14.png"/>--%>我的秀
                                </li>
                            </s:a></div>
                            <div class="menuItems">
                                <s:a action="initMyOnlive">
                                <li class="menuli" <s:if test="operaType==14">style="color: #cc6600;"</s:if>>
                                    <%--<img src="images/usermenu/icon_14.png"/>--%>我的直播
                                </li>
                            </s:a></div>
                            <div class="menuItems">
                                <s:a action="myForcastClass">
                                <li class="menuli" <s:if test="operaType==11">style="color: #cc6600;"</s:if>>
                                    <%--<img src="images/usermenu/icon_02.png"/>--%><s:property value="%{getText('usermenu.item.mycourses')}" />
                                </li>
                                </s:a>
                            </div>
                            <div class="menuItems forcastClass">
                                <s:a action="forcastClass">
                                <li class="menuli" <s:if test="operaType==2">style="color: #cc6600;"</s:if>>
                                    <%--<img src="images/usermenu/icon_03.png"/>--%><s:property value="%{getText('usermenu.item.newestcourses')}" /></li>
                                 </s:a>
                            </div>
                            <div class="menuItems">
                                <s:a action="livingClass">
                                <li class="menuli" <s:if test="operaType==3">style="color: #cc6600;"</s:if>>
                                   <%-- <img src="images/usermenu/icon_04.png"/>--%><s:property value="%{getText('usermenu.item.courseonline')}" /></li>
                                </s:a>
                            </div>
                             <div class="menuItems"><s:a action="ageClass">
                                <li class="menuli" <s:if test="operaType==6">style="color: #cc6600;"</s:if>>
                                    <%--<img src="images/usermenu/icon_05.png"/>--%><s:property value="%{getText('usermenu.item.coursesretrospect')}" /></li>
                            </s:a></div>
                             <%--<div class="menuItems"><li class="menuli"><s:property value="%{getText('usermenu.item.allcourse')}" /></li></div>--%>
                            <div class="menuItems">
                                <s:a action="createCourse">
                                <li class="menuli" <s:if test="operaType==4">style="color: #cc6600;"</s:if>>
                                    <%--<img src="images/usermenu/icon_06.png"/>--%><s:property value="%{getText('usermenu.item.createcourse')}" /></li>
                                </s:a>
                            </div>
                            <div class="menuItems"><s:a action="maintenanceSearchResult">
                                <li class="menuli" <s:if test="operaType==5">style="color: #cc6600;"</s:if>>
                                    <%--<img src="images/usermenu/icon_07.png"/>--%><s:property value="%{getText('usermenu.item.coursemaintenance')}" /></li>
                            </s:a></div>
                            <div class="menuItems">
                                <s:a action="organizationMatter">
                                     <li class="menuli" <s:if test="operaType==12">style="color: #cc6600;"</s:if>>
                                         <%--<img src="images/usermenu/icon_08.png"/>--%><s:property value="%{getText('usermenu.item.organizationmatters')}" />
                                     </li>
                                </s:a>
                           </div>
                           <div id="masterdiv">
                                 <div class="menutitle" onclick="SwitchMenu()" style="cursor:pointer;" >
                                     <li id="huiyuan" class="menuli">
                                         <s:property value="%{getText('usermenu.item.memberfunctions')}" /></li>
                                 </div>
                                 <div class="extendArea">
                                     <span class="submenu" id="sub2">
                                           <a href="#"><li class="menuli"><%--<img src="images/usermenu/icon_09.png"/>--%><s:property value="%{getText('usermenu.item.datacenter')}" /></li></a><br>
                                           <s:a action="regCourseSystem"><li class="menuli"><%--<img src="images/usermenu/icon_10.png"/>--%><s:property value="%{getText('usermenu.item.refunding')}" /></li></s:a><br>
                                           <s:a action="initConsumption"><li class="menuli"><%--<img src="images/usermenu/icon_11.png"/>--%><s:property value="%{getText('usermenu.item.history')}" /></li></s:a>
                                     </span>
                                 </div>
                            </div>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>