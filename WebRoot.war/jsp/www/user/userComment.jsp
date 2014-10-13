<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div id="message_list_ul">
    <s:iterator value="comments" status="idx">
        <div class="row">
            <div class="forumsinfo">
                <div class="forumsUserContainer">
                    <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="owner.id"/><img
                            src="<s:property value="owner.pic"/>" alt="" class="forumportrait"/></s:a>
                    <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="owner.id"/><p
                            class="textOverSinglerow"><s:property value="owner.nickName"/></p></s:a>
                </div>

                <div class="forumsContentContainer">
                    <div class="forumText"><s:property value="description"/></div>
                    <p class="text-right"><s:date name="createDate" format="%{getText('global.display.datetime')}"/></p>

                        <%-- <s:if test="user.id == #session.userID && owner.id != #session.userID">
                            <span class="span_3"><a onclick="replyToComment('<s:property value="owner.nickName"/>')" href="#message_area_tip"><s:text name="blog.comments.reply"/></a></span>
                            <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)" href="#message_area_tip"><s:text name="blog.comments.delete"/></a></span>
                        </s:if>
                        <s:elseif test="user.id != #session.userID && owner.id != #session.userID">
                            <span class="span_3"><a onclick="replyToComment('<s:property value="owner.nickName"/>')" href="#message_area_tip"><s:text name="blog.comments.reply"/></a></span>
                        </s:elseif>
                        <s:else>
                            <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)" href="#message_area_tip"><s:text name="blog.comments.delete"/></a></span>
                        </s:else>  --%>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </s:iterator>
</div>
<s:if test="commentsNum != 0">
    <s:if test="!commentsNumOverflow">
        <a class="more_or_close" onclick="getMoreComments();" href="#message_area_tip"><s:property value="%{getText('blog.comments.more.result')}"/>&gt;&gt;</a>
    </s:if>
    <s:else>
        <a class="more_or_close" onclick="rollBack();" href="#message_area_tip">&lt;&lt;<s:property value="%{getText('blog.comments.rollBack')}"/></a>
    </s:else>
</s:if>

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
