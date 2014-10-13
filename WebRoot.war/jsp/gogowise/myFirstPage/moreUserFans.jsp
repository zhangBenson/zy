<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<span class="title"><s:text name="my.firstpage.users.i.followed"/></span>
<s:if test="userFansNum > 6 && !numOverFlow">
    <span class="more"><a href="javascript:;" onclick="getMoreConcernUserFans();"><s:text name="others.more"/></a></span>
</s:if>
<ul class="courseul">
    <s:iterator value="userFanses">
        <li class="host">
            <a class="host_img" href="userBlog.html?user.id=<s:property value="user.id"/>"
               title="<s:property value="user.nickName"/>"><img src="<s:property value="user.pic"/>"/></a>
            <a class="host_name" href="userBlog.html?user.id=<s:property value="user.id"/>"
               title="<s:property value="user.nickName"/>"><s:property value="user.nickName"/></a>

            <s:if test="userLiving">
                <a class="live_tip"
                   href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="personalOnliveID"/>"
                   title="<s:text name="click.to.watch"/>"><s:text name="video.is.living"/></a>
            </s:if>
        </li>
    </s:iterator>
    <script type="text/javascript">
        function getMoreConcernUserFans() {
            $.post("getMoreConcernUserFans.html", {'currentPageSize':<s:property value="currentPageSize"/>}, function (data) {
                $("#userFans_data").html(data);
            })
        }
    </script>
</ul>
