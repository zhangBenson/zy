<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link type="text/css" href="css/search/searchOMList.css" rel="stylesheet"/>


<s:form action="searchResult" theme="css_xhtml" id="postPageForm">
    <s:hidden name="searchType"/>
    <s:hidden name="searchStr"/>
    <div class="listUp">
        <s:hidden value="%{#session.userID}" id="hidSessionId"/>
        <h3 class="h3_title"><s:text name="search.header.organization"/></h3>

            <%-- 这是组织列表 --%>
        <div class="memeberWrap orgInfo fl">

            <s:iterator value="organizations">
                <div class="memeberInfo fl">
                    <div class="Info1 fl">
                        <a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="schoolName"/>"><img
                                class="orgLogo" src="<s:property value="logoUrl"/>"/></a>
                    </div>
                    <div class="Info2 fl">
                        <a class="a_title" href="orgBlog.html?org.id=<s:property value="id"/>"
                           title="<s:property value="schoolName"/>"><s:property value="schoolName"/></a>
                        <span><%--7老师&nbsp;&nbsp;5课程&nbsp;&nbsp;--%>
                            <s:property value="fansNum"/>
                            <s:text name="user.add.focus"/></span>
                        <span><s:property value="description"/></span>
                    </div>
                    <div class="Info3 fr">
                        <s:if test="!userFocused">
                            <a class="a_focus" href="javascript:;" onclick="becomeFans(this,<s:property value="id"/>);"><s:property
                                    value="%{getText('user.add.focus')}"/></a>
                        </s:if>
                        <s:else>
                            <a class="a_focus" href="javascript:;" onclick="becomeFans(this,<s:property value="id"/>);"><s:property
                                    value="%{getText('user.add.focused')}"/></a>
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
    function becomeFans(obj, orgId) {
        if (validateLogo()) {
            $.post("saveOrgFans.html", {'organization.id': orgId}, function (data) {
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
