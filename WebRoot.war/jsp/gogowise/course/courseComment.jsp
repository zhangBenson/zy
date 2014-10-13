<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:iterator value="courseComments" status="idx">
    <p>
        <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="commenter.id"/><img
                src="<s:property value="commenter.pic"/>"/></s:a>
        <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="commenter.id"/><s:property value="commenter.nickName"/></s:a>
                    <span class="span_out">
                        <span class="span1"><s:property value="content"/></span>
                        <s:if test="course.teacher.id == #session.userID && commenter.id != #session.userID">
                            <a class="span2" href="javascript:;"
                               onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:property value="%{getText('blog.comments.reply')}"/></a>
                            <a class="span2" href="javascript:;"
                               onclick="deleteThisComment(this,<s:property value="id"/>)"><s:property value="%{getText('blog.comments.delete')}"/></a>
                        </s:if>
                        <s:elseif test="course.teacher.id != #session.userID && commenter.id != #session.userID">
                            <a class="span2" href="javascript:;"
                               onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:property value="%{getText('blog.comments.reply')}"/></a>
                        </s:elseif>
                        <s:elseif test=" #session.userID == null">
                            <a class="span2" href="####"
                               onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:property value="%{getText('blog.comments.reply')}"/></a>
                        </s:elseif>
                        <s:else>
                            <a class="span2" href="javascript:;"
                               onclick="deleteThisComment(this,<s:property value="id"/>)"><s:property value="%{getText('blog.comments.delete')}"/></a>
                        </s:else>
                        <span class="span3"><s:date name="commentTime"
                                                    format="%{getText('global.display.datetime')}"/></span>
                    </span>
    </p>
</s:iterator>
<s:if test="commentsNum != 0">
    <s:if test="!commentsNumOverflow">
        <a href="javascript:;" class="more_or_close" onclick="getMoreComments();"><s:property value="%{getText('blog.comments.more.result')}"/>&gt;&gt;</a>
    </s:if>
    <s:elseif test="commentsNumOverflow && commentsNum>=10">
        <a href="javascript:;" class="more_or_close" onclick="rollBack();">&lt;&lt;<s:property value="%{getText('blog.comments.rollBack')}"/></a>
    </s:elseif>
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
