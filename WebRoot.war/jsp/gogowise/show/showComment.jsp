<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<s:iterator value="showComments" status="idx">
    <li class="li_out" style="text-align: left;">
        <ul class="ul_in">
            <li class="li_1"><s:a action="userBlog" target="_blank"><s:param name="user.id" value="commenter.id"/><img src="<s:property value="commenter.pic"/>"  class="portraitImg"/></s:a></li>
            <li class="li_2"><s:a action="userBlog" target="_blank"><s:param name="user.id" value="commenter.id"/><s:property value="commenter.nickName"/></s:a></li>
            <li class="li_3">
                <span class="span_1"><s:property value="content"/></span>
                <span class="span_2"><s:date name="commentTime" format="%{getText('global.display.datetime')}"/></span>
               <s:if test="myShow.owner.id == #session.userID && commenter.id != #session.userID">
                     <span class="span_3"><a onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:property value="%{getText('blog.comments.reply')}"/></a></span>
                     <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)"><s:property value="%{getText('blog.comments.delete')}"/></a></span>
                </s:if>
                <s:elseif test="myShow.owner.id != #session.userID && commenter.id != #session.userID">
                      <span class="span_3"><a onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:property value="%{getText('blog.comments.reply')}"/></a></span>
                </s:elseif>
                <s:else>
                      <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="myShow.id"/>,<s:property value="id"/>)"><s:property value="%{getText('blog.comments.delete')}"/></a></span>
                </s:else>
            </li>
        </ul>
    </li>
</s:iterator>
 <s:if test="commentsNum != 0">
    <s:if test="!commentsNumOverflow">
        <a  class="more_or_close" onclick="getMoreComments();"><s:property value="%{getText('blog.comments.more.result')}"/>&gt;&gt;</a>
    </s:if>
    <s:elseif test="commentsNumOverflow && commentsNum>=10">
        <a class="more_or_close" onclick="rollBack();">&lt;&lt;<s:property value="%{getText('blog.comments.rollBack')}"/></a>
    </s:elseif>
</s:if>
 <script type="text/javascript">
        function getMoreComments(){
            $.post("moreComments.html",{'myShow.id':<s:property value="myShow.id"/>,'commentsNum':<s:property value="commentsNum"/>},function(data){
                $("#message_list_ul").html(data);
                setDefaultPortraitImage();
            });
        }

        function rollBack(){
            $.post("moreComments.html",{'myShow.id':<s:property value="myShow.id"/>,'commentsNum':0},function(data){
                $("#message_list_ul").html(data);
                setDefaultPortraitImage();
            });
        }
</script>