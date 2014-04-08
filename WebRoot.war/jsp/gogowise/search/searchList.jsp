<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link type="text/css" href="css/search/searchList.css" rel="stylesheet"/>

<div class="listUp">
    <s:hidden value="%{#session.userID}" id="hidSessionId"/>
    <h3 class="h3_title"><a href="javascript:;" onclick="startSearch(2);"><s:property
            value="%{getText('search.header.member')}"/></a>&nbsp;|&nbsp;<a href="javascript:;"
                                                                            onclick="startSearch(3);"><s:property
            value="%{getText('search.header.organization')}"/></a></h3>

    <%-- 这是会员列表3个 --%>
    <div class="memeberWrap fl">

        <s:iterator value="baseUsers">
            <div class="memeberInfo fl">
                <div class="Info1 fl">
                    <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>"><img
                            src="<s:property value="pic"/>"/></a>
                </div>
                <div class="Info2 fl">
                    <a class="a_title" href="userBlog.html?user.id=<s:property value="id"/>"
                       title="<s:property value="nickName"/>"><s:property value="nickName"/></a>
                        <%--<span><s:property value="fansNum"/><s:property value="%{getText('user.add.focus')}"/></span>--%>
                        <%--<s:if test="!userFocused">--%>
                        <%--<a class="a_focus" href="javascript:;" onclick="becomeFans(this,<s:property value="id"/>);"><s:property value="%{getText('user.add.focus')}"/></a>--%>
                        <%--</s:if>--%>
                        <%--<s:else>--%>
                        <%--<a class="a_focus" href="javascript:;" onclick="becomeFans(this,<s:property value="id"/>);"><s:property value="%{getText('user.add.focused')}"/></a>--%>
                        <%--</s:else>--%>
                </div>
            </div>
        </s:iterator>
    </div>


    <%-- 这是组织列表3个 --%>
    <div class="memeberWrap orgInfo fl">
        <s:iterator value="organizations">
            <div class="memeberInfo fl">
                <div class="Info1 fl">
                    <a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="schoolName"/>"><img
                            src="<s:property value="logoUrl"/>"/></a>
                </div>
                <div class="Info2 fl">
                    <a class="a_title" href="orgBlog.html?org.id=<s:property value="id"/>"
                       title="<s:property value="schoolName"/>"><s:property value="schoolName"/></a>
                        <%--<span><s:property value="fansNum"/><s:property value="%{getText('user.add.focus')}"/></span>--%>
                        <%--<s:if test="!userFocused">--%>
                        <%--<a class="a_focus" href="javascript:;" onclick="becomeOrgFans(this,<s:property value="id"/>);"><s:property value="%{getText('user.add.focus')}"/></a>--%>
                        <%--</s:if>--%>
                        <%--<s:else>--%>
                        <%--<a class="a_focus" href="javascript:;" onclick="becomeOrgFans(this,<s:property value="id"/>);"><s:property value="%{getText('user.add.focused')}"/></a>--%>
                        <%--</s:else>--%>
                </div>
            </div>
        </s:iterator>
    </div>
</div>

<div class="listDown fl">
    <h3 class="h3_title"><a href="javascript:;" onclick="startSearch(4);"><s:property
            value="%{getText('search.header.course')}"/></a>

        <%-- 这是课程循环的Div  --%>
        <s:iterator value="courses">
        <div class="listView fl">
            <div class="viewRight fl">
                <a class="img" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                   title="<s:property value="name"/>">
                    <img src="<s:property value="logoUrl"/>"/>
                </a>
                <a class="person" href="userBlog.html?user.id=<s:property value="teacher.id"/>"
                   title="<s:property value="teacher.nickName"/>"><img width="30" height="30"
                                                                       src="<s:property value="teacher.pic"/>"/></a>
            </div>

            <div class="viewLeft fl">
                <p class="title">
                    <a class="title" href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                       title="<s:property value="name"/>"><s:property value="name"/></a>
                    <a class="watch orange_words"
                       href="voaCourseBlog.html?course.id=<s:property value="id"/>"><s:property
                            value="%{getText('gogowise.things.details')}"/></a>
                </p>

                <p class="info">
                    <span><span class="orange_words"><s:date name="startDate" format="%{getText('dateformat')}"/></span></span>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <span>
                            <s:if test="charges == 0">
                                <span class="orange_words"> <s:property
                                        value="%{getText('course.without.charges')}"/></span>
                            </s:if>
                            <s:else>
                                <span class="orange_words"><s:property value="course.charges"/> &nbsp;&nbsp;<s:property
                                        value="%{getText('course.consumptionType.true')}"/></span>
                            </s:else>
                        </span>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <span><span class="orange_words"> <s:property value="courseStudentsNum"/>&nbsp;</span><s:property
                            value="%{getText('course.blog.purchase.num')}"/></span>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <span><span class="orange_words"> <s:property value="courseRecommendNum"/>&nbsp;</span><s:property
                            value="%{getText('course.blog.recommend.num')}"/></span> &nbsp;&nbsp;|&nbsp;&nbsp;
                    <span><s:property value="%{getText('course.blog.total.terms')}"/><span
                            class="orange_words"> <s:property value="courseTermsNum"/>&nbsp;</span><s:property
                            value="%{getText('course.blog.total.terms.tail')}"/></span>
                </p>

                <p><s:property value="description"/></p>
            </div>
        </div>
        </s:iterator>


</div>

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
    function becomeOrgFans(obj, orgId) {
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