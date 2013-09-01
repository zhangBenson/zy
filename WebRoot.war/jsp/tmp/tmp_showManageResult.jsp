<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/show/showCreation_js.jsp" %>
<link href="css/show/showManageResult.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.rate.js"></script>

<ul class="ul_1">
        <li class="li_1">
            <s:iterator value="myShows" status="idx">
                <ul class="ul_2">
                    <li class="subli_0">
                        <s:a action="showBlog" target="_blank"><s:param name="myShow.id" value="id"/><img src="<s:property value="logoUrl"/>" onerror="javascript:this.src='images/nopic.jpg'" /></s:a>
                    </li>
                    <li class="subli_1"><h3><s:property value="name"/></h3></li>
                    <li class="subli_2 type2"  id="show_evaluate_li<s:property value="#idx.index"/>"></li>
                    <li class="subli_3"><s:property value="%{getText('show.blog.host.username')}"/>：<s:a action="#" class="orangeWords"><s:property value="owner.nickName"/></s:a></li>
                    <li class="subli_3"><s:property value="%{getText('show.attention.member.num')}"/>：<span class="orangeWords"><s:date name="showDate" format="%{getText('dateformat')}"/></span>
                    </li>
                    <li class="subli_3"><s:property value="%{getText('show.attention.member.num')}"/>：<span class="orangeWords"><s:property value="fansNum"/></span></li>
                    <li class="subli_3"><s:property value="%{getText('show.finished.terms.num')}"/>：<span class="orangeWords"></span></li>
                    <li class="subli_4"><s:property value="%{getText('show.intro')}"/>：<span class="orangeWords"><s:property value="description"/></span></li>
                    <li class="subli_5"><s:a action="initShowManage"><s:property value="%{getText('show.start.manage')}"/><s:param name="myShow.id" value="id"/></s:a></li>
                </ul>
                <script type="text/javascript">
                    $("#show_evaluate_li<s:property value="#idx.index"/>").rate({
                        selected:<s:property value="synthetical"/>,
                        selectable:false,
                        decimal:true,
                        revert:true,
                        fullStar:false
                    });
                </script>
            </s:iterator>
        </li>
</ul>