<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>


<link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox-1.3.4.css" media="screen"/>

<div class="container">

    <div class="thinline"></div>

    <div class="row">
        <div class="col-md-8">
            <div class="container">
                <s:hidden value="%{#session.userID}" id="hidSessionId"/>
                <%-- Course Info--%>
                <s:if test=""><img src="<s:property value="course.bannerUrl" />" alt="course.name" class="courseBanner"></s:if>
                <h1 class="courseSubject"><s:property value="course.name"/></h1>
                <%-- <h5 class ="courseSynopsis">
                    An introduction to the intellectual enterprises of computer science and the art of
                programming.
                </h5>--%>

                <%-- <h5 class ="courseSynopsis"><s:property value="%{getText('course.info')}"/></h5> --%>
                <div class="row">
                    <div class="col-md-8">
                        <h3 class="courseSubhead"><s:property value="%{getText('course.info')}"/></h3>
                    </div>
                    <div class="col-md-4" style="text-align: right;">
                        <h3><a herf="#"><img src="../../images/course/download.png" alt="" class="downloadIcon"></a></h3>
                    </div>
                </div>

                <img src="<s:property value="course.logoUrl" />" class="courseInfoImg"/>
                <h4 class="courseBody"><s:property value="course.description"/></h4>
                <div style="clear: left">
                </div>

                <div class="thickline"></div>

                <h3 class="courseSubhead"><s:property value="%{getText('online.class.avigation.course.video')}"/></h3>

                <%-- Course Videos--%>
                <s:set var="isMore" value="false"></s:set>

                <s:iterator value="course.classes" id="class" status="status">
                    <s:if test="#status.index<6">
                        <s:if test="#status.index % 3 == 0"><div class="row"></s:if>

                        <%--<div class="col-sm-4">--%>
                        <%--<s:if test="#status.index < course.FinshedClassNum"><div class="lessonOrange"></s:if>--%>
                        <%--<s:else><div class="lessonGreen"></s:else>--%>
                        <%--<div id="lessonText"><s:property value="#status.index+1" /></div>--%>
                        <%--<div id="lessonName"><s:property value="nickName"/></div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <div class="col-sm-4">
                            <div class="pull-left">
                                <s:if test="#status.index < course.FinshedClassNum"><div class="lessonOrange"></s:if>
                                <s:else><div class="lessonGreen"></s:else>
                                    <span><s:property value="#status.index+1"/></span><div>Lesson</div>
                                </div>
                            </div>

                            <div class="pull-left">
                                <div class="lessonName"><s:property value="nickName"/></div>
                                <div class="lessonTime"><s:date name="date" format="%{getText('dateformat.forclass')}"/></div>
                            </div>
                        </div>

                        <s:if test="#status.index % 3 == 2||#status.last"></div><br/></s:if>
                    </s:if>
                    <s:else><s:set var="isMore" value="true"></s:set></s:else>
                </s:iterator>

                <s:if test="isMore"><p class="text-right"><a href="#"><s:property value="%{getText('others.more')}"/></a></p></s:if>

                <br/>
                <%-- Forum --%>
                <div class="thickline"></div>
                <div class="courseSubhead"><s:property value="%{getText('blog.message.board')}"/><%--Forum--%></div>
                <br/>


                <%--<div class="forumsinfo">--%>
                <%--<div class="forumsUserContainer">--%>
                <%--<img src="gogowisestyle/image/portrait1.jpg" alt="" class="forumportrait">--%>
                <%--<p class="textOverSinglerow">Name</p>--%>
                <%--</div>--%>
                <%--<div class="forumsContentContainer">--%>
                <%--<div class="forumText">--%>
                <%--For students, that means you really have to pay attention in all your computer scienceclasses.For students, that means you really have to pay attention in all your computer scienceclasses.--%>
                <%--</div>--%>
                <%--<p class="text-right">2013-11-12</p>--%>
                <%--</div>--%>
                <%--<div class="clearfix"></div>--%>
                <%--</div>--%>

                <div id="message_list_ul">
                    <s:set var="flag" value="true"/>
                    <s:iterator value="courseComments" status="idx">
                        <%--<p>--%>
                        <s:if test="flag">
                            <div class="row">
                                <div class="forumsinfo">
                                    <div class="forumsUserContainer">
                                        <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="commenter.id"/><img src="<s:property value="commenter.pic"/>" alt="" class="forumportrait"/></s:a>
                                        <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="commenter.id"/><p class="textOverSinglerow"><s:property value="commenter.nickName"/></p></s:a>
                                    </div>

                                    <div class="forumsContentContainer">
                                        <div class="forumText"><s:property value="content"/></div>
                                        <p class="text-right"><s:date name="commentTime" format="%{getText('global.display.datetime')}"/></p>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>

                            </div>
                            <s:if test="#idx.index > 3"><s:set var="flag" value="false"/></s:if>
                        </s:if>
                        <%--</p>--%>
                    </s:iterator>
                </div>

                <br/>
                <br/>

                <div>
                    <s:form theme="css_xhtml" name="commentsForm" method="post" id="commentForm">
                        <textarea id="message_textarea" class="form-control" rows="3"></textarea>
                        <br/>
                        <%--<a href="javascript:;" class="btn btn-primary btn-lg btn-block" id="message_submit_btn" ><s:property value="%{getText('blog.comments.submit')}" /></a>--%>
                        <a href="javascript:;" class="btn btn-primary btn-lg btn-block" id="message_submit_btn"><s:property value="%{getText('blog.comments.submit')}"/></a>
                    </s:form>
                </div>

                <br/>

                <div class="thickline"></div>

                <%-- Recommend courses --%>
                <div class="courseSubhead"><s:property value="%{getText('recommend.course')}"/></div>
                <br/>

                <div class="row">
                    <s:iterator value="courses2teacher"><%--courses2teacher--%>
                        <div class="col-sm-4">
                            <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                                <div class="recommended"><img src="<s:property value="logoUrl"/>" alt="" /><br/><span><s:property value="name"/></span></div>
                            </a>
                        </div>
                    </s:iterator>
                    <p class="text-right"><a href="#"><s:property value="%{getText('others.more')}"/></a></p>
                </div>
            </div>
        </div>


        <div class="col-md-4">
            <div class="container">

                <div class="well">
                    <a href="orgBlog.html?org.id=<s:property value="course.organization.id"/>" title="<s:property value="course.organization.nickName"/>">
                        <img class="schoolPortrait" src="<s:property value="course.organization.logoUrl"/>"/></a>
                    <h4 class="textOverSinglerow"><s:property value="%{getText('course.school')}"/>:<s:property value="course.organization.schoolName"/></h4>
                    <h4 class="textOverSinglerow"><s:property value="%{getText('course.code')}"/>: <s:property value="course.id"/></h4>
                    <h4 class="textOverSinglerow"><s:property value="%{getText('course.teaching.language')}"/>:<s:property value="course.languageType"/></h4>
                    <button type="button" class="btn btn-primary btn-block"><s:property value="%{getText('user.info.identity.finish.reg')}"/> <%--Register for --%><s:property value="course.name" /></button>
                </div>

                <!-- Panel 1 -->
                <div class="gogopanelHead"><div class="gogopanelTitle"><s:property value="%{getText('course.lecturer')}"/><%--Lecturers--%></div></div>

                <div class="gogopanelBody">
                    <div class="gogopanelBodyText">
                        <a href="userBlog.html?user.id=<s:property value="course.teacher.id"/>"title="<s:property value="course.teacher.nickName"/>">
                            <img class="teacherPortrait" src="<s:property value="course.teacher.pic"/>"/>
                        </a>

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
                <div class="gogopanelHead"><div class="gogopanelTitle"><s:property value="%{getText('label.course.class.room')}"/><%--Classroom--%></div></div>

                <div class="gogopanelBody">

                    <div class="gogopanelBodyText">
                        <s:if test="course.FinshedClassNum < course.ClassesNum">
                            <s:iterator value="course.ForcastClasses" begin="0" end="0" status="idx">

                                <div><s:property value="%{getText('lable.course.nickname')}"/><%--Topic--%>: <s:property value="nickName"/></div>
                                <p></p>

                                <div><s:property value="%{getText('lable.course.no')}"/><%--Numbers--%>:
                                    <s:property value="%{getText('lable.class.no1')}"/><s:property value="course.FinshedClassNum+1"/><s:property value="%{getText('lable.class.no2')}"/>
                                </div>
                                <p></p>

                                <div><s:property value="%{getText('lable.course.starttime')}"/><%--Time--%>:<s:date name="date" format="%{getText('dateformat.forclass')}"/></div>
                                <p></p>

                                <div><s:property value="%{getText('courses.info.lecturer')}"/><%--Lecturer--%>: <s:property value="course.teacher.nickName"/></div>
                                <br/>
                            </s:iterator>
                        </s:if>
                        <s:else>
                            <s:iterator value="course.classes" begin="course.ClassesNum-1" end="course.ClassesNum -1" status="idx">
                                <div><s:property value="%{getText('lable.course.nickname')}"/>: <s:property value="nickName"/></div>
                                <p></p>

                                <div><s:property value="%{getText('lable.course.no')}"/>:
                                    <s:property value="%{getText('lable.class.no1')}"/><s:property value="course.ClassesNum"/><s:property value="%{getText('lable.class.no2')}"/>
                                </div>
                                <p></p>
                                <div><s:property value="%{getText('lable.course.starttime')}"/>:<s:date name="date" format="%{getText('dateformat.forclass')}"/></div>
                                <p></p>
                                <div><s:property value="%{getText('courses.info.lecturer')}"/>: <s:property value="course.teacher.nickName"/></div>
                                <p></p>
                                <div><s:property value="%{getText('word.audience')}"/>:</div>
                                <br/>
                            </s:iterator>
                        </s:else>
                        <button type="button" class="btn btn-primary btn-block"><s:property value="%{getText('button.enter')}"/><%--Enter--%></button>
                    </div>
                </div>

                <br/>

                <!--Panel 3-->
                <div class="gogopanelHead"><div class="gogopanelTitle"><s:property value="%{getText('label.course.discussion.room')}"/><%--Discussion Room--%></div></div>

                <div class="gogopanelBody">
                    <div class="gogopanelBodyText">
                        <div><s:property value="%{getText('label.discussion.room.start.time')}"/>:</div>
                        <p></p>
                        <div><s:property value="%{getText('label.discussion.room.duration')}"/>:</div>
                        <p></p>
                        <div id="DisUserArea" style="text-align: center;">
                            <s:if test="course.teachers != null">
                                <div class="row">
                                    <s:iterator value="course.teachers" status="idx">
                                        <s:if test="#idx.index < 5">
                                            <div class="col-md-4">
                                                <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                                                    <img  class="normalPortrait" src="<s:property value="pic" />"/>
                                                </a>
                                                <p class="textOverSinglerow"><s:property value="nickName"/></p>
                                            </div>
                                        </s:if>
                                    </s:iterator>
                                    <s:if test="course.teachers.size() < 5">
                                        <s:iterator var="counter" begin="course.teachers.size() + 1" end = "5">
                                            <div class="col-md-4">
                                                <img src="/images/course/noportrait.jpg" class="normalPortrait"/>
                                                <p class="textOverSinglerow">Available</p>
                                            </div>
                                        </s:iterator>
                                    </s:if>
                                </div>
                            </s:if>
                            <s:else>
                                <div class="row">
                                    <s:iterator var="counter" begin="1" end = "5">
                                        <div class="col-md-4">
                                            <img src="/images/course/noportrait.jpg" class="normalPortrait"/>
                                            <p class="textOverSinglerow">Available</p>
                                        </div>
                                    </s:iterator>
                                </div>
                            </s:else>
                        </div>
                        <br/>
                        <button type="button" class="btn btn-primary btn-block"><s:property value="%{getText('button.enter')}"/></button>
                    </div>
                </div>

                <br/>

                <!--view all file -->
                <div class="basePanel"><button type="button" class="btn btn-primary btn-block"><s:property value="%{getText('course.resource.view')}"/><%--View All File--%></button></div>
            </div>
        </div>
    </div>
</div>

</div>

<script type="text/javascript">

    $("#message_submit_btn").bind('click', function () {
        if (validateLogo()) {

            var messageText = $("#message_textarea").val();
            if (messageText == "") {
                $("#message_area_tip").html("<s:text name='blog.left.message.empty'/>");
                return;
            }
            $.post("saveComment.html", {'course.id':<s:property value="course.id"/>, 'courseComment.content': $("#message_textarea").val(), 'commentsNum':<s:property value="commentsNum"/>}, function (data) {
                $("#message_list_ul").html(data);
            });
            $("#message_textarea").attr('value', "");
            $("#message_area_tip").html("");
        }
    })

    function validateLogo() {
        if (document.getElementById('hidSessionId').value > 0) {
            return true;
        } else {
            $.fancybox({
                "type": "iframe",
                "href": "login.html",
                "width": 350,
                "height": 270
            });
            return false;
        }
    }

</script>