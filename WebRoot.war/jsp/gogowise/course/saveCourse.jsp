<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/view.css" rel="stylesheet"/>
<script type="text/javascript" src="js/calendar1.js"></script>
<script type="text/javascript" src="js/view.js"></script>
<style type="text/css">
#now{background:url(images/navigation-menu2.gif) bottom repeat-x;color:#fff;}
#tabtitle{float:left;overflow:hidden;list-style:none; margin:0; padding:0; margin-left: 5px;}
#tabtitle li{width:120px; height:25px; line-height:24px; float:left; text-align:center;  margin-right:2px;list-style:none; font-size:14px; font-weight:bold;}
#tabtitle li a:link,#tabtitle li a:visited{ text-decoration:none;background:url(images/navigation-menu4.gif) repeat-x bottom; display:block; width:120px; height:25px; color:#fff;}
#tabtitle li a:hover,#tabtitle li a:active{background:url(images/navigation-menu5.gif) bottom repeat-x; color:#fff;}
#html_1{width:800px;word-wrap:break-word; padding:3px; float:left;}
</style>
<div id="rightcontent">
     <div id="html_1">
<s:form action="saveCourse"  validate="true" theme="css_xhtml" method="POST" enctype="multipart/form-data" cssClass="appnitro">
    <s:hidden name="identity"/>

<div id="sinupfirst">
<img id="top" src="images/form/top.png" alt="">
	<div id="form_container">
		<h1><a>&nbsp;GoGoWise</a></h1>
        <div class="appnitro">

		<div class="form_description">
			<h2><s:property value="%{getText('label.class.oline')}" /></h2>
			<p><s:property value="%{getText('text.easy.study')}" /></p>
		</div>

		  <ul >
          <s:if test="identity == 1">
          <h3><s:property value="%{getText('label.online.class.lecturer.info')}" /></h3>
           <li id="li_1" >
		     <label class="description" for="element_1"><s:property value="%{getText('label.online.class.org.name')}" /><span class="errorinfo">*</span></label>
		     <div>
			      <s:textfield name="course.organization.schoolName" cssClass="element text"/>
		     </div>
		  </li>
		  <li id="li_1" >
		     <label class="description" for="element_1"><s:property value="%{getText('label.online.class.teacheremail')}" /> <span class="errorinfo">*</span></label>
		     <div>
			      <s:textfield name="course.teacher.email" required="true" cssClass="element text"/>
		     </div>
		  </li>
          <li id="li_2" >
		     <label class="description" for="element_2"><s:property value="%{getText('label.online.class.cameramanemail')}" /> <span class="errorinfo">*</span></label>
		     <div>
			    <s:textfield name="course.cameraMan.email" cssClass="element text"/>
		     </div>
		  </li>

         </s:if>

         <s:if test="identity == 2">
           <h3><s:property value="%{getText('label.online.class.lecturer.info')}" /></h3>
           <li id="li_3" >
		     <label class="description" for="element_3"><s:property value="%{getText('label.online.class.org.name')}" /><span class="errorinfo">*</span></label>
		     <div>
			     <s:textfield name="course.organization.schoolName" cssClass="element text"/>
		     </div>
		  </li>
          <li id="li_2" >
		     <label class="description" for="element_2"><s:property value="%{getText('label.online.class.cameramanemail')}" /> <span class="errorinfo">*</span></label>
		     <div>
			    <s:textfield name="course.cameraMan.email" cssClass="element text"/>
		     </div>
		  </li>
         </s:if>

         <s:if test="identity == 3">
           <h3><s:property value="%{getText('label.online.class.lecturer.info')}" /></h3>
           <li id="li_3" >
		     <label class="description" for="element_3"><s:property value="%{getText('label.online.class.org.name')}" /><span class="errorinfo">*</span></label>
		     <div>
			     <s:textfield name="course.organization.schoolName"  cssClass="element text"/>
		     </div>
		  </li>
		  <li id="li_1" >
		     <label class="description" for="element_1"><s:property value="%{getText('label.online.class.teacheremail')}" /> <span class="errorinfo">*</span></label>
		     <div>
			      <s:textfield name="course.teacher.email" required="true" cssClass="element text"/>
		     </div>
		  </li>
         </s:if>



      <h3><s:property value="%{getText('label.online.class.type')}" /></h3>

      <s:if test="identity != 4">
       <li id="li_44">

           <label><input name="course.opened"  type="radio" value="true"id="opened" checked="checked"/><s:property value="%{getText('label.online.class.public')}" /></label>
           <label><input name="course.opened" type="radio" value="false" id="notOpened"/><s:property value="%{getText('label.online.class.nopublic')}" /></label>
       </li>

      </s:if>
      <s:if test="identity == 4">
         <li>
             <label><input  type="radio" name="course.teachingNum" value="1" checked="checked" /><s:property value="%{getText('label.online.class.tutor.1to1')}" /></label>
             <label><input  type="radio" name="course.teachingNum" value="2" /><s:property value="%{getText('label.online.class.tutor.1to2')}" /></label>
             <label><input  type="radio" name="course.teachingNum" value="3" /><s:property value="%{getText('label.online.class.tutor.1to3')}" /></label>
             <label><input  type="radio" name="course.teachingNum" value="4" /><s:property value="%{getText('label.online.class.tutor.1tomany')}" /></label>
         </li>
         <li >
	     	<label class="description" for="element_4"><s:property value="%{getText('label.online.class.tutor.price')}" /></label>
		   <div>
			     <input name="course.charges" class="element text medium" type="text" maxlength="255"  value=""/>
                 <label><input  type="radio" name="course.consumptionType" value="true" checked="checked"/><s:property value="%{getText('label.zhibi')}" /></label>
                 <label><input  type="radio" name="course.consumptionType" value="false" /><s:property value="%{getText('label.course.zhiquan')}" /></label>
		   </div>
		</li>
      </s:if>
        <li id="li_4" >
		<label class="description" for="element_4"><s:property value="%{getText('label.online.class.coursename')}" /> </label>
		<div>
			<input id="element_4" name="course.name" class="element text medium" type="text" maxlength="255" value=""/>
		</div>
		</li>
        <li id="li_5" >
		<label class="description" for="element_5"><s:property value="%{getText('label.online.class.introduction')}" /> </label>
		<div>
            <s:textarea cols="30" name="course.description" required="true" cssClass="element textarea medium"/>
		</div>
		</li>		<li id="li_6" >
		<label class="description" for="element_6"><s:property value="%{getText('label.online.class.totalperods')}" /> </label>
		<div>
            <s:textfield name="course.totalHours" required="true" cssClass="element text" size="4" maxlength="4"/>
            <s:property value="%{getText('label.online.class.perods')}" /> </div>
		</li>
             <li id="li_7" >

		<label class="description" for="element_7"><s:property value="%{getText('label.online.class.startdate')}" /> </label>
		<span>
            <!--s:textfield  name="course.startDate" value="%{getText('global.date',{courseClass.date})}"
                         cssClass="date" readonly="true" required="true"/-->
            <!--s:textfield name="course.startDate" id="startDate" /-->

            <%--<s:textfield name="course.startDate" readonly="true" value="" cssClass="Wdate" onfocus="WdatePicker({lang:'%{getText('language')}',startDate:'%y-%M-01 00:00:00',dateFmt:'%{getText('dateformat')}',alwaysUseStartDate:true})"/>--%>
            <s:textfield name="course.startDate" readonly="true" value="" cssClass="Wdatepicker" id="startDate" required="true" />
		</span>
		</li>
              <li id="li_8" >
		<label class="description" for="element_8"><s:property value="%{getText('label.online.class.enddate')}" /> </label>
		<span>
			<!--s:textfield name="course.finishDate" value="%{getText('global.date',{courseClass.date})}"
            class"Wdate" readonly="true" id="date"/-->
            <s:textfield name="course.finishDate" readonly="true" value=""  cssClass="Wdatepicker" id="finishDate" required="true"/>
		</span>

		</li>
         <li id="li_9" >
             <label class="description" for="element_9"><s:property value="%{getText('label.online.class.logo')}" /> </label>
		<img src="images/courseImages/50.png" width="50" height="50" id="reImg" />
		<div>
            <s:file name="upload" id="fileField" cssClass="element file"/>
            <s:hidden name="course.logoUrl"/>
		</div>
		</li>
        <li class="buttons">
                      <s:submit name="" id="button1" value="%{getText('button.next')}" cssClass="button_text" />
		</li> <span class="info"></span>
		  </ul>

            </div>
		<div id="footer">
			<s:property value="%{getText('text.backto')}" /> <a href="http://www.gogowise.com"><s:property value="%{getText('menu.item.index')}" /></a>
		</div>
</div>
<img id="bottom" src="images/form/bottom.png" alt="">
</div>


</s:form>
    </div>
</div>


<script type="text/javascript">
    var fileType="<s:text name='validate.message.filetype'/>"
    var mustBeJpg="<s:text name='validate.message.filetype.must.be'/>"
    var fileSize="<s:text name='validate.message.filesize'/>"
    var dateformat="<s:text name='dateformat'/>"
    function getFullPath(obj) {    //得到图片的完整路径
        if (obj) {
            //ie
    	        if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
    	            obj.select();
    	            return document.selection.createRange().text;
    	        }else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
    	            if (obj.files) {
                       return window.URL.createObjectURL(obj.files.item(0));
    	            }
   	                return obj.value;
    	        }
    	        return obj.value;
    	    }
    }
       	$("#fileField").change(function () {
                    var strSrc = this.value;
        	        img = new Image();
                    var href1 = getFullPath(this);
        	        img.src = href1;
        	        //验证上传文件格式是否正确
        	        var pos = strSrc.lastIndexOf(".");
        	        var lastname = strSrc.substring(pos, strSrc.length);
        	        if (lastname.toLowerCase() != ".jpg" ) {
                    alert(fileType + lastname + ","+mustBeJpg);
                    return false;
                    }//验证上传文件宽高比例
           	        if (img.fileSize / 1024 > 150) {
                        alert(fileSize);
                        return false;
                     }

                     document.getElementById("reImg").src = href1;
         } );
         $(function(){
                   $("#finishDate").datepicker({dateFormat: dateformat});

                });
         $(function(){
                   $("#startDate").datepicker({dateFormat: dateformat});
                });
    var i  = 0;
    $("#notOpened").change(function(){
        $("#li_44").after(function(){
                var html = '<li id="teachingNums"><label><input name="course.teachingNum"  type="radio" value="1" checked="checked"/>1对1</label> <label><input name="course.teachingNum" type="radio" value="2"/>1对2</label>  <label><input name="course.teachingNum" type="radio" value="3"/>1对多</label></li> ';
                return html;
        });
    });
    $("#opened").change(function(){
        $("#teachingNums").remove();
    });
    $(function(){
        $("#notOpened")[0].checked = false;
        $("#opened")[0].checked = true;
    });
</script>