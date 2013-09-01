<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<style type="text/css">
#courseAjustDiv {
	float: left;
	width: 100%;
}
#courseAjustContent {
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	font-family: "微软雅黑", "Lucida Sans Unicode", "Lucida Grande", sans-serif;
}
#courseAjustDiv #courseAjustContent ul li .reasonArea {
	height: 80px;
	width: 300px;
	border: 1px solid #C9F0FA;
}

table,tr,td{
	border-collapse:collapse;
	border: 1px solid #09F;
	text-align:center;
}

tr.odd{
	background-color:#CEFFFF;
}

#courseAjustDiv #courseAjustContent ul li {
	list-style-type: none;
	padding-top: 5px;
	padding-bottom: 5px;
}

#courseAjustContent .resetCourseBtn,
#courseAjustContent  .accpetCourseBtn{
	display:block;
	float:left;
	margin-right:20px;
	height:30px;
	box-shadow:1px 1px 3px rgba(0,0,0,0.2);
	border-radius:6px;
	background-color:#09F;
	line-height:30px;
	text-align: center;
	vertical-align: middle;
	color: #FFF;
	font-weight: bolder;
	padding-right: 5px;
	padding-left: 5px;
	cursor:pointer;
}

#courseAjustContent .resetCourseBtn:hover,
#courseAjustContent  .accpetCourseBtn:hover{
	background-color:#066;
}
</style>

<div id="courseAjustDiv">
  <div id="courseAjustContent">
  	<ul>
    	<li>组织：XXXX</li>
        <li>课程名称：XXXX</li>
        <li>课程表：<br/>
        	<table width="400" cellspacing="0" cellpadding="0">
          <tr>
            <td>课程序列</td>
            <td>课程昵称</td>
            <td>上课时间</td>
            <td>持续时间</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
        </li>
      <li>重新调整的理由：<br/>
          <textarea name="" class="reasonArea"></textarea>
        </li>
        <li><span class="resetCourseBtn">申请重新安排</span><span class="accpetCourseBtn">接受现有安排</span></li>
        <li></li>
        <li></li>
    </ul>
  </div> 
</div>

