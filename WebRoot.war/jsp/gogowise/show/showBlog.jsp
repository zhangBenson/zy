<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link type="text/css" href="css/show/showBlog.css" rel="stylesheet" />
<script type="text/javascript">
 var  del = "<s:text name='course.class.delete'/>";
 var friendEmail="<s:text name='label.email.friend'/>";
 var earlytimeEmpty="<s:text name='message.earliest.time.empty'/>";
 var lasttimeEmpty="<s:text name='message.lastest.time.empty'/>";
 var earliesterror="<s:text name='message.earlist.time.cannot.realy'/>";
 var latesterror="<s:text name='message.latiest.time.cannot.realy'/>";
 var score="<s:text name='label.scrore.compre'/>";
 var box;

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

$(document).ready(function(){
    $("#message_submit_btn").bind('click', function () {
        if(validateLogo()){
            var messageText = $("#message_textarea").val();
            if(messageText == ""){
                $("#message_area_tip").html("<s:text name='blog.left.message.empty'/>");
                return;
            }
            $.post("saveShowComment.html", {'myShow.id':'<s:property value="myShow.id"/>', 'showComment.content':messageText,'commentsNum':<s:property value="commentsNum"/>} , function (data) {
                $("#message_list_ul").html(data);
            });
            $("#message_textarea").attr('value',"");
            $("#message_area_tip").html("");
        }
    })

    $("#message_textarea").keyup(function(){
        changeWordNumber($(this),$("#message_area_tip"),250);
    });
});

function saveEvaluation(cid) {
    var ret = validateLogo();
    if (!ret) return false;
    var msg = $("#msg");
    var msg1 = $("#syntheticalMsg");
    var synthetical = $("#synthetical");
    var interest = $("#interest").html();
    var available = $("#available").html();
    var interaction = $("#interaction").html();

   alert("<s:property value="%{getText('show.function.is.still.not.public')}" />");

    return false;
    var url = "saveCourseEvaluation.html";
    var postStr = "courseEvaluation.interest=" + interest + "&courseEvaluation.available=" + available + "&courseEvaluation.interaction=" + interaction + "&courseEvaluation.costPerformance=" + costPerformance + "&courseEvaluation.course.id=" + cid;
    var ajax = InitAjax();
    ajax.open("POST", url, true);
    ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    ajax.send(postStr);
    ajax.onreadystatechange = function() {
        if (ajax.readyState == 4) {
            var str = ajax.responseText.split("$");
            //alert(str[0]+"   "+str[1]);
            msg1.innerHTML = score;
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
    ajax.onreadystatechange = function() {
        if (ajax.readyState == 4) {
            getGirlOjbect().LoadVideoURL(ajax.responseText);
        }
    }
}

var SellerScroll = function(options) {
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
    SetOptions: function(options) {
        this.options = {
            lButton: "left_scroll",
            rButton: "right_scroll",
            oList: "carousel_ul",
            showSum: 4    //一次滚动多少个items
        };
        $.extend(this.options, options || {});
    },
    ReturnLeft: function() {
        return isNaN(parseInt($("#" + this.oList).css("left"))) ? 0 : parseInt($("#" + this.oList).css("left"));
    },
    LeftScroll: function() {
        if (this.dividers == 1) return;
        var _this = this, currentOffset;
        $("#" + this.lButton).click(function() {
            currentOffset = _this.ReturnLeft();
            if (currentOffset == 0) {
                for (var i = 1; i <= _this.showSum; i++) {
                    $(_this.iList[_this.iListSum - i]).prependTo($("#" + _this.oList));
                }
                $("#" + _this.oList).css({ left: -_this.moveWidth });
                $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, { duration: "slow", complete: function() {
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
    RightScroll: function() {
        if (this.dividers == 1) return;
        var _this = this, currentOffset;
        $("#" + this.rButton).click(function() {
            currentOffset = _this.ReturnLeft();
            if (Math.abs(currentOffset) >= _this.moveMaxOffset) {
                for (var i = 0; i < _this.showSum; i++) {
                    $(_this.iList[i]).appendTo($("#" + _this.oList));
                }
                $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 2) });

                $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, { duration: "slow", complete: function() {
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
    $(document).ready(function() {
        var ff = new SellerScroll();
    });
     function showEditModal() {
         if(!validateLogo()) return false;
         $.post("becomeFans.html",{'myShow.id':"<s:property value="myShow.id"/>"},function(data){
               $.fancybox({
                content:"<div style='height: 40px;width: 300px;'><p align='center' style='line-height: 40px;'>"+data.message+"</p></div>",
                onComplete: function(){ setTimeout("$.fancybox.close();","2000")}
              });
         });
     }
    $(document).ready(function() {
        $("#evaluatebtn").click(function() {
            $("#evaluatepanel").slideToggle(500);
        });

        $(".reservebtn").click(showEditModal);
        $("#course_reserve").click(function(){
            var ret = validateLogo();
            if (!ret) return false;
            if($("#recommdatepanel").is(":visible")){
                $("#recommdatepanel").hide();
             }
             $("#reservepanel").slideToggle(500);
            box.hide();
        });
        $(".reserve_close").click(function(){
            var ret = validateLogo();
            if (!ret) return false;
            if($("#recommdatepanel").is(":visible")){
                $("#recommdatepanel").hide();
            }
            $("#reservepanel").slideToggle(500);
            box.hide();
        });

        $(".recommdatebtn").click(function() {
            var ret = validateLogo();
            if (!ret) return false;
            if( $("#reservepanel").is(":visible")){
                 $("#reservepanel").hide();
            }
            $("#recommdatepanel").slideToggle(500);
        });

        $(".tab_li").click(function(){
            var contObj = $("."+$(this).attr("id")+"_content");
             contObj.siblings("div").hide("fast");
             contObj.show("fast");
        });

    });

    $(document).ready(function() {
        $("dl dd").hide();
        $("dl dd.ddcurrent").show();
        $("dl dt").click(function() {
            $("dl dd").not($(this).next()).hide();
            $("dl dt").not($(this).next()).removeClass("current");
            $(this).next().slideToggle(500);
            $(this).toggleClass("current");
        });
    });

    function refreshResourcePage(htmlDate) {
        $('#resourceList').html(htmlDate);
    }

    $(document).ready(function(){
        $(".add_friend_email").click(function(){
             $(".added_line").append("<tr><td align='right' valign='top'>"+friendEmail+"&nbsp;&nbsp;</td><td><input class='recommdate_email' type ='text' name='emails' onblur='checkEmail(this);'>&nbsp;&nbsp;<span class='recommdate_delete' onclick='deleteRow(this)'>"+del+"</span></td></tr>");
        });
    });

    function deleteRow(obj){
             $(obj).parent().parent().remove();
    }

    function checkCourseReservation(){
       $("#dateMsg").text("");
       if($("#courseReservationInitial").val()==""){
             $("#dateMsg").text(earlytimeEmpty);
             return false;
       }else{
           var initial = new Date($("#courseReservationInitial").val().replace(/-/g,"/"));
           if(initial<new Date()){
               $("#dateMsg").text(earliesterror);
               return false;
           }
           if($("#courseReservationAtLatest").val()==""){
             $("#dateMsg").text(lasttimeEmpty);
             return false;
           }else{
               var atLatest = new Date($("#courseReservationAtLatest").val().replace(/-/g,"/"));
               if(atLatest<initial){
                  $("#dateMsg").text(latesterror);
                   return false;
               }
           }
       }
        return true;
    }

    $(document).ready(function(){
      $("#courseReservationInitial").blur(function(){
       $("#dateMsg").text("");
       if($("#courseReservationInitial").val()==""){
             $("#dateMsg").html(earlytimeEmpty);
       } else{
           var initial = new Date($("#courseReservationInitial").val().replace(/-/g,"/"));
           if(initial<new Date()){
               $("#dateMsg").html(earliesterror);
           }
       }
      });
    });

    $(document).ready(function(){
      $("#courseReservationAtLatest").blur(function(){
           $("#dateMsg").text("");
           if($("#courseReservationAtLatest").val()==""){
              $("#dateMsg").text(lasttimeEmpty);
              return false;
           }else{
               var initial = new Date($("#courseReservationInitial").val().replace(/-/g,"/"));
               var atLatest = new Date($("#courseReservationAtLatest").val().replace(/-/g,"/"));
               if(atLatest<initial){
                  $("#dateMsg").text(latesterror);
                   return false;
               }
           }
      });
   });
</script>

<div id="blogindex">

<div class="blogframe">
    <img src="images/blogindex/frame1top.gif"/>

    <div id="blogHead2">
        <h2 id="share_title"><s:property value="myShow.name"/></h2>
    </div>

    <div id="grade" style="float:left;width:110px;"><span id="rate_t_5" class="type2"></span></div>
    <div id="courseLogo">
        <div class="courseImgDiv">
             <img id="share_pic" src="<s:property value="myShow.logoUrl"/>" class="showImg"/>
        </div>
        <span id="share_desc"><s:property value="myShow.description"/></span>
    </div>
    <div id="courseinfo">
        <p><s:property value="%{getText('show.blog.host.username')}"/>：<b><s:a action="userBlog"><s:param name="user.id" value="myShow.owner.id"/><s:property value="myShow.owner.nickName"/></s:a></b></p>
        <p><s:property value="%{getText('show.start.time')}"/>：<b><s:date name="myShow.showDate" format="%{getText('dateformat')}"/></b></p>
        <p><s:property value="%{getText('show.attention.member.num')}"/>：<b><s:property value="myShow.fansNum"/></b></p>
        <p><s:property value="%{getText('show.finished.terms.num')}"/>：<b><s:property value="myShow.showTermsNum"/></b></p>
    </div>
    <div id="evaluate">
        <table>
            <tr><td class="htitle"><s:property value="%{getText('label.score')}"/>：</td><td><s:property value="myShow.synthetical"/></td></tr>
            <tr><td class="htitle"><s:property value="%{getText('label.interest')}"/>：</td><td><s:property value="myShow.interest"/></td></tr>
            <tr><td class="htitle"><s:property value="%{getText('label.practivity')}"/>：</td><td><s:property value="myShow.available"/></td></tr>
            <tr><td class="htitle"><s:property value="%{getText('label.interactivity')}"/>：</td><td><s:property value="myShow.interaction"/></td></tr>
        </table>
    </div>
    <div id="course_share">

        <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare" data="">
            <%--<span style="float:left;line-height: 30px;margin-left: 10px;"><s:property value="%{getText('label.shared.with')}"/>：</span>--%>
            <a class="bds_qzone">QQ空间</a>
            <a class="bds_tsina">新浪微博</a>
            <a class="bds_tqq">腾讯微博</a>
            <a class="bds_renren">人人网</a>
            <a class="bds_fbook">Facebook</a>
            <a class="bds_twi">Twitter</a>
            <span class="bds_more"><s:property value="%{getText('others.more')}"/></span>
        </div>
        <script type="text/javascript" id="bdshare_js" data="type=tools" ></script>
        <script type="text/javascript" id="bdshell_js"></script>
        <script type="text/javascript">
            var share_title = document.getElementById("share_title").innerText+"@GoGoWise"+"  <s:text name="show.recommend.default.content"/>";
            var share_pic =  document.getElementById("share_pic").src;
            var share_comment = "<s:text name="show.recommend.default.content"/>";
            var share_desc = document.getElementById("share_desc").innerText;

            var _data = "{'text':'"+share_title + "',"+
                    "'comment':'"+share_comment + "',"+
                    "'url':'"+window.location.href+"'}";

            document.getElementById("bdshare").setAttribute("data",_data);


            var bds_config = {'bdText':share_title,
                'bdDesc':share_desc, //qq，开心
                'bdComment':share_comment,
                'bdPopTitle':'GoGoWise Share',
                'bdPic':share_pic
            };
            document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
        </script>
    </div>
    <div class="topbtn">
        <div class="btn1 reservation reservebtn"></div>
        <div class="btn1 recommdate recommdatebtn"></div>
    </div>
    <div class="reservation_external">
        <div class="external_inner">
            <ul>
                <li class="warm_tip"><s:property value="%{getText('org.warmtip')}"/></li>
                <li><s:property value="%{getText('label.course.total')}"/><s:property value="course.totalHours"/><s:property value="%{getText('label.course.class.passed')}"/><s:property value="course.finshedClassNum"/><s:property value="%{getText('label.course.you.can')}"/></li>
                <li><a id="course_reg" href="initCourseconfirm.html?course.id=<s:property value="course.id"/>"><s:property value="%{getText('label.course.register')}"/></a></li>
                <li><s:property value="%{getText('course.selection.or')}"/></li>
                <li><s:property value="%{getText('label.course.fill.request')}"/></li>
                <li><a id="course_reserve"><s:property value="%{getText('label.course.reserve.new')}"/></a></li>
            </ul>
        </div>
    </div>
    <img src="images/blogindex/frame1bottom.gif" class="frame1bottom"/>
</div>


<div id="conleft">

    <div class="blogframe2" id="reservepanel">
        <img src="images/blogindex/frame2top.gif"/>
        <s:hidden value="%{#session.userID}" id="hidSessionId"/>
        <h4><s:property value="%{getText('button.booking.our.course')}"/></h4> <div id="dateMsg"></div>
        <div class="reservepanel_inner">
            <div class="reserveLeft">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <s:iterator value="course.classes">
                            <tr>
                                <td width="70px"><s:property value="name"/></td>
                                <td width="430px">&nbsp;&nbsp;<s:property value="nickName"/></td>
                                <td width="140px"><s:property value="%{getText('label.day.of.week.'+weekDay)}"/> &nbsp;&nbsp;<s:date name="date" format="%{getText('dateformat.hour.minute')}"/></td>
                            </tr>
                        </s:iterator>
                    </table>
            </div>

            <s:form action="saveCourseReservation" method="POST">
                <s:hidden name="course.id"/>
            <div class="reserveRight">
                <table>
                    <tr><td align="right"><s:property value="%{getText('label.anticipated.earliest.time')}"/>&nbsp;</td><td><s:textfield id="courseReservationInitial" name="courseReservation.initial" readonly="true" cssClass="Wdatepicker" onfocus="WdatePicker({lang:'%{getText('language')}',startDate:'%y-%M-01 00:00:00',dateFmt:'%{getText('dateformat.forclass')}',alwaysUseStartDate:true})"/></td>
                        <td align="right"><s:property value="%{getText('label.anticipated.lastest.time')}"/>&nbsp;</td><td><s:textfield id="courseReservationAtLatest" name="courseReservation.atLatest" readonly="true" cssClass="Wdatepicker" onfocus="WdatePicker({lang:'%{getText('language')}',startDate:'%y-%M-01 00:00:00',dateFmt:'%{getText('dateformat.forclass')}',alwaysUseStartDate:true})"/></td>
                    </tr>
                    <tr><td align="right" valign="top"><s:property value="%{getText('button.message')}"/>&nbsp;</td><td colspan="3"><textarea name="courseReservation.comments" class="reserve_area" placeholder="<s:property value="%{getText('message.no.special.req')}"/>"></textarea></td></tr>
                    <tr><td></td><td colspan="3"><input type="submit" class="reserve_submit"  value="<s:property value="%{getText('button.book.course')}"/>" onclick="return checkCourseReservation();"/>&nbsp;&nbsp;<span class="reserve_close"><s:property value="%{getText('button.close')}"/></span></td></tr>
                </table>
            </div>
            </s:form>

        </div>
        <img src="images/blogindex/frame2bottom.gif"  class="frame1bottom"/>
    </div>


    <s:form action="recommendShow" method="POST">
        <s:hidden name="myShow.id"/>
    <div class="blogframe2" id="recommdatepanel">
        <img src="images/blogindex/frame2top.gif"/>
        <h4><s:property value="%{getText('show.recommend.my.show')}"/></h4>   <div id="recommendMsg"></div>
        <div class="recommdatepanel_inner">
            <table>
                <tr><td></td><td class="add_friend_email"><s:property value="%{getText('button.add.email.friend')}"/></td></tr>
                <tr><td width="80px" align="right" valign="top"><s:property value="%{getText('label.email.friend')}"/>&nbsp;</td><td><input class="recommdate_email" type ="text" name="emails" onblur="checkEmail(this);"></tr>
                <tbody class="added_line"></tbody>
                <tr><td align="right" valign="top"><s:property value="%{getText('button.message')}"/>&nbsp;</td><td><textarea class="recommdate_message" placeholder="<s:property value="%{getText('show.recommend.default.content')}"/>" name="comments"></textarea></td></tr>
                <tr><td></td><td><input class="recommdate_submit" type="submit" onclick="return checkCourseRecommend();" value="<s:property value="%{getText('button.submit')}" />" />&nbsp;&nbsp;<span class="recommdate_close recommdatebtn"><s:property value="%{getText('button.close')}"/></span></td></tr>
            </table>
        </div>
        <img src="images/blogindex/frame2bottom.gif"  class="frame1bottom"/>
    </div>
    </s:form>

    <div class="blogframe2">
        <img src="images/blogindex/frame2top.gif"/>
        <h4><s:property value="%{getText('show.detail.info')}"/></h4>

        <div id="allclass">
            <div class="con">
                <div id="carousel_container">
                    <div id="left_scroll"></div>
                    <div id="carousel_inner">
                        <ul id="carousel_ul">
                            <s:iterator value="myShow.finishedTerms">
                                <li><a href="#"
                                        <%--onclick="LoadVideo(<s:property value='id'/>);"--%>
                                        >
                                    <table border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td class="td1"><s:property value="myShow.name"/></td>
                                        </tr>
                                        <tr>
                                            <td class="td2"><s:property value="myShow.owner.nickName"/></td>
                                        </tr>
                                        <tr>
                                            <td class="td3">
                                                <s:date name="startTime" format="%{getText('dateformat')}"/></td>
                                        </tr>
                                    </table>
                                </a></li>
                            </s:iterator>
                        </ul>
                    </div>
                    <div id="right_scroll"></div>
                </div>
            </div>
        </div>
        <img src="images/blogindex/frame2bottom.gif" class="frame1bottom"/>
    </div>

    <div class="blogframe2">
        <img src="images/blogindex/frame2top.gif"/>
        <h4><s:property value="%{getText('show.host.introduction')}"/></h4>
        <div style="display:inline;margin-left:15px; margin-bottom:5px;">
            <table width="96%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="introcon">
                       <p>
                            <s:a action="userBlog" target="_blank"><s:param name="user.id" value="myShow.owner.id"/><img src="<s:property value="myShow.owner.pic" />" height="56px" width="56px"
                                class="portraitImg" title="<s:property value="myShow.owner.nickName"/>" /></s:a>
                            <s:property value="myShow.owner.selfDescription" />
                       </p>
                    </td>
                </tr>
            </table>
        </div>
        <img src="images/blogindex/frame2bottom.gif"  class="frame1bottom"/>
    </div>

    <div class="blogframe2">
        <img src="images/blogindex/frame2top.gif"/>

        <div id="tabs10">
            <ul>
                <li class="tab_li" id="tab_1"><a href="###" id="regspry"><span>Member Focused</span></a></li>
                <li class="tab_li" id="tab_3"><a href="###" id="communicatespry"><span><s:property
                        value="%{getText('label.interaction')}"/></span></a></li>
                <li class="tab_li" id="tab_4"><a href="###" id="infospry"><span>Show Materials</span></a>
                </li>
            </ul>
        </div>

        <script type="text/javascript" >
            $(document).ready(function(){
                <%--loadRegMembers(<s:property value='course.id'/>,1);--%>
            });
            function loadRegMembers(courseId, pageNow){
                $.post('showRegMembers.html',{"course.id":courseId, "pagination.pageNow": pageNow}, function(data) {
                    $('#regMembersUl').append(data);
                });
            }
        </script>

        <div id="dynamicDiv">
            <div id="regpanel" class="tab_1_content">
               <ul id="regMembersUl"></ul>
               <%--<div class="img_page_scroll">--%>
                   <%--<span class="scroll_right" alt="下一页" title="下一页">下一页</span>--%>
                   <%--<span class="scroll_left" alt="上一页" title="上一页">上一页</span>--%>
                   <%--<span class="scroll_more"><s:property value="%{getText('others.more')}"/></span>--%>
               <%--</div>--%>
            </div>
            <div id="communicatepanel" class="tab_3_content"><img src="images/blogindex/QA.gif" width="60" height="60" style="float:left;"/>
                <h4 style="margin-top:30px; width:70%"><s:property value="%{getText('label.interaction.zone')}"/></h4>

                <div style="border-bottom:2px solid #666; width:100%; height:0px;"></div>
                <h5 style="margin-top:20px; border-bottom:1px dotted #999"><s:property
                        value="%{getText('label.newest.question')}"/></h5>

                <div class="toggles">
                    <s:iterator value="courseQuestions">
                        <dl>
                            <dt><strong><s:property
                        value="%{getText('label.question')}"/>：</strong><s:property value="description"/>
                                <a href="####"><s:property value="%{getText('label.answer')}"/>&gt;&gt;</a>
                            </dt>
                            <dd>
                                <input type="text" name="textfield" id="textfield" size="60"/>
                                <input type="submit" name="button2" id="button2"
                                       value="<s:property value="%{getText('label.submit.answer')}" />"
                                       class="btnsubmit"/>
                            </dd>
                        </dl>
                    </s:iterator>
                </div>
                <h5 style="margin-top:20px; border-bottom:1px dotted #999"><s:property
                        value="%{getText('label.question.answer')}"/></h5>

                <div class="toggles">
                    <dl>
                        <%--<dt><strong>question：</strong>你已听说烟草控制和世卫组织烟草控制框架公约，但它们是什么呢？</dt>--%>
                        <dd>
                            <%--<strong>answer：</strong>烟草控制是指一系列综合措施以保护人们免受烟草消费和二手烟草烟雾的影响。烟草消费是目前造成可预防死亡的首要原因，每年导致近600万人过早死亡，其中500多万人使用烟草或曾使用烟草，60多万人是接触二手烟的非吸烟者。如果目前的趋势持续下去，到2030年，每年死亡人数将增至800万人。--%>
                            <table width="96%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
                                <tr>
                                    <td width="250">&nbsp;</td>
                                    <td class="answerpeople"><s:property value="%{getText('label.replier')}"/>：易中天</td>
                                    <td class="answertime"><s:property
                                            value="%{getText('label.repley.time')}"/>：2011-08-08
                                    </td>
                                </tr>
                            </table>

                        </dd>
                    </dl>

                </div>

                <h5 style="margin-top:20px; border-bottom:1px dotted #999"><s:property
                        value="%{getText('label.ask.questions')}"/></h5>

                <div class="toggles">
                    <s:form action="saveQuestion" method="POST"  onsubmit="return validateLogo()" >
                        <s:hidden name="course.id"/>
                        <p>
                            <textarea name="courseQuestion.description" cols="60" rows="3"></textarea>
                        </p>

                        <p>
                            <s:submit name="" value="%{getText('label.submit.question')}"/>
                        </p>
                    </s:form>

                </div>
            </div>
            <div id="courseResourceAjax" class="tab_4_content" style="width:650px;overflow:hidden;">
                <div id="infopanel" style="width:670px;">

                    <dl>
                        <dt class="dt2"><s:property value="%{getText('show.material.upload')}"/></dt>
                        <dd>
                            <s:form action="saveCourseResource" id="resourceForm" name="resourceForm"
                                    enctype="multipart/form-data"
                                    method="post" target="hidden_frame"  onsubmit="return validateLogo()">
                                <s:hidden name="course.id"/>
                                <table border="0" cellspacing="0" cellpadding="0" width="90%">
                                    <tr>
                                        <td class="filefield"><s:property value="%{getText('label.resourse.path')}"/>：
                                            <label for="fileField"></label>
                                            <s:file name="download" id="fileField"/></td>
                                    </tr>
                                    <tr>
                                        <td class="infointro"><strong><s:property
                                                value="%{getText('label.add.resourse.intr')}"/>：</strong></td>
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
                                            <s:submit id="saveCourseResource"
                                                      value="%{getText('label.upresourse.infor')}"/></td>
                                    </tr>
                                </table>
                                <iframe name='hidden_frame' id="hidden_frame" style="display: none;"></iframe>
                            </s:form>


                        </dd>
                    </dl>

                    <dl>
                        <dt class="dt2"><s:property value="%{getText('show.material.list')}"/></dt>
                        <dd class="ddcurrent" id="resourceList">

                            <s:iterator value="courseResources">
                                <table border="0" cellspacing="0" cellpadding="0" class="infolist">
                                    <tr>
                                        <td rowspan="2" class="infotitle"><a
                                                href="download.html?courseResource.id=<s:property value="id"/>"><s:property
                                                value="sourceTitle"/></a></td>
                                        <td class="infopeople"><s:property
                                                value="%{getText('label.uploader')}"/>：<s:property
                                                value="provider.userName"/></td>
                                        <td class="uploadtime"><s:property
                                                value="%{getText('label.updatetime')}"/>：<s:date name="provideTime" format="%{getText('global.display.datetime')}"/></td>
                                        <td class="uploadtime"><s:property
                                                value="%{getText('label.approved.time')}"/>：<s:date name="estimateTime" format="%{getText('global.display.datetime')}"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" class="infointro"><strong><s:property
                                                value="%{getText('label.resourse.intr')}"/>：</strong><s:property
                                                value="description"/></td>
                                    </tr>
                                </table>
                            </s:iterator>

                        </dd>
                    </dl>

                </div>
            </div>
        </div>
        <!--end of dynamicDiv -->

        <img src="images/blogindex/frame2bottom.gif" class="frame1bottom"/>
    </div>

    <%-- 课程讨论区 --%>
    <div class="blogframe2 ubd_2">
        <img src="images/blogindex/frame2top.gif"/>
        <h4 style="width:300px;"><s:property value="%{getText('blog.message.board')}"/></h4> <p id="message_area_tip"></p>
        <div class="ubd_2_3">
            <div class="ubd_2_3_area">
                <s:hidden value="%{#session.userID}" id="hidSessionId"/>
                <s:form theme="css_xhtml" name="commentsForm" method="post" action="saveUserBlogComments" validate="true">
                    <s:hidden name="user.id"/>
                    <textarea id="message_textarea"></textarea>
                    <input type="button" id="message_submit_btn" value="<s:property value="%{getText('blog.comments.submit')}"/>" />
                </s:form>
            </div>
            <div id="ubd_2_3_list" class="ubd_2_3_list">
                <ul class="ul_out" id="message_list_ul">
                    <s:iterator value="showComments" status="idx">
                        <li class="li_out">
                            <ul class="ul_in">
                                <li class="li_1"><s:a action="userBlog" target="_blank"><s:param name="user.id" value="commenter.id"/><img src="<s:property value="commenter.pic"/>" class="portraitImg"/></s:a></li>
                                <li class="li_2"><s:a action="userBlog" target="_blank"><s:param name="user.id" value="commenter.id"/><s:property value="commenter.nickName"/></s:a></li>
                                <li class="li_3">
                                    <span class="span_1"><s:property value="content"/></span>
                                    <span class="span_2"><s:date name="commentTime" format="%{getText('global.display.datetime')}"/></span>
                                    <s:if test="myShow.owner.id == #session.userID && commenter.id != #session.userID">
                                         <span class="span_3"><a onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:property value="%{getText('blog.comments.reply')}"/></a></span>
                                         <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)"><s:property value="%{getText('blog.comments.delete')}"/></a></span>
                                    </s:if>
                                    <s:elseif test="myShow.owner.id != #session.userID && commenter.id != #session.userID">
                                          <span class="span_3"><a onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:property value="%{getText('blog.comments.reply')}"/></a></span>
                                    </s:elseif>
                                    <s:else>
                                          <span class="span_3"><a onclick="deleteThisComment(this,<s:property value="id"/>)"><s:property value="%{getText('blog.comments.delete')}"/></a></span>
                                    </s:else>
                                </li>
                            </ul>
                        </li>
                    </s:iterator>
                    <s:if test="commentsNum != 0">
                        <s:if test="!commentsNumOverflow">
                            <a  class="more_or_close" onclick="getMoreComments();"><s:property value="%{getText('blog.comments.more.result')}"/>&gt;&gt;</a>
                        </s:if>
                        <s:elseif test="commentsNumOverflow && commentsNum>=10">
                            <a class="more_or_close" onclick="rollBack();">&lt;&lt;<s:property value="%{getText('blog.comments.rollBack')}"/></a>
                        </s:elseif>
                    </s:if>
                    <script type="text/javascript">
                        function getMoreComments(){
                            $.post("moreComments.html",{'myShow.id':<s:property value="myShow.id"/>,'commentsNum':<s:property value="commentsNum"/>},function(data){
                                $("#message_list_ul").html(data);
                                setDefaultPortraitImage();
                            });
                        }

                        function rollBack(){
                            $.post("moreComments.html",{'myShow.id':<s:property value="myShow.id"/>,'commentsNum':0},function(data){
                                $("#message_list_ul").html(data);
                                setDefaultPortraitImage();
                            });
                        }
                    </script>
                </ul>

            </div>
        </div>
        <img src="images/blogindex/frame2bottom.gif" class="frame1bottom"/>
    </div>

    <div class="blogframe2" id="evaluatepanel">
        <img src="images/blogindex/frame2top.gif"/>
        <div id="ievaluate">
            <h4><s:property value="%{getText('show.evaluation.of.yours')}"/></h4>
            <table width="650px" border="0" cellspacing="0" cellpadding="0" style="float:left;">
                <tr>
                    <td class="commenttd1" align="right"><s:property value="%{getText('label.interest')}"/>：</td>
                    <td class="commenttd2">
                        <div id="rate_t" class="type2"></div>
                    </td>
                    <td class="commenttd3">
                        <div id="interest" class="pnl_t"></div>
                    </td>

                    <td rowspan="2" id="syntheticalMsg" class="commenttd5"></td>
                    <td rowspan="2" id="synthetical" class="commenttd4"></td>

                </tr>
                <tr>
                    <td class="commenttd1"><s:property value="%{getText('label.practivity')}"/>：</td>
                    <td class="commenttd2">
                        <div id="rate_t_2" class="type2"></div>
                    </td>
                    <td class="commenttd3">
                        <div id="available" class="pnl_t_2"></div>
                    </td>
                </tr>
                <tr>
                    <td class="commenttd1"><s:property value="%{getText('label.interactivity')}"/>：</td>
                    <td class="commenttd2">
                        <div id="rate_t_3" class="type2"></div>
                    </td>
                    <td class="commenttd3">
                        <div id="interaction" class="pnl_t_3"></div>
                    </td>
                    <td colspan="2" rowspan="2" id="msg" class="commenttd5"></td>
                </tr>
                <tr>
                    <td></td>
                    <td rowspan="4" align="right" cellpadding-top="5px" valign="middle" align="right">
                        <br/>
                        <input type="button" id="button" onclick="saveEvaluation(22);"
                               value="<s:property value="%{getText('label.evluate')}" />"/></td>
                </tr>
            </table>
        </div>
        <img src="images/blogindex/frame2bottom.gif" class="frame1bottom"/>
    </div>
    </div>

<div id="conright">

    <s:iterator value="advertisements" status="idx">
        <div class="blogframe3">
            <img src="images/blogindex/frame3top.gif"/>
            <a href="http://<s:property value="linkAddress"/>" target="_blank">
                 <img class="advertise_rent" src="<s:property value="adLogoUrl"/>" class="showImg"/>
            </a>
            <img src="images/blogindex/frame3bottom.gif" class="frame1bottom"/>
        </div>
    </s:iterator>
   <s:iterator value="courses">
        <div class="blogframe3">
            <img src="images/blogindex/frame3top.gif"/>
            <a href="voaCourseBlog.html?course.id=<s:property value="id"/>"  target="_blank">
                <img class="advertise_rent" src="<s:property value="logoUrl"/>" class="showImg"/>
            </a>
            <img src="images/blogindex/frame3bottom.gif" class="frame1bottom"/>
        </div>
   </s:iterator>

    <span><a href="showAdBidList.html?myShow.id=<s:property value="myShow.id"/>">个人秀广告投标</a></span>

</div>
</div>

<script type="text/javascript" src="js/jquery.rate.js"></script>
<script type="text/javascript">
    $("#rate_t").rate({
        selected:<s:property value="myShow.interest"/>,
        selectable:true,
        decimal:true,
        revert:true,
        fullStar:false,
        initCallBack:function(val, obj) {
            val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
            $(".pnl_t").html(val);
        },
        mouseOutCallBack:function(val, obj) {
            obj.getValue() < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
        },
        selectedCallBack:function(val, obj) {
            val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
        },
        clickCallBack:function(val, obj) {
            $(".pnl_t").html(val);
        }
    });

    $("#rate_t_2").rate({
        selected:<s:property value="myShow.available"/>,
        selectable:true,
        decimal:true,
        revert:true,
        fullStar:false,
        initCallBack:function(val, obj) {
            val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
            $(".pnl_t_2").html(val);
        },
        mouseOutCallBack:function(val, obj) {
            obj.getValue() < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
        },
        selectedCallBack:function(val, obj) {
            val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
        },
        clickCallBack:function(val, obj) {
            $(".pnl_t_2").html(val);
        }
    });
    $("#rate_t_3").rate({
        selected:<s:property value="myShow.interaction"/>,
        selectable:true,
        decimal:true,
        revert:true,
        fullStar:false,
        initCallBack:function(val, obj) {
            val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
            $(".pnl_t_3").html(val);
        },
        mouseOutCallBack:function(val, obj) {
            obj.getValue() < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
        },
        selectedCallBack:function(val, obj) {
            val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
        },
        clickCallBack:function(val, obj) {
            $(".pnl_t_3").html(val);
        }
    });

    $("#rate_t_5").rate({
        selected:<s:property value="myShow.synthetical"/>,
        selectable:false,
        decimal:true,
        revert:true,
        fullStar:false
    });

    <%--<s:if test="#session.userID != null">--%>
        <%--$(document).ready(function() {--%>
            <%--$.post('browsedCourse.html',{"courseId":<s:property value='course.id'/>});--%>
        <%--});--%>
    <%--</s:if>--%>

    function checkEmail(object){
        var content = $(object).attr('value');
        var reMail = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
        var emailContent = content.replace(/(^\s*)|(\s*$)/g, "");
        $("#recommendMsg").text("");

        if (!reMail.test(emailContent)) {
            $("#recommendMsg").text("<s:text name='course.email.input.error'/>");
            return false;
        }
        var mySession = "<s:property value="#session.email"/>";
        //alert(mySession+":"+emailContent);
        if (emailContent == mySession) {
            $("#recommendMsg").text("<s:text name='course.email.input.myself'/>");
            return false;
        }
        $(object).attr('value', emailContent);
        return true;
    }


    function checkCourseRecommend(){
        //alert($(document.getElementsByName("emails")).size());
        for(var i=0;i<$(document.getElementsByName("emails")).size();i++){
            var content = $($(document.getElementsByName("emails"))[i]).attr('value');
            //alert(content);
            var reMail = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
            var emailContent = content.replace(/(^\s*)|(\s*$)/g, "");
            $("#recommendMsg").text("");
            if(emailContent!=""){
                 if (!reMail.test(emailContent)) {
                    $("#recommendMsg").text("<s:text name='course.email.input.error'/>");
                    return false;
                 }
                  var mySession = "<s:property value="#session.email"/>";
                  if (emailContent == mySession) {
                       $("#recommendMsg").text("<s:text name='course.email.input.myself'/>");
                       return false;
                  }
            }else{
                  $("#recommendMsg").text("<s:text name='emailEmpty'/>");
                  return false;
            }
        }
        return true;
    }

    function replyToComment(nickName,userID){
        var prefixStr = "回复";
        $("#message_textarea").val(prefixStr+nickName+": ");
        $("#message_textarea").focus();
        $.post("putUserIDtoSession.html",{'user.id':userID},function(data){});
    }
    function deleteThisComment(obj,commentId){
        $(obj).parents("li.li_out").remove();
        $.post("deleteShowComment.html",{'showComment.id':commentId},function(data){});
    }

    function linkToNewPage(linkAddress){
        window.open( linkAddress, "newwindow ", "toolbar=no,menubar=no,scrollbars=no,resizable=no, location=no,status=no ");
    }
</script>
