<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:iterator value="courseComments" status="idx">
    <div class="row">
        <div class="forumsinfo">

            <div class="forumsUserContainer">
                <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="commenter.id"/><img
                        src="<s:property value="commenter.pic"/>" alt="" class="forumportrait"/></s:a>
                <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="commenter.id"/><p
                        class="textOverSinglerow"><s:property value="commenter.nickName"/></p></s:a>
            </div>

            <div class="forumsContentContainer">
                <div class="forumText"><s:property value="content"/></div>
                <p class="text-right"><s:date name="commentTime" format="%{getText('global.display.datetime')}"/></p>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
</s:iterator>
<s:if test="commentsNum != 0">
    <p class="text-right">
        <s:if test="commentsNumOverflow">
            <a href="javascript:;" class="more_or_close" onclick="getMoreComments();"><s:property
                    value="%{getText('blog.comments.more.result')}"/>&gt;&gt;</a>
            <s:if test="commentsNum>5">
                &nbsp;|&nbsp;<a href="javascript:;" class="more_or_close" onclick="rollBack();">&lt;&lt;<s:property
                    value="%{getText('blog.comments.rollBack')}"/></a>
            </s:if>
        </s:if>
    </p>
</s:if>
<script type="text/javascript">
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
