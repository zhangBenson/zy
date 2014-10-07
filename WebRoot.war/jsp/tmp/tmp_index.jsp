<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>

<style type="text/css">
#content {
    float: left;
    width: 1000px;
    margin: 0 auto;
    overflow: hidden;
}

#contentUp {
    margin: 15px 10px 10px 10px;
    float: left;
    display: inline;
    height: 260px;
    width: 980px;
    border-bottom: 1px dashed #ccc;
}

#contentDown {
    float: left;
    width: 980px;
    margin-bottom: 15px;
    margin-right: 10px;
    margin-left: 10px;
}

#upLeft {
    float: left;
    height: 246px;
    width: 756px;
}

#upRight {
    background: rgb(245, 245, 245);
    float: left;
    height: 236px;
    width: 192px;
    margin-left: 10px;
    padding: 10px 5px 5px 5px;
    font-family: "微软雅黑";
}

#upRight form table tr .registerNow {
    padding-left: 10px;
    padding-right: 18px;
    margin-bottom: 6px;
    height: 36px;
    float: left;
    cursor: pointer;
    font-size: 20px;
    color: #FFF;
    line-height: 36px;
    background: #58B2DC;
    border-radius: 4px;
    box-shadow: 0px 2px 2px rgba(43, 95, 117, 0.4);
}

#upRight form table tr .registerNow img {
    vertical-align: middle;
    margin-right: 10px;
    border: none;
}

#upRight form table tr td .nickname input,
#upRight form table tr td .password input {
    height: 30px;
    width: 177px;
    padding-left: 2px;
    margin-bottom: 4px;
    border: 1px solid rgb(137, 204, 225);
    border-radius: 2px;
    font-size: 16px;
    line-height: 30px;
}

#contentDown .beginExp .expImg {
    float: left;
    height: 17px;
    width: 27px;
    margin-left: 12px;
    background: url(images/indexImgs/indexImg.gif) -29px -404px;
    display: block;
    margin-top: 2px;
}

#contentDown .beginExp .expWords {
    font-size: 16px;
    color: #E5490D;
    display: block;
    float: left;
    margin-left: 4px;
}

#contentDown .beginExp .more_course {
    font-size: 12px;
    color: rgb(85, 170, 221);
    display: block;
    float: right;
    text-decoration: none;
    margin-right: 60px;
}

#contentDown .beginExp .more_course:hover {
    text-decoration: underline;
}

#contentDown .courseEntry {
    float: left;
    width: 100%;
    height: 160px;
}

#contentDown .courseEntry ul {
    float: left;
    margin-left: 26px;
    margin-bottom: 10px;
}

#contentDown .courseEntry ul li {
    list-style: none;
    display: block;
    float: left;
    height: 102px;
    width: 191px;
    margin-right: 47px;
    margin-top: 15px;
    cursor: pointer;
}

#contentDown .courseEntry ul .organization {
    background: url(images/indexImgs/indexImg.gif) -532px -449px;
}

#contentDown .courseEntry ul .league {
    background: url(images/indexImgs/indexImg.gif) -770px -449px;
}

#contentDown .courseEntry ul .selectCourse {
    background: url(images/indexImgs/indexImg.gif) -50px -449px;
}

#contentDown .courseEntry ul .createCourse {
    background: url(images/indexImgs/courseCreation.gif) 0px 0px;
    width: 188px;
    height: 103px;
}

#contentDown .list_div_1 {
    float: left;
    width: 100%;
    border-bottom: 1px dashed #ccc;
    margin-bottom: 10px;
}

#contentDown .list_div_1 ul {
    list-style-type: none;
    float: left;
    height: 180px;
}

#contentDown .list_div_1 ul li {
    float: left;
    width: 190px;
}

#contentDown .list_div_1 ul li p {
    float: left;
    width: 150px;
    height: 159px;
    margin-left: 26px;
    margin-top: 10px;
    margin-bottom: 10px;
    overflow: hidden;
    background: url(images/indexImgs/online_class_bg.jpg) 0px 0px;
    /*border:1px solid #ccc;*/
    position: relative;
}

#contentDown .list_div_1 ul li p img {
    float: left;
    width: 140px;
    height: 115px;
    border: none;
    padding: 4px 4px 0px 4px;
    cursor: pointer;
}

#contentDown .list_div_1 ul li p .second_counter {
    position: absolute;
    bottom: 45px;
    right: 8px;
    color: orange;
    font-weight: bolder;
    font-size: 12px;
    cursor: pointer;
}

#contentDown .list_div_1 ul li p .course_tittle {
    float: left;
    width: 100%;
    height: 20px;
    color: rgb(85, 170, 221);
    overflow: hidden;
    line-height: 20px;
    font-size: 12px;
    padding: 0px 5px;
    text-align: center;
}

#contentDown .list_div_1 ul li p .course_time {
    float: left;
    width: 100%;
    height: 20px;
    overflow: hidden;
    line-height: 20px;
    font-size: 12px;
    padding: 0 5px;
    /*background: rgb(85, 170, 221);*/
    color: orange;
    text-align: center;
}

#upRight form table tr td .login .loginImg {
    float: left;
    /*background: rgb(40,160,200);*/
    background: #58B2DC;
    height: 37px;
    line-height: 37px;
    padding-left: 5px;
    padding-right: 10px;
    font-size: 17px;
    color: #FFF;
    border-radius: 4px;
    cursor: pointer;
    box-shadow: 0px 2px 2px rgba(43, 95, 117, 0.4);
}

#upRight form table tr td .login .loginImg img {
    vertical-align: middle;
    margin-right: 5px;
    border: none;
}

#upRight form table tr td .login .forgetPwd {
    cursor: pointer;
    color: #28A0C8;
    font-size: 14px;
    float: left;
    margin-top: 18px;
    margin-left: 5px;
    text-decoration: none;
}

#upRight form table tr td .login .forgetPwd:hover {
    text-decoration: underline;
    color: #00bfff;
}

#upRight form table tr td a {
    text-decoration: none;
}

#upRight form table tr td {
    display: block;
    padding-left: 5px;
    float: left;
}

textarea, input {
    behavior: url("textbox.htc");
}
</style>
<style type="text/css">
    #banner {
        float: left;
        position: relative;
        width: 750px;
        height: 240px;
        overflow: hidden;
    }

    #banner_list img {
        border: 0px;
        width: 750px;
    }

    #banner_bg {
        position: absolute;
        bottom: 0;
        background-color: #000;
        height: 26px;
        filter: Alpha(Opacity=30);
        opacity: 0.3;
        z-index: 1000;
        cursor: pointer;
        width: 100%;
    }

    #banner_info {
        position: absolute;
        bottom: 0;
        left: 5px;
        height: 22px;
        color: #fff;
        z-index: 1001;
        cursor: pointer
    }

    #banner ul {
        position: absolute;
        list-style-type: none;
        filter: Alpha(Opacity=80);
        opacity: 0.7;
        border: 1px solid #fff;
        z-index: 1002;
        margin: 0;
        padding: 0;
        bottom: 2px;
        right: 5px;
    }

    #banner ul li {
        padding: 0px 10px;
        float: left;
        display: block;
        color: #FFF;
        border: #e5eaff 1px solid;
        background: #6f4f67;
        cursor: pointer;
        font-size: 12px;
        font-weight: bolder;
    }

    #banner ul li.on {
        background: #28A0C8;
    }

    #banner_list a {
        position: absolute;
        border-style: none;
    }

    .emailTip, .pwdTip {
        display: block;
        float: left;
        width: 100%;
        height: 20px;
        font-size: 12px;
        font-weight: lighter;
        color: red;
    }
</style>
<script type="text/javascript">
    var t = n = 0, count;
    $(document).ready(function () {
        count = $("#banner_list a").length;
        $("#banner_list a:not(:first-child)").hide();
        $("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
        $("#banner_info").click(function () {
            window.open($("#banner_list a:first-child").attr('href'), "_blank")
        });

        $("#banner li").click(function () {
            var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4
            n = i;
            if (i >= count) return;
            $("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
            $("#banner_info").unbind().click(function () {
                window.open($("#banner_list a").eq(i).attr('href'), "_blank")
            })
            $("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
            document.getElementById("banner").style.background = "";
            $(this).toggleClass("on");
            $(this).siblings().removeAttr("class");
        });

        t = setInterval("showAuto()", 7000);
        $("#banner").hover(function () {
            clearInterval(t)
        }, function () {
            t = setInterval("showAuto()", 7000);
        });
    })

    function showAuto() {
        n = (n >= (count - 1)) ? 0 : ++n;
        $("#banner li").eq(n).trigger('click');
    }

    $(document).ready(function () {
        $("#nickname").blur(function () {
            checkEmail();
        });
        $("#nickname").focus(function () {
            $(".emailTip").text("");
        });
        $("#password").blur(function () {
            checkPwd();
        });
        $("#password").focus(function () {
            $(".pwdTip").text("");
        });

        $(".loginImg").click(function () {
            if (checkForm()) {
                $(".formClass").submit();
            }
        });
        $("#password").keydown(function (e) {
            if (e.keyCode == 13) {
                if (checkForm()) {
                    $(".formClass").submit();
                }
            }
        });
    });


    function checkForm() {
        return checkEmail() && checkPwd();
    }

    function checkEmail() {
        $(".emailTip").text("");
        if ($("#nickname").attr('value') != "") {
            var pattern = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            var email = $("#nickname").val();
            if (!pattern.test(email)) {
                $(".emailTip").text("<s:text name="emailerror"/>");
                return false;
            }
        } else {
            $(".emailTip").text("<s:text name="emailEmpty"/>");
            return false;
        }

        return true;
    }

    function checkPwd() {
        if ($("#password").val() == "") {
            $(".pwdTip").text("<s:text name="psdEmpty"/>");
            return false;
        }
        return true;
    }
</script>

<div id="content">
    <div id="contentUp">
        <div id="upLeft">
            <div id="banner">
                <div id="banner_bg"></div>
                <!--标题背景-->
                <div id="banner_info"></div>
                <!--标题-->
                <ul>
                    <li class="on">1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                </ul>
                <div id="banner_list">
                    <a><img src="images/indexImgs/first.gif" title="读网校，上知元" alt="读网校，上知元"/></a>
                    <a><img src="images/indexImgs/p7.gif" title="开课上课，免费方便" alt="开课上课，免费方便"/></a>
                    <a><img src="images/indexImgs/p2.png" title="组织开课，网上教学，轻松愉快" alt="组织开课，网上教学，轻松愉快"/></a>
                    <a><img src="images/indexImgs/p6.gif" title="远程培训，网上面试，教务管理，您都拥有" alt="远程培训，网上面试，教务管理，您都拥有"/></a>
                </div>
            </div>
        </div>
        <div id="upRight">
            <form action="logon.html" class="formClass" validate="true" theme="css_xhtml" method="POST">
                <table width="187px" height="246px" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td><a href="initReg.html">
                            <div class="registerNow"><img src="images/indexImgs/index_regist.png"/><s:property
                                    value="%{getText('button.register')}"/></div>
                        </a></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="nickname">
                                <input name="user.email" id="nickname"
                                       placeholder="<s:property value="%{getText('msg.email')}"/>" type="text"/><br/>
                                <span class="emailTip"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="password">
                                <input name="user.password" id="password"
                                       placeholder="<s:property value="%{getText('msg.pwd')}"/>" type="password"/>
                                <br/>
                                <span class="pwdTip"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="login&forget">
                                <div class="login">
                                    <div class="loginImg"><img src="images/indexImgs/index_log_in.png"/><s:property
                                            value="%{getText('button.log.in')}"/></div>
                                    <a href="initRepassword.html"><span class="forgetPwd"><s:property
                                            value="%{getText('link.forget.pwd')}"/>？</span></a>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div id="contentDown">
        <div class="beginExp">
            <div class="expImg"></div>
            <span class="expWords"><s:property value="%{getText('label.course.online')}"/></span>
            <a href="livingClass.html" class="more_course"><s:property
                    value="%{getText('label.course.online.more')}"/>></a>
        </div>
        <div class="list_div_1">
            <ul class="list_ul_1">
                <s:iterator value="courses" status="idx">
                    <li>
                        <p>
                            <a href="courseOnlineAudit.html?courseClass.id=<s:property value="classOnTheCorner.id"/>&courseOnline=true">
                                <img src="<s:property value="logoUrl"/>" title="<s:property value="description"/>"
                                     onerror="javascript:src='images/nopic.jpg'"/>
                                <span class="second_counter" id="second_counter<s:property value="#idx.index"/>"></span>
                            </a>
                            <span class="course_tittle"><s:property value="name"/></span>
                            <span class="course_time" id="course_time_<s:property value="#idx.index"/>"><s:date
                                    name="classOnTheCorner.date" format="%{getText('dateformat.forclass')}"/></span>
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    var startTime = new Date("<s:date name="classOnTheCorner.date" format="%{getText('dateformat.forclass')}"/>".replace(/-/g, '/'));
                                    var now = new Date();
                                    if (startTime < now) {
                                        $("#course_time_<s:property value="#idx.index"/>").html("<s:property value="%{getText('course.online.in.progress')}"/>");
                                    } else if ((startTime - now) / 1000 < 3600) {
                                        $("#second_counter<s:property value="#idx.index"/>").countdown({
                                            date: '<s:date name="classOnTheCorner.date" format="%{getText('date.formate.firstpage.course.startdate')}"/>',
                                            onChange: function (event, timer) {
                                            },
                                            onComplete: function (event) {
                                                $(this).html("<s:text name='course.in.progress'/>");
                                            },
                                            htmlTemplate: "<span><b>%{m}</b><s:property value="%{getText('course.time.minute')}"/><b>%{s}</b><s:property value="%{getText('course.tine.second')}"/></span>",
                                            leadingZero: true,
                                            direction: "down"
                                        });
                                    }
                                });
                            </script>
                        </p>
                    </li>
                </s:iterator>
            </ul>
        </div>
        <div class="beginExp">
            <div class="expImg"></div>
            <span class="expWords">最新个人秀</span>
            <a href="livingClass.html" class="more_course">更多个人秀></a>
        </div>
        <div class="list_div_1">
            <ul class="list_ul_1">
                <s:iterator value="myShows" status="idx">
                    <li>
                        <p>
                            <a href="showBlog.html?myShow.id=<s:property value="id"/>">
                                <img src="<s:property value="logoUrl"/>" title="<s:property value="description"/>"
                                     onerror="javascript:src='images/nopic.jpg'"/>
                                <span class="second_counter" id="second_counter<s:property value="#idx.index"/>"></span>
                            </a>
                            <span class="course_tittle"><s:property value="name"/></span>
                            <span class="course_time" id="show_time_<s:property value="#idx.index"/>"><s:date
                                    name="firstFutureTerm.startTime" format="%{getText('dateformat.forclass')}"/></span>
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    var startTime = new Date("<s:date name="firstFutureTerm.startTime" format="%{getText('dateformat.forclass')}"/>".replace(/-/g, '/'));
                                    var now = new Date();
                                    if (startTime < now) {
                                        $("#show_time_<s:property value="#idx.index"/>").html("<s:property value="%{getText('show.online.in.progress')}"/>");
                                    } else if ((startTime - now) / 1000 < 3600) {
                                        $("#second_counter<s:property value="#idx.index"/>").countdown({
                                            date: '<s:date name="firstFutureTerm.startTime" format="%{getText('date.formate.firstpage.course.startdate')}"/>',
                                            onChange: function (event, timer) {
                                            },
                                            onComplete: function (event) {
                                                $(this).html("<s:text name='show.online.in.progress'/>");
                                            },
                                            htmlTemplate: "<span><b>%{m}</b><s:property value="%{getText('course.time.minute')}"/><b>%{s}</b><s:property value="%{getText('course.tine.second')}"/></span>",
                                            leadingZero: true,
                                            direction: "down"
                                        });
                                    }
                                });
                            </script>
                        </p>
                    </li>
                </s:iterator>
            </ul>
        </div>
        <div class="beginExp">
            <div class="expImg"></div>
            *****
            <span class="expWords"><s:property value="%{getText('label.have.a.try')}"/></span>
        </div>
        <div class="courseEntry">
            <ul>
                <a href="courseSelection.html">
                    <li class="selectCourse"></li>
                </a> <a href="createCourse.html">
                <li class="createCourse"></li>
            </a> <a href="initOrgCourseCreation.html">
                <li class="organization"></li>
            </a> <a href="initOrgLeague.html">
                <li class="league"></li>
            </a>
            </ul>
        </div>
    </div>
</div>
