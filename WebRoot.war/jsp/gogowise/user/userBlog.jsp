<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<script type="text/javascript" src="js/jqueryTabs.js"></script>
<link type="text/css" href="css/user/userBlog.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>

<div class="ubd_1">
    <div class="ubd_1_1">
        <img src="<s:property value="user.pic"/>" class="portraitImg"/>
    </div>
    <div class="ubd_1_2">
        <ul>
            <li class="li_1"><s:property value="user.nickName"/></li>
            <li class="li_2"><s:property value="user.selfDescription"/></li>
        </ul>
    </div>
    <div class="ubd_1_3">
        <ul>
            <li><s:property value="userCoursesNum"/><s:text name="search.header.course"/></li>
            <li><s:property value="userCoursesStudentNum"/><s:text name="label.student"/></li>
            <li><s:property value="userFansNum"/><s:text name="onlive.fensi"/></li>
        </ul>
    </div>
    <div class="udb_1_4" id="focus_center">
        <%--<s:if test="!focused">--%>
        <a href="javascript:;" id="focus_btn" onclick="addFocus(<s:property value="user.id"/>);"><s:text name="onlive.focus.on"/></a>
        <%--</s:if>--%>
    </div>
</div>

<div class="ubd_2">
<div id="video"
     style="display:none;float:left;width:560px;height:427px;padding: 2px;border: 1px solid #CCC;background: #ebebeb;">

    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" name="Girl"
            width="560px" height="427px" id="Girl">
        <param name="movie" value="flash/VideoPlayer.swf"/>
        <param name="quality" value="high"/>
        <param name="wmode" value="Window"/>
        <param name="allowFullScreen" value="true"/>
        <embed src="flash/VideoPlayer.swf" allowFullScreen="true" width="560px" height="427px" quality="high"
               pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"
               wmode="Window" name="Girl" id="GirlEmbed"></embed>
    </object>

</div>
<%--<s:if test="existRecordPerOnlive">--%>
<%--<div class="ubd_2_online">--%>
<%--<h4>直播室</h4>--%>
<%--<div class="scroll_out">--%>
<%--<s:if test="needScrollForPerLives">--%>
<%--<div class="scroll_left" id="left_scroll" onclick="loadLeftTerms();"></div>--%>
<%--</s:if>--%>
<%--<div class="scroll_in">--%>
<%--<div class="div_tmp">--%>
<%--<ul id="scroll_ul">--%>
<%--<s:iterator value="personalOnlives" status="idx">--%>
<%--<li class="li_out">--%>
<%--<a href="javaScript:;" onclick="LoadVideo(<s:property value="id"/>);">--%>
<%--<ul title="<s:property value="name"/>">--%>
<%--<li>第<s:property value="sequence"/>期</li>--%>
<%--<li><s:date name="startDate" format="%{getText('global.display.datetime')}"/></li>--%>
<%--</ul>--%>
<%--</a>--%>
<%--</li>--%>
<%--</s:iterator>--%>
<%--<script type="text/javascript">--%>
<%--function  loadRightTerms(){--%>
<%--<s:if test="perOnlivTermsMinSquence != 1">--%>
<%--$.post("loadRightTerms.html",{'user.id':<s:property value="user.id"/>,'perOnlivTermsMinSquence':<s:property value="perOnlivTermsMinSquence"/>,'biggestSquence':<s:property value="biggestSquence"/>},function(data){--%>
<%--$("#scroll_ul").html(data);--%>
<%--});--%>
<%--</s:if>--%>
<%--}--%>
<%--function  loadLeftTerms(){--%>
<%--<s:if test="perOnlivTermsMaxSquence != biggestSquence">--%>
<%--$.post("loadLeftTerms.html",{'user.id':<s:property value="user.id"/>,'perOnlivTermsMaxSquence':<s:property value="perOnlivTermsMaxSquence"/>,'biggestSquence':<s:property value="biggestSquence"/>},function(data){--%>
<%--$("#scroll_ul").html(data);--%>
<%--});--%>
<%--</s:if>--%>
<%--}--%>
<%--</script>--%>
<%--</ul>--%>
<%--</div>--%>
<%--</div>--%>
<%--<s:if test="needScrollForPerLives">--%>
<%--<div class="scroll_right" id="right_scroll" onclick="loadRightTerms();"></div>--%>
<%--</s:if>--%>
<%--</div>--%>
<%--</div>--%>
<%--</s:if>--%>

<div class="ubd_2_1">
    <h4><s:property value="%{getText('user.created.courses',{user.nickName})}"/></h4>
    <a class="a_all" href="#">(<s:text name="search.header.all"/><s:property value="coursesAsTeacherNum"/>)</a>
    <ul>
        <s:iterator value="coursesAsTeacher" status="idx">
            <li class="li_out">
                <ul>
                    <li class="li_1"><s:a action="voaCourseBlog"><s:param name="course.id" value="id"/><img
                            src="<s:property value="logoUrl"/>"/></s:a></li>
                    <li class="li_2"><s:a action="voaCourseBlog"><s:param name="course.id" value="id"/><s:property value="name"/></s:a></li>
                    <li class="li_3 introduction<s:property value='#idx.index'/>"><s:property value="description"/></li>
                    <li class="li_4"><s:text name="blog.time.left"/>&nbsp;&nbsp;<strong
                            id="timeLeftForBook<s:property value="#idx.index"/>"></strong></li>
                </ul>
            </li>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#timeLeftForBook<s:property value="#idx.index"/>").countdown({
                        date: '<s:date name="classOnTheCorner.date" format="%{getText('date.formate.firstpage.course.startdate')}"/>',
                        onChange: function (event, timer) {
                        },
                        onComplete: function (event) {
                            $(this).html("Completed");
                        },
                        leadingZero: true,
                        direction: "down"
                    });

                    var introduction = getSubString($(".introduction<s:property value='#idx.index'/>").text(), 65);
                    $(".introduction<s:property value='#idx.index'/>").text(introduction);
                });
            </script>
        </s:iterator>
    </ul>
</div>
<div class="ubd_2_2">
    <h4><s:property value="%{getText('user.reged.courses',{user.nickName})}"/></h4>
    <a class="a_all" href="#">(<s:text name="search.header.all"/><s:property value="coursesAsStudentNum"/>)</a>
    <ul class="ul_out">
        <s:iterator value="coursesAsStudent">
            <li class="course">
                <s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>
                    <img src="<s:property value="logoUrl"/> " title="<s:property value="name"/>"/>
                </s:a>
                <span title="<s:property value="name"/>"><s:a action="voaCourseBlog"><s:param name="course.id"
                                                                                              value="id"/><s:property value="name"/></s:a></span>
            </li>
        </s:iterator>
    </ul>
</div>

<s:if test="existShows">
    <div class="ubd_2_2">
        <h4><s:property value="%{getText('user.created.shows',{user.nickName})}"/></h4>
        <a class="a_all" href="#">(<s:text name="search.header.all"/><s:property value="myShowsNum"/>)</a>
        <ul>
            <s:iterator value="myShows">
                <li class="course">
                    <s:a action="showBlog"><s:param name="myShow.id" value="id"/>
                        <img src="<s:property value="logoUrl"/> " title="<s:property value="name"/>" class="courseImg"/>
                    </s:a>
                    <span title="<s:property value="name"/>"><s:a action="showBlog"><s:param name="myShow.id"
                                                                                             value="id"/><s:property value="name"/></s:a></span>
                </li>
            </s:iterator>
        </ul>
    </div>
</s:if>

<div class="ubd_2_2">
    <h4><s:property value="%{getText('user.course.browsed',{user.nickName})}"/></h4>
    <a class="a_all" href="#">(<s:text name="search.header.all"/><s:property value="browsedCoursesNum"/>)</a>
    <ul>
        <s:iterator value="browsedCourses">
            <li class="course">
                <s:a action="voaCourseBlog"><s:param name="course.id" value="course.id"/>
                    <img src="<s:property value="course.logoUrl"/> " title="<s:property value="course.name"/>"
                         class="courseImg"/>
                </s:a>
                <span title="<s:property value="course.name"/>"><s:a action="voaCourseBlog"><s:param name="course.id"
                                                                                                     value="course.id"/><s:property value="course.name"/></s:a></span>
            </li>
        </s:iterator>
    </ul>
</div>
<div class="ubd_2_1">
    <h4><s:property value="%{getText('user.onlive.history',{user.nickName})}"/></h4>
    <table cellpadding="0" cellspacing="0">
        <tr>
            <th width="90px"><s:text name="onlive.virtual.room.head.title"/></th>
            <th><s:text name="course.start.time"/></th>
            <th><s:text name="lable.course.endtime"/></th>
            <th><s:text name="user.onlive.duration"/></th>
            <th><s:text name="user.onlive.history.online.reged.fens"/></th>
            <th><s:text name="user.onlive.history.online.fens"/></th>
            <th><s:text name="user.onlive.click.num"/></th>
            <th><s:text name="live.map.address"/></th>
        </tr>
        <s:iterator value="personalOnlives">
            <tr>
                <td><a href="javascript:;"><s:property value="title"/></a></td>
                <td><s:date name="startTime" format="%{getText('dateformat.forclass')}"/></td>
                <td><s:date name="endTime" format="%{getText('dateformat.forclass')}"/></td>
                <td><s:property value="duration"/></td>
                <td><s:property value="numOfRegAudience"/></td>
                <td><s:property value="numOfAudience"/></td>
                <td><s:property value="clickRate"/></td>
                <td><s:property value="address"/></td>
            </tr>
        </s:iterator>
    </table>
</div>
<div class="pagination" style="padding-top:0px;">
    <tiles:insertTemplate template="../pagination.jsp">
        <tiles:putAttribute name="pagination" value="${pagination}"/>
    </tiles:insertTemplate>
</div>
<div class="ubd_2_3">
    <h4><s:text name="blog.message.board"/></h4>

    <p id="message_area_tip"></p>

    <div class="ubd_2_3_area">
        <s:hidden value="%{#session.userID}" id="hidSessionId"/>
        <s:form name="commentsForm">
            <s:hidden name="user.id"/>
            <textarea id="message_textarea"></textarea>
            <input type="button" id="message_submit_btn"
                   value="<s:text name="blog.comments.submit"/>"/>
        </s:form>
    </div>
    <div class="ubd_2_3_list">
        <ul class="ul_out" id="message_list_ul">
            <s:iterator value="comments" status="idx">
                <li class="li_out">
                    <ul class="ul_in">
                        <li class="li_1"><s:a action="userBlog" target="_blank"><s:param name="user.id"
                                                                                         value="owner.id"/><img
                                src="<s:property value="owner.pic"/>" class="portraitImg"/></s:a></li>
                        <li class="li_2"><s:a action="userBlog" target="_blank"><s:param name="user.id"
                                                                                         value="owner.id"/><s:property value="owner.nickName"/></s:a></li>
                        <li class="li_3">
                            <span class="span_1"><s:property value="description"/></span>
                            <span class="span_2"><s:date name="createDate"
                                                         format="%{getText('global.display.datetime')}"/></span>
                            <s:if test="user.id == #session.userID && owner.id != #session.userID">
                                <span class="span_3"><a onclick="replyToComment('<s:property value="owner.nickName"/>')"
                                                        href="#message_area_tip"><s:text name="blog.comments.reply"/></a></span>
                                <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)"
                                                        href="#message_area_tip"><s:text name="blog.comments.delete"/></a></span>
                            </s:if>
                            <s:elseif test="user.id != #session.userID && owner.id != #session.userID">
                                <span class="span_3"><a onclick="replyToComment('<s:property value="owner.nickName"/>')"
                                                        href="#message_area_tip"><s:text name="blog.comments.reply"/></a></span>
                            </s:elseif>
                            <s:else>
                                <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)"
                                                        href="#message_area_tip"><s:text name="blog.comments.delete"/></a></span>
                            </s:else>
                        </li>
                    </ul>
                </li>
            </s:iterator>
            <li class="li_out">
                <s:if test="commentsNum != 0">
                    <s:if test="!commentsNumOverflow">
                        <a class="more_or_close" onclick="getMoreComments();" href="#message_area_tip"><s:text name="blog.comments.more.result"/>&gt;&gt;</a>
                    </s:if>
                    <s:else>
                        <a class="more_or_close" onclick="rollBack();" href="#message_area_tip">&lt;&lt;<s:text name="blog.comments.rollBack"/></a>
                    </s:else>
                </s:if>
            </li>
            <script type="text/javascript">
                function getMoreComments() {
                    $.post("moreUserComments.html", {'user.id':<s:property value="user.id"/>, 'commentsNum':<s:property value="commentsNum"/>}, function (data) {
                        $("#message_list_ul").html(data);
                    });
                }

                function rollBack() {
                    $.post("moreUserComments.html", {'user.id':<s:property value="user.id"/>, 'commentsNum': 0}, function (data) {
                        $("#message_list_ul").html(data);
                    });
                }
            </script>
        </ul>
    </div>

</div>


</div>

<div class="ubd_3">
    <div class="ubd_3_0" id="personalOnliveMessage">
        <%--<s:if test="!personalOnlive.finished">--%>
        <%--<span>博主正在直播</span>--%>
        <%--<a href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="personalOnlive.id"/>">222观看直播</a>--%>
        <%--</s:if>--%>
    </div>
    <div class="ubd_3_1">
        <h4><s:property value="%{getText('user.students',{user.nickName})}"/></h4>
        <ul>
            <s:iterator value="students">
                <li><a href="userBlog.html?user.id=<s:property value="id"/>"><img src="<s:property value="pic"/>"
                                                                                  class="portraitImg"
                                                                                  title="<s:property value="nickName"/>"/></a>
                </li>
            </s:iterator>
            <li class="li_turn"><a href="javascript:;" class="turn_left"
                                   title="<s:text name="pagination.last.page"/>"></a><a
                    href="javascript:;" class="turn_right"
                    title="<s:text name="pagination.next.page"/>"></a></li>
        </ul>
    </div>
    <div class="ubd_3_1">
        <h4><s:property value="%{getText('user.fans',{user.nickName})}"/></h4>
        <ul>
            <s:iterator value="userFanses">
                <li><a href="userBlog.html?user.id=<s:property value="fan.id"/>"><img
                        src="<s:property value="fan.pic"/>" title="<s:property value="fan.nickName"/>"/></a></li>
            </s:iterator>
            <li class="li_turn"><a href="javascript:;" class="turn_left"
                                   title="<s:text name="pagination.last.page"/>"></a><a
                    href="javascript:;" class="turn_right"
                    title="<s:text name="pagination.next.page"/>"></a></li>
        </ul>
    </div>
    <div class="ubd_3_2">
        <h4><s:text name="label.course.materials"/></h4>
        <ul>
            <li class="li_1" title="<s:text name="blog.videos"/>">
                <a href="" id="xxx1"></a>
            </li>
            <li class="li_2" title="<s:text name="blog.documents"/>">
                <a href="" id="xxx2"></a>
            </li>
            <li class="li_3" title="<s:text name="course.selection.others"/>">
                <a href="" id="xxx3"></a>
            </li>
        </ul>
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

//                  alert(data.initSeesionString);
            getGirlOjbect().LoadVideoURL(data.initSeesionString);
//                  alert(getGirlOjbect().LoadVideoURL);
        });

    }
</script>
