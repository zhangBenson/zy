<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>


	<div class="container">
		<div class="footersbg">
			<div class="row">
				<div class="col-md-2">
					<div class="footersLogo"></div>
				</div>
				<div class="col-md-10">
					<%--<div class ="footersSiteInfo">Service email:gogowise@gogowise.com    Copyright 1997 - 2012 All Rights Reserved, ready for record</div>
					--%>
					<div class ="footersSiteInfo">
						<s:property value="%{getText('text.service.email')}"/>&nbsp;&nbsp;&nbsp;
        				<s:property value="%{getText('text.copyright')}"/>
					</div>

					<%--<div class="footersLink">|  Home |  COURSES  |  SCHOOLS  |</div> --%>
					<div class="footersLink">|  <a href="index.html" style="color: #fff;"><s:property value="%{getText('menu.item.index')}"/></a>   |   <a href="courseCenter.html" style="color: #fff;"><s:property value="%{getText('frame.course.center')}"/></a>   |   <a href="schoolCenter.html" style="color: #fff;"><s:property value="%{getText('frame.schools.center')}"/></a>   |   <a href="aboutUs.html" style="color: #fff;"><s:property value="%{getText('link.about.us')}"/></a>   |
					</div>
				</div>
			</div>
		</div>
	</div>