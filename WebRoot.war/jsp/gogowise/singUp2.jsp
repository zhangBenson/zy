<%@ taglib prefix="s" uri="struts-tags.tld" %>
<style type="text/css">
    <!--
    .bigcn {
        font-weight: bold;
        font-size: 14px;
        color: #333333;
        font-family: Arial, "宋体";
        text-decoration: none;
    }

    .STYLE6 {
        color: #3399CC
    }

    .STYLE8 {
        color: #FF0000
    }

    .STYLE14 {
        font-family: Arial, "宋体";
        text-decoration: none;
        color: #FF0000;
    }

    .STYLE16 {
        font-family: Arial, "宋体";
        text-decoration: none;
        color: #333333;
    }

    .STYLE20 {
        font-size: 12
    }

    .STYLE21 {
        width: 200px;
        border-bottom: #333333 1px solid;
        border-top: #FFFFFF 0px solid;
        border-right: #FFFFFF 0px solid;
        border-left: #FFFFFF 0px solid
    }

    -->
</style>
<s:form enctype="multipart/form-data" validate="true" onSubmit="return validateForm_initSingUp()" method="POST">

    <s:hidden name="singUpInfo.user.id"/>
    <s:hidden name="singUpInfo.id"/>
    <s:hidden name="type"/>
    <s:hidden name="competition.id"/>
    <s:hidden name="haveUserInfo"/>
    <s:hidden name="showCompetitionSessionList"/>

    <table width="1000" height="884" border="0" align="center" cellspacing="0">
        <s:if test="%{competition.id}">
            <tr>
                <td width="163" rowspan="6" valign="top"><p><img src="images/shangbiao11.gif" width="163" height="71"/>
                    <img
                        src="images/CCCC_03.gif" width="163" height="704"/></p>
                </td>

            </tr>
            <tr>
                <td height="21">&nbsp;</td>
            </tr>
            <tr>
                <td height="110">
                    <table width="798" height="110" border="0" align="center">
                        <tr>
                            <td colspan="3"><span class="bigcn">主题 Topic: <span class="STYLE6"><s:property
                                    value="competition.subject.name"/> <s:property
                                    value="competition.name"/> </span></span>
                            </td>
                        </tr>
                        <tr>
                            <td width="213"><span class="bigcn">开始日期: </span><span class="STYLE6"><s:property
                                    value="%{getText('global.date',{competition.startDate})}"/></span></td>
                            <td width="213"><span class="bigcn">报名结束日期: </span><span class="STYLE6"><s:property
                                    value="%{getText('global.date',{competition.singUpEndDate})}"/></span></td>
                        </tr>
                        <tr>
                            <td width="213"><span class="bigcn">EMAIL: </span><span class="STYLE6"><s:property
                                    value="competition.subject.owner.email"/></span></td>
                            <td width="198"><span class="bigcn">电话 Tel:<span class="STYLE6"> <s:property
                                    value="competition.phone"/></span></span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="15" align="center">
                    <hr width="800"/>
                </td>
            </tr>
        </s:if>
        <tr>
            <td height="104" align="center">
                <table width="809" height="499" align="center" cellpadding="3" cellspacing="0">
                    <tr>
                        <td height="24" colspan="2" align="left" class="bigcn"> 参加人员信息 &nbsp;&nbsp; <s:fielderror />
                        <div id="errorInfo" align="left"> </div>
                        </td>
                    </tr>

                 <s:if test="%{haveUserInfo}">
                        <tr>
                            <td height="40" align="left" class="tdline2 STYLE20">Email:
                                <span class="STYLE16">
                                <s:property value="singUpInfo.user.email"/>
                                <s:hidden name="singUpInfo.user.email" id="email"/>
                                </span>
                            </td>
                        </tr>

                    </s:if>

                    <s:else>
                        <tr>
                            <td height="40" align="left" class="tdline2 STYLE20">Email:<span class="STYLE16">
                            <s:textfield name="singUpInfo.user.email" id="email" cssClass="STYLE21"/>
                        </span>   <span class="STYLE14">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td height="40" align="left" class="tdline2 STYLE20">密码<span class="STYLE16">
                            <s:password name="singUpInfo.user.password" cssClass="STYLE21"/>
                            </span><span class="STYLE14">*</span>
                            </td>
                            <td height="40" align="left" class="tdline2 STYLE20">密码<span class="STYLE16">
                            <s:password name="duplicate" cssClass="STYLE21"/>
                            </span><span class="STYLE14">*</span>
                            </td>
                        </tr>
                    </s:else>
                    <tr>
                        <td align="left" class="tdline2 STYLE20">姓名: <span class="STYLE16">
                            <s:textfield name="singUpInfo.user.userName" id="name" required="true" cssClass="STYLE21"/>
            </span><span class="STYLE14">*</span></td>
                        <td align="left" class="tdline2 STYLE20">昵称：<span class="STYLE16">
                            <s:textfield name="singUpInfo.user.nickName" id="nickName" required="true"
                                         cssClass="STYLE21"/>
              <span class="STYLE14">*</span></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" height="10" align="left"><span class="STYLE20"></span></td>
                    </tr>
                    <tr>
                        <td width="50%" align="left" class="tdline2 STYLE20">性别:
                            <span class="STYLE16">
                                <s:select
                                        list="#{true:'[男]',false:'[女]'}"
                                        name="singUpInfo.user.sexy" listKey="key"
                                        listValue="value" headerKey="" headerValue="请选择性别"
                                        cssStyle="width:100px;border-bottom:#333333 1px solid;border-top:#FFFFFF 0px solid;border-right:#FFFFFF 0px solid;border-left:#FFFFFF 0px solid"/>
                             </span><span class="STYLE8">*</span></td>
                        <td align="left" class="tdline2 STYLE20">
                            身份证: <span class="STYLE16">
                          <s:textfield name="singUpInfo.user.cardId" id="cardId" required="true" cssClass="STYLE21"/>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="tdline2 STYLE20">电话: <span class="STYLE16">
              <s:textfield name="singUpInfo.phone" id="phone" required="true" cssClass="STYLE21"/>
            </span></td>
                        <td align="left" class="tdline2 STYLE20">
                            照片：<span class="STYLE16">
						  <s:file label="File (1)" name="upload" id="updateFile1"/>
                            <s:hidden name="singUpInfo.user.pic"/>
                            <%--<a id="link1" href="upload/images/zlhades/0.jpg"></a>--%>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="tdline2 STYLE20">手机：<span class="STYLE16">
               <s:textfield name="singUpInfo.cellPhone" id="cellPhone" required="true" cssClass="STYLE21"/>
            </span><span class="STYLE14">*</span></td>
                        <td align="left" class="tdline2 STYLE20">演唱形式：<span class="STYLE16">
                              <s:select
                                      list="#{1:{getText('singup.singType.1')},2:{getText('singup.singType.2')},3:{getText('singup.singType.3')}}"
                                      name="singUpInfo.singType" listKey="key"
                                      listValue="value" headerKey="" headerValue="请选择演唱形式"
                                      cssStyle="width:100px;border-bottom:#333333 1px solid;border-top:#FFFFFF 0px solid;border-right:#FFFFFF 0px solid;border-left:#FFFFFF 0px solid"/>

            </span></td>
                    </tr>
                    <tr>
                        <td width="50%" align="left" class="tdline2 STYLE20">年龄:
                            <span class="STYLE16">
                               <s:textfield name="singUpInfo.age" id="cellPhone" required="true" cssClass="STYLE21"/>
                            </span>
                        </td>


                        <td height="20" align="left" class="tdline2 STYLE20">QQ号码<span class="STYLE16">：
                            <s:textfield name="singUpInfo.qq" id="qq" required="true" cssClass="STYLE21"/>
            </span></td>
                    </tr>
                    <tr>
                        <td width="50%" align="left" class="tdline2 STYLE20">地址:<span class="STYLE16">
              <s:textfield name="singUpInfo.address" id="address" required="true" cssClass="STYLE21"/>
            </span></td>
                        <td width="50%" align="left" class="tdline2 STYLE20">兴趣爱好: <span class="STYLE16">
                 <s:textfield name="singUpInfo.interest" id="interest" required="true" cssClass="STYLE21"/>
            </span></td>
                    </tr>
                    <tr>
                        <td align="left" class="tdline2 STYLE20">参赛宣言: <span class="STYLE16">
                <s:textfield name="singUpInfo.enounce" id="enounce" required="true" cssClass="STYLE21"/>
            </span><span class="STYLE8">*</span></td>
                        <td align="left" class="tdline2 STYLE20">自我介绍: <span class="STYLE16">
<s:textfield name="singUpInfo.description" id="description" required="true" cssClass="STYLE21"/>
            </span><span class="STYLE14">*</span></td>
                    </tr>

                    <tr>
                        <td align="left" class="tdline2 STYLE20">BLOG地址: <span class="STYLE16">
             <s:textfield name="singUpInfo.blogUrl" id="blogUrl" required="true" cssClass="STYLE21"/>
            </span></td>
                        <s:if test="%{showCompetitionSessionList}">
                            <s:if test="%{competition.id}">
                                <td align="left" class="STYLE20 tdline2">参赛场次：<span class="STYLE16">
          <s:select name="sessionId" list="competitionSession" listKey="key"
                    listValue="value" headerKey="" headerValue="请选参赛场次"/></span> <span class="STYLE14">*</span></td>
                                </td>
                            </s:if>
                        </s:if>
                    </tr>
                    <tr>
                        <td align="center">
                            <s:submit name="singUp" action="saveSingUp" value="提交"></s:submit>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>

</s:form>



<script type="text/javascript">
    var errorsString = "";
    function addError(field, error) {
        errorsString += '<li><span>'+error + '</span></li>';
    }
    function validateForm_initSingUp() {
        errorsString = "";
        form = document.getElementById("initSingUp");


        var errors = false;
        var continueValidation = true;

        // field name: singUpInfo.user.email
        // validator name: required
        if (form.elements['singUpInfo.user.email']) {
            field = form.elements['singUpInfo.user.email'];
            var error = "EMAIL是必填的";
            if (field.value == "") {
                addError(field, error);
                errors = true;
                return !errors;


            }
        }
        // field name: singUpInfo.user.email
        // validator name: email
        if (form.elements['singUpInfo.user.email']) {
            field = form.elements['singUpInfo.user.email'];
            var error = "EMAIL格式不对";
            if (continueValidation && field.value != null && field.value.length > 0 && field.value.match(/\b(^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@([A-Za-z0-9-])+(\.[A-Za-z0-9-]+)*((\.[A-Za-z0-9]{2,})|(\.[A-Za-z0-9]{2,}\.[A-Za-z0-9]{2,}))$)\b/gi) == null) {
                addError(field, error);
                errors = true;
                 return !errors;
            }
        }
        // field name: singUpInfo.user.password
        // validator name: requiredstring
        if (form.elements['singUpInfo.user.password']) {
            field = form.elements['singUpInfo.user.password'];
            var error = "密码是必填的";
            if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
                addError(field, error);
                errors = true;
                 return !errors;
            }
        }
        // field name: duplicate
        // validator name: requiredstring
        if (form.elements['duplicate']) {
            field = form.elements['duplicate'];
            var error = "密码是必填的";
            if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
                addError(field, error);
                errors = true;
                return !errors;
            }
        }

        if (form.elements['singUpInfo.user.password']) {
            field1 = form.elements['singUpInfo.user.password'];
            field2 = form.elements['duplicate'];
            var error = "两次输入密码不一致";
            if (continueValidation && field1.value != field2.value) {
                addError(field1, error);
                errors = true;
                 return !errors;
            }
        }
        // field name: singUpInfo.user.userName
        // validator name: requiredstring
        if (form.elements['singUpInfo.user.userName']) {
            field = form.elements['singUpInfo.user.userName'];
            var error = "名子是必填的";
            if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
                addError(field, error);
                errors = true;
                 return !errors;
            }
        }
        // field name: singUpInfo.user.nickName
        // validator name: requiredstring
        if (form.elements['singUpInfo.user.sexy']) {
            field = form.elements['singUpInfo.user.sexy'];
            var error = "性别是必填的";
            if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
                addError(field, error);
                errors = true;
                return !errors;
            }
        }

        // field name: singUpInfo.user.nickName
        // validator name: requiredstring
       // if (form.elements['singUpInfo.user.nickName']) {
      //      field = form.elements['singUpInfo.user.nickName'];
       //     var error = "昵称是必填的";
      //      if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
       //         addError(field, error);
       //         errors = true;

       //     }
       // }
        // field name: singUpInfo.cellPhone
        // validator name: required
        if (form.elements['singUpInfo.phone']) {
            field = form.elements['singUpInfo.phone'];
            var error = "固定电话是必填的";
            if (field.value == "") {
                addError(field, error);
                errors = true;
                 return !errors;
            }
        }
        // field name: singUpInfo.cellPhone
        // validator name: long
        if (form.elements['singUpInfo.cellPhone']) {
            field = form.elements['singUpInfo.cellPhone'];
            var error = "请输入正确的手机号码";
             if (field.value == "") {
                addError(field, error);
                errors = true;
                 return !errors;
            }
        }
        // field name: singUpInfo.enounce
        // validator name: requiredstring
        if (form.elements['singUpInfo.enounce']) {
            field = form.elements['singUpInfo.enounce'];
            var error = "参赛宣言必填的";
            if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
                addError(field, error);
                errors = true;
                 return !errors;
            }
        }
        // field name: singUpInfo.description
        // validator name: requiredstring
        if (form.elements['singUpInfo.description']) {
            field = form.elements['singUpInfo.description'];
            var error = "自我介绍必填的";
            if (continueValidation && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g, "").length == 0)) {
                addError(field, error);
                errors = true;
                 return !errors;
            }
        }
        // field name: singUpInfo.regedCompetitionSession.id
        // validator name: required
        if (form.elements['sessionId']) {
            field = form.elements['sessionId'];
            var error = "参赛场次必填的";
            if (field.value == "") {
                addError(field, error);
                errors = true;
                 return !errors;
            }
        }

        if (errors != "") {
            errorsString = ' <ul  class="errorMessage">'      + errorsString + ' </ul>';
             $('#errorInfo').html(errorsString);
//            alert(errorsString);
            return false;
        }
        return !errors;
    }
</script>
