<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link type="text/css" href="css/search/searchOMList.css" rel="stylesheet"/>

<s:form action="searchResult" theme="css_xhtml" id="postPageForm">
    <s:hidden name="searchType"/>
    <s:hidden name="searchStr"/>
    <div class="listUp">
        <s:hidden value="%{#session.userID}" id="hidSessionId"/>
        <h3 class="h3_title">
            <s:if test="hotType == 1">
                <s:text name="teacher.hottest"/>
            </s:if>
            <s:elseif test="hotType == 2">
                <s:text name="most.hottest.bloger"/>
            </s:elseif>
        </h3>

            <%-- 这是会员列表3个 --%>
        <div class="memeberWrap fl">
            <s:iterator value="baseUsers">
                <div class="memeberInfo fl">
                    <div class="Info1 fl">
                        <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>"><img
                                class="memberLogo" src="<s:property value="pic"/>"/></a>
                    </div>
                    <div class="Info2 fl">
                        <a class="a_title" href="userBlog.html?user.id=<s:property value="id"/>"
                           title="<s:property value="nickName"/>"><s:property value="nickName"/></a> <br/>
                        <span><%--7课程&nbsp;&nbsp;5个人秀&nbsp;&nbsp;4直播&nbsp;&nbsp;--%><s:property value="fansNum"/>关注</span> <br/>
                        <span><s:property value="selfDescription"/></span>
                    </div>
                    <div class="Info3 fr">
                        <s:if test="!userFocused">
                            <a class="a_focus" href="javascript:;" onclick="becomeFans(this,<s:property value="id"/>);"><s:text name="user.add.focus"/></a>
                        </s:if>
                        <s:else>
                            <a class="a_focus" href="javascript:;" onclick="becomeFans(this,<s:property value="id"/>);"><s:text name="user.add.focused"/></a>
                        </s:else>
                    </div>
                </div>
            </s:iterator>
        </div>
        <div class="pagination" style="padding-top:0px;">
            <tiles:insertTemplate template="../paginationPost.jsp">
                <tiles:putAttribute name="pagination" value="${pagination}"/>
            </tiles:insertTemplate>
        </div>
    </div>
</s:form>


<script type="text/javascript">
    function becomeFans(obj, userID) {
        if (validateLogo()) {
            $.post("addUserFocus.html", {'user.id': userID}, function (data) {
                $.fancybox({
                    content: data.message,
                    onComplete: function () {
                        setTimeout("$.fancybox.close();", "2000")
                    }
                });
            });
            $(obj).html("<s:text name='user.add.focused'/>");
        }
    }
</script>
