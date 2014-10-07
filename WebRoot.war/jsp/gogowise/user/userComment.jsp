<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:iterator value="comments" status="idx">
    <li class="li_out">
        <ul class="ul_in">
            <li class="li_1"><s:a action="userBlog" target="_blank"><s:param name="user.id" value="owner.id"/><img
                    src="<s:property value="owner.pic"/>" class="portraitImg"/></s:a></li>
            <li class="li_2"><s:a action="userBlog" target="_blank"><s:param name="user.id"
                                                                             value="owner.id"/><s:property
                    value="owner.nickName"/></s:a></li>
            <li class="li_3">
                <span class="span_1"><s:property value="description"/></span>
                <span class="span_2"><s:date name="createDate" format="%{getText('global.display.datetime')}"/></span>
                <s:if test="user.id == #session.userID && owner.id != #session.userID">
                    <span class="span_3"><a onclick="replyToComment('<s:property value="owner.nickName"/>')"
                                            href="#message_area_tip">回复</a></span>
                    <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)"
                                            href="#message_area_tip">删除</a></span>
                </s:if>
                <s:elseif test="user.id != #session.userID && owner.id != #session.userID">
                    <span class="span_3"><a onclick="replyToComment('<s:property value="owner.nickName"/>')"
                                            href="#message_area_tip">回复</a></span>
                </s:elseif>
                <s:else>
                    <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)"
                                            href="#message_area_tip">删除</a></span>
                </s:else>
            </li>
        </ul>
    </li>
</s:iterator>
<li class="li_out">
    <s:if test="commentsNum != 0">
        <s:if test="!commentsNumOverflow">
            <a class="more_or_close" onclick="getMoreComments();" href="#message_area_tip">更多&gt;&gt;</a>
        </s:if>
        <s:else>
            <a class="more_or_close" onclick="rollBack();" href="#message_area_tip">&lt;&lt;收起</a>
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
