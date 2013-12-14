<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link type="text/css" href="css/search/searchHeader.css" rel="stylesheet"/>

<div class="searchWrap">
    <div class="searchType">
        <a id="searchType1" href="javascript:startSearch(1);"><s:property value="%{getText('search.header.all')}"/></a>
        <a id="searchType2" href="javascript:startSearch(2);"><s:property value="%{getText('search.header.member')}"/></a>
        <a id="searchType3" href="javascript:startSearch(3);"><s:property value="%{getText('search.header.organization')}"/></a>
        <a id="searchType4" href="javascript:startSearch(4);"><s:property value="%{getText('search.header.course')}"/></a>
        <%--<a id="searchType5" href="javascript:startSearch(5);"><s:property value="%{getText('search.header.show')}"/></a>--%>
        <%--<a id="searchType6" href="javascript:startSearch(6);"><s:property value="%{getText('search.header.live')}"/></a>--%>
    </div>

    <div class="searchInput">
        <form action="searchResult.html" method="POST" id="main_search_form">
            <s:hidden name="searchType" id="searchType_msg"/>
            <s:textfield cssClass="input1" id="searchStr_id" name="searchStr"/>
            <input type="submit" class="input2" value="<s:property value="%{getText('menu.item.search')}"/>"></a>
        </form>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        var searchType = <s:property value="searchType"/>;
        switch(searchType){
            case 1: $("#searchType1").addClass("search_stand_out");break;
            case 2: $("#searchType2").addClass("search_stand_out");break;
            case 3: $("#searchType3").addClass("search_stand_out"); break;
            case 4: $("#searchType4").addClass("search_stand_out"); break;
            case 5: $("#searchType5").addClass("search_stand_out"); break;
            case 6: $("#searchType6").addClass("search_stand_out"); break;
        }
    });



   function startSearch(searchType){
       // window.location.href = "searchResult.html?searchType="+searchType+"&searchStr="+encodeURI($("#searchStr_id").val());
       $("#searchType_msg").attr('value',searchType);
       $("#main_search_form").submit();
   }



</script>

