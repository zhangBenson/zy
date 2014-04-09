<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%--<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>--%>
<script type="text/javascript" src="js/jqueryTabs.js"></script>
<link type="text/css" href="css/org/orgBlog.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>

<div class="ubd_1">
    <div class="ubd_1_1">
        <img src="<s:property value="org.logoUrl"/>" class="courseImg"/>
    </div>
    <div class="ubd_1_2">
        <h4><s:property value="org.schoolName"/></h4>
    </div>
    <div class="ubd_1_3">
        <ul>
            <li><s:property value="userCoursesNum"/><s:property value="orgCourseNum"/>课程</li>
            <li><s:property value="userCoursesStudentNum"/><s:property value="studentsNum"/>学生</li>
            <%--<li><s:property value="userFansNum"/>36粉丝</li>--%>
        </ul>
    </div>
    <div class="udb_1_4">
        <a href="javascript:;" id="focus_btn" onclick=";"><s:property value="%{getText('onlive.focus.on')}"/></a>
    </div>
</div>

<div class="ubd_2">
    <div class="ubd_2_1">
        <h4><s:property value="org.schoolName"/>简介</h4>

        <p>
            <s:property value="org.description"/>
        </p>
    </div>
    <div class="ubd_2_2">
        <h4>精品课程</h4>
        <a class="a_all">(全部<s:property value="bestCoursesNum"/>)</a>
        <ul>
            <s:iterator value="hotCourses">
                <li class="course">
                    <s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>
                        <img src="<s:property value="logoUrl"/> " title="<s:property value="description"/>"
                             class="courseImg"/>
                    </s:a>
                    <span title="<s:property value="name"/>"><s:a action="voaCourseBlog"><s:param name="course.id"
                                                                                                  value="id"/><s:property
                            value="name"/></s:a></span>
                </li>
            </s:iterator>
        </ul>
    </div>
    <div class="ubd_2_online">
        <h4>直播室</h4>
        <%--<p>--%>
        <%--知元网是全国首家致力于云教育的网络平台。知元网采用云计算、云存储技术，以及先进多媒体压缩、交互技术，P2P以及P2G混合型数据传输方式等，为广大的学生、老师、教育组织、公司等提供虚拟网络教学平台以及相关的服务，如虚拟教室及相关功能。同时我们将为合作的网站提供应用的接口，根据网站的需求提供相应的接口，如课程安排。我们竭诚为莘莘学子，教师，组织领导等提供我们最好的服务！--%>
        <%--</p>--%>
        <div class="scroll_out">
            <div class="scroll_left" id="left_scroll"></div>
            <div class="scroll_in">
                <div class="div_tmp">
                    <ul id="scroll_ul">
                        <s:iterator value="hotCourses">
                            <li class="li_out">
                                <s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>
                                    <ul title="<s:property value="name"/>">
                                        <li>第2期</li>
                                        <li><s:property value="name"/></li>
                                        <li><s:date name="startDate"
                                                    format="%{getText('global.display.datetime')}"/></li>
                                    </ul>
                                    <%--<img src="<s:property value="logoUrl"/> " title="<s:property value="name"/>"  class="courseImg"/>--%>
                                </s:a>
                            </li>
                        </s:iterator>
                    </ul>
                </div>
            </div>
            <div class="scroll_right" id="right_scroll"></div>
        </div>
    </div>
    <div class="ubd_2_3">
        <h4>留言板</h4>

        <p id="message_area_tip"></p>

        <div class="ubd_2_3_area">
            <s:hidden value="%{#session.userID}" id="hidSessionId"/>
            <s:form theme="css_xhtml" name="commentsForm" method="post" action="saveUserBlogComments" validate="true">
                <s:hidden name="user.id"/>
                <textarea id="message_textarea"></textarea>
                <input type="button" id="message_submit_btn" value="提交留言"/>
            </s:form>
        </div>
        <div class="ubd_2_3_list">
            <ul class="ul_out" id="message_list_ul">
                <s:iterator value="comments" status="idx">
                    <li class="li_out">
                        <ul class="ul_in">
                            <li class="li_1"><s:a action="userBlog" target="_blank"><s:param name="user.id"
                                                                                             value="owner.id"/><img
                                    src="<s:property value="commenter.pic"/>" class="portraitImg"/></s:a></li>
                            <li class="li_2"><s:a action="userBlog" target="_blank"><s:param name="user.id"
                                                                                             value="owner.id"/><s:property
                                    value="commenter.nickName"/></s:a></li>
                            <li class="li_3">
                                <span class="span_1"><s:property value="description"/></span>
                                <span class="span_2"><s:date name="createDate"
                                                             format="%{getText('global.display.datetime')}"/></span>
                                <s:if test="org.responsiblePerson.id == #session.userID && commenter.id != #session.userID">
                                    <span class="span_3"><a
                                            onclick="replyToComment('<s:property value="commenter.nickName"/>',
                                                <s:property value="commenter.id"/>)" href="javascript:;">回复</a></span>
                                    <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)">删除</a></span>
                                </s:if>
                                <s:elseif
                                        test="org.responsiblePerson.id != #session.userID && commenter.id != #session.userID">
                                    <span class="span_3"><a
                                            onclick="replyToComment('<s:property value="commenter.nickName"/>',
                                                <s:property value="commenter.id"/>)" href="javascript:;">回复</a></span>
                                </s:elseif>
                                <s:else>
                                    <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)"
                                                            href="javascript:;">删除</a></span>
                                </s:else>
                            </li>
                        </ul>
                    </li>
                </s:iterator>
                <li class="li_out">
                    <s:if test="commentsNum != 0">
                        <s:if test="!commentsNumOverflow">
                            <a class="more_or_close" onclick="getMoreComments();" href="javascript:;"><s:property
                                    value="%{getText('blog.comments.more.result')}"/>&gt;&gt;</a>
                        </s:if>
                        <s:elseif test="commentsNumOverflow && commentsNum>=10">
                            <a class="more_or_close" onclick="rollBack();" href="javascript:;">&lt;&lt;<s:property
                                    value="%{getText('blog.comments.rollBack')}"/></a>
                        </s:elseif>
                    </s:if>
                </li>
                <script type="text/javascript">
                    function getMoreComments() {
                        $.post("moreOrgComments.html", {'org.id':<s:property value="org.id"/>, 'commentsNum':<s:property value="commentsNum"/>}, function (data) {
                            $("#message_list_ul").html(data);
                        });
                    }
                    function rollBack() {
                        $.post("moreOrgComments.html", {'org.id':<s:property value="org.id"/>, 'commentsNum': 0}, function (data) {
                            $("#message_list_ul").html(data);
                        });
                    }
                </script>
            </ul>
        </div>
    </div>
</div>

<div class="ubd_3">
    <div class="ubd_3_1">
        <h4>金牌老师</h4>
        <ul>
            <s:iterator value="hotTeachers">
                <li><img src="<s:property value="pic"/>" class="portraitImg" title="<s:property value="nickName"/>"/>
                </li>
            </s:iterator>
            <li class="li_turn"><a href="javascript:;" class="turn_left" title="上一页"></a><a href="javascript:;"
                                                                                            class="turn_right"
                                                                                            title="下一页"></a></li>
        </ul>
    </div>
    <div class="ubd_3_2">
        <h4>所有老师</h4>
        <ul>
            <s:iterator value="latestTeachers">
                <li><img src="<s:property value="pic"/>" class="portraitImg" title="<s:property value="nickName"/>"/>
                </li>
            </s:iterator>
            <li class="li_turn"><a href="javascript:;" class="turn_left" title="上一页"></a><a href="javascript:;"
                                                                                            class="turn_right"
                                                                                            title="下一页"></a></li>
        </ul>
    </div>
    <div class="ubd_3_3">
        <h4>组织数据</h4>
        <ul>
            <li class="li_1" title="<s:property value="%{getText('blog.videos')}" />"></li>
            <li class="li_2" title="<s:property value="%{getText('blog.documents')}" />"></li>
            <li class="li_3" title="<s:property value="%{getText('course.selection.others')}" />"></li>
        </ul>
    </div>
</div>


<script type="text/javascript">
    var SellerScroll = function (options) {
        this.SetOptions(options);
        this.lButton = this.options.lButton;
        this.rButton = this.options.rButton;
        this.oList = this.options.oList;
        this.showSum = this.options.showSum;

        this.iList = $("#" + this.options.oList + " > li");
        this.iListSum = this.iList.length;
        this.iListWidth = this.iList.outerWidth(true);
        this.moveWidth = this.iListWidth * this.showSum;

        this.dividers = Math.ceil(this.iListSum / this.showSum);	//共分为多少块
        this.moveMaxOffset = (this.dividers - 1) * this.moveWidth;
        this.LeftScroll();
        this.RightScroll();
    };
    SellerScroll.prototype = {
        SetOptions: function (options) {
            this.options = {
                lButton: "left_scroll",
                rButton: "right_scroll",
                oList: "scroll_ul",
                showSum: 4    //一次滚动多少个items
            };
            $.extend(this.options, options || {});
        },
        ReturnLeft: function () {
            return isNaN(parseInt($("#" + this.oList).css("left"))) ? 0 : parseInt($("#" + this.oList).css("left"));
        },
        LeftScroll: function () {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.lButton).click(function () {
                currentOffset = _this.ReturnLeft();
                if (currentOffset == 0) {
                    for (var i = 1; i <= _this.showSum; i++) {
                        $(_this.iList[_this.iListSum - i]).prependTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth });
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, { duration: "slow", complete: function () {
                        for (var j = _this.showSum + 1; j <= _this.iListSum; j++) {
                            $(_this.iList[_this.iListSum - j]).prependTo($("#" + _this.oList));
                        }
                        $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 1) });
                    } });
                } else {
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, "slow");
                }
            });
        },
        RightScroll: function () {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.rButton).click(function () {
                currentOffset = _this.ReturnLeft();
                if (Math.abs(currentOffset) >= _this.moveMaxOffset) {
                    for (var i = 0; i < _this.showSum; i++) {
                        $(_this.iList[i]).appendTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 2) });

                    $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, { duration: "slow", complete: function () {
                        for (var j = _this.showSum; j < _this.iListSum; j++) {
                            $(_this.iList[j]).appendTo($("#" + _this.oList));
                        }
                        $("#" + _this.oList).css({ left: 0 });
                    } });
                } else {
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, "slow");
                }
            });
        }
    };
    $(document).ready(function () {
        var ff = new SellerScroll();

        $("#message_submit_btn").bind('click', function () {
            if (validateLogo()) {
                var messageText = $("#message_textarea").val();
                if (messageText == "") {
                    $("#message_area_tip").html("留言不能为空");
                    return;
                }
                if (validateForm_saveUserBlogComments()) {
                    $.post("saveOrgComment.html", {'org.id': '<s:property value="org.id"/>', 'comment.description': messageText, 'commentsNum':<s:property value="commentsNum"/>}, function (data) {
                        $("#message_list_ul").html(data);
                    });
                }
                $("#message_textarea").attr('value', "");
                $("#message_area_tip").html("");
            }
        })

        $("#message_textarea").keyup(function () {
            changeWordNumber($(this), $("#message_area_tip"), 250);
        });
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

    function replyToComment(nickName, userID) {
        var prefixStr = "回复";
        $("#message_textarea").val(prefixStr + nickName + ": ");
        $("#message_textarea").focus();
        $.post("putUserIDtoSession.html", {'user.id': userID}, function (data) {
        });
    }
    function deleteThisComment(obj, commentId) {
        $(obj).parents("li.li_out").remove();
        $.post("deleteOrgComment.html", {'comment.id': commentId}, function (data) {
        });

    }
</script>
