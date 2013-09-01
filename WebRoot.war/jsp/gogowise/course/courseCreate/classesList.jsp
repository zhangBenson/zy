<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<s:iterator value="courseClasses" status="idx">
  <tr id="classes<s:property value="id"/>">
      <td id="course_name<s:property value="id"/>"><s:property value="#idx.index+1"/></td>
      <td id="course_nickName<s:property value="id"/>" class="course_nickName_text"><s:property value="nickName"/></td>
      <td id="course_date<s:property value="id"/>"><s:date name="date" format="%{getText('global.display.hour.minute')}"/></td>
      <td id="course_duration<s:property value="id"/>"><s:property value="duration"/></td>
      <td>
          <a class="class_btn edit_class_btn" id="course_edit<s:property value="id"/>" onclick="editSpecifiedClass(<s:property value="id"/>);"><s:property value="%{getText('course.class.edit')}"/></a>
      </td>
      <td>
          <a class="class_btn" onclick="deleteAddedClass('classes<s:property value="id"/>',<s:property value="id"/>);"><s:property value="%{getText('course.class.delete')}"/></a>
      </td>
  </tr>
</s:iterator>