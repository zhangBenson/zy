<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    function getSubstringForNewsName(str) {
        var letterExp = /[u00-uFF]/;
        var len = 0;
        for (var j = 0; j < str.length; j++) {
            var c = str.charAt(j);
            if (letterExp.test(c) || c == " ") {
                len++;
            } else {
                len += 2;
            }
            if (len > 30) {
                return str.substring(0, j) + "...";
            }
        }
        return str;
    }

    $(document).ready(function () {

        for (var i = 0; i < $(".goGoWiseAnnounce_newEvents").size(); i++) {
            var str = $($(".goGoWiseAnnounce_newEvents")[i]).html();
            $($(".goGoWiseAnnounce_newEvents")[i]).html(getSubstringForNewsName(str));
        }

        for (var i = 0; i < $(".course_newEvents").size(); i++) {
            var str = $($(".course_newEvents")[i]).html();
            $($(".course_newEvents")[i]).html(getSubstringForNewsName(str));
        }

        for (var i = 0; i < $(".show_newEvents").size(); i++) {
            var str = $($(".show_newEvents")[i]).html();
            $($(".show_newEvents")[i]).html(getSubstringForNewsName(str));
        }


    });
</script>
