<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<!doctype html>
<%--<html lang="en">--%>
<%--<head>--%>
<%--<meta charset="UTF-8">--%>
<%--<title>UserBlog</title>--%>
<%--</head>--%>
<%--<body>--%>
<div class="container">
    <div class="thinline"></div>
    <div class="row">
        <div class="col-sm-8">

            <div id="lecturerInfo">
                <%--<img src="gogowisestyle/image/largeportrait.jpg" class="lecturerPortrait">--%>
                <img src="<s:property value="user.pic" />" class="lecturerPortrait" />
                <h1 class = "lecturerName"><s:property value="user.nickName"/></h1>

                <h4 class="courseBody">
                    <s:property value="user.selfDescription"/>
                </h4>

            </div>
            <div style="clear: left">
            </div>

            <div class="thickline"></div>
            <h3 class="courseSubhead">Responsible Course</h3>
            <%--<h3 class="courseSubhead"><s:property value="%{getText('user.created.courses',{user.nickName})}"/></h3>--%>
            <div id="schoolcurriculum">

                <s:iterator value="coursesAsTeacher" status="status">

                    <s:if test="#status.index % 3 == 0">
                        <div class="row">
                    </s:if>

                    <div class="col-sm-4">
                        <s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>
                        <div class="recommended">
                            <img src="<s:property value="logoUrl"/>" />
                                <%--<a href="#">--%>
                                <%--<img src="gogowisestyle/image/recommended4.jpg" alt="">--%>
                                <%--</a>--%>
                            <br/>
                            <span><s:param name="course.id" value="id"/><s:property value="name"/></span>
                            
                        </div>
                        </s:a>
                    </div>

                    <s:if test="#status.index % 3 == 2||#status.last">
                        </div>
                    </s:if>
                </s:iterator>
                <%--<div class="row">--%>
                <%--<div class="col-sm-4">--%>
                <%--<div class="recommended">--%>
                <%--<a href="#">--%>
                <%--<img src="gogowisestyle/image/recommended4.jpg" alt="">--%>
                <%--</a>--%>
                <%--<span>Introduction to Public Speaking</span>--%>

                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-sm-4">--%>
                <%--<div class="recommended">--%>
                <%--<img src="gogowisestyle/image/recommended5.jpg" alt="">--%>
                <%--<span>Introduction to Public Speaking</span>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-sm-4">--%>
                <%--<div class="recommended">--%>
                <%--<img src="gogowisestyle/image/recommended6.jpg" alt="">--%>
                <%--<span>Introduction to Public Speaking</span>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>

                <%--<div class="row">--%>
                <%--<div class="col-sm-4">--%>
                <%--<div class="recommended">--%>
                <%--<img src="gogowisestyle/image/recommended7.jpg" alt="">--%>
                <%--<span>Introduction to Public Speaking</span>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-sm-4">--%>
                <%--<div class="recommended">--%>
                <%--<img src="gogowisestyle/image/recommended8.jpg" alt="">--%>
                <%--<span>Introduction to Public Speaking</span>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-sm-4">--%>

                <%--</div>--%>
                <%--</div>--%>
                <br/>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="container">
                <div  class="basePanel">
                     <a href="orgBlog.html?org.id=<s:property value="userOrganization.id"/>" title="<s:property value="userOrganization.schoolName"/>">
                        <img class="schoolPortrait" src="<s:property value="userOrganization.logoUrl"/>"/></a>
                    <h4><s:property value="userOrganization.schoolName"/></h4>
                    <h4 class="courseBody">
                        <s:property value="userOrganization.description"/>
                    </h4>
                </div>
            </div>
        </div>


    </div>
</div>
<%--</body>--%>
<%--</html>--%>
