<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link rel="stylesheet" type="text/css" href="css/view2.css" media="all">
<script type="text/javascript" src="js/view.js"></script>

<div>
<div id="tishi" align="center">
    <div>
        <style type="text/css">
            .tips1all {
                width: 700px;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 14px;
                color: #333;
                margin: 0px auto;
            }

            .tips1 {
                width: 700px;
                font-size: 14px;
                color: #333;
            }

            .tips1 h2 {
                color: #FFF;
                text-align: center;
                background: #39F;
                padding: 3px 0;
                margin: 0px;
            }

            .tips1 p {
                text-indent: 2em;
                margin: 5px;
            }

            .tips1 .bottom {
                margin-top: 10px;
                height: 40px;
                margin: 30px 10px 5px;
                text-align: right;
            }

            .tips1 .content {
                margin: 4px 6px;
                line-height: 170%;
            }

            .tips1 .button1 {
                background: url(images/next.gif) no-repeat;
                height: 30px;
                width: 65px;
                border: 0px;
                cursor: pointer;
            }

            .wwlbl {
                float: none;
                clear: both;
            }

            .wwctrl {
                float: none;
            }
        </style>
    </div>

    <div class="tips1all">
        <img src="images/form/top.png" width="700" height="9"/>

        <div class="tips1">
            <h2>温馨提示</h2>

            <div class="content">
                <strong>尊敬的用户：</strong>

                <p><strong>您好！</strong></p>

                <p>您现在正在申请变更注册组织的负责人，变更成功以后，您将成为注册组织新的负责人，是否继续？ </p>

                <div class="bottom">
                    <input type="button" name="button" id="button1" value="" class="button1" onclick="disshow();"/>
                </div>
            </div>
        </div>
        <img src="images/form/bottom.png" width="700" height="9"/>
    </div>
</div>
<s:form id="form" action="changeResponser" method="POST" validate="true" theme="css_xhtml">
    <div id="formdiv" style="display:none;" align="center">

        <div id="sinupfirst">
            <img id="top" src="images/form/top.png" alt="">

            <div id="form_container">

                <h1><a>&nbsp;Gogowise</a></h1>

                <div class="form_description">
                    <h2>负责人更改</h2>

                    <p>让你的学习变得简单却丰满！</p>
                </div>

                <ul id="ul"><h3>现负责人信息</h3>

                    <li id="li_10">
                        <label class="description" for="element_10">注册组织<b style="color:red;"
                                                                           id="yzschoolname">*</b></label>

                        <div>
                            <s:select name="changeResponserHistory.organization.country"
                                      list="#{'中国':'中国','加拿大':'加拿大'}" value="'中国'"
                                      cssClass="element select medium" id="element_10"/>
                            国家
                            <s:select name="changeResponserHistory.organization.province" list="#{'湖南省':'湖南省'}"
                                      value="'湖南省'"
                                      cssClass="element select medium" id="element_11"/>
                            省
                            <s:select name="changeResponserHistory.organization.city" list="#{'长沙市':'长沙市'}"
                                      value="'长沙市'"
                                      cssClass="element select medium" id="element_12"/>
                            市
                            <s:select name="changeResponserHistory.organization.schoolName"
                                      list="#{'湖南大学':'湖南大学','其它':'其它'}" value="'湖南大学'"
                                      cssClass="element select medium" id="schoolname"/>
                            组织
                        </div>
                    </li>
                    <li id="li_1">
                        <label class="description" for="crusername">组织现负责人姓名<b style="color:red;"
                                                                               id="yzcrusername">*</b></label>

                        <div>
                            <s:textfield id="crusername" name="changeResponserHistory.currentResponser.userName"
                                         cssClass="element text medium" type="text"
                                         maxlength="255" value=""/>
                        </div>
                    </li>
                    <li id="li_2">
                        <label class="description" for="cremail">组织现负责人Email<b style="color:red;"
                                                                               id="yzcremail">*</b></label>

                        <div>
                            <s:textfield id="cremail" name="changeResponserHistory.currentResponser.email"
                                         cssClass="element text medium" type="text"
                                         maxlength="255" value=""/>
                        </div>
                    </li>
                    <li id="li_3">
                        <label class="description" for="crtelphone">组织现负责人联系电话<b style="color:red;"
                                                                                 id="yzcrtelphone">*</b></label>

                        <div>
                            <s:textfield id="crtelphone" name="changeResponserHistory.currentResponser.telphone"
                                         cssClass="element text medium" type="text"
                                         maxlength="255" value=""/>
                        </div>
                    </li>
                    <h3>申请人信息</h3>
                    <li id="li_4">
                        <label class="description" for="nrusername">申请人姓名 <b style="color:red;" id="yznrusername">*</b></label>

                        <div>
                            <s:textfield id="nrusername" name="changeResponserHistory.newResponser.userName"
                                         cssClass="element text medium" type="text"
                                         maxlength="255" value=""/>
                        </div>
                    </li>
                    <li id="li_5">
                        <label class="description" for="nremail">申请人Email <b style="color:red;"
                                                                             id="yznremail">*</b></label>

                        <div>
                            <s:textfield id="nremail" name="changeResponserHistory.newResponser.email"
                                         cssClass="element text medium" type="text"
                                         maxlength="255" value=""/>
                        </div>
                    </li>
                    <li id="li_6">
                        <label class="description" for="nrtelphone">申请人联系电话 <b style="color:red;"
                                                                               id="yznrtelphone">*</b></label>

                        <div>
                            <s:textfield id="nrtelphone" name="changeResponserHistory.newResponser.telphone"
                                         cssClass="element text medium" type="text"
                                         maxlength="255" value=""/>
                        </div>
                    </li>
                    <h3>申请人个人账户信息</h3>
                    <li id="li_7">
                        <label class="description" for="element_7">申请人开户名 </label>

                        <div>
                            <s:textfield id="element_7" name="userAccountInfo.disposeName"
                                         cssClass="element text medium" type="text"
                                         maxlength="255" value=""/>
                        </div>
                    </li>
                    <li id="li_8">
                        <label class="description" for="element_8">申请人开户行 </label>

                        <div>
                            <s:textfield id="element_8" name="userAccountInfo.bankName"
                                         cssClass="element text medium" type="text"
                                         maxlength="255" value=""/>
                        </div>
                    </li>
                    <li id="li_9">
                        <label class="description" for="element_9">申请人开户账号 </label>

                        <div>
                            <s:textfield id="element_9" name="userAccountInfo.bankAccount"
                                         cssClass="element text medium" type="text"
                                         maxlength="255" value=""/>
                        </div>
                    </li>
                    <li id="li_11">
                        <label class="description" for="element_10">重复申请人开户账号 <b style="color:red;"
                                                                                 id="yzrereelement_10"></b></label>

                        <div>
                            <s:textfield id="reelement_10" name=""
                                         cssClass="element text medium" type="text"
                                         maxlength="255" value=""/>
                        </div>
                    </li>

                    <li class="buttons">
                        <input id="saveForm" type="button" value="下一步"/>
                    </li>
                </ul>
                <div id="footer">
                    返回 <a href="http://www.gogowise.com">知元首页</a>
                </div>
            </div>
            <img id="bottom" src="images/form/bottom.png" alt="">
        </div>

    </div>
</s:form>
</div>
<script type="text/javascript">
    var errorMsg = "信息填写不全，无法提交";
    function disshow() {
        $("#tishi").css('display', 'none');
        $("#formdiv").css('display', 'block');
    }
    $("#schoolname").change(function () {
        var school = $("#schoolname").val();
        if (school == "其它") {
            $("<input id='schoolname' name='changeResponserHistory.organization.schoolName' value='' onblur='check(this);'/>").replaceAll($(this));
        }
    });

    function check(obj) {
        $("#yzschoolname").text("*");
        if ($(obj).val() == "") {
            errorMsg = "   请输入学校名称！！";
            $("#yzschoolname").text(errorMsg);
            return;
        }
        errorMsg = "";
    }

    $("#crusername").blur(function () {
        $("#yzcrusername").text("*");
        if ($("#crusername").attr('value') == "") {
            errorMsg = "用户名不能为空";
            $("#yzcrusername").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#nrusername").blur(function () {
        $("#yznrusername").text("*");
        if ($("#nrusername").attr('value') == "") {
            errorMsg = "用户名不能为空";
            $("#yznrusername").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#cremail").blur(function () {
        $("#yzcremail").text("*");
        if ($("#cremail").attr('value') != "") {
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            var email = $("#cremail").val();
            if (!pattern.test(email)) {
                errorMsg = "邮件格式不对";
                $("#yzcremail").text(errorMsg);
                return;
            }
            errorMsg = "";
        } else {
            errorMsg = "邮件不能为空";
            $("#yzcremail").text(errorMsg);
            return;
        }
    });
    $("#nremail").blur(function () {
        $("#yznremail").text("*");
        if ($("#nremail").attr('value') != "") {
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            var email = $("#nremail").val();
            if (!pattern.test(email)) {
                errorMsg = "邮件格式不对";
                $("#yznremail").text(errorMsg);
                return;
            }
            errorMsg = "";
        } else {
            errorMsg = "邮件不能为空";
            $("#yznremail").text(errorMsg);
            return;
        }
    });
    $("#crtelphone").blur(function () {
        $("#yzcrtelphone").text("*");
        if ($("#crtelphone").attr('value') == "") {
            errorMsg = "电话号码不能为空";
            $("#yzcrtelphone").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#nrtelphone").blur(function () {
        $("#yznrtelphone").text("*");
        if ($("#nrtelphone").attr('value') == "") {
            errorMsg = "电话号码不能为空";
            $("#yznrtelphone").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    function checkForm() {
        if ($("#schoolname").val() != null && $("#crusername").val() != null && $("#nrusername").val() != null) {
        }
        else {

        }
    }
    $("#saveForm").click(function () {
        if (errorMsg == "") {
            document.forms[0].submit();
        } else {
            $("#ul").before(function () {
                return "<div><span style='color: red;'>对不起，信息填写不全，无法提交</span></div>";
            });
        }
    });
    $("#reelement_10").blur(function () {
        if ($("#reelement_10").val() != $("#element_9").val()) {
            errorMsg = "账户信息不一致";
            $("#yzrereelement_10").text(errorMsg);
        } else {
            errorMsg = "";
        }
    });
</script>
