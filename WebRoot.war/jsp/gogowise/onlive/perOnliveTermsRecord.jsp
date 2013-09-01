<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/virtualClass/personalVirtualRoom_js.jsp" %>

<s:iterator value="personalOnlives" status="idx">
    <li class="li_out">
        <a href="javaScript:;" onclick="LoadVideo(<s:property value="id"/>);">
            <ul title="<s:property value="name"/>">
                <li><s:property value="%{getText('sequence.of.first')}"/><s:property value="sequence"/><s:property value="%{getText('sequence.of.tail')}"/></li>
                <li><s:date name="startDate" format="%{getText('global.display.datetime')}"/></li>
            </ul>
        </a>
    </li>
</s:iterator>
<script type="text/javascript">
    function  loadRightTerms(){
        <s:if test="perOnlivTermsMinSquence != 1">
             $.post("loadRightTerms.html",{'user.id':<s:property value="user.id"/>,'perOnlivTermsMinSquence':<s:property value="perOnlivTermsMinSquence"/>,'biggestSquence':<s:property value="biggestSquence"/>},function(data){
                      $("#scroll_ul").html(data);
             });
        </s:if>
    }
    function  loadLeftTerms(){
        <s:if test="perOnlivTermsMaxSquence != biggestSquence">
             $.post("loadLeftTerms.html",{'user.id':<s:property value="user.id"/>,'perOnlivTermsMaxSquence':<s:property value="perOnlivTermsMaxSquence"/>,'biggestSquence':<s:property value="biggestSquence"/>},function(data){
                      $("#scroll_ul").html(data);
             });
         </s:if>
    }
</script>