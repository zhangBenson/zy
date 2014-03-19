<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link href="css/log_reg.css" rel="stylesheet"/>

<head>
    <meta charset="UTF-8">
    <script src="js/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#btnclauses").click(function(){
                $('#myModal').modal();
            });
        });
    </script>
</head>


<div class="tooltip">
    <div class="tooltip-inner">Tooltip!</div>
    <div class="tooltip-arrow"></div>
</div>
<div class="container">

    <div class="row">
        <div class="col-sm-5">
            <div class="basePanelTextLeft">
                <h1 class = "courseSubject"><s:property value="%{getText('button.log.in')}"/></h1>
                <h1 class = "courseSynopsis"><s:property value="%{getText('label.log.in.info')}"/></h1>

                <s:form validate="true" theme="css_xhtml" cssClass="form-horizontal"  method="POST" action="logon">

                    <div class="form-group">
                        <label class="col-sm-2 control-label"> <s:property value="%{getText('email')}" /></label>
                        <div class="col-sm-10">
                            <span class="errorinfo" id="yzemail"></span>
                            <s:textfield name="user.email" id="logonemail" cssClass="form-control" placeholder="Email"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"> <s:property value="%{getText('password')}"/></label>

                        <div class="col-sm-10">
                            <span class="errorinfo" id="yzpwd"><s:property value="identityConfirmMsg"/></span>
                            <s:password name="user.password" id="pwd" cssClass="form-control" placeholder="Password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                        <%-- <input type="checkbox"><s:property value="%{getText('label.log.in.remember.me.info')}"/></label> --%>
                                    <a href="initRepassword.html" style="float: right;"><span><s:property value="%{getText('link.forget.pwd')}" />？</span></a>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input class = "btn btn-success  btn-lg btn-block" type="submit" name="button" id="btn1" onclick="return checkForm();" value="<s:property value="%{getText('button.log.in')}" />"/>
                        </div>
                    </div>
                </s:form>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="basePanelTextLeft">
                <h1 class = "courseSubject"><s:property value="%{getText('user.info.identity.confirm.no.account')}"/></h1>
                <h1 class = "courseSynopsis"><s:property value="%{getText('label.login.no.account.info')}"/></h1>
                <s:form validate="true" theme="css_xhtml" method="POST" action="reg">
                    <s:hidden name="reDirectUrl" id="reDirectUrl"/>

                    <div class="form-group">
                        <label><s:property value="%{getText('email')}" /></label>
                        <span id="log_email_tip" class="errorinfo">*</span>

                        <s:textfield cssClass="form-control" name="user.email" id="registeremail" placeholder="Enter Email"/>
                    </div>
                    <div class="form-group">
                        <label ><s:property value="%{getText('password')}"/></label>
                        <span id="log_pwd_tip" class="errorinfo">*</span>
                        <s:password cssClass="form-control" name="user.password" id="registerpwd" placeholder="Password"/>
                    </div>
                    <div class="form-group">
                        <label><s:property value="%{getText('psdagain')}"/></label>
                        <span id="log_repwd_tip" class="errorinfo">*</span>

                        <s:password cssClass="form-control" name="duplicate"   placeholder="Password"/>
                    </div>
                    <div class="form-group">
                        <label ><s:property value="%{getText('menber.reg.nickName')}"/></label>
                        <span id="log_nickName_tip" class="errorinfo">*</span>

                        <s:textfield cssClass="form-control" name="user.nickName"  placeholder="Nick Name"/>
                    </div>
                    <div class="form-group">

                            <%-- <div class="col-sm-offset-2 col-sm-10">
                                <div class="clause">
                                    <span id="yxcheckbox" class="tip_words"></span> <br/>
                                    <input name="checkbox" type="checkbox" value="checked" id="checkbox"/>
                                    <a href="<%=request.getContextPath()%>/jsp/gogowise/Clause.htm" class="boxy" id="reg_clause"><s:property value="%{getText('read')}"/></a>
                                </div>
                                <input type="submit" class="subBtn" onclick="return checkRegForm();" value="<s:property value="%{getText('createButton')}"/>" />
                            </div> --%>

                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <span id="yxcheckbox" class="tip_words"></span> <br/>
                                        <%--<input name="checkbox" type="checkbox" value="checked" id="checkbox"/>
                                        <a href="<%=request.getContextPath()%>/jsp/gogowise/Clause.htm" class="boxy" id="reg_clause"><s:property value="%{getText('read')}"/></a>--%>
                                    <input name="checkbox" type="checkbox" value="checked" id="checkbox" ><a href="#" id="btnclauses"><s:property value="%{getText('read')}"/></a>
                                </label>
                                    <%--<a href="#" id="btnclauses"><s:property value="%{getText('label.login.clause.msg')}"/></a> --%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                                <%-- <button type="submit" class="btn btn-primary btn-lg btn-block">Sign me up!</button> --%>
                            <input type="submit" class="btn btn-primary btn-lg btn-block" onclick="return checkRegForm();" value="<s:property value="%{getText('createButton')}"/>" />
                        </div>
                    </div>
                </s:form>
            </div>

        </div>
        <div class="col-sm-1"></div>
    </div>
</div>


<script type="text/javascript">
    var pwdEmpty = "<s:text name='psdEmpty'/>";
    var pwdFormatWrong = "<s:text name='psdFormatWrong'/>";
    var repwdAgain = "<s:text name='psdagain'/>";
    var repwdNotEqual = "<s:text name='psdNOsame'/>";
    var emailEmpty = "<s:text name='emailEmpty'/>";
    var emailFormatWrong = "<s:text name='emailerror'/>";
    var acceptClauseMsg = "<s:text name='message.accept.rule'/>";
    function checkCheckBox(){
        if($("#checkbox").is(":checked"))
            return true;
        else{
            $("#yxcheckbox").html(acceptClauseMsg);
            return false;
        }
    }

    $(function(){
        $("#registeremail").blur(function(){
            var email = $(this).val();
            //alert("email : " + email);
            checkRegisterEmail(1,email,"log_email_tip");
        });
        $("#registerpwd").blur(function(){
            var pwd = $(this).val();
            checkRegisterPwd(1,pwd,"log_pwd_tip");
        });
        $("input[name='duplicate']").blur(function(){
            //var pwd = $("input[name='user.password']").val();
            var pwd = $("#registerpwd").val();
            var repwd = $(this).val();
            checkRepwd(1,pwd,repwd,"log_pwd_tip","log_repwd_tip");
        });
        $("#reg_clause").fancybox();
    });

    function checkRegisterEmail(type,email,tipId){
        document.getElementById(tipId).innerHTML = "*";
        //alert("checkRigisterEmail : " + email);
        if(email == ""){
            if(type == 0){
                document.getElementById(tipId).innerHTML = emailEmpty;
                return false;
            }else{
                return true;
            }
        }else{
            var emailPattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
            if(emailPattern.test(email)){
                return true;
            }else{
                document.getElementById(tipId).innerHTML = emailFormatWrong;
                return false;
            }
        }
    }

    function checkRegisterPwd(type,pwd,tipId){ //0表示提交表单时候的验证
        document.getElementById(tipId).innerHTML = "*";
        if(pwd == ""){
            if(type == 0){
                document.getElementById(tipId).innerHTML = pwdEmpty;
                return false;
            }else{
                return true;
            }
        }else{
            var pwdPattern = /[\d|\w]{8,}/;
            if(!pwdPattern.test(pwd)){
                $("#"+tipId).text(pwdFormatWrong);

                document.getElementById(tipId).innerHTML = pwdFormatWrong;
                return false;
            }else{
                return true;
            }
        }
    }
    function checkRepwd(type,pwd,repwd,pwdTipId,repwdTipId){
        var repwdTipObj = document.getElementById(repwdTipId);
        repwdTipObj.innerHTML = "*";
        if(type == 0){    //提交表单时
            if(pwd == ""){
                return false;
            }else{
                if(checkRegisterPwd(1,pwd,pwdTipId)){
                    if(repwd == ""){
                        repwdTipObj.innerHTML = repwdAgain;
                        return false;
                    }else if(pwd != repwd){
                        repwdTipObj.innerHTML = repwdNotEqual;
                        return false;
                    }else{
                        return true;
                    }
                }else{

                    return false;
                }
            }
        }else{
            if(pwd == ""){
                return false;
            }else{
                if(checkRegisterPwd(1,pwd,pwdTipId)){
                    if(repwd == ""){
                        return true;
                    }else if(pwd != repwd){
                        //alert(pwd + " " + repwd);
                        repwdTipObj.innerHTML = repwdNotEqual;
                        return false;
                    }else{
                        return true;
                    }
                }else{
                    return false;
                }
            }
        }
    }

    function checkRegForm(){
        var email = $("#registeremail").attr('value');
        var pwd = $("#registerpwd").attr('value');
        var repwd = $("input[name='duplicate']").val();
        var b1 = checkRegisterEmail(0,email,"log_email_tip");
        var b2 = checkRegisterPwd(0,pwd,"log_pwd_tip");
        var b3 = checkRepwd(0,pwd,repwd,"log_pwd_tip","log_repwd_tip");
        var b4 = checkCheckBox();
        //alert (b1 + "--" + b2 + "--" + b3 + "--" + b4);
        return b1&&b2&&b3&&b4;
    }



    function goToReg(){
        window.location.href = "initReg.html?user.email="+$("#logonemail").attr("value")+"&reDirectUrl="+encodeURIComponent($("#reDirectUrl").attr("value"));
    }

    $("#logonemail").blur(function(){
        checkEmail();
    });

    $("#logonemail").focus(function(){
        $("#yzemail").text("*");
        $("#wwerr_email .errorMessage").html("");
    });

    $("#pwd").focus(function(){
        $("#yzpwd").text("*");
        $("#wwerr_pwd .errorMessage").html("");
    });

    $("#pwd").blur(function() {
        checkPwd();
    });

    function checkForm() {
        return checkEmail()&&checkPwd();
    }

    function checkEmail(){
        $("#yzemail").text("*");
        if($("#logonemail").attr('value')!="" ){
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            var email = $("#logonemail").val();
            if(!pattern.test(email)){
                $("#yzemail").text("<s:text name="emailerror"/>");
                return false;
            }
        }else{
            $("#yzemail").text("<s:text name="emailEmpty"/>");
            return false;
        }

        return true;
    }

    function checkPwd(){
        $("#yzpwd").text("*");
        var pwd = $("#pwd").attr('value');
        if (pwd == "") {
            $("#yzpwd").text("<s:text name="psdEmpty"/>");
            return false;
        }
        return true;
    }
</script>


<%--
<script type="text/javascript">
    function goToReg(){
        window.location.href = "initReg.html?user.email="+$("#email").attr("value")+"&reDirectUrl="+encodeURIComponent($("#reDirectUrl").attr("value"));
    }

    $("#email").blur(function(){
        checkEmail();
    });

    $("#email").focus(function(){
        $("#yzemail").text("*");
        $("#wwerr_email .errorMessage").html("");
    });

    $("#pwd").focus(function(){
        $("#yzpwd").text("*");
        $("#wwerr_pwd .errorMessage").html("");
    });

    $("#pwd").blur(function() {
        checkPwd();
    });

    function checkForm() {
        return checkEmail()&&checkPwd();
    }

    function checkEmail(){
        $("#yzemail").text("*");
        if($("#email").attr('value')!="" ){
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            var email = $("#email").val();
            if(!pattern.test(email)){
                $("#yzemail").text("<s:text name="emailerror"/>");
                return false;
            }
        }else{
            $("#yzemail").text("<s:text name="emailEmpty"/>");
            return false;
        }

        return true;
    }

    function checkPwd(){
        $("#yzpwd").text("*");
        var pwd = $("#pwd").attr('value');
        if (pwd == "") {
            $("#yzpwd").text("<s:text name="psdEmpty"/>");
            return false;
        }
        return true;
    }
</script>

    --%>



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Clauses</h4>
            </div>
            <div class="modal-body">
                <p>欢迎您注册成为知元网用户！</p>
                <p>请仔细阅读下面的协议，只有接受协议才能继续进行注册。</p>
                <ol>
                    <li>
                        <h4>服务条款的确认和接纳</h4>
                        知元网用户服务的所有权和运作权归知元网拥有。知元网所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与知元网达成协议并接受所有的服务条款。
                    </li>
                    <li>
                        <h4>知元网服务简介</h4>
                        知元网通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。
                        <br />
                        用户必须：
                        <br />
                        （1）购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。
                        <br />
                        （2）个人上网和支付与此服务有关的电话费用、网络费用。
                        <br />
                        用户同意：
                        <br />
                        （1）提供及时、详尽及准确的个人资料。
                        <br />
                        （2）不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。
                        <br />
                        （3）用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，知元网合理地认为用户的行为可能违反上述法律、法规，知元网可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。
                    </li>
                    <li>
                        <h4>服务条款的修改</h4>
                        知元网会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。
                    </li>
                    <li>
                        <h4>服务修订</h4>
                        知元网保留随时修改或中断服务而不需知照用户的权利。知元网行使修改或中断服务的权利，不需对用户或第三方负责。
                    </li>
                    <li>
                        <h4>用户隐私制度</h4>
                        尊重用户个人隐私是知元网的 基本政策。知元网不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或知元网在诚信的基础上认为透露这些信息在以下三种情况是必要的：
                        <br />
                        a、遵守有关法律规定，遵从合法服务程序。
                        <br />
                        b、保持维护知元网的商标所有权。
                        <br />
                        c、在紧急情况下竭力维护用户个人和社会大众的隐私安全。
                        <br />
                        d、符合其他相关的要求。
                    </li>
                    <li>
                        <h4>用户的帐号，密码和安全性</h4>
                        一旦注册成功成为知元网用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知知元网。
                    </li>
                    <li>
                        <h4>免责条款</h4>
                        用户明确同意网站服务的使用由用户个人承担风险。
                        <br />
                        知元网不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过知元网服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。
                    </li>
                    <li>
                        <h4>有限责任</h4>
                        知元网对任何直接、间接、偶然、特殊及继起的损害不负责任。
                    </li>
                    <li>
                        <h4>不提供零售和商业性服务</h4>
                        用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经知元网同意，不能利用网站服务进行销售或其他商业用途。
                    </li>
                    <li>
                        <h4>用户责任</h4>
                        用户单独承担传输内容的责任。用户必须遵循：
                        <br />
                        （1）从中国境内向外传输技术性资料时必须符合中国有关法规。
                        <br />
                        （2）使用网站服务不作非法用途。
                        <br />
                        （3）不干扰或混乱网络服务。
                        <br />
                        （4）不在论坛BBS或留言簿发表任何与政治相关的信息。
                        <br />
                        （5）遵守所有使用网站服务的网络协议、规定、程序和惯例。
                        <br />
                        （6）不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。
                        <br />
                        （7）不得利用本站制作、复制和传播下列信息：
                        <br />
                        1、煽动抗拒、破坏宪法和法律、行政法规实施的；
                        <br />
                        2、煽动颠覆国家政权，推翻社会主义制度的；
                        <br />
                        3、煽动分裂国家、破坏国家统一的；
                        <br />
                        4、煽动民族仇恨、民族歧视，破坏民族团结的；
                        <br />
                        5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；
                        <br />
                        6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；
                        <br />
                        7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；
                        <br />
                        8、损害国家机关信誉的；
                        <br />
                        9、其他违反宪法和法律行政法规的；
                    </li>
                    <li>
                        <h4>进行商业广告的行为</h4>
                        用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，知元网将取消用户服务帐号。
                    </li>
                    <li>
                        <h4>网站内容的所有权</h4>
                        知元网定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；知元网为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在知元网和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。
                    </li>
                    <li>
                        <h4>附加信息服务</h4>
                        用户在享用知元网提供的免费服务的同时，同意接受知元网提供的各类附加信息服务。
                    </li>
                    <li>
                        <h4>解释权</h4>
                        本注册协议的解释权归知元网所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。
                    </li>
                </ol>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
