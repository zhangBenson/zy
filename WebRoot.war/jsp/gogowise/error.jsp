<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title><s:text name="error.title"/></title>

    <link type="text/css" rel="stylesheet" href="css/chucuola.css">

</head>

<body youdao="bind">
<div id="header">
    <div id="header_wrap">
        <h1>
            <a href="index.html" title="<s:text name="title.gogowise"/>"></a>
        </h1>
    </div>
</div>
<div id="content">
    <div class="error_img"></div>
    <h3>
        <s:text name="error.info.end.user"/>
    </h3>
    <h4>
        <s:actionerror></s:actionerror>
    </h4>

    <p><a href="index.html"><s:text name="error.back.index"/></a></p>
    <p><a href="javascript:window.history.go(-1);"><s:text name="error.back.previous"/></a></p>

    <p><a href="javascript:showError();"> show details</a></p>

</div>
<div>
    <p style="display: none" id="eMessage">${errorMsg} </p>
</div>
<!--end content-->
<script type="text/javascript">
    function showError() {
        document.getElementById('eMessage').style.display = 'block';
    }
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
