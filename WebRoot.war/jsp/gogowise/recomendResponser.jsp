<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<style type="text/css">
    <!--
    #onlingclass {
        width: 600px;
        margin: 0px auto;
        background: url(images/organiseshool.gif) top no-repeat;
        padding-top: 60px;
        padding-left: 50px;
        display: none;
    }

    #con1 {
        width: 500px;
        background: #ECF5FF;
        float: left;
        text-align: center;
        vertical-align: middle;
        padding-top: 15px;
        font-family: "微软雅黑", "宋体";
        padding-left: 50px;
    }

    #con1 h1 {
        font-family: "微软雅黑", "宋体";
        font-size: 16px;
        color: #999;
        text-align: left;
        margin: 10px 0;
        border-bottom: #999 1px dotted;
    }

    #button1 {
        width: 100px;
        height: 27px;
        border: none;
        background: url(images/onlineclasssubmit.gif);
        margin-left: 80px;
        cursor: pointer;
    }

    .btn {
        background-repeat: no-repeat;
        width: 65px;
        height: 25px;
        border: none;
        cursor: pointer;
    }

    .errorinfo {
        color: #F00;
        font-size: 11px;
        width: 160px;
        text-align: left;
    }

    .tdleft {
        text-align: left;
        padding: 3px 30px;
        color: #C60;
        font-size: 12px;
    }

    .errorinfo1 {
        color: #F00;
        font-size: 11px;
    }

    #button1 {
        width: 70px;
        height: 25px;
        border: none;
        background: url(images/onlineclassnext.gif);
        cursor: pointer;
        margin: 10px 5px 10px 50px;
    }

    #button2 {
        width: 70px;
        height: 25px;
        border: none;
        background: url(images/classreset.gif);
        cursor: pointer;
        margin: 10px 5px;
    }

    p#info {
        color: #C00;
    }

    -->
</style>
<style type="text/css">
    .tips1all {
        width: 770px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 12px;
        color: #333;
        margin: 0px auto;
    }

    .tips1 {
        width: 770px;
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

    .tips1 .content ul li {
        list-style: square;
        color: #CA4200;
        font-size: 12px;
        margin: 2px;
    }
</style>

<div>
    <div id="tishi" align="center">
        <div class="tips1all">
            <img src="images/top.png" width="770" height="10"/>

            <div class="tips1">
                <h2>温馨提示</h2>

                <div class="content">
                    <strong>尊敬的用户：</strong>

                    <p><strong>您好！</strong></p>

                    <p>您现在正在推荐实体学校成为知元网的注册组织。 </p>

                    <p>
                        如果您的朋友是某个实体学校的负责人，如校长、教务处主任等，您可以推荐您朋友成为实体学校在知元网上注册组织的负责人。如果您的朋友正式成为其实体学校在知元网上注册组织的负责人，您将终生拥有您朋友作为负责人期间其注册组织所有新网上教学课件所产生的版权收益（以下简称注册组织负责人负责期间版权收益，包括负责期间所有实时课程教学、视频点播、课件下载等）的2%作为您的推荐报酬，我们定期将报酬转账至您的个人账户。具体说明如下：， </p>
                    <ul>
                        <li>您将填写推荐表格，请认真填写，所填信息关系到您作为推荐人同注册组织负责人推荐身份关系的确认；</li>
                        <li>
                            如果您所推荐的负责人正式成为其所在实体学校在知元网注册组织的负责人以后，您将正式成为实体学校知元网推荐人，其注册组织负责人负责期间收益的2%作为您推荐组织的报酬，我们将按季为您结算；
                        </li>
                        <li>如果您所推荐的负责人离职，不再是其所在实体学校在知元网上注册组织的负责人以后，您将终生拥有其注册组织负责人负责期间版权收益的2%，我们将定期转账至您的个人账户。</li>
                    </ul>
                    <div class="bottom">
                        <input type="submit" name="button" id="next" value="" class="button1" onclick="disshow();"/>
                    </div>
                </div>
            </div>
            <img src="images/bottom.png" width="770" height="10"/>
        </div>
    </div>
    <s:form id="form" action="recomendResponser" method="POST">
        <div id="onlingclass">
            <div id="con1">
                <table width="400" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td><s:fielderror><s:param>errorInfo</s:param></s:fielderror></td>
                    </tr>
                    <tr id="before">
                        <td><h1>推荐人基本信息</h1></td>
                    </tr>
                    <tr>
                        <td class="tdleft">您的Email<span class="errorinfo" id="yzemail">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield type="text" name="organization.agent.email" id="email"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">您的密码<span class="errorinfo" id="yzpwd">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:password type="text" name="password" id="pwd"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">密码确认<span class="errorinfo" id="yzrepwd">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:password type="text" name="repassword" id="repwd"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">您的真实姓名<span class="errorinfo" id="yzusername">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield type="text" name="organization.agent.userName"
                                                        id="username"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">身份证号码<span class="errorinfo" id="yzcard">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield type="text" name="organization.agent.cardId" id="card"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">您的联系电话<span class="errorinfo" id="yztelphone">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield type="text" name="organization.agent.telphone"
                                                        id="telphone"/></td>
                    </tr>
                    <tr>
                        <td><h1>推荐组织机构负责人信息</h1></td>
                    </tr>
                    <tr>
                        <td class="tdleft">您所推荐的组织机构<span class="errorinfo" id="yzschool">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:select name="organization.schoolName" list="#{'湖南大学':'湖南大学','其它':'其它'}"
                                                     value="'湖南大学'" id="select"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">负责人姓名<span class="errorinfo" id="yzresusername">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield type="text" name="responser.userName" id="resusername"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">负责人Email<span class="errorinfo" id="yzresemail">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield type="text" name="responser.email" id="resemail"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">负责人联系电话<span class="errorinfo" id="yzrestelphone">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield type="text" name="responser.telphone" id="restelphone"/></td>
                    </tr>

                    <tr>
                        <td align="left"><input type="button" name="button1" id="button1" value=""/>
                            <input type="reset" name="button2" id="button2" value=""/></td>
                    </tr>
                </table>
            </div>
        </div>
    </s:form>
</div>
<script type="text/javascript">
    var errorMsg = "  ";
    function disshow() {
        $("#tishi").css('display', 'none');
        $("#onlingclass").css('display', 'block');
    }

    $("#select").change(function () {
        var school = $("#select").val();
        if (school == "其它") {
            $("<input id='select' name='organization.schoolName' value='' onblur='check(this);'/>").replaceAll($(this));
        }
    });
    function check(obj) {
        $("#yzschool").text("*");
        if ($(obj).val() == "") {
            errorMsg = "   请输入学校名称！！";
            $("#yzschool").text(errorMsg);
            return;
        }
        errorMsg = "";
    }
    $("#pwd").blur(function () {
        $("#yzpwd").text("*");
        if ($("#pwd").attr('value') == "") {
            errorMsg = "密码不能为空";
            $("#yzpwd").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#repwd").blur(function () {
        $("#yzrepwd").text("*");
        if ($("#repwd").attr('value') != $("#pwd").attr('value')) {
            errorMsg = "两次密码不一致";
            $("#yzrepwd").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#email").blur(function () {
        $("#yzemail").text("*");
        if ($("#email").attr('value') != "") {
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            var email = $("#email").val();
            if (!pattern.test(email)) {
                errorMsg = "邮件格式不对";
                $("#yzemail").text(errorMsg);
                return;
            }
            errorMsg = "";
        } else {
            errorMsg = "邮件不能为空";
            $("#yzemail").text(errorMsg);
            return;
        }

    });
    $("#username").blur(function () {
        $("#yzusername").text("*");
        if ($("#username").attr('value') == "") {
            errorMsg = "用户名不能为空";
            $("#yzusername").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#card").blur(function () {
        $("#yzcard").text("*");
        if ($("#card").attr('value') == "") {
            errorMsg = "身份证号不能为空";
            $("#yzcard").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#telphone").blur(function () {
        $("#yztelphone").text("*");
        if ($("#telphone").attr('value') == "") {
            errorMsg = "手机号不能为空";
            $("#yztelphone").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#depositName").blur(function () {
        $("#yzdepositName").text("*");
        if ($("#depositName").attr('value') == "") {
            errorMsg = "开户人姓名不能为空";
            $("#yzdepositName").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#depositBankName").blur(function () {
        $("#yzdepositBankName").text("*");
        if ($("#depositBankName").attr('value') == "") {
            errorMsg = "开户银行不能为空";
            $("#yzdepositBankName").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#depositBankAccount").blur(function () {
        $("#yzdepositBankAccount").text("*");
        if ($("#depositBankAccount").attr('value') == "") {
            errorMsg = "开户帐号不能为空";
            $("#yzdepositBankAccount").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#resusername").blur(function () {
        $("#yzresusername").text("*");
        if ($("#resusername").attr('value') == "") {
            errorMsg = "负责人姓名不能为空";
            $("#yzresusername").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#resemail").blur(function () {
        $("#yzresemail").text("*");
        if ($("#resemail").attr('value') == "") {
            errorMsg = "负责人邮件不能为空";
            $("#yzresemail").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#restelphone").blur(function () {
        $("#yzrestelphone").text("*");
        if ($("#restelphone").attr('value') == "") {
            errorMsg = "负责人电话不能为空";
            $("#yzrestelphone").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#button1").click(function () {
        if (errorMsg == "") {
            document.forms[0].submit();
        } else {
            $("#before").before(function () {
                return "<tr><td><span class='errorinfo'>对不起，信息填写不全，无法提交</span></td></tr>";
            });
        }
    });
</script>