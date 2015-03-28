<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btnLogin").click(function (event) {
            $("#login_tip").html(" ");
            $('#modalLogin').modal("show");
        });

        var currHref = window.location.href;
        if (currHref.indexOf("index.html") > -1) {
            document.getElementById("isIndex").value = 1;
        }
        else {
            document.getElementById("isIndex").value = 0;
        }

    })

</script>
<%--<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>--%>
<%--<div class="thickline"></div>--%>
<div class="container">

    <div class="topBar">
        <div class="topBInner"><strong class="fontc">欢迎来到嘉兴移动公开课堂！</strong><a href="login2.html">学生登录</a>|<a href="login.html">教师登录</a></div>
    </div>

    <div class="header">
        <div class="hdLogo fL"><a href="index.html"><img src="images/logo.png"/></a></div>
        <div class="hdRcon fR">
            <div class="hdrTip"><span class="hotTel"><strong>咨询热线：</strong><img src="images/pic_hotTel.png"/></span>
                <span class="bshare-custom"><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到腾讯微博" class="bshare-qqmb" href="javascript:void(0);"></a><a title="分享到QQ空间" class="bshare-qzone" href="javascript:void(0);"></a><a title="分享到人人网" class="bshare-renren"></a><a title="分享到网易微博" class="bshare-neteasemb"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
                </span></div>
            <div class="hdrNav">
                |<a href="index.html" class="on">首页</a>|<a href="zbClass.html">直播课堂</a>|<a href="dbClass.html">点播课堂</a>|<a href="msList.html">授课名师</a>|
            </div>
        </div>
    </div>

    <div class="hdBar">
        <div class="h_b_cont">
            <div class="searBox fL">
                <form name="searForm" action="#" method="post"><span>公开课：</span><input type="text" class="intxt" placeholder="课程名称、主讲老师"/><input type="submit" class="abtn_1" value="搜索"/></form>
            </div>
            <div class="hotSear fR">
                <span>热门课程：<a href="#">初二英语</a><a href="#">高一数学</a><a href="#">高三化学</a></span>
                <span>推荐老师：<a href="#">李勤</a><a href="#">彭荣荣</a><a href="#">傅琴</a><a href="#">李刚</a></span>
            </div>
        </div>
    </div>

</div>


<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
     style="overflow:hidden;">

    <div class="modal-dialog"
         style="width: 580px;height:370px;margin-top: 5%;background:rgba(255,255,255,.9);border-radius: 4px;">

        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

        <div style="padding-left: 20px;padding-right: 20px;">
            <h1 class="courseSubject">Log in</h1><span id="login_tip" style="color:red;"></span>

            <h1 class="courseSynopsis">Please log in to continue.</h1>

            <form class="form-horizontal" role="form" id="user_login_form" method="post">
                <s:hidden name="isIndex" id="isIndex"/>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>

                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="inputEmail3" placeholder="Email" check="mail"
                               name="user.email"></div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>

                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword3" placeholder="Password"
                               name="user.password"></div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">Remember me</label>
                            <%--<a href="#" style="float: right;">Forget password</a>--%>
                            <a href="javascript:;" style="float: right;"
                               onclick="parent.window.location.href='initRepassword.html';"><s:text name="link.forget.pwd"/>？</a>
                        </div>

                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" id="log_btn" class="btn btn-success  btn-lg btn-block">Log me in!</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#log_btn").click(function () {
        if (checkForm()) {

            var userData = $("#user_login_form").serialize();
            $.post("ajaxLogin.html", userData, function (data) {
                handlePostResult(data);
            });
        }
    });
    $("#inputPassword3").keydown(function (event) {
        if (event.keyCode == 13) {
            if (checkForm()) {
                var userData = $("#user_login_form").serialize();
                $.post("ajaxLogin.html", userData, function (data) {
                    handlePostResult(data);
                });
            }
        }
    });
    function handlePostResult(data) {
        if (data == "success" || data == "Teacher") {
            var currHref = window.location.href;
            if (currHref.substring(currHref.lastIndexOf('/')) == '/exitSystem.html') {
                currHref = currHref.substring(0, currHref.lastIndexOf('/') + 1);
            }
            if (currHref.indexOf("index.html") > -1) {
                if (data == "success") {
                    window.location.href = "personalCenter.html";
                }
                else {
                    window.location.href = "myfirstPage.html";
                }
                return;
            }
            window.location.reload();
        } else {
            $("#login_tip").text(data);
        }
    }
    function checkForm() {

        return checkEmail() && checkPwd();
    }
    function checkEmail() {
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

    function checkPwd() {
        if ($("#inputPassword3").val() == "") {
            $("#login_tip").text("<s:text name="psdEmpty"/>");
            return false;
        }
        return true;
    }
</script>
