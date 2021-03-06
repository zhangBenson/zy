<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% request.setCharacterEncoding("UTF-8"); %>

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<%--<script type="text/javascript" src="js/keeperScript.js"></script>--%>
<%--<script type="text/javascript" src="js/ajaxReq.js"></script>--%>
<script type="text/javascript" language="javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" language="javascript" src="js/timezone.js"></script>
<script type="text/javascript" src="js/jquery.boxy.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<link type="text/css" href="css/boxy.css" rel="stylesheet"/>
<link href="css/global.css" type="text/css" rel="stylesheet" />
<script src="js/global.js" type="text/javascript"></script>
<!--[if lte IE 6]> <script type="text/javascript" src="js/iepngfix/iepngfix_tilebg.js"></script> <![endif]-->
<script type="text/javascript">

    function createDatePicker(ctlname) {
        var id = "#" + ctlname;
        var dateformate ="<s:text name='dateformat'/>";
        var laguage="<s:text name='language'/>";
       $(id).bind("click", function() {
            $("#" + ctlname).innerText=WdatePicker({lang:laguage,startDate:'%y-%M-%d 00:00:00',dateFmt:dateformate,
                alwaysUseStartDate:true});
        });
    }
    function createDateTimePicker(ctlname) {
       var id = "#" + ctlname;
        var laguage="<s:text name='language'/>";
         var dateTimeformat="<s:text name='dateformat.forclass'/>";
       $(id).bind("click", function() {
            $("#" + ctlname).innerText=WdatePicker({lang:laguage,startDate:'%y-%M-%d 00:00:00',dateFmt:dateTimeformat,
                alwaysUseStartDate:true});

        });
    }
    function createTimePicker(ctlname) {
//        alert(ctlname);
       var id = "#" + ctlname;
       var dateformate ="<s:text name='dateformat.hour.minute'/>";
       var laguage="<s:text name='language'/>";
//       alert($(id).parent().html());
       $(id).bind("click", function() {
            $("#" + ctlname).innerText=WdatePicker({lang:laguage,startDate:'%y-%M-%d 00:00:00',dateFmt:dateformate,
                alwaysUseStartDate:true});
        });
    }

    $(function(){
        if ($("input.Wdatepicker") != null && $("input.Wdatepicker") != undefined) {
            $("input.Wdatepicker").each(function() {
                createDatePicker(this.id);
            });
        }

        if ($("input.WdateTime") != null && $("input.WdateTime") != undefined) {
            $("input.WdateTime").each(function() {
                createDateTimePicker(this.id);
            });
        }

        if ($("input.WTime") != null && $("input.WTime") != undefined) {
            $("input.WTime").each(function() {
                createTimePicker(this.id);
            });
        }

        calculate_time_zone("<s:property value='#session.timeZone'/>");

        $(".change_portrait").fancybox({
            type: 'iframe',
            width: 720,
            height: 490
        });
    });


</script>


<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-26210233-1', 'gogowise.com');
    ga('require', 'displayfeatures');
    ga('send', 'pageview');

</script>
