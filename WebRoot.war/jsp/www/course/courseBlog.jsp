<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<div class="container">
<div class="thinline"></div>
<div class="row">
<div class="col-md-8">
<div class="container">
    <%-- Course Info--%>
    <img src="<s:property value="course.logoUrl" />" alt="..." class="img-rounded">
    <%-- <h1 class = "courseSubject">Introduction to Computer Science</h1>  --%>
    <h1 class = "courseSubject"><s:property value="course.name"/></h1>
    <%-- <h5 class ="courseSynopsis">
        An introduction to the intellectual enterprises of computer science and the art of
    programming.
    </h5>--%>

    <%-- <h5 class ="courseSynopsis"><s:property value="%{getText('course.info')}"/></h5> --%>
    <div class = "row">
        <div class="col-md-8">
            <h3 class="courseSubhead"><s:property value="%{getText('course.info')}"/></h3>
        </div>
        <div class="col-md-4" style="text-align: right;">
            <h3>
                <button type="button" class="btn btn-primary btn-sm">PDF Download(12.7M)</button>
            </h3>
        </div>
    </div>


    <h4 class="courseBody" ><s:property value="course.description"/></h4>
    <div class="thickline"></div>
    <h3 class="courseSubhead">Course Videos</h3>

    <%-- Course Videos--%>
    <s:set var="isMore" value="false"></s:set>
    <s:iterator value="course.classes" id="class" status="status">
    <s:if test="#status.index<6">
    <s:if test="#status.index % 3 == 0">
    <div class="row">
        </s:if>

        <div class="col-sm-4">
            <s:if test="#status.index < course.FinshedClassNum"><div class="lessonOrange"></s:if>
            <s:else><div class="lessonGreen"></s:else>
                <div id="lessonText"><s:property value="#status.index+1" /></div>
                <div id="lessonName"><s:property value="nickName"/></div>
            </div>

        </div>

            <s:if test="#status.index % 3 == 2||#status.last">
        </div><br/>
        </s:if>
        </s:if>
        <s:else><s:set var="isMore" value="true"></s:set></s:else>
        </s:iterator>

        <s:if test="isMore">
            <p class="text-right">more</p>
        </s:if>

        <br/>
        <%-- Forum --%>
        <div class="thickline"></div>
        <div class="courseSubhead">Forum</div>
        <br/>

        <%--spkang added forum content begin --%>
        <s:set var="flag" value="true" />
        <s:iterator value="courseComments" status="idx">
            <%--<p>--%>
            <s:if test="flag">
                <div class="row">
                    <div class="col-md-2">
                        <div class="portrait">
                            <s:a action="userBlog" ><s:param name="user.id" value="commenter.id"/><img src="<s:property value="commenter.pic"/>"/></s:a>
                            <br/>
            					     <span>
                                		<s:a action="userBlog" ><s:param name="user.id" value="commenter.id"/><s:property value="commenter.nickName"/></s:a>
                                	</span>
                        </div>
                    </div>

                        <%--<span class="span_out">--%>
                    <div class="col-md-10">
                        <div class="forumContent">
                            <s:property value="content"/>
                        </div>
                        <div class="forumContentDate">
                            <s:date name="commentTime" format="%{getText('global.display.datetime')}"/>
                        </div>
                    </div>
                        <%--</span> --%>

                </div>
                <s:if test="#idx.getIndex() > 1">
                    <s:set var="flag" value="false" />
                </s:if>
            </s:if>
            <%--</p>--%>
        </s:iterator>
        <br/>
        <div class="thickline"></div>

        <%-- Recommend courses --%>
        <div class="courseSubhead"><s:property value="%{getText('recommend.course')}"/></div>
        <br/>
        <div class="row">
            <s:iterator value="courses2teacher"><%--courses2teacher--%>
                <div class="col-sm-4">
                    <div class="recommended">
                        <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                            <img src="<s:property value="logoUrl"/>" alt=""></a>
                        <br/>
                        <span><s:property value="name"/></span>
                    </div>
                </div>
            </s:iterator>
        </div>
    </div>
</div>

<div class="col-md-4">
    <div class="container">

        <div class="well">
            <img src="/images/course/schoolslogo.png" alt="">
            <h4>School:Rice</h4>
            <h4>Course Code: <s:property value="course.id"/></h4>
            <h4>Course Language:English</h4>
            <button type="button" class="btn btn-primary btn-block">Register for SW12X</button>
        </div>
        <!-- Panel 1 -->
        <div class="gogopanelHead">
            <div class="gogopanelTitle">Lecturers</div>
        </div>
        <div class="gogopanelBody">
            <div class="gogopanelBodyText">
                <a href="userBlog.html?user.id=<s:property value="course.teacher.id"/>" title="<s:property value="course.teacher.nickName"/>"><img class="teacherPortrait" src="<s:property value="course.teacher.pic"/>"/></a>
                <div>
                    <p class="teacherTitle"><s:property value="course.teacher.nickName"/></p>
                    <p><s:property value="course.teacher.selfDescription"/></p>
                    <p></p>
                    <br/>
                </div>
                <%-- <div class="thicklineExtra"></div>
                <img class="teacherPortrait" src="/images/course/portrait1.jpg"  />
                <div>
                    <p class="teacherTitle">Name</p>
                    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>

                </div>--%>
            </div>
        </div>

        <br/>
        <!-- Panel 2 -->
        <div class="gogopanelHead">
            <div class="gogopanelTitle">Classroom</div>
        </div>

        <div class="gogopanelBody">
            <div class="gogopanelBodyText">
                <s:if test="course.FinshedClassNum < course.ClassesNum">
                    <s:iterator value="course.ForcastClasses" begin="0" end="0" status="idx">
                        <div>topic: <s:property value="nickName"/></div>
                        <p></p>
                        <div>numbers:
                            <s:property value="%{getText('lable.class.no1')}" />
                            <s:property value="course.FinshedClassNum+1"/>
                            <s:property value="%{getText('lable.class.no2')}" />
                        </div>
                        <p></p>
                        <div>times:<s:date name="date" format="%{getText('dateformat.forclass')}"/></div>
                        <p></p>
                        <div>teacher: <s:property value="course.teacher.nickName"/></div>
                        <br/>
                    </s:iterator>
                </s:if>
                <s:else>
                    <div>近期没有要开始的课程。</div>
                </s:else>
                <button type="button" class="btn btn-primary btn-block">Enter</button>
            </div>
        </div>
        <br/>
        <!--Panel 3-->
        <div class="gogopanelHead">
            <div class="gogopanelTitle">Discussion Room</div>
        </div>
        <div class="gogopanelBody">
            <div class="gogopanelBodyText">
                <div class="row">
                    <div class="col-md-4"><img class="teacherPortrait" src="images/defaultImgs/portrait.png"  /></div>
                    <div class="col-md-4"><img class="teacherPortrait" src="images/defaultImgs/portrait.png"  /></div>
                    <div class="col-md-4"><img class="teacherPortrait" src="images/defaultImgs/portrait.png"  /></div>
                </div>

                <br/>
                <button type="button" class="btn btn-primary btn-block">Enter</button>
            </div>
        </div>
        <br/>

        <!--view all file -->
        <div class="basePanel">
            <button type="button" class="btn btn-primary btn-block">View All File</button>
        </div>
    </div>
</div>
