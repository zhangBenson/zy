<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<script type="text/javascript" src="js/jqueryTabs.js"></script>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>


<div class="container">
    <div class="thinline"></div>
    <div class="row">
        <div class="col-sm-8">
            <div id="lecturerInfo">
                <%--<img src="gogowisestyle/image/largeportrait.jpg" class="lecturerPortrait">--%>
                <img src="<s:property value="user.pic" />" class="lecturerPortrait"/>

                <h1 class="lecturerName"><s:property value="user.nickName"/></h1>

                <h4 class="courseBody">
                    <s:property value="user.selfDescription"/>
                </h4>

            </div>
            <div style="clear: left">
            </div>

            <div class="thickline"></div>
            <h3 class="courseSubhead"><s:property
                    value="%{getText('user.responsible.course')}"/><%--Responsible Course--%></h3>
            <div id="schoolcurriculum">

                <s:iterator value="coursesAsTeacher" status="status">

                    <s:if test="#status.index % 3 == 0">
                        <div class="row">
                    </s:if>

                    <div class="col-sm-4">
                        <s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>
                            <div class="recommended">
                                <img src="<s:property value="logoUrl"/>"/>
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
                <br/>
            </div>
            <div class="thickline"></div>
            <h4><s:text name="blog.message.board"/></h4>

            <div id="message_list_ul">
                <s:iterator value="comments" status="idx">
                    <s:if test="#idx.index < 3">
                        <div class="row">
                            <div class="forumsinfo">
                                <div class="forumsUserContainer">
                                    <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id"
                                                                                         value="owner.id"/><img
                                            src="<s:property value="owner.pic"/>" alt="" class="forumportrait"/></s:a>
                                    <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id"
                                                                                         value="owner.id"/><p
                                            class="textOverSinglerow"><s:property value="owner.nickName"/></p></s:a>
                                </div>

                                <div class="forumsContentContainer">
                                    <div class="forumText"><s:property value="description"/></div>
                                    <p class="text-right"><s:date name="createDate"
                                                                  format="%{getText('global.display.datetime')}"/></p>

                                        <%-- <s:if test="user.id == #session.userID && owner.id != #session.userID">
                                            <span class="span_3"><a onclick="replyToComment('<s:property value="owner.nickName"/>')" href="#message_area_tip"><s:text name="blog.comments.reply"/></a></span>
                                            <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)" href="#message_area_tip"><s:text name="blog.comments.delete"/></a></span>
                                        </s:if>
                                        <s:elseif test="user.id != #session.userID && owner.id != #session.userID">
                                            <span class="span_3"><a onclick="replyToComment('<s:property value="owner.nickName"/>')" href="#message_area_tip"><s:text name="blog.comments.reply"/></a></span>
                                        </s:elseif>
                                        <s:else>
                                            <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)" href="#message_area_tip"><s:text name="blog.comments.delete"/></a></span>
                                        </s:else> --%>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </s:if>
                </s:iterator>
            </div>

            <p id="message_area_tip"></p>

            <div>
                <s:hidden value="%{#session.userID}" id="hidSessionId"/>
                <s:form theme="css_xhtml" name="commentsForm" method="post" id="commentForm">
                    <s:hidden name="user.id"/>
                    <textarea id="message_textarea" class="form-control" rows="3"></textarea>
                    <br/>
                    <input type="button" class="btn btn-primary btn-lg btn-block" id="message_submit_btn"
                           value="<s:text name="blog.comments.submit"/>"/>
                </s:form>
            </div>

            <br/>
        </div>

        <div class="col-sm-4">
            <div class="container">
                <div class="basePanel">
                    <a href="orgBlog.html?org.id=<s:property value="userOrganization.id"/>"
                       title="<s:property value="userOrganization.schoolName"/>">
                        <img class="schoolPortrait" src="<s:property value="userOrganization.logoUrl"/>"/></a>

                    <div class="clearfix"></div>
                    <h4 style="white-space: pre-wrap;word-wrap: break-word"><s:property
                            value="userOrganization.schoolName"/></h4>
                    <h4 class="courseBody">
                        <s:property escapeHtml="false" value="userOrganization.description"/>
                    </h4>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        $("#message_submit_btn").bind('click', function () {
            if (validateLogo()) {
                var messageText = $("#message_textarea").val();
                if (messageText == "") {
                    $("#message_area_tip").html("<s:text name='blog.left.message.empty'/>");
                    return;
                }

                $.post("saveUserBlogComments.html", {'user.id': '<s:property value="user.id"/>', 'comment.description': messageText, 'commentsNum':<s:property value="commentsNum"/>}, function (data) {
                    $("#message_list_ul").html(data);
                });

                $("#message_textarea").attr('value', "");
                $("#message_area_tip").html("");
            }
        })

        $("#message_textarea").keyup(function () {
            changeWordNumber($(this), $("#message_area_tip"), 250);
        });
        timedCount();

    });

    function getSubString(parentStr, shortLength) {
        if (/.*[\u4e00-\u9fa5]+.*$/.test(parentStr)) {
            if (parentStr.length > shortLength) {
                return parentStr.substring(0, shortLength) + "...";
            }
        } else {
            if (parentStr.length > 2 * shortLength) {
                return parentStr.substring(0, 2 * shortLength) + "...";
            }
        }
    }

    function replyToComment(nickName) {
        var prefixStr = "<s:text name='blog.message.reply'/>";
        $("#message_textarea").val(prefixStr + nickName + ": ");
        $("#message_textarea").focus();
    }
    function deleteThisComment(obj, commentId) {
        $(obj).parents("li.li_out").remove();
        $.post("deleteUserComment.html", {'comment.id': commentId}, function (data) {
        });
    }
    function timedCount() {
        setTimeout("timedCount()", 200 * 1000)
        $.post("findPersonalOnlive.html", {'user.id': '<s:property value="user.id"/>'}, function (data) {
            $("#personalOnliveMessage").html(data);
        });
    }
    function addFocus(userID) {
        if (validateLogo()) {
            $.post("addUserFocus.html", {'user.id': userID}, function (data) {
                Boxy.alert("<s:text name='frame.operation.success'/>");
                $("#focus_center").html("");
            });
        }
    }

    function getGirlOjbect() {
        if ($.browser.msie) {
            //alert("the edition is IE");
            return   document.getElementById("Girl")
        } else {
            //alert("the edition is ff");
            return   document.getElementById("GirlEmbed")
        }
    }

    function LoadVideo(onliveID) {

        if (!$("#video").isVisible())  $("#video").slideDown();
        $.post("loadPerOnLiveRecord.html", {'personalOnlive.id': onliveID}, function (data) {
            getGirlOjbect().LoadVideoURL(data.initSeesionString);
        });

    }
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
