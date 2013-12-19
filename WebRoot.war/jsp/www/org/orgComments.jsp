<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<%--<s:iterator value="comments" status="idx">--%>
<%--<li class="li_out">--%>
<%--<ul class="ul_in">--%>
<%--<li class="li_1"><s:a action="userBlog" target="_blank"><s:param name="user.id" value="owner.id"/><img src="<s:property value="commenter.pic"/>" class="portraitImg"/></s:a></li>--%>
<%--<li class="li_2"><s:a action="userBlog" target="_blank"><s:param name="user.id" value="owner.id"/><s:property value="commenter.nickName"/></s:a></li>--%>
<%--<li class="li_3">--%>
<%--<span class="span_1"><s:property value="description"/></span>--%>
<%--<span class="span_2"><s:date name="createDate" format="%{getText('global.display.datetime')}"/></span>--%>
<%--<s:if test="org.responsiblePerson.id == #session.userID && commenter.id != #session.userID">--%>
<%--<span class="span_3"><a onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)" href="javascript:;">回复</a></span>--%>
<%--<span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)" href="javascript:;">删除</a></span>--%>
<%--</s:if>--%>
<%--<s:elseif test="org.responsiblePerson.id != #session.userID && commenter.id != #session.userID">--%>
<%--<span class="span_3"><a onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)" href="javascript:;">回复</a></span>--%>
<%--</s:elseif>--%>
<%--<s:else>--%>
<%--<span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)" href="javascript:;">删除</a></span>--%>
<%--</s:else>--%>
<%--</li>--%>
<%--</ul>--%>
<%--</li>--%>
<%--</s:iterator>--%>

<s:iterator value="comments" status="idx">
    <s:if test="#idx.getCount() < 3">
        <div class="row">
            <div class="col-md-2">
                <div class="portrait">
                    <s:a action="userBlog" ><s:param name="user.id" value="commenter.id"/><img src="<s:property value="commenter.pic"/>"/></s:a>
                    <br/>
                     <span>
                        <s:a action="userBlog" ><s:param name="user.id" value="commenter.id"/><s:property value="commenter.nickName"/></s:a>
                    </span>
                </div>
            </div>
            <div class="col-md-10">
                <div class="forumContent">
                    <s:property value="content"/>
                </div>

                <div class="forumContentDate">
                    <s:date name="commentTime" format="%{getText('global.display.datetime')}"/>
                </div>
            </div>
        </div>
    </s:if>
</s:iterator>


<script type="text/javascript">
    function getMoreComments(){
        $.post("moreUserComments.html",{'user.id':<s:property value="user.id"/>,'commentsNum':<s:property value="commentsNum"/>},function(data){
            $("#message_list_ul").html(data);
        });
    }

    function rollBack(){
        $.post("moreUserComments.html",{'org.id':<s:property value="org.id"/>,'commentsNum':0},function(data){
            $("#message_list_ul").html(data);
        });
    }
</script>