<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title><s:property value="%{getText('error.title')}"/></title>

    <link type="text/css" rel="stylesheet" href="css/chucuola.css">

</head>

<body youdao="bind">
<div id="header">
    <div id="header_wrap">
        <h1>
            <a href="index.html" title="<s:property value="%{getText('title.gogowise')}"/>"></a>
        </h1>
    </div>
</div>
<div id="content">
    <div class="error_img"></div>
    <h4><s:property value="%{getText('error.not.exist')}"/></h4>

    <p><a href="index.html"><s:property value="%{getText('error.back.index')}"/></a></p>
    <p><a href="javascript:window.history.go(-1);"><s:property value="%{getText('error.back.previous')}"/></a></p>
</div>
<!--end content-->
<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-27089053-1']);
    _gaq.push(['_setDomainName', 'gogowise.com']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();
</script>


</body>
</html>