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
<div class="thickline"></div>
<div class="container">
    <div>
        <div class="col-md-3" style="width:250px;">
            <a href="/index.html">
                <div class="topLogo"></div>
            </a>

        </div>
        <div class="col-md-7" style="width:670px;">
            <ul class="nav nav-pills">
                <li>
                    <%--<a href="index.html" class="navlink"><s:text name="menu.item.index"/></a>--%>
                    <a href="aboutUs.html" class="navlink">About Us</a>
                </li>
                <li>
                    <a href="courseCenter.html" class="navlink"><s:text name="frame.course.center"/></a>

                </li>
                <li>
                    <a href="schoolCenter.html" class="navlink"><s:text name="frame.schools.center"/></a>
                </li>
                <li>
                    <a href="FAQ.html" class="navlink">FAQ</a>
                </li>
            </ul>
        </div>

        <div class="col-md-2">
            <div class="pull-right">
                <s:if test="#session.email !=null">
                    <div class="btn-group">

                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span>
                            <a href="userBlog.html?user.id=<s:property value="#session.userID"/>"
                               title="<s:property value="#session.nickName"/>">
                                <s:property value="#session.nickName"/>
                            </a>
                            <span class="caret"></span>
                        </button>

                        <ul class="dropdown-menu" role="menu">

                            <s:if test="#session.isTeacher">
                                <li><a href="myfirstPage.html" id="myFirstPageLink"><s:text name="label.orgcenter"/> </a>
                                </li>
                            </s:if>
                            <li><a href="personalCenter.html"><s:text name="label.personalcenter"/> </a></li>
                        <%--<a href="#">Profile Settings</a>--%>
                            <li><a href="initUpdate.html"><span></span><s:text name="account.item.accountsettings"/></a></li>
                        <%--</s:if>--%>
                                <%--<s:else>--%>

                                <%--<li><a href="setting.html"><span></span><s:text name="account.item.accountsettings"/></a></li>--%>
                                <%--</s:else>--%>

                            <li class="divider"></li>

                                <%--<a href="#">Log out</a>--%>
                            <li><a href="exitSystem.html"><span></span><s:text name="href.logout"/></a></li>

                        </ul>
                    </div>
                </s:if>
                <s:else>
                    <ul class="list-inline">
                        <li>

                        </li>
                        <li>
                            <a href="initReg.html" target="_blank"><s:text name="user.info.identity.finish.reg"/></a>
                        </li>
                        <li>
                            <a href="#" id="btnLogin"><s:text name="Login"/></a>
                        </li>
                    </ul>
                </s:else>

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
