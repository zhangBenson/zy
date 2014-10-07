<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style type="text/css">
        #main {
            font-size: 12px;
            width: 600px; /*height:350px;*//*overflow-y:scroll;*/
            color: black;
            text-align: left;
        }

        #main p {
            font-family: "΢微软雅黑", "宋体";
            line-height: 25px;
            color: #333;
            text-align: left;
        }

        #main h4 {
            color: #333;
            font-size: 14px;
            margin-top: 10px;
            margin-bottom: 4px;
            text-align: left;
            display: block;
            clear: both;
        }

        #main h3 {
            color: #333;
            font-size: 16px;
            margin-top: 10px;
            margin-bottom: 4px;
            text-align: left;
        }
    </style>

    <META content="MSHTML 6.00.2800.1106" name=GENERATOR>
</head>

<body>
<div id="main">
    <ol>
        <li><h4 class="centerTittle"><s:text name="course.creation.low.rule"/></h4>

            <p><s:text name="course.creation.low.rule.content"/></p></li>
        <li><h4 class="centerTittle"><s:text name="course.creation.charges.rule"/></h4>

            <p>a) <s:text name="course.creation.charges.rule.content.a"/><br/>
                b)<s:text name="course.creation.charges.rule.content.b"/></p></li>
        <li><h4><s:text name="course.creation.is.not.perfect"/></h4>
            <h4><s:text name="course.creation.rule.tail"/></h4>
        </li>
    </ol>
</div>
</body>
</html>



