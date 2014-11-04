<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox-1.3.4.css" media="screen"/>

<style>
    .none {
        display: none
    }
</style>

<div class="container">

<div class="thinline"></div>

<div class="row">
    <div class="col-md-10">
        <div class="container">
            <s:hidden value="%{#session.userID}" id="hidSessionId"/>
            <%-- Course Info--%>
            <s:if test=""><img src="<s:property value="course.bannerUrl" />" alt="course.name"
                               class="courseBanner"></s:if>
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
            </div>

            <img src="<s:property value="course.logoUrl" />" class="courseInfoImg"/>
            <h4 class="courseBody"><s:property value="course.description"/></h4>

            <div style="clear: left">
            </div>

            <div class="thickline"></div>
            <h3 style="color: #6ab600"><s:text name="makeVideo.tips"/></h3>
            <h4 class="courseBody">
                <span style="color: red; font-weight:bold"><s:property value="%{getText('makeVideo.redHead')}"/></span><s:property value="%{getText('makeVideo.redContent')}"/>
                <br/>
                <span style="color: green; font-weight:bold;"><s:property value="%{getText('makeVideo.greenHead')}"/></span><s:property value="%{getText('makeVideo.greenContent')}"/>
            </h4>

            <div class="thickline"></div>

            <h3 class="courseSubhead"><s:text name="online.class.avigation.course.video"/></h3>

            <%-- Course Videos--%>
            <div id="videoList">
                <s:iterator value="course.classes" id="class" status="status">
                <s:if test="#status.index<6">
                <s:if test="#status.index % 3 == 0">
                <div class="row"></s:if>

                    <div class="col-sm-4">
                        <div class="pull-left">
                            <s:if test="record">
                            <div class="lessonGreen" onclick="getVideoUrl(<s:property value="id"/>)"
                                 style="cursor:pointer;">
                                </s:if>

                                <s:else>
                                <div class="lessonOrange" onclick="getVideoUrl(<s:property value="id"/>)"
                                     style="cursor:pointer;">
                                    </s:else>
                                    <span><s:property value="#status.index+1"/></span>

                                    <div>Lesson</div>
                                </div>
                            </div>

                            <div class="pull-left">
                                <div class="lessonName"><s:property value="nickName"/></div>
                                <div class="lessonTime"><s:date name="date"
                                                                format="%{getText('dateformat.forclass')}"/></div>
                            </div>
                        </div>

                        <s:if test="#status.index % 3 == 2||#status.last"></div>
                    <br/></s:if>
                    </s:if>
                    </s:iterator>

                </div>

                <div id="hiddenVideoList" class="none">
                    <s:iterator value="course.classes" id="class" status="status">
                    <s:if test="#status.index>5">
                    <s:if test="#status.index % 3 == 0">
                    <div class="row"></s:if>

                        <div class="col-sm-4">
                            <div class="pull-left">
                                <s:if test="record">
                                <div class="lessonGreen" onclick="getVideoUrl(<s:property value="id"/>)"
                                     style="cursor:pointer;">
                                    </s:if>
                                    <s:else>
                                    <div class="lessonOrange" onclick="getVideoUrl(<s:property value="id"/>)">
                                        </s:else>
                                        <span><s:property value="#status.index+1"/></span>

                                        <div>Lesson</div>
                                    </div>
                                </div>

                                <div class="pull-left">
                                    <div class="lessonName"><s:property value="nickName"/></div>
                                    <div class="lessonTime"><s:date name="date"
                                                                    format="%{getText('dateformat.forclass')}"/></div>
                                </div>
                            </div>

                            <s:if test="#status.index % 3 == 2||#status.last"></div>
                        <br/></s:if>
                        </s:if>
                        </s:iterator>
                    </div>

                    <s:if test="course.classes.size()>6">
                        <p class="text-right">
                            <button id="moreClass" style="cursor:hand; border: 1px dotted;background-color: #ffffff;"
                                    onClick="showdiv('hiddenVideoList')">
                                <s:text name="others.more"/>
                            </button>
                        </p>
                    </s:if>

                    <br/>

                    <br/>

                </div>
            </div>


        </div>
    </div>

</div>

<script type="text/javascript">
    function enterPlayerRoom(courseClassId) {
//        if(validateLogo()){
        window.location.href = "playerClass.html?courseClass.id=" + courseClassId;
//        }
    }

    function getVideoUrl(cid) {
        window.location.href = "lecturerClass.html?courseClass.id=" + cid;
    }

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
    });
    $('#register_btn').click(function () {
        if (validateLogo()) {
            <%--<s:if test="course.charges == 0 && !course.limitOver && !course.courseFinished">--%>
            <%--$.post("courseconfirm.html",{'course.id':"<s:property value="course.id"/>"},function(data){--%>
            <%--window.location.href = "myRegistration.html";--%>
            <%--return true;--%>
            <%--});--%>
            <%--</s:if>--%>
            <%--<s:if test="course.charges > 0 && !course.limitOver && !course.courseFinished">--%>
            window.location.href = "initCourseconfirm.html?course.id=<s:property value="course.id"/>";
            return true;
            <%--</s:if>--%>
            <%--<s:else>--%>
            <%--window.location.href =  "myRegistration.html";--%>
            <%--</s:else>--%>
        }
    });

    function validateLogo() {
        if (document.getElementById('hidSessionId').value > 0) {
            return true;
        } else {
            $('#modalLogin').modal("show");
            return false;
        }
    }

    function showdiv(targetid) {

        var target = document.getElementById(targetid);
        //var rollBack = ;

        if (target.style.display == "block") {
            target.style.display = "none";
            document.getElementById('moreClass').innerHTML = "<s:text name="%{getText('blog.comments.more.result')}"/>";

        } else {
            target.style.display = "block";
            document.getElementById('moreClass').innerHTML = "<s:text name="%{getText('blog.comments.rollBack')}"/>";
        }
    }

    function getMoreComments() {
        $.post("moreCourseComments.html", {'course.id':<s:property value="course.id"/>, 'commentsNum':<s:property value="commentsNum"/>}, function (data) {
            $("#message_list_ul").html(data);
        });
    }

    function rollBack() {
        $.post("moreCourseComments.html", {'course.id':<s:property value="course.id"/>, 'commentsNum': 0}, function (data) {
            $("#message_list_ul").html(data);
        });
    }

</script>
