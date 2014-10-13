<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:head/>

<script src="js/dialog.js" type="text/javascript"></script>
<link type="text/css" href="css/dialog.css" rel="stylesheet"/>

<style type="text/css">
    .errorinfo {
        color: #F00;
        font-size: 10px;
        float: left;
    }

    .errorMessage {
        color: #F00;
        font-size: 10px;
        float: left;
    }

    #mainEnter {
        width: 600px;
        margin: 0px auto;
        margin-top: 80px;
        margin-bottom: 60px;
        font-family: "微软雅黑", "宋体";
        font-size: 12px;
    }

    #get_back_pwd {
        color: rgb(0, 138, 255);
        background: url(images/title_login_4.gif) left top no-repeat;
        padding-left: 50px;
        text-align: left;
        height: 57px;
        font-size: 18px;
        line-height: 40px;
    }

    #center {
        margin: 0px auto;
        margin-top: 40px;
        width: 400px;
    }

    #center table tr td {
        height: 30px;
    }

    h1 {
        font-family: "微软雅黑", "宋体";
        color: #333;
        font-size: 12px;
    }

    .tdleft {
        text-align: right;
        width: 150px;
    }

    .con {
        background: #EAEAEA;
    }

    #question {
        float: right;
        font-size: 10px;
    }

    #question a {
        color: #666;
    }

    .btn {
        text-align: center;
    }

    .btn a img {
        border: none;
    }

    .repassword_submit_btn {
        border: none;
        color: #FFF;
        font-size: 16px;
        display: block;
        float: left;
        background: #9acd32;
        height: 30px;
        margin-top: 8px;
        margin-left: 20px;
        margin-bottom: 10px;
        line-height: 30px;
        padding-left: 15px;
        padding-right: 15px;
        box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
        border-radius: 3px;
    }
</style>

<div class="container">
    <div class="thinline"></div>
    <br/>

    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6" style="">
            <div class="basePanelTextLeft">
                <h1 class="courseSubject"><s:text name="label.get.back.password"/></h1>

                <h1 class="courseSynopsis"><s:text name="message.protect.safety"/></h1>

                <s:form action="yzRePasswordCode" id="form" method="POST" theme="css_xhtml" validate="true"
                        cssClass="form-horizontal">
                    <%--<form class="form-horizontal" role="form">--%>
                    <s:hidden name="user.email"/>
                    <div class="form-group">

                        <label for="textfield" class="col-sm-2 control-label">Email</label>

                        <div class="col-sm-10">
                                <%--<input type="email" class="form-control" id="inputEmail3" placeholder="Please Input Your Email" check="mail" disabled></div>--%>
                            <s:textfield type="text" name="user.email" id="textfield" disabled="true"
                                         cssClass="form-control"/>
                        </div>

                        <div class="col-sm-offset-2 col-sm-10">
                            <br/>
                                <%--<button type="submit" class="btn btn-danger  btn-sm btn-block">Send the validation code</button>--%>
                            <a href="#" class="btn btn-danger  btn-sm btn-block" onclick="sendEmail();"><s:property value="%{getText('button.send.valid.code')}"/></a>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="textfield2" class="col-sm-2 control-label"><s:property value="%{getText('label.valid.code')}"/>：</label>

                        <div class="col-sm-10">
                                <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Please Input Validation Code">--%>
                            <s:textfield name="rePasswordCode" id="textfield2" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success  btn-lg btn-block">Submit</button>
                        </div>
                    </div>
                </s:form>
            </div>
        </div>
        <div class="col-sm-3"></div>
    </div>
</div>

<script type="text/javascript">
    var sent = "<s:text name='message.valid.code.sent'/>";
    var getIn = "<s:text name='message.click.get.in'/>";
    var gongxi = "<s:text name='title.of.message.box'/>";
    function sendEmail() {
        // var timestamp = (new Date()).valueOf();
        $.post("sendPasswordEmail.html?user.email=<s:property value='user.email'/>");
        var email = '<s:property value="user.email" />';
        var emailBox = "";
        if (email == 'qq.com') {
            emailBox = 'http://www.' + email.substr(email.lastIndexOf('@') + 1, email.length);
        } else {
            emailBox = 'http://www.' + email.substr(email.lastIndexOf('@') + 1, email.length);
        }
        var context = "<h1 align='center'>" + sent + "</h1><br/><a href='" + emailBox + "' target='_blank'>" + getIn + emailBox + "</a>";
        new Dialog(context, {time: 4000, title: gongxi, center: true}).show();
    }
    function goUrl(obj) {

    }
</script>
