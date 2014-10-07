<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>


<tiles:importAttribute name="pagination"/>
<link rel="stylesheet" href="css/pagination.css"/>

<table class="pagination">
    <tr>
        <td>
            <s:hidden name="pagination.pageNow" id="pagenumForNow"/>
            <s:if test="pagination.hasPre">
                <s:url id="url_pre" action="%{pagination.actionName}">
                    <s:param name="pagination.pageNow" value="pagination.pageNow-1"></s:param>
                </s:url>
                <s:a href="#" cssClass="page_pre" onclick="postFormPrePag(this)"
                     title="%{getText('pagination.last.page')}"><s:text name="pagination.last.page"/><s:property
                        value="actionName"/></s:a>
            </s:if>

            <s:bean name="org.apache.struts2.util.Counter" id="counter">
                <s:param name="first" value="1"/>
                <s:param name="last" value="pagination.totalPage"/>
            </s:bean>

            <s:iterator value="counter" status="status">
                <s:url id="getNextPage" action="%{pagination.actionName}">
                    <s:param name="pagination.pageNow"><s:property/></s:param>
                </s:url>
                <%--aa<s:property value="#status.index"/>    bb--%>
                <%--<s:a href="%{getNextPage}">--%>

                <s:if test="pagination.pageNow==#status.index+1">
                    <s:a href="#" cssClass="page_now">
                        <s:property/>
                    </s:a>
                </s:if>

                <s:else>
                    <s:a href="#" onclick="postFormWithPag(this)" cssClass="page_other">
                        <s:property/>
                    </s:a>
                </s:else>


            </s:iterator>


            <s:if test="pagination.hasNext">
                <s:url id="url_next" action="%{pagination.actionName}">
                    <s:param name="pagination.pageNow" value="pagination.pageNow+1"></s:param>
                </s:url>
                <s:a href="#" onclick="postFormNextPag()" cssClass="page_next"
                     title="%{getText('pagination.next.page')}"><s:text name="pagination.next.page"/></s:a>
            </s:if>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function postFormWithPag(aobj) {
        document.getElementById('pagenumForNow').value = aobj.innerHTML;
        document.getElementById('postPageForm').submit();
    }
    function postFormPrePag(aobj) {
        document.getElementById('pagenumForNow').value = parseInt(document.getElementById('pagenumForNow').value) - 1;
        document.getElementById('postPageForm').submit();
    }
    function postFormNextPag(aobj) {
        document.getElementById('pagenumForNow').value = parseInt(document.getElementById('pagenumForNow').value) + 1;
        ;
        document.getElementById('postPageForm').submit();
    }
</script>


