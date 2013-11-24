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
                <h1 class = "lecturerTitle">Professor</h1>
                <h1 class = "lecturerTitle">Computer Science</h1>
                <h1 class = "lecturerTitle">Rice University</h1>
                <br>
                <h4 class="courseBody">
                    <s:property value="user.selfDescription"/>
                    <%--Joe Warren is a Professor in the Department of Computer Science at Rice University. His main area of research interest is computer graphics and geometric modeling, where he has published extensively. He is the author of the book Subdivision Methods for Geometric Design. He also has a love for computer gaming, both playing games and teaching students how to build them. He has taught the Department’s introduction to game creation course as well as its senior-level game design course in collaboration with Houston game professionals for over a decade. Joe was an undergraduate at Rice from 1979-1983 and received his Ph.D. from Cornell in 1986. He has been a professor at Rice ever since and currently serves as the Chair of the Department.--%>
                </h4>

            </div>
            <br/>
            <div class="thickline"></div>
            <h3 class="courseSubhead">Responsible Course</h3>
            <%--<h3 class="courseSubhead"><s:property value="%{getText('user.created.courses',{user.nickName})}"/></h3>--%>
            <div id="schoolcurriculum">

                <s:iterator value="coursesAsTeacher" status="status">

                    <s:if test="#status.index % 3 == 0">
                        <div class="row">
                    </s:if>

                    <div class="col-sm-4">
                        <div class="recommended">
                            <s:a action="voaCourseBlog"><s:param name="course.id" value="id"/><img src="<s:property value="logoUrl"/>" /></s:a>
                            <%--<a href="#">--%>
                            <%--<img src="gogowisestyle/image/recommended4.jpg" alt="">--%>
                            <%--</a>--%>
                            <br/>
                            <span><s:param name="course.id" value="id"/><s:property value="name"/></span>
                        </div>
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
                    <img src="gogowisestyle/image/schoolslogo.png">
                    <h4>Rice University</h4>
                    <h4 class="courseBody">
                        Located on a 300-acre forested campus in Houston, Rice University is consistently ranked among the top 20 universities in the U.S. and the top 100 in the world. Rice has highly respected schools of Architecture, Business, Continuing Studies, Engineering, Humanities, Music, Natural Sciences and Social Sciences and is home to the Baker Institute for Public Policy.
                    </h4>
                </div>
            </div>
        </div>


    </div>
</div>
<%--</body>--%>
<%--</html>--%>