<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow:hidden;">

    <div class="modal-dialog" style="width: 580px;height:370px;margin-top: 5%;background:rgba(255,255,255,.9);border-radius: 4px;">

        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

        <div style="padding-left: 20px;padding-right: 20px;">
            <h1 class = "courseSubject">Log in</h1>
            <h1 class = "courseSynopsis">Please log in to continue.</h1>
            <span id="login_tip" style="color:red; "></span>
            <%--<div style="clear:both"></div>--%>

            <form class="form-horizontal" role="form" id="user_login_form" method="post">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="inputEmail3" placeholder="Email" check="mail" name="user.email"></div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="user.password"></div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">Remember me</label>
                            <%--<a href="#" style="float: right;">Forget password</a>--%>
                            <a href="javascript:;" style="float: right;" onclick="parent.window.location.href='initRepassword.html';"><s:property value="%{getText('link.forget.pwd')}"/>？</a>
                        </div>

                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <%--<button type="submit" id="log_btn" class="btn btn-success  btn-lg btn-block">Log me in!</button>--%>
                        <input type="button" id="log_btn" class="btn btn-success  btn-lg btn-block" value="Log me in!" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#log_btn").click(function(){
        if(checkForm()){

            var userData = $("#user_login_form").serialize();
            $.post("ajaxLogin.html",userData,function(data){
                if(data=="success"){
                    var currHref = parent.window.location.href;
                    parent.window.location.reload();
                }else{
                    $("#login_tip").text(data);
                }
            });
        }
    });
    $("#inputPassword3").keydown(function(event){
        if(event.keyCode == 13){
            if(checkForm()){
                var userData = $("#user_login_form").serialize();
                $.post("ajaxLogin.html",userData,function(data){
                    if(data=="success"){
                        var currHref = parent.window.location.href;
                        if(currHref.substring(currHref.lastIndexOf('/')) == '/exitSystem.html'){
                            currHref = currHref.substring(0,currHref.lastIndexOf('/')+1);
                        }
                        parent.window.location.reload();
                    }else{
                        $("#login_tip").text(data);
                        alert(data);
                    }
                });
            }
        }
    });
    function checkForm(){

        return checkEmail()&&checkPwd();
    }
    function checkEmail(){
        $("#login_tip").text("");
        if ($("#inputEmail3").attr('value') != "") {
            var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
            var email = $("#inputEmail3").val();
            if (!pattern.test(email)) {
                $("#login_tip").text("<s:text name="emailerror"/>");
                return false;
            }
        } else {
            $("#login_tip").text("<s:text name="emailEmpty"/>");
            return false;
        }

        return true;
    }

    function checkPwd(){
        if($("#inputPassword3").val()==""){
            $("#login_tip").text("<s:text name="psdEmpty"/>");
            return false;
        }
        return true;
    }
</script>
