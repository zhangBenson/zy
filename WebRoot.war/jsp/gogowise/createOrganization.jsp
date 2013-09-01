<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
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
        font-family:Arial, Helvetica, sans-serif;
        font-size: 14px;
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

                        <p>你现在开始注册教学组织机构，请在注册之前仔细阅读以下说明，谢谢您的合作！</p>

                        <p>
                            每个具有法人资格的学校都具有在知元网注册成组织的权利。知元网将为每一个注册组织免费提供实时网络教学平台，配合贵校响应教育部开展公开课的政策，帮助贵校开展网络教学的工作，让贵校优秀的教育资源通过网络为更多的莘莘学子服务。同时，知元网将免费为贵校提供老师课堂教学录像、视频编辑、教学课件网络共享、教学版权收费等服务。 </p>

                        <p>
                            通过合作，贵校将获得在知元网上所有教学课件收益（包括贵校所属老师网上授课、教学视频点播、教学PPT下载等所产生的收益）的20%作为贵校版权收益。为了保证贵校的权益，贵校需要向我们提供真实的信息，我们核实以后，贵校将正式成为知元网的注册组织。注册组织需要指定一名负责人，所指定负责人将终生拥有其负责期间内贵校新教学课件所产生版权收益（以下简称负责人负责期间组织机构版权收益）的8%作为负责人劳动付出的报酬。您帮助贵校注册将有可能成为贵校的负责人。同一所学校在没有正式注册之前，可能会有多名老师同时为贵校进行注册。如果出现这种情况，贵校将负责指定唯一学校负责人。我们将以贵校和知元网正式协议中指定的负责人为贵校在知元网上的唯一负责人。正式注册以后，将不允许重复注册。 </p>

                        <p>网上注册过程完成以后，系统将自动生成一份贵校同知元网的协议草本，为PDF文件（如果您还没有安装adobe reader, 请点击这里<a href="#">下载安装</a>）。协议草本中将指定您为贵校在知元网的唯一负责人。您需打印四份协议，贵校实际负责人在协议相应的地方签字、盖上贵校的合同章以后，您保留一份、贵校保留一份、知元网所属公司（长沙知金电子科技有限公司）两份。此协议为我们系统自动生成的协议，不需要盖章同样具有法律效应。烦请您通过快递邮寄给我们两份签字、加盖贵校合同章后的协议，以及一份加盖贵校公章的法人营业执照副本。收到此邮件以后，我们将同您联系确认，协议生效日期以我们收到贵校协议的邮戳日期为准。
                        </p>

                        <div class="bottom">
                            <input type="submit" name="button" class="button1" value="" onclick="disshow();"/>
                        </div>
                    </div>
                </div>
                <img src="images/bottom.png" width="770" height="10"/>
            </div>
        </div>
<s:form method="POST" action="createOrganization" id="form" validate="true" theme="css_xhtml" enctype="multipart/form-data">
    <s:hidden name="effective"/>
        <div id="onlingclass">
            <div id="con1">
                <table width="400" border="0" cellspacing="0" cellpadding="0">
                    <tr id="before">
                        <td><h1>负责人及组织机构基本信息</h1></td>
                    </tr>
                    <tr>
                        <td class="tdleft">您的Email<span class="errorinfo" id="yzemail">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield type="text" name="organization.responsiblePerson.email" id="email"/>
                        </td>
                    </tr>

                        <tr>
                            <td class="tdleft">您的密码<span class="errorinfo" id="yzpwd">*</span></td>
                        </tr>
                        <tr>
                            <td class="tdleft"><s:password type="text" name="password" id="pwd"/></td>
                    </tr>
                   <s:if test="#session.userID == null">
                    <tr>
                        <td class="tdleft">密码确认<span class="errorinfo" id="yzrepwd">*</span></td>
                        </tr>
                        <tr>
                            <td class="tdleft"><s:password type="text" name="repassword" id="repwd"/></td>
                        </tr>
                    </s:if>
                    <tr>
                        <td class="tdleft">您的真实姓名<span class="errorinfo" id="yzusername">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield type="text" name="organization.responsiblePerson.userName" id="username" /></td>
                    </tr>
                    <tr>
                        <td class="tdleft">身份证号码<span class="errorinfo" id="yzcard">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield type="text" name="organization.responsiblePerson.cardId" id="card"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">您的联系电话<span class="errorinfo" id="yztelphone">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield type="text" name="organization.responsiblePerson.telphone" id="telphone"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">您所在的组织机构<span class="errorinfo" id="yzschool">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:select name="organization.schoolName" list="#{'湖南大学':'湖南大学','其它':'其它'}" value="'湖南大学'" id="select"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">组织机构简介<span class="errorinfo" id="yzsdescription">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textarea type="text" name="organization.description" id="description" cssStyle="width: 300px;height: 40px;"/></td>
                    </tr>
                     <tr>
                        <td class="tdleft">请上传组织机构图片<span class="errorinfo" id="yzslogourl">*</span><s:file  name="upload" id="fileField"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><img src="images/courseImages/50.png" width="50" height="50" id="logourl" /></td>
                        <s:hidden name="organization.logoUrl"/>
                    </tr>
                    <tr>
                        <td><h1>组织机构账户信息</h1></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><p id="info">提示：非常重要，请确保正确，否则关系到您所在组织机构的报酬能准时到账，谢谢您的合作！ </p></td>
                    </tr>
                    <tr>
                        <td class="tdleft">组织机构开户名 <span class="errorinfo" id="yzdepositName">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield name="organization.depositName" type="text" id="depositName"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">组织机构开户银行 <span class="errorinfo" id="yzdepositBankName">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield name="organization.depositBankName" type="text" id="depositBankName"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">组织机构开户账号 <span class="errorinfo" id="yzdepositBankAccount">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield name="organization.depositBankAccount" type="text" id="depositBankAccount"/></td>
                    </tr>
                    <tr>
                        <td class="tdleft">重复组织机构开户账号 <span class="errorinfo" id="yzredepositBankAccount">*</span></td>
                    </tr>
                    <tr>
                        <td class="tdleft"><s:textfield name="" type="text" id="redepositBankAccount"/></td>
                    </tr>
                    <tr>   <td>
                    <s:fielderror fieldName="error"/> </td>
                    </tr>
                    <tr id="after">
                        <td align="left">
                            <input  type="button" id="button1" value=""/>
                            <input type="reset" name="button2" id="button2" value=""/></td>
                    </tr>
                </table>
            </div>
        </div>

    </div>
</s:form>
<script type="text/javascript">
     var fileType="<s:text name='validate.message.filetype'/>"
    var mustBeJpg="<s:text name='validate.message.filetype.must.be'/>"
    var fileSize="<s:text name='validate.message.filesize'/>"
    var dateformat="<s:text name='dateformat'/>"
    function getFullPath(obj) {    //得到图片的完整路径
        if (obj) {
            //ie
    	        if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
    	            obj.select();
    	            return document.selection.createRange().text;
    	        }else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
    	            if (obj.files) {
                       return window.URL.createObjectURL(obj.files.item(0));
    	            }
   	                return obj.value;
    	        }
    	        return obj.value;
    	    }
    }

     	$("#fileField").change(function () {
                    var strSrc = this.value;
        	        img = new Image();
                    var href1 = getFullPath(this);
        	        img.src = href1;
        	        //验证上传文件格式是否正确
        	        var pos = strSrc.lastIndexOf(".");
        	        var lastname = strSrc.substring(pos, strSrc.length);
        	        if (lastname.toLowerCase() != ".jpg" ) {
                    alert(fileType + lastname + ","+mustBeJpg);
                    return false;
                    }//验证上传文件宽高比例
           	        if (img.fileSize / 1024 > 150) {
                        alert(fileSize);
                        return false;
                     }

                     document.getElementById("logourl").src = href1;
         } );


    var errorMsg = "";
    function disshow() {
        $("#tishi").css('display', 'none');
        $("#onlingclass").css('display', 'block');
    }

    $("#select").change(function(){
        var school = $("#select").val();
        if(school == "其它"){
           $("<input id='select' name='organization.schoolName' value='' onblur='check(this);'/>").replaceAll($(this));
        }
    });
    function check(obj){
        $("#yzschool").text("*");
        if($(obj).val() == ""){
            errorMsg = "   请输入学校名称！！"   ;
          $("#yzschool").text(errorMsg);
                  return;
       }
        errorMsg = "";
    }
    $("#pwd").blur(function(){
        $("#yzpwd").text("*");
        if($("#pwd").attr('value') ==""){
           errorMsg = "密码不能为空";
           $("#yzpwd").text(errorMsg);
                  return;
        }
        errorMsg = "";
    });
    $("#repwd").blur(function(){
        $("#yzrepwd").text("*");
         if($("#repwd").attr('value')!=$("#pwd").attr('value')){
           errorMsg = "两次密码不一致";
           $("#yzrepwd").text(errorMsg);
                   return;
        }
        errorMsg = "";
    });
    $("#email").blur(function(){
        $("#yzemail").text("*");
        if($("#email").attr('value')!="" ){
           var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
           var email = $("#email").val();
            if(!pattern.test(email)){
                errorMsg = "邮件格式不对";
                $("#yzemail").text(errorMsg);
                      return;
            }
            errorMsg = "";
        }else{
           errorMsg = "邮件不能为空";
           $("#yzemail").text(errorMsg);
                  return;
        }

    });
    $("#username").blur(function(){
        $("#yzusername").text("*");
        if($("#username").attr('value') ==""){
           errorMsg = "用户名不能为空";
           $("#yzusername").text(errorMsg);
                  return;
        }
        errorMsg = "";
    });
    $("#card").blur(function(){
        $("#yzcard").text("*");
        if($("#card").attr('value') ==""){
           errorMsg = "身份证号不能为空";
           $("#yzcard").text(errorMsg);
                  return;
        }
        errorMsg = "";
    });

     $("#description").blur(function(){
         $("#yzsdescription").text("*");
         if($("#description").attr('value') ==""){
             errorMsg = "组织简介不能为空";
             $("#yzsdescription").text(errorMsg);
             return;
         }
     });
    $("#telphone").blur(function(){
        $("#yztelphone").text("*");
        if($("#telphone").attr('value') ==""){
           errorMsg = "手机号不能为空";
           $("#yztelphone").text(errorMsg);
                  return;
        }
        errorMsg = "";
    });
    $("#depositName").blur(function(){
        $("#yzdepositName").text("*");
        if($("#depositName").attr('value') ==""){
           errorMsg = "开户人姓名不能为空";
           $("#yzdepositName").text(errorMsg);
                  return;
        }else if($("#depositName").attr('value') != $("#select").attr('value')){
            errorMsg = "开户名不合法";
           $("#yzdepositName").text(errorMsg);
                  return;
        }
        errorMsg = "";
    });
    $("#depositBankName").blur(function(){
        $("#yzdepositBankName").text("*");
        if($("#depositBankName").attr('value') ==""){
           errorMsg = "开户银行不能为空";
           $("#yzdepositBankName").text(errorMsg);
                  return;
        }
        errorMsg = "";
    });
    $("#depositBankAccount").blur(function(){
        $("#yzdepositBankAccount").text("*");
        if($("#depositBankAccount").attr('value') ==""){
           errorMsg = "开户帐号不能为空";
           $("#yzdepositBankAccount").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#redepositBankAccount").blur(function(){
        $("#yzredepositBankAccount").text("*");
        if($("#redepositBankAccount").attr('value') ==""){
           errorMsg = "开户帐号不能为空";
           $("#yzredepositBankAccount").text(errorMsg);
            return;
        }else if($("#redepositBankAccount").attr('value') != $("#depositBankAccount").attr('value')){
          errorMsg = "开户帐号不相同";
           $("#yzredepositBankAccount").text(errorMsg);
            return;
        }
        errorMsg = "";
    });
    $("#button1").click(function(){
        if(errorMsg == ""){
           document.forms[0].submit();
        }else{
           $("#before").before(function(){
               return "<tr><td><span class='errorinfo'>对不起，信息填写不全，无法提交</span></td></tr>";
           });
        }
    });
</script>