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
        background: url(images/courseImages/commentslogo.gif) no-repeat;
        margin-top: 15px;
    }

    #rejectreason #text {
        margin-left: 280px;
        height: 300px;
        padding-top: 20px;
    }

    #rejectreason #text p {
        font-size: 14px;
        color: #333;
    }

    .rejectsubmit {
        border: none;
        width: 104px;
        height: 28px;
        background: url(images/courseImages/submitreject.gif);
        cursor: pointer;
    }
</style>

<s:form action="saveRejectComments" method="POST">
    <s:hidden name="course.id"/>
    <s:hidden name="role"/>
    <div id="rejectreason">
        <div id="rejecthead"></div>
        <div id="rejectcon">
            <div id="text">
                <p><s:property value="%{getText('text.reason.rejection')}"/>：</p>

                <p>
                    <s:textarea name="comments" cols="35" rows="3" id="textarea"/>
                </p>

                <p>
                    <s:submit name="" value="" cssClass="rejectsubmit"/>
                </p>
            </div>
        </div>
    </div>
</s:form>