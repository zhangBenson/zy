<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>SignUp Page</title>
    <style type="text/css">
        #all {
            width: 1280px;
            margin: 0 auto;
        }

        body {
            background: #800040;
            font-family: "微软雅黑", "宋体";
            font-size: 12px;
        }

        #all {
            width: 1280px;
            margin: 0 auto;
        }

        #nav {
            list-style: none;
            padding: 0px;
            font-size: 14px;
            margin-left: 90px;
            font-weight: bold;
            margin-top: -4px;
        }

        #nav li {
            float: left;
            width: 100px;
        }

        #nav li a {
            text-decoration: none;
            color: #FFFFFF;
            text-align: center;
            display: block;
            width: 100px;
            line-height: 20px;
        }

        #nav li a:hover, #nav li a:active {
            color: #FFFF00;
        }

        #main {
            width: 1010px;
            margin-left: 140px;
            margin-top: -2px;
            position: relative;
            background: url(images/mainback_32.gif) right top no-repeat #FFF;
            float: left;
        }

        #bottom {
            width: 1020px;
            margin-left: 138px;
            margin-top: -1px;
            background: url(images/first_32.gif) top no-repeat;
            height: 29px;
            float: left;
        }

        #footer {
            text-align: center;
            background: url(images/first_35.gif) bottom left no-repeat;
            float: left;
            margin: 10px 0 10px 140px;
            height: 30px;
            width: 1010px;
            line-height: 30px;
            text-align: center;
            color: #FFFFFF;
        }

        #footercontent {
            text-align: center;
            color: #FFFFFF;
        }

        .title1 {
            font-size: 18px;
            color: #800040;
            padding: 10px 0 0 6px;
            font-weight: bold;
            text-align: center;
        }

        .title2 {
            font-weight: bold;
            font-size: 14px;
            color: #333;
            padding: 30px 0 10px 6px;
            border-bottom: #333 dashed 1px;
        }

        .tbleft {
            text-align: right;
            width: 80px;
            vertical-align: middle;
            padding: 10px 6px 10px 0px;
        }

        .btn {
            background-repeat: no-repeat;
            width: 75px;
            height: 30px;
            border: none;
            cursor: pointer;
        }

        #btn1 {
            background: url(images/submitsignup.gif);
        }

        #btn2 {
            background: url(images/reset.gif);
        }

        #tablebottom {
            border-top: #333 dotted 1px;
            text-align: center;
            padding-top: 20px;
            height: 60px;
        }

        .wronginfo {
            font-size: 12px;
            color: #F00;
        }

        #toptb {
            padding: 4px 0 10px 5px;
        }
    </style>


</head>

<body>
<div id="all">
<table cellpadding="0" cellspacing="0">
    <tr>
        <td width="138" height="70"></td>
        <td colspan="2">
            <img src="images/first_02.gif" width="235" height="70" alt=""></td>
        <td>
            <img src="images/first_03.gif" width="359" height="70" alt=""></td>
        <td colspan="3">
            <img src="images/first_04.gif" width="426" height="70" alt=""></td>
        <td>
            <img src="images/first_05.gif" width="122" height="70" alt=""></td>
    </tr>
    <tr>
        <td width="138" height="202"></td>
        <td>
            <img src="images/first_07.gif" width="2" height="202" alt=""></td>
        <td colspan="2">
            <img src="images/first_08.gif" width="592" height="202" alt=""></td>
        <td colspan="2">
            <img src="images/first_09.gif" width="237" height="202" alt=""></td>
        <td>
            <img src="images/first_10.gif" width="189" height="202" alt=""></td>
        <td>
            <img src="images/first_11.gif" width="122" height="202" alt=""></td>
    </tr>
    <tr>
        <td width="138" height="198"></td>
        <td colspan="4">
            <img src="images/first_13.gif" width="801" height="198" alt=""></td>
        <td colspan="2">
            <img src="images/first_14.gif" width="219" height="198" alt=""></td>
        <td>
            <img src="images/first_15.gif" width="122" height="198" alt=""></td>
    </tr>
    <tr>
        <td width="138" height="48"></td>
        <td colspan="6" width="1020" height="48"
            style="padding-bottom:10px; background:url(images/first_17.gif) top no-repeat;">
            <ul id="nav">
                <li><a href="#">活动首页</a></li>
                <li><a href="#">大赛新闻</a></li>
                <li><a href="#">赛事直播</a></li>
                <li><a href="#">精彩回顾</a></li>
                <li><a href="#">赛事简介</a></li>
                <li><a href="#">报名须知</a></li>
                <li><a href="#">投票专区</a></li>
                <li><a href="#">参赛选手</a></li>

            </ul>
        </td>
        <td width="122" height="48"></td>
    </tr>
    <tr>
        <td width="138" height="25"></td>
        <td colspan="6">
            <img src="images/first_20.gif" width="1020" height="25" alt=""></td>
        <td width="122" height="25"></td>
    </tr>
    <tr>
        <td>
            <img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="138" height="1" alt=""></td>
        <td>
            <img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="2" height="1" alt=""></td>
        <td>
            <img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="233" height="1" alt=""></td>
        <td>
            <img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="359" height="1" alt=""></td>
        <td>
            <img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="207" height="1" alt=""></td>
        <td>
            <img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="30" height="1" alt=""></td>
        <td>
            <img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="189" height="1" alt=""></td>
        <td>
            <img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="122" height="1" alt=""></td>
    </tr>
</table>
<div id="main">


    <table width="798" height="110" border="0" align="center">
        <tr>
            <td colspan="3"><span class="bigcn">主题 Topic: <span class="STYLE6"><s:property value="competition.subject.name"/> <s:property value="competition.name"/> </span></span>
            </td>
        </tr>
        <tr>
            <td width="213"><span class="bigcn">开始日期: </span><span class="STYLE6"><s:property value="%{getText('global.date',{competition.startDate})}"/></span></td>
            <td width="213"><span class="bigcn">报名结束日期: </span><span class="STYLE6"><s:property value="%{getText('global.date',{competition.singUpEndDate})}"/></span></td>
        </tr>
        <tr>
            <td width="213"><span class="bigcn">EMAIL: </span><span class="STYLE6"><s:property value="competition.subject.owner.email"/></span></td>
            <td width="198"><span class="bigcn">电话 Tel:<span class="STYLE6"> <s:property value="competition.phone"/></span></span>
            </td>
        </tr>
    </table>


    <s:form enctype="multipart/form-data" validate="true" method="POST" theme="css_xhtml">

        <s:hidden name="singUpInfo.user.id"/>
        <s:hidden name="singUpInfo.id"/>
        <s:hidden name="type"/>
        <s:hidden name="competition.id"/>
        <s:hidden name="haveUserInfo"/>
        <s:hidden name="showCompetitionSessionList"/>
        <table width="750" border="0" cellspacing="0" cellpadding="0">
            <tr class="title2">
                <td colspan="4" class="title2">报名基本信息</td>
            </tr>
            <tr>
                <s:if test="%{haveUserInfo}">
                    <td class="tbleft">Email：</td>
                    <td>
                        <lable>
                            <s:property value="singUpInfo.user.email"/>
                            <s:hidden name="singUpInfo.user.email" id="email"/>
                        </lable>
                    </td>
                </s:if>

                <s:else>
                    <td class="tbleft">Email：</td>
                    <td><s:textfield name="singUpInfo.user.email" id="email"/><span id="yzemail"
                                                                                    class="wronginfo">*</span></td>
                </s:else>
            </tr>

            <s:if test="%{haveUserInfo==false}">
                <tr>
                    <td class="tbleft">密码：</td>
                    <td><s:password name="singUpInfo.user.password" id="pwd"/>
                        <span class="wronginfo" id="yzpwd">*</span></td>
                    <td class="tbleft">密码确认：</td>
                    <td><s:password name="duplicate" id="repwd"/>
                        <span class="wronginfo" id="yzrepwd">*</span></td>
                </tr>
            </s:if>

            <tr>
                <td class="tbleft">参赛宣言：</td>
                <td><s:textfield name="singUpInfo.enounce" id="enounce" required="true"/>
                    <span class="wronginfo" id="yzenounce">*</span></td>
                <td class="tbleft">演唱形式：</td>
                <td>
                    <s:select
                            list="#{1:{getText('singup.singType.1')},2:{getText('singup.singType.2')},3:{getText('singup.singType.3')}}"
                            name="singUpInfo.singType" listKey="key" listValue="value" headerKey=""
                            headerValue="请选择演唱形式" id="singtype"/>
                    <span class="wronginfo" id="yzsingtype">*</span>
                </td>
            </tr>
            <tr>
                <td valign="top" class="tbleft">自我介绍：</td>
                <td colspan="3"><s:textfield name="singUpInfo.description" id="description" required="true"/>
                    <span class="wronginfo" id="yzdescription">*</span></td>
            </tr>
            <tr class="title2">
                <td colspan="4" class="title2">个人详细信息</td>
            </tr>
            <tr>
                <td class="tbleft">真实姓名：</td>
                <td><s:textfield name="singUpInfo.user.userName" id="name" required="true"/>
                    <span class="wronginfo" id="yzname">*</span></td>
                <td class="tbleft">性别：</td>
                <td><p>
                    <label>
                            <s:select list="#{true:'[男]',false:'[女]'}" name="singUpInfo.user.sexy" listKey="key"
                                      listValue="value" headerKey="" headerValue="请选择性别" id="sex"/>
                        <span class="wronginfo" id="yzsex">*</span><br/>
                </p></td>
            </tr>
            <tr>
                <td class="tbleft">年龄：</td>
                <td><s:textfield name="singUpInfo.age" id="age" required="true"/></td>
                <td class="tbleft">身份证号：</td>
                <td><s:textfield name="singUpInfo.user.cardId" id="cardId" required="true"/></td>
            </tr>
            <tr>
                <td class="tbleft">手机号：</td>
                <td>
                    <s:textfield name="singUpInfo.cellPhone" id="cellPhone" required="true"/>
                    <span class="wronginfo" id="yzcellphone">*</span></td>
                <td class="tbleft">固定电话：</td>
                <td>
                    <s:textfield name="singUpInfo.phone" id="phone" required="true"/> <span class="wronginfo"
                                                                                            id="yzphone">*</span></td>
                </td>
            </tr>
            <tr>
                <td class="tbleft">QQ号码：</td>
                <td><s:textfield name="singUpInfo.qq" id="qq" required="true"/></td>
                <td class="tbleft">博客地址：</td>
                <td><s:textfield name="singUpInfo.address" id="address" required="true"/></td>
            </tr>
            <tr>
                <td class="tbleft">家庭住址：</td>
                <td><s:textfield name="singUpInfo.address" id="address" required="true"/></td>
                <td class="tbleft">兴趣爱好：</td>
                <td><s:textfield name="singUpInfo.interest" id="interest" required="true"/></td>
            </tr>
            <tr>

                <td class="tbleft">参赛场次:</td>
                <td>
                    <s:if test="%{showCompetitionSessionList}">
                        <s:if test="%{competition.id}">
                            <s:select name="sessionId" list="competitionSession" listKey="key" listValue="value"
                                      headerKey="" headerValue="请选参赛场次" id="competition"/><span class="wronginfo"
                                                                                                yd="yzcompetition">*</span>
                        </s:if>
                    </s:if>
                </td>
                <td class="tbleft">照片：</td>
                <td rowspan="3">
                    <s:if test="%{haveUserInfo}"><img src="<s:property value="singUpInfo.user.pic"/>" width="80"
                                                      height="80" id="reImg"/></s:if>
                    <s:else><img src="images/head.gif" width="80" height="80" id="reImg"/></s:else>
                    <s:file label="File (1)" name="upload" id="updateFile1"/>
                    <s:hidden name="singUpInfo.user.pic"/></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>

                </td>
                <td class="tbleft">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="tbleft">&nbsp;</td>

            </tr>
            <tr>
                <td colspan="4" align="center" id="tablebottom">
                    <s:submit name="singUp" action="saveSingUp" value=""
                              style="background-repeat:no-repeat; width:75px; height:30px; border:none; cursor:pointer;background:url(images/submitsignup.gif);"></s:submit>
                    &nbsp;&nbsp;&nbsp;
                    <s:reset name="reset" value=""
                             style="background-repeat:no-repeat; width:75px; height:30px; border:none; cursor:pointer;background:url(images/reset.gif);"/>
                </td>
            </tr>
        </table>

    </s:form>

</div>
<div id="bottom"></div>
<div id="footer">版权所有&copy; www.gogowise.com 请勿侵权</div>
</div>
</body>
</html>

<script type="text/javascript">
    function getFullPath(obj) {    //得到图片的完整路径
        if (obj) {
            //ie
            if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
                obj.select();
                return document.selection.createRange().text;
            }
            //firefox
            else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
                if (obj.files) {
                    return window.URL.createObjectURL(obj.files.item(0));
                }
                return obj.value;
            }
            return obj.value;
        }
    }
    $("#updateFile1").change(function () {
        var strSrc = this.value;
        img = new Image();
        var href1 = getFullPath(this);
        img.src = href1;
        //验证上传文件格式是否正确
        var pos = strSrc.lastIndexOf(".");
        var lastname = strSrc.substring(pos, strSrc.length);
        if (lastname.toLowerCase() != ".jpg") {
            alert("您上传的文件类型为" + lastname + "，图片必须为 JPG 类型");
            return false;
        }//验证上传文件宽高比例
        if (img.fileSize / 1024 > 150) {
            alert("您上传的文件大小超出了150K限制！");
            return false;
        }

        document.getElementById("reImg").src = href1;
    });
    errorsString = "";
    form = document.getElementById("initSingUp");
    var errorMsg = "";

    var errors = false;
    var continueValidation = true;

    // field name: singUpInfo.user.email
    // validator name: required
    $("#email").blur(function () {

        var field = form.elements['singUpInfo.user.email'];
        var error = "EMAIL是必填的";
        if (field.value == "") {
            alert(1);
            $("#yzemail").text(error);
            errors = true;

        }
        field = form.elements['singUpInfo.user.email'];
        var error = "EMAIL格式不对";
        if (continueValidation && field.value != null && field.value.length > 0 && field.value.match(/\b(^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@([A-Za-z0-9-])+(\.[A-Za-z0-9-]+)*((\.[A-Za-z0-9]{2,})|(\.[A-Za-z0-9]{2,}\.[A-Za-z0-9]{2,}))$)\b/gi) == null) {
            $("#yzemail").text(error);
            errors = true;

        }
    });

    // field name: duplicate
    // validator name: requiredstring
    $("#duplicate").blur(function () {
        var field = form.elements['duplicate'];
        var error = "确认密码是必填的";
        if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
//                addError($("#yzrepwd"), error);
            errors = true;
            $("#yzrepwd").text(error);

        }
        field1 = form.elements['singUpInfo.user.password'];
        field2 = form.elements['duplicate'];
        var error = "两次输入的密码不一致";
        if (continueValidation && field1.value != field2.value) {
//                addError($("#yzpwd"), error);
            errors = true;
            $("#yzpwd").text(error);
        }
    });
    // field name: singUpInfo.user.userName
    // validator name: requiredstring
    $("#name").blur(function () {
        field = form.elements['singUpInfo.user.userName'];
        var error = "名子是必填的";
        if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
            $("#yzname").text(error);
            errors = true;

        }
    });
    $("#sex").blur(function () {
        field = form.elements['singUpInfo.user.sexy'];
        var error = "性别是必填的";
        if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
            $("#yzsex").text(error);
            errors = true;

        }
    });
    $("#singtype").blur(function () {
        field = form.elements['singUpInfo.singType'];
        var error = "演唱形式必填";
        if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
            $("#yzsingtype").text(error);
            errors = true;

        }
    });
    $("#cellPhone").blur(function () {

        var field = form.elements['singUpInfo.cellPhone'];
        var error = "请输入正确的手机号码";
        if (field.value == "") {
            $("#yzcellphone").text(error);
            errors = true;

        }
    });
    $("#phone").blur(function () {
        field = form.elements['singUpInfo.phone'];
        var error = "固定电话是必填的";
        if (field.value == "") {
            $("#yzphone").text(error);
            errors = true;

        }
    });
    $("#enounse").blur(function () {
        field = form.elements['singUpInfo.enounce'];
        var error = "参赛宣言必填的";
        if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
            $("#yzenounce").text(error);
            errors = true;

        }
    });
    $("#description").blur(function () {
        field = form.elements['singUpInfo.description'];
        var error = "自我介绍必填的";
        if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
            $("#yzdescription").text(error);
            errors = true;

        }
    });
    $("#competition").blur(function () {
        field = form.elements['sessionId'];
        var error = "参赛场次必填的";
        if (field.value == "") {
            $("#yzcompetition").text(error);
            errors = true;
        }
    });
    $("#pwd").blur(function () {
        $("#yzpwd").text("");
        if ($("#pwd").attr('value') == "") {
            errorMsg = "密码不能为空";
            $("#yzpwd").text(errorMsg);
        }
    });
    $("#repwd").blur(function () {
        $("#yzrepwd").text("");
        if ($("#repwd").attr('value') != $("#pwd").attr('value')) {
            errorMsg = "两次密码不一致";
            $("#yzrepwd").text(errorMsg);
        }
    });

</script>
