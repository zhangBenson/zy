<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
    #rejectreason {
        width: 600px;
        margin: 100px auto;
        height: 400px;
        font-family: "微软雅黑", "宋体";
    }

    #rejecthead {
        height: 75px;
        background: url(images/courseImages/gogowise.gif) no-repeat;
        border-bottom: 1px dashed #808080;
    }

    #rejectcon {
        background: url(images/courseImages/no_entry.png) no-repeat;
        margin-top: 15px;
    }

    #rejectreason #text {
        margin-left: 280px;
        height: 300px;
        padding-top: 20px;
    }

    #rejectreason #text p {
        font-size: 16px;
        color: #333;
    }

</style>

<div id="rejectreason">
    <div id="rejecthead"></div>
    <div id="rejectcon">
        <div id="text">
            <p>&nbsp;</p>

            <p><s:text name="text.save.course.error"/></p>
        </div>
    </div>
</div>

