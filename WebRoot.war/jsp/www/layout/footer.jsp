<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<div class="container">
    <div class="footersbg">
        <div class="row">
            <div class="col-md-2">
                <div class="footersLogo"></div>
            </div>
            <div class="col-md-10">
                <%--<div class ="footersSiteInfo">Service email:gogowise@gogowise.com    Copyright 1997 - 2012 All Rights Reserved, ready for record</div>
                --%>
                <div class="footersSiteInfo">
                    <s:text name="text.service.email"/>&nbsp;&nbsp;&nbsp;
                    <s:text name="text.copyright"/>
                </div>

                <%--<div class="footersLink">|  Home |  COURSES  |  SCHOOLS  |</div> --%>
                <div class="footersLink">| <a href="index.html" style="color: #fff;"><s:text name="menu.item.index"/></a> | <a href="courseCenter.html"
                                                                                                                               style="color: #fff;"><s:text name="frame.course.center"/></a> | <a href="schoolCenter.html"
                                                                                                                                                                                                  style="color: #fff;"><s:text name="frame.schools.center"/></a> | <a href="aboutUs.html"
                                                                                                                                                                                                                                                                      style="color: #fff;"><s:text name="link.about.us"/></a> |
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F7a385c45f142eb625e3851e626090111' type='text/javascript'%3E%3C/script%3E"));
</script>
