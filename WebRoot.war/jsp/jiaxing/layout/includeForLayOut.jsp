<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% request.setCharacterEncoding("UTF-8"); %>


<script type="text/javascript" src="js/common.js"></script>
<script>

    $(document).ready(function () {
        if ($("#gogowiseTitle").val()) {
            document.title = $("#gogowiseTitle").val();
        }
        $(".change_portrait").fancybox({
            type: 'iframe',
            width: 720,
            height: 490
        });
    });

    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-26210233-1', 'gogowise.com');
    ga('require', 'displayfeatures');
    ga('send', 'pageview');

</script>

