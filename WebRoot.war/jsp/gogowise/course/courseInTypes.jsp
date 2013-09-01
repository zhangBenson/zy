<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<ul class="left">
    <s:iterator value="coursesInTypesLeft">
      <li><a href="voaCourseBlog.html?course.id=<s:property value="id"/>" class="courseInTypes_name_size"><s:property value="name"/></a><span class="price"><s:property value="charges"/><s:property value="%{getText('label.zhibi.true')}"/></span><span class="date"><s:date name="startDate" format="%{getText('dateformat')}"/></span></li>
    </s:iterator>
</ul>
<div class="split"></div>
<ul class="right">
   <s:iterator value="coursesInTypesRight">
      <li><a href="voaCourseBlog.html?course.id=<s:property value="id"/>" class="courseInTypes_name_size"><s:property value="name"/></a><span class="price"><s:property value="charges"/><s:property value="%{getText('label.zhibi.true')}"/></span><span class="date"><s:date name="startDate" format="%{getText('dateformat')}"/></span></li>
    </s:iterator>
</ul>
<script type="text/javascript ">
    function getSubstringForCourseName(str){
         var letterExp = /[u00-uFF]/;
         var len = 0;
         for (var j = 0; j < str.length; j++) {
            var c = str.charAt(j);
            if (letterExp.test(c) || c==" ") {
                len++;
            }else {
                len += 2;
            }
            if(len > 30){
               return str.substring(0,j)+"...";
            }
         }
         return str;
    }
    for(var i=0; i<$(".courseInTypes_name_size").size();i++){
      var str = $($(".courseInTypes_name_size")[i]).html();

      $($(".courseInTypes_name_size")[i]).html(getSubstringForCourseName(str));
    }
</script>