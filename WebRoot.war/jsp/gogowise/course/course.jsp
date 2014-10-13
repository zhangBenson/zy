<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="container">
<div class="thinline"></div>
<div class="row">
<div class="col-md-8">
<div class="container">
<%-- Course Info--%>
<img src="<s:property value="course.logoUrl" />" alt="..." class="img-rounded">
<%-- <h1 class = "courseSubject">Introduction to Computer Science</h1>  --%>
<h1 class="courseSubject"><s:property value="course.name"/></h1>
<%-- <h5 class ="courseSynopsis">
    An introduction to the intellectual enterprises of computer science and the art of
programming.
</h5>--%>

<%-- <h5 class ="courseSynopsis"><s:text name="course.info"/></h5> --%>
<div class="row">
    <div class="col-md-8">
        <h3 class="courseSubhead"><s:text name="course.info"/></h3>
    </div>
    <div class="col-md-4" style="text-align: right;">
        <h3>
            <button type="button" class="btn btn-primary btn-sm">PDF Download(12.7M)</button>
        </h3>
    </div>
</div>

<%--<h4 class="courseBody">
    CS50x is Harvard College's introduction to the intellectual enterprises of computer science
</h4> --%>

<h4 class="courseBody"><s:property value="course.description"/></h4>

<div class="thickline"></div>
<h3 class="courseSubhead">Course Videos</h3>

<%-- Course Videos--%>
<s:iterator value="course.classes" id="class" status="status">

<s:if test="#status.index % 3 == 0">
<div class="row">
    </s:if>

    <div class="col-sm-4">

        <s:if test="#status.index < course.FinshedClassNum">
        <div class="lessonOrange"></s:if>
            <s:else>
            <div class="lessonGreen"></s:else>

                <div id="lessonText"><s:property value="#status.index+1"/></div>
                <div id="lessonName"><s:property value="nickName"/></div>
            </div>

        </div>

        <s:if test="#status.index % 3 == 2||#status.last">
    </div>
    <br/>
    </s:if>
    </s:iterator>

    <br/>
    <%-- Forum --%>
    <div class="thickline"></div>
    <div class="courseSubhead">Forum</div>
    <br/>

    <%--spkang added forum content begin --%>
    <s:set var="flag" value="true"/>
    <s:iterator value="courseComments" status="idx">
        <%--<p>--%>
        <s:if test="flag">
            <div class="row">
                <div class="col-md-2">
                    <div class="portrait">
                        <s:a action="userBlog"><s:param name="user.id" value="commenter.id"/><img
                                src="<s:property value="commenter.pic"/>"/></s:a>
					                    	<span>
					                    		<s:a action="userBlog"><s:param name="user.id"
                                                                                value="commenter.id"/><s:property value="commenter.nickName"/></s:a>
					                    	</span>
                    </div>
                </div>

                    <%--<span class="span_out">--%>
                <div class="col-md-10">
                    <div class="forumContent">
                        <s:property value="content"/>
                    </div>
                        <%--<s:if test="course.teacher.id == #session.userID && commenter.id != #session.userID">
                            <a class="span2" href="####" onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:text name="blog.comments.reply"/></a>
                            <a class="span2" href="####" onclick="deleteThisComment(this,<s:property value="id"/>)"><s:text name="blog.comments.delete"/></a>
                        </s:if>
                        <s:elseif test="course.teacher.id != #session.userID && commenter.id != #session.userID">
                            <a class="span2" href="####" onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:text name="blog.comments.reply"/></a>
                        </s:elseif>
                        <s:elseif test=" #session.userID == null">
                            <a class="span2" href="####" onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:text name="blog.comments.reply"/></a>
                        </s:elseif>
                        <s:else>
                            <a class="span2" href="####" onclick="deleteThisComment(this,<s:property value="id"/>)"><s:text name="blog.comments.delete"/></a>
                        </s:else>
                        --%>
                    <div class="forumContentDate">
                        <s:date name="commentTime" format="%{getText('global.display.datetime')}"/>
                    </div>
                </div>
                    <%--</span> --%>

            </div>
            <s:if test="#idx.getIndex() > 1">
                <s:set var="flag" value="false"/>
            </s:if>
        </s:if>
        <%--</p>--%>
    </s:iterator>
    <%--
    <s:if test="commentsNum != 0">
           <s:if test="!commentsNumOverflow">
               <a href="javascript:;" class="more_or_close" onclick="getMoreComments();"><s:text name="blog.comments.more.result"/>&gt;&gt;</a>
           </s:if>
           <s:elseif test="commentsNumOverflow && commentsNum>=10">
               <a href="javascript:;" class="more_or_close" onclick="rollBack();">&lt;&lt;<s:text name="blog.comments.rollBack"/></a>
           </s:elseif>
    </s:if>
     <script type="text/javascript">
           function getMoreComments(){
               $.post("moreCourseComments.html",{'course.id':<s:property value="course.id"/>,'commentsNum':<s:property value="commentsNum"/>},function(data){
                   $("#message_list_ul").html(data);
               });
           }

           function rollBack(){
               $.post("moreCourseComments.html",{'course.id':<s:property value="course.id"/>,'commentsNum':0},function(data){
                   $("#message_list_ul").html(data);
               });
           }
     </script>
   --%>
    <br/>

    <div class="thickline"></div>
    <%--  added end --%>

    <%--<div class="row">
        <div class="col-md-2">
            <div class="portrait">
                <img src="gogowisestyle/image/portrait1.jpg" alt="">
                <span>Name</span>
            </div>
        </div>
        <div class="col-md-10">
            <div class="forumContent">
                For students, that means you really have to pay attention in all your computer scienceclasses.For students, that means you really have to pay attention in all your computer scienceclasses.
            </div>
            <div class="forumContentDate">2013-11-12</div>
        </div>
    </div>
    <br/>
    <div class="row">
        <div class="col-md-2">
            <div class="portrait">
                <img src="gogowisestyle/image/portrait2.jpg" alt="">
                <span>Name</span>
            </div>
        </div>
        <div class="col-md-10">
            <div class="forumContent">
                For students, that means you really have to pay attention in all your computer scienceclasses.For students, that means you really have to pay attention in all your computer scienceclasses.
            </div>
            <div class="forumContentDate">2013-11-12</div>
        </div>
    </div>
    <br/>
    <div class="thickline"></div>
    --%>


    <%-- Recommend courses --%>
    <div class="courseSubhead"><s:text name="recommend.course"/></div>
    <br/>

    <div class="row">
        <s:iterator value="courses2teacher">
            <div class="col-sm-4">
                <div class="recommended">
                    <ul>
                        <li><a href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                               title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>" alt=""></a>
                        </li>
                        <span><s:property value="name"/></span>

                    </ul>
                </div>
            </div>
        </s:iterator>
        <%--<div class="col-sm-4">

             <div class="recommended">
                <img src="gogowisestyle/image/recommended1.jpg" alt="">
                <span>Introduction to Public Speaking</span>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="recommended">
                <img src="gogowisestyle/image/recommended2.jpg" alt="">
                <span>Introduction to Public Speaking</span>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="recommended">
                <img src="gogowisestyle/image/recommended3.jpg" alt="">
                <span>Introduction to Public Speaking</span>
            </div>
        </div>
        --%>
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
                <%--
                <img class="teacherPortrait" src="gogowisestyle/image/portrait2.jpg"  />
                <div>
                    <p class="teacherTitle">Name</p>
                  <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                  <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>

                </div>
                <div class="thicklineExtra"></div>
                <img class="teacherPortrait" src="gogowisestyle/image/portrait1.jpg"  />
                <div>
                  <p class="teacherTitle">Name</p>
                  <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>

                </div>
                --%>
                <%-- <p><s:property value="course.teacher.selfDescription"/></p> --%>
                <a href="userBlog.html?user.id=<s:property value="course.teacher.id"/>"
                   title="<s:property value="course.teacher.nickName"/>"><img class="teacherPortrait"
                                                                              src="<s:property value="course.teacher.pic"/>"/></a>
                <%-- <img class="teacherPortrait" src="<s:property value="course.teacher.pic"/>"/> --%>
                <div>
                    <p class="teacherTitle"><s:property value="course.teacher.nickName"/></p>

                    <p><s:property value="course.teacher.selfDescription"/></p>

                    <p></p>
                    <br/>
                </div>
                <div class="thicklineExtra"></div>
                <img class="teacherPortrait" src="/images/course/portrait1.jpg"/>

                <div>
                    <p class="teacherTitle">Name</p>

                    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>

                </div>
            </div>
        </div>

        <br/>
        <!-- Panel 2 -->
        <div class="gogopanelHead">
            <div class="gogopanelTitle">Classroom</div>
        </div>

        <div class="gogopanelBody">
            <div class="gogopanelBodyText">
                <s:iterator value="course.ForcastClasses" begin="0" end="0" status="idx">
                    <div>topic: <s:property value="nickName"/></div>
                    <p></p>

                    <div>numbers:
                        <s:text name="lable.class.no1"/>
                        <s:property value="course.FinshedClassNum+1"/>
                        <s:text name="lable.class.no2"/>
                    </div>
                    <p></p>

                    <div>times:<s:date name="date" format="%{getText('dateformat.forclass')}"/></div>
                    <p></p>

                    <div>teacher: <s:property value="course.teacher.nickName"/></div>
                    <br/>
                </s:iterator>
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
                    <div class="col-md-4"><img class="teacherPortrait" src="/images/course/portrait2.jpg"/></div>
                    <div class="col-md-4"><img class="teacherPortrait" src="/images/course/portrait4.jpg"/></div>
                    <div class="col-md-4"><img class="teacherPortrait" src="/images/course/portrait5.jpg"/></div>
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
