<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

﻿<style type="text/css">
#blogindex ,#blogindex div#blogindex ,ul,#blogindex li,#blogindex h1,#blogindex h2,#blogindex h3,#blogindex h4,#blogindex h5,#blogindex table{ margin:0px; padding:0px; font-family:Verdana, Geneva, sans-serif; color:#666; background:#FFF;}
#blogindex ul,#blogindex li{ list-style:none;}
#blogindex div{ float:left; text-align: left;}
#blogindex a:link,#blogindex a:visited{ color:#cc6600; text-decoration:underline;}
#blogindex a:hover{ color:#F90;}
#blogindex{ width:1000px; margin:0px auto; position:relative; float:none; font-size:14px; text-align:left;}
.blogframe{ width:1000px; background:url(images/blogindex/frame1center.gif) center repeat-y; position:relative; padding-bottom:15px;}
.blogframe #video{height:320px;width:400px;padding:2px;margin: 0 15px 25px;border: 1px solid #CCC; padding: 3px;text-align: center; }
#courseinfo{ width:240px; margin:30px 15px 5px;}
#blogindex b{ color:#cc6600;}
#blogindex h2{ color:#006699; font-size:22px;padding-bottom:2px; float:left; width:320px;}
#evaluate{ width:260px; margin:30px 0px 5px;}
#evaluate b{ font-style:oblique;}
#evaluate h3{ font-size:18px; height:28px; padding-bottom:2px;}
#evaluate h3 b{ font-size:24px;}
img.frame1bottom{ position:absolute; left:0; bottom:0;}
#blogindex .btn1{border:none; height:54px; width:183px; cursor:pointer; margin:5px 30px 0px 15px;}
.reservation{ background:url(images/blogindex/blogreservation.gif) no-repeat; }
.evaluate{ background:url(images/blogindex/blogevaluate.gif) no-repeat;}

#ievaluate{ margin-left:15px; width:970px;}
#evaluatepanel{ display:none;}


#allclass{ width:960px; float:left; position:relative; margin:5px 5px 0px 20px;}
#blogindex h4{width:230px;color:#000; font-size:18px;padding-bottom:2px; float:left; margin:20px 0px 5px 15px;; font-weight:bold;}
#blogindex h5{ width:680px;color:#666; font-size:16px;padding-bottom:2px; float:left; margin:2px 15px; font-weight:bold; text-align: left;}
#carousel_ul a table{ width:100%; height:100%;}
#carousel_ul a:hover table{ border:#F93 2px solid;}
#blogindex .con{overflow:hidden; width:958px; background-color:#FFF;}
#carousel_container{position:relative; height:100px;overflow:hidden; float:left; width:958px;}
#carousel_inner{width:900px; height:95px; overflow: hidden; position:absolute;left:27px; top:5px;}
#left_scroll{position: absolute;left:0;top:20px;width:26px;height:56px;cursor: pointer;cursor: hand; background: url(images/blogindex/listdirection.gif) no-repeat;}
#right_scroll{position: absolute;top:20px;right:0; width:28px;height:56px;cursor: pointer;cursor: hand; background: url(images/blogindex/listdirection2.gif) no-repeat;}
#carousel_ul{width:9999px; height:95px; position:relative;}
#carousel_ul li{float: left;width:138px; height:90px; border:solid 1px #999; display:inline; margin:0 5px; background:#EAEAEA;}
#carousel_ul li a{ text-decoration:none; font-size:12px;}
#carousel_ul li a .td1{ color:#000; text-align:center; font-weight:bold;}
#carousel_ul li a .td2{ color:#006699; text-align:center;}
#carousel_ul li a .td3{ color:#666; text-align:center;}

#conleft{ width:724px; float:left;}
.blogframe2{ width:724px; background:url(images/blogindex/frame2center.gif) center repeat-y; position:relative; padding-bottom:15px; float:left;}
.blogframe2 table{ margin:0px 15px 10px;}
.introtitle{ padding:3px 15px; font-size:16px; color:#cc6600; font-weight:bolder;}
.introcon{ padding:2px 10px 2px 10px; width: 360px;}
.introcon p{ text-indent:2em; line-height:18px; display: inline;}
.intromore{ text-align:right; padding-right:10px;}
.intromore a{text-decoration:none;}
#conright{ width:270px; float:right; margin-right: 0; padding-right: 0;}


.blogframe3{ width:270px; background:url(images/blogindex/frame3center.gif) middle repeat-y; position:relative; padding-bottom:15px; float:left;}
.photolist{ list-style:none; padding:0px;float:left; margin:15px 10px 5px 10px; width:250px; font-size:12px;}
.photolist li{ float:left; margin-left:4px;}
.photolist li a{ display:block; width:120px; text-align:center; text-decoration:none; color:#333333; font-size:12px;margin-left:4px;}
.photolist li a:hover,.photolist li a:active{ color:#CCCCCC;}
.photolist a img{ display:block; width:110px; height:90px; border:1px #999 solid; margin-bottom:2px; padding:4px;}
.photolist li td{ text-align:center; height:20px;}
.photolist li .td5 a{ color:#cc6600; display:inline; text-decoration:underline;}
.photolist li .td5 a:hover{ color:#F90;}

#commentlist{ float:left; width:960px;}
.type2,.type2 .rate-current,.type2 .rate-on:hover,.type2-bad .rate-current,.type2-bad .rate-on:hover{ background: url(images/blogindex/star.gif) repeat-x; color:#cc6600;}
.type2{ position:relative; height:18px; width:110px;}
.type2 .rate-on,.type2 .rate-current{ position:absolute; top:0; left:0; height:18px; outline:none;}
.type2 .rate-current,.type2 .rate-on:hover{ background-position:0 -46px;}
.type2-bad .rate-current,.type2-bad .rate-on:hover{ background-position:0 -23px;}


#tabs10 { float:left;width:670px; font-size:93%; border-bottom:1px solid #2763A5;line-height:normal; margin-left:10px; margin-bottom:15px;}
#tabs10 ul {padding:0px 10px 0 20px;}
#tabs10 li {display:inline;}
#tabs10 a:link,#tabs10 a:visited{float:left;background: url(images/blogindex/tableft10.gif) no-repeat left top;margin:0;padding:0 0 0 4px;text-decoration:none; }
#tabs10 a span {float:left;display:block; background:url(images/blogindex/tabright10.gif) no-repeat right top;padding:5px 15px 4px 6px;color:#FFF; }
#tabs10 a span {float:none;}
#tabs10 a:hover span {color:#FFF;}
#tabs10 a:hover {background-position:0% -42px;}
#tabs10 a:hover span {background-position:100% -42px; }
#tabs10 #current a {background-position:0% -42px; }
#tabs10 #current a span {background-position:100% -42px;}

#commentpanel{ width:680px; margin-left:15px; margin-bottom:15px;}
#communicatepanel{ width:680px; margin-left:15px; margin-bottom:15px;display:none;}
#infopanel{ width:680px; margin-left:15px; margin-bottom:15px; font-size:12px;display:none; }

.commenttd1{ width:120px; text-align:right; padding-right:20px; padding-top:5px;}
.commenttd2{ width:140px; text-align:right; padding-right:4px; padding-top:5px;}
.commenttd3 div{ width:50px; padding-right:4px; padding-top:5px; font-size:18px; font-style:oblique; color:#F60;font-weight:bold;}
.commenttd4{ width:50px; padding-right:4px; padding-top:5px; font-size:24px; font-style:oblique; color:#F60; font-weight:bold;}
.commenttd5{ width:290px; text-align:right; padding-right:20px; padding-top:5px;}

.commentdetail{ border-bottom:1px #CCC dashed; font-size:12px; width:100%; float:left; margin:5px 0;}
.commentdetail .userlogo{ width:100px; text-align:center;}
.commentdetail .userlogo img{ padding:1px; border:1px solid #999;}
.commentnumber{ width:60px; font-size:12px; text-align:right;}
.commentdetail .tdname{ padding:3px 10px 3px 10px; color:#006699; font-size:14px; font-weight:bold; width:90px;}
.commentdetail .tdtime{ font-size:12px; color:#666; width:180px;}
.commentdetail .iwantreply{ text-align:right; padding-right:2px; width:70px;}
.commentdetail .commentnumber{ text-align:right;}
.commentdetail table{ margin-top:6px;}


.commentdetail .tdname2{ padding:3px 10px 3px 10px; color:#006699; font-size:12px; font-weight:bold; width:80px;}
.commentdetail .tdtime{ font-size:12px; color:#666; width:120px;}
.commentdetail table{ margin-top:6px; float:left;}

.replylist{width:620px; display:none; margin: 3px 0 3px 70px;border-bottom:1px dotted #999;}
.ireply{ width:620px; margin-left:60px; padding:3px 5px 3px 2px; background-color:#EEE; font-size:12px; display:none; border-top:1px dotted #999}

.infolist{ border:1px dotted #999; margin-bottom: 5px; width:650px;}
.infolist td{ padding:3px 4px;}
.infotitle{ width:100px; border-right:1px dotted #999;}
.infopeople{ width:120px; border-bottom:1px dashed #999}
.uploadtime{ border-bottom:1px dashed #999; width:160px;}


.toggles{ width:640px; margin-left:15px; display:inline;}
#blogindex dl dt { width:680px;font-size:14px; font-weight:bold; color:#006600; cursor:pointer; display:block; text-align:left; line-height:30px;}
#blogindex dl dd{ margin:0px; padding:0px;}
#blogindex dl dd h2 { font-size:15px; }
#blogindex dl .dt2{ width:640px;color:#666; font-size:18px;padding-bottom:2px; margin:2px 15px; font-weight:bold;}
.btnsubmit{ font-size:12px;}
.answerpeople{ width:150px; text-align:left; font-size:12px;}
.answertime{ width:140px; text-align:right; font-size:12px;}

.topbtn{ width:500px; float:left;}

#teachername{ position:relative;}
#teachername .type2{ width:110px; height:18px; background:url(images/blogindex/star.gif) repeat-x; display:block; position:absolute; top:-5px; right:-10px;}
.filefield{ height:24px; padding:4px 0; width:100%}

#blogindex .logo{ width:50px; height:56px; padding:1px; border:1px solid #999; float:left; margin:0px 3px 2px 0px;}

#blogindex .bottom{ width:1000px; border-top:1px solid #999; color:#999; clear:both; margin-top:10px; font-weight:bold; padding-right:15px;}
#blogindex .bottom p{ text-align:right; height:20px;}
</style>


<script type="text/javascript" src="js/jquery.rate.js"></script>
<script type="text/javascript">
    function InitAjax() {
        var ajax = false;
        try {
            ajax = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                ajax = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (E) {
                ajax = false;
            }
        }
        if (!ajax && typeof XMLHttpRequest != 'undefined') {
            ajax = new XMLHttpRequest();
        }
        return ajax;
    }

    function saveEvaluation(cid) {

        var msg = document.getElementById("msg");
        var msg1 = document.getElementById("syntheticalMsg");
        var synthetical = document.getElementById("synthetical");
        var interest = document.getElementById("interest").innerHTML;
        var available = document.getElementById("available").innerHTML;
        var interaction = document.getElementById("interaction").innerHTML;
        var costPerformance = document.getElementById("costPerformance").innerHTML;

        var url = "saveCourseEvaluation.html";
        var postStr = "courseEvaluation.interest=" + interest + "&courseEvaluation.available=" + available + "&courseEvaluation.interaction=" + interaction + "&courseEvaluation.costPerformance=" + costPerformance + "&courseEvaluation.course.id=" + cid;
        var ajax = InitAjax();
        ajax.open("POST", url, true);
        ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        ajax.send(postStr);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                var str = ajax.responseText.split("$");
                //alert(str[0]+"   "+str[1]);
                msg1.innerHTML = "您给该课程的综合评分：";
                synthetical.innerHTML = str[1];
                msg.innerHTML = str[0];
            }
        }
    }
    function getGirlOjbect() {
        if ($.browser.msie) {
            //alert("the edition is IE");
            return   document.getElementById("Girl")
        } else {
            //alert("the edition is ff");
            return   document.getElementById("GirlEmbed")
        }
    }

    function LoadVideo(cid) {
        var url = href = "openVideoClass.html";
        var postStr = "courseClass.id=" + cid;
        var ajax = InitAjax();
        ajax.open("POST", url, true);
        ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        ajax.send(postStr);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                //alert(getGirlOjbect().LoadVideoURL);
                getGirlOjbect().LoadVideoURL(ajax.responseText);
                //alert(getGirlOjbect().LoadVideoURL);
            }
        }

    }


    var SellerScroll = function (options) {
        this.SetOptions(options);
        this.lButton = this.options.lButton;
        this.rButton = this.options.rButton;
        this.oList = this.options.oList;
        this.showSum = this.options.showSum;

        this.iList = $("#" + this.options.oList + " > li");
        this.iListSum = this.iList.length;
        this.iListWidth = this.iList.outerWidth(true);
        this.moveWidth = this.iListWidth * this.showSum;

        this.dividers = Math.ceil(this.iListSum / this.showSum);	//共分为多少块
        this.moveMaxOffset = (this.dividers - 1) * this.moveWidth;
        this.LeftScroll();
        this.RightScroll();
    };
    SellerScroll.prototype = {
        SetOptions: function (options) {
            this.options = {
                lButton: "left_scroll",
                rButton: "right_scroll",
                oList: "carousel_ul",
                showSum: 6	//一次滚动多少个items
            };
            $.extend(this.options, options || {});
        },
        ReturnLeft: function () {
            return isNaN(parseInt($("#" + this.oList).css("left"))) ? 0 : parseInt($("#" + this.oList).css("left"));
        },
        LeftScroll: function () {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.lButton).click(function () {
                currentOffset = _this.ReturnLeft();
                if (currentOffset == 0) {
                    for (var i = 1; i <= _this.showSum; i++) {
                        $(_this.iList[_this.iListSum - i]).prependTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth });
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, { duration: "slow", complete: function () {
                        for (var j = _this.showSum + 1; j <= _this.iListSum; j++) {
                            $(_this.iList[_this.iListSum - j]).prependTo($("#" + _this.oList));
                        }
                        $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 1) });
                    } });
                } else {
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, "slow");
                }
            });
        },
        RightScroll: function () {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.rButton).click(function () {
                currentOffset = _this.ReturnLeft();
                if (Math.abs(currentOffset) >= _this.moveMaxOffset) {
                    for (var i = 0; i < _this.showSum; i++) {
                        $(_this.iList[i]).appendTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 2) });

                    $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, { duration: "slow", complete: function () {
                        for (var j = _this.showSum; j < _this.iListSum; j++) {
                            $(_this.iList[j]).appendTo($("#" + _this.oList));
                        }
                        $("#" + _this.oList).css({ left: 0 });
                    } });
                } else {
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, "slow");
                }
            });
        }
    };
    $(document).ready(function () {
        var ff = new SellerScroll();
    });

    $(document).ready(function () {
        $("#evaluatebtn").click(function () {
            $("#evaluatepanel").slideToggle(500);
        });
    });
    $(document).ready(function () {
        $("#commentspry").click(function () {
            $("#infopanel").hide("fast");
            $("#communicatepanel").hide("fast");
            $("#commentpanel").show("fast");
        });
    });
    $(document).ready(function () {
        $("#communicatespry").click(function () {
            $("#infopanel").hide("fast");
            $("#communicatepanel").show("fast");
            $("#commentpanel").hide("fast");
        });
    });
    $(document).ready(function () {
        $("#infospry").click(function () {
            $("#infopanel").show("fast");
            $("#communicatepanel").hide("fast");
            $("#commentpanel").hide("fast");
        });
    });


    $(document).ready(function () {
        $(" dl dd").hide();
        $("dl dd.ddcurrent").show();
        $("dl dt").click(function () {
            $("dl dd").not($(this).next()).hide();
            $("dl dt").not($(this).next()).removeClass("current");
            $(this).next().slideToggle(500);
            $(this).toggleClass("current");
        });
    });


    // $(document).ready(function(){
    //      $("#saveCourseResource").click(function(){
    //            $.post("saveCourseResource.html",$("#resourceForm").serialize(),function(data){
    //                $('#courseResourceAjax').html(data);
    //            });
    //      });
    //  });
</script>
<div id="courseCommentAjax">
    <div id="infopanel">

        <dl>
            <dt class="dt2">课程资源上传</dt>
            <dd>
                <s:form action="saveCourseResource" id="resourceForm" name="resourceForm" encType="multipart/form-data"
                        method="post" target="hidden_frame" onsubmit="return validateLogo()">
                    <s:hidden name="course.id"/>
                    <table border="0" cellspacing="0" cellpadding="0" width="90%">
                        <tr>
                            <td class="filefield">资料路径：
                                <label for="fileField"></label>
                                <s:file name="download" id="fileField"/></td>
                        </tr>
                        <tr>
                            <td class="infointro"><strong>添加资料简介：</strong></td>
                        </tr>
                        <tr>
                            <td class="infointro">
                                <label for="textarea"></label>
                                <s:textarea name="courseResource.description" id="textarea" cols="60"
                                            rows="3"></s:textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="filefield">
                                <s:submit id="saveCourseResource" value="上传资料，并提交信息"/></td>
                        </tr>
                    </table>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            if (parent && $("#resourceList").html()) {
                                parent.refreshResourcePage($("#resourceList").html());
                            }
                        });
                    </script>
                    <iframe name='hidden_frame' id="hidden_frame" style="display: none;"></iframe>
                </s:form>


            </dd>
        </dl>

        <dl>
            <dt class="dt2">课程资源列表</dt>
            <dd class="ddcurrent" id="resourceList">

                <s:iterator value="courseResources">
                    <table border="0" cellspacing="0" cellpadding="0" class="infolist">
                        <tr>
                            <td rowspan="2" class="infotitle"><a
                                    href="download.html?courseResource.id=<s:property value="id"/>"><s:property
                                    value="sourceTitle"/></a></td>
                            <td class="infopeople">上传者：<s:property value="provider.userName"/></td>
                            <td class="uploadtime">上传时间：<s:date name="provideTime"
                                                                format="%{getText('global.display.datetime')}"/></td>
                            <td class="uploadtime">审核时间：<s:date name="estimateTime"
                                                                format="%{getText('global.display.datetime')}"/></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="infointro"><strong>资料简介：</strong><s:property value="description"/>
                            </td>
                        </tr>
                    </table>
                </s:iterator>

            </dd>
        </dl>

    </div>
</div>
