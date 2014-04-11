﻿<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link rel="stylesheet" href="htm/Demo/FirstPage_Formal/gogowisestyle/css/bootstrap.min.css">
<link rel="stylesheet" href="htm/Demo/FirstPage_Formal/gogowisestyle/css/gogowise.css">
<link rel="stylesheet" href="htm/Demo/FirstPage_Formal/gogowisestyle/css/messenger.css">
<link rel="stylesheet" href="htm/Demo/FirstPage_Formal/gogowisestyle/css/messenger-theme-future.css">
<link rel="stylesheet" href="htm/Demo/FirstPage_Formal/gogowisestyle/skins/all.css">

<script src="htm/Demo/FirstPage_Formal/gogowisestyle/js/jquery-1.10.2.min.js"></script>
<script src="htm/Demo/FirstPage_Formal/gogowisestyle/js/bootstrap.min.js"></script>
<script src="htm/Demo/FirstPage_Formal/gogowisestyle/js/iscroll.js"></script>
<script src="htm/Demo/FirstPage_Formal/gogowisestyle/js/messenger.min.js"></script>
<script src="htm/Demo/FirstPage_Formal/gogowisestyle/js/icheck.min.js"></script>
<script src="htm/Demo/FirstPage_Formal/gogowisestyle/js/Chart.min.js"></script>

<script type="text/javascript">
var stundioWrapper;
var chatWrapper;
var currentMIC = null;
var currentPencil = null;

$(document).ready(function () {

    stundioWrapper = new iScroll('stundioWrapper');
    chatWrapper = new iScroll('chatWrapper');

    $('input').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
    });

    $("body").keydown(function () {
        if (event.keyCode == "13") {
            $('#btnSendMsg').click();
        }
    });

    //绑定单击
    $("#studionList li a").bind("click", function (event) {
        var id = $(this).parent().find("span").text();
        showControlBar(id, event.pageX, event.pageY);
    });

    // $(".fileList li a").bind("click",function(event){
    //        		$("#currentfile").find("img").remove();
    //        		$("#currentfile").find("span").remove();
    //        		$("#currentfile").find(".selectfileid").remove();
    //        		$("#currentfile").append("<img src="+$(this).find('img').attr('src')+"></img>");
    //        		$("#currentfile").append("<span>"+$(this).find('.filetext').text()+"</span>");
    //        		$("#currentfile").append("<span style='display:none;' id='selectfileid'>"+$(this).find('.fileid').text()+"</span>");
    //        	});


    $._messengerDefaults = {
        extraClasses: 'messenger-fixed messenger-theme-block messenger-on-top'
    }

    /*$("#top").load("top.htm");
     $("#detailfooters").load("footers.htm");*/

    $("#btnaddUser").click(function () {
        addOneStudent("Scan", "htm/Demo/FirstPage_Formal/gogowisestyle/image/portrait5.jpg", "c1", 0, 1);
    });

    $("#btndeleteOneStudent").click(function () {
        deleteOneStudent("u2");
    });

    /**
     * 取回画笔
     * @return {[type]}
     */
    $("#btnGetPencil").click(function () {
        takePencil();
    });

    //设置画笔
    $("#btnSetPencil").click(function () {
        givePencil();
    });

    //获取麦克风
    $("#btnGetMic").click(function () {
        takeMIC();
    });

    //设置麦克风
    $("#btnSetMic").click(function () {
        giveMIC();
    });


    //踢出用户
    $("#btnKickuser").click(function () {
        kickUser();
    });

    //发送
    $("#btnSendMsg").click(function () {
        //ShowMessage($("#currentName").text(),$("#currentimgPath").text(),$("#txtContent").val(),0);
        var str = $("#txtContent").val();
        $("#txtContent").val("");
        sendMessageTeacher(str);

    });

    $("#btnreceivemessage").click(function () {
        ShowMessage("Scan", "htm/Demo/FirstPage_Formal/gogowisestyle/image/portrait5.jpg", "^_^ test message.........^_^ test message.........^_^ test message.........", 1);
    });

    $("#btnsendmessage").click(function () {
        ShowMessage("Scan", "htm/Demo/FirstPage_Formal/gogowisestyle/image/portrait5.jpg", "^_^ test message.........^_^ test message.........^_^ test message.........", 0);
    });

    $("#btnask").click(function (event) {
        studentAskSpeak("u2");
    });

    $("#btncancelask").click(function (event) {
        cancelStudentSpeak("u2");
    });

    $("#btnCloseBar").click(function (event) {
        $("#btnControlBar").hide('200', function () {
            $("#btnControlBar").find('.userId').text("");
        });
    });

    $("#btnEvent").click(function (event) {
        //getGirlOjbect().playVideo("xxxx");
    });

    $("#btnEvent2").click(function (event) {
        $("#studionList li a").bind("click", function (event) {
            var id = $(this).parent().find("span").text();
            showControlBar(id, event.pageX, event.pageY);
        });
    });

    $("#btnEvent3").click(function (event) {
        getGirlOjbect().seletedQuestions(2);
    });

    $("#btnOpenFile").click(function () {
        showFile(2);
    });

    $("#btnOpenQuestions").click(function () {
        showQuestions();
    });

    $("#btnQuestionsStudio").click(function () {
        showQuestionsStudio();
    });

    //查看问题结果
    $("#btnQuestionResult").click(function () {

    });

    //提交选择题目;
    $("#btnQuestionResult").click(function () {
        $("#resultView").show();
        $("#questionsList").hide();
        getQuestionResult(24, 16, 2);
    });

    $("#btnSelectFile").click(function () {

        switch ($("#currentfile").find(".selectCategory").text()) {
            case "speech":
                $('#fileModal').modal('hide');
                seletedFile($("#currentfile").find(".selectfileid").text(), $("#currentfile").find(".selectfileNum").text());
                break;
            case "video":
                $('#fileModal').modal('hide');
                playVideo($("#currentfile").find(".selectVideoLink").text());
                $('#fileModal').modal('hide');
                break;
            case "question":
                getQuestionInfo();
                showQuestions();
                break;
        }
    });

    ////////////// 获取文件列表
    $('#myTabFile a[href="#filesysDocument"]').click(function () {
        getSpeechList();
    });

    $('#myTabFile a[href="#filesysVideo"]').click(function () {
        getVideoList();
    });

    $('#myTabFile a[href="#filesysQuestionbank"]').click(function () {
        getQuestionList();
    });
    //////////////

    $("#btnUploadquestion").click(function () {
        if ($('input[name=fileQuestion]').val() != "") {

        }
        else
            alert("no,select file");
    });


    $("#btnUploadspeech").click(function () {
        if ($('input[name=fileSpeech]').val() != "") {

        }
        else
            alert("no,select file");
    });

    $("#btnSubmitQuestions").click(function () {
        //alert($('input[name="selectQuestion"]:checked').val());
        seletedQuestions();
    });
});

//document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
//document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);

function getGirlOjbect() {
    if (/msie/.test(navigator.userAgent.toLowerCase())) {
        return  document.getElementById("Girl");
    } else {
        return  document.getElementById("GirlEmbed");
    }
}

function getSpeechList() {
    $("#speechDraftPanle li").remove();
    //Speech
    $.getJSON("htm/Demo/FirstPage_Formal/fileList.htm", function (data) {
        $.each(data, function (key, info) {
            var icon_path = "";

            switch (info["fileType"]) {
                case "doc":
                    icon_path = "htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_docx.png"
                    break;
                case "docx":
                    icon_path = "htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_docx.png"
                    break;
                case "pdf":
                    icon_path = "htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_pdf.png"
                    break;
                case "xls":
                    icon_path = "htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_xlsx.png"
                    break;
                case "xlsx":
                    icon_path = "htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_xlsx.png"
                    break;
                case "ppt":
                    icon_path = "htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_pptx.png"
                    break;
                case "ppt":
                    icon_path = "htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_pptx.png"
                    break;
            }

            $("#speechDraftPanle").append("<li><a href='#'>" +
                    "<div class='fileItem'>" +
                    "<img class='fileicon' src='" + icon_path + "' />" +
                    "<p class='fileName'>" + info["fileName"] + "</p>" +
                    "<span class='fileDirectory'>" + info["fileDirectory"] + "</span>" +
                    "<span class='category'>" + info["category"] + "</span>" +
                    "<span class='pageNum'>" + info["pageNum"] + "</span>" +
                    "</div></a></li>");
        });

        bindFileClick();
    });
}

function getVideoList() {
    $("#videoPanle li").remove();

    $.getJSON("htm/Demo/FirstPage_Formal/videoList.htm", function (data) {
        $.each(data, function (key, info) {
            var icon_path = "htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_mov.png";

            $("#videoPanle").append("<li><a href='#'>" +
                    "<div class='fileItem'>" +
                    "<img class='fileicon' src='" + icon_path + "' />" +
                    "<p class='fileName'>" + info["fileName"] + "</p>" +
                    "<span class='videolink'>" + info["videoLink"] + "</span>" +
                    "<span class='category'>" + info["category"] + "</span>" +
                    "</div></a></li>");
        });

        bindFileClick();
    });
}

function getQuestionList() {
    $("#questionbankPanle li").remove();
    $.getJSON("htm/Demo/FirstPage_Formal/questionList.htm", function (data) {

        $.each(data, function (key, info) {
            var icon_path = "htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_text.png";

            $("#questionbankPanle").append("<li><a href='#'>" +
                    "<div class='fileItem'>" +
                    "<img class='fileicon' src='" + icon_path + "' />" +
                    "<p class='fileName'>" + info["fileName"] + "</p>" +
                    "<span class='question'>" + info["questionID"] + "</span>" +
                    "<span class='category'>" + info["category"] + "</span>" +
                    "</div></a></li>");
        });

        bindFileClick();
    });
}


function getQuestionInfo() {
    $("#questionsList div").remove();

    $.ajax({
        type: "GET",
        url: "htm/Demo/FirstPage_Formal/questionInfo.htm",
        dataType: "json",
        success: function (data) {

            $.each(data, function (key, info) {
                $("#questionsList").append("<div class='questionsItem'>" +
                        "<label>" +
                        "<input type='radio' name='selectQuestion' value='" + info["questionID"] + "'>" +
                        "<span class='questionsItemText'>" + info["content"] + "</span>" +
                        "<span class='questionid'>" + info["questionID"] + "</span>" +
                        "</label>" +
                        "</div>");

            });

            $('input').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        },
        error: function () {
            alert("no data....");
        }
    });
}

function bindFileClick() {
    $(".fileList li a").bind("click", function (event) {
        $("#currentfile").find("img").remove();
        $("#currentfile").find("span").remove();
        $("#currentfile").find(".selectfileid").remove();
        $("#currentfile").find(".selectfileNum").remove();
        $("#currentfile").find(".selectVideoLink").remove();
        $("#currentfile").find(".selectQuestion").remove();
        $("#currentfile").find(".selectCategory").remove();
        $("#currentfile").append("<img src=" + $(this).find('img').attr('src') + "></img>");
        $("#currentfile").append("<span>" + $(this).find('.fileName').text() + "</span>");
        $("#currentfile").append("<span style='display:none;' class='selectfileid'>" + $(this).find('.fileDirectory').text() + "</span>");
        $("#currentfile").append("<span style='display:none;' class='selectfileNum'>" + $(this).find('.pageNum').text() + "</span>");
        $("#currentfile").append("<span style='display:none;' class='selectVideoLink'>" + $(this).find('.videolink').text() + "</span>");
        $("#currentfile").append("<span style='display:none;' class='selectQuestion'>" + $(this).find('.question').text() + "</span>");
        $("#currentfile").append("<span style='display:none;' class='selectCategory'>" + $(this).find('.category').text() + "</span>");
    });
}


/**
 * 生成图形结果
 * @param right 答对人数
 * @param wrong 答错人数
 * @param noresponse 没有应答
 */
function getQuestionResult(right, wrong, noresponse) {
    var pieData = [
        {
            value: right,
            color: "#F38630"
        },
        {
            value: wrong,
            color: "#E0E4CC"
        },
        {
            value: noresponse,
            color: "#69D2E7"
        }

    ];

    var myPie = new Chart(document.getElementById("canvas").getContext("2d")).Pie(pieData);
}

function giveMIC() {
    if (currentMIC != null) {
        removestate(currentMIC);
        if (currentMIC == currentPencil)
            tabstate(currentMIC, 3, false);
        currentMIC = null;
    }

    var id = $("#btnControlBar").find('.userId').text();
    currentMIC = id;

    if (id == currentPencil)
        tabstate(id, 4, false);
    else
        tabstate(id, 2, false);

    getGirlOjbect().giveMIC(id);

    $("#btnControlBar").hide('200', function () {
        $("#btnControlBar").find('.userId').text("");
    });


}

function takeMIC() {
    if (currentMIC == $("#btnControlBar").find('.userId').text()) {
        var id = $("#btnControlBar").find('.userId').text();
        currentMIC = null;
        removestate(id);

        if (id == currentPencil)
            tabstate(id, 3, false);

        getGirlOjbect().takeMIC(id);

        $("#btnControlBar").hide('200', function () {
            $("#btnControlBar").find('.userId').text("");
        });
    }
}

function givePencil() {
    if (currentPencil != null) {
        removestate(currentPencil);

        if (currentPencil == currentMIC)
            tabstate(currentPencil, 2, false);

        currentPencil = null;
    }

    var id = $("#btnControlBar").find('.userId').text();
    currentPencil = id;

    if (id == currentMIC)
        tabstate(id, 4, false);
    else
        tabstate(id, 3, false);

    getGirlOjbect().givePencil(id);

    $("#btnControlBar").hide('200', function () {
        $("#btnControlBar").find('.userId').text("");
    });
}

function takePencil() {
    if (currentPencil == $("#btnControlBar").find('.userId').text()) {
        var id = $("#btnControlBar").find('.userId').text();

        currentPencil = null;
        removestate(id);

        if (id == currentMIC)
            tabstate(id, 2, false);

        getGirlOjbect().takePencil(id);
        $("#btnControlBar").hide('200', function () {
            $("#btnControlBar").find('.userId').text("");
        });
    }
}


function kickUser() {
    var id = $("#btnControlBar").find('.userId').text();

    if (currentMIC != null) {
        removestate(currentMIC);
        currentMIC = null;
    }

    if (currentPencil != null) {
        removestate(currentPencil);
        currentPencil = null;
    }

    getGirlOjbect().kickAway(id);

    deleteOneStudent(id);
    $("#btnControlBar").hide('400', function () {
        $("#btnControlBar").find('.userId').text("");
    });

}

//学生发言
function studentAskSpeak(id) {
    tabstate(id, 1, true);
    studioSortUp(id);
}

//学生取消发言
function cancelStudentSpeak(id) {
    removestate(id);
}

//根据id显示用户控制面板,x,y为显示位置
function showControlBar(id, x, y) {
    if ($("#btnControlBar").css("display") != "none")
        $("#btnControlBar").css("display", "none");

    $("#btnControlBar").css("position", "absolute");
    $("#btnControlBar").css("left", x - 500 + "px");
    $("#btnControlBar").css("top", y + 30 + "px");
    $("#btnControlBar").show(200);
    $("#btnControlBar").find(".userId").text(id);
}

//控制面板动作 1.给与mic 2.取回mic 3.给与画笔 4.取回画笔 5.踢出教室
function controlAction(actioncode) {
    var id = $("#btnControlBar").find('.userId').text();
    switch (actioncode) {
        case 1:
            tabstate(id, 3, false);
            break;
        case 2:
            removestate(id);
            break;
        case 3:
            tabstate(id, 4, false);
            break;
        case 4:
            removestate(id);
            break;
        case 5:
            deleteOneStudent(id);
            break;
    }

    $("#btnControlBar").hide('600', function () {
        $("#btnControlBar").find('.userId').text("");
    });
}

//重写提示消息
function alert(content, type) {
    $.globalMessenger().post({
        message: content,
        type: type,
        showCloseButton: true
    });
}

//添加一个学生到学生列表
function addOneStudent(name, imgpath, id, ismsg, isMic) {
    $("#studionList").prepend("<li class='ui-state-default' style='display:none;'>" +
            "<a href='#'><div class='studioPortraitPanel'>" +
            "<img src='" + imgpath + "'>" +
            "<p>" + name + "</p>" +
            "</div></a>" +
            "<span class='userId'>" + id + "</span></li>");

    $("#studionList li:contains('" + id + "')").fadeIn(800, function () {
        stundioWrapper.refresh();
    });

    $("#studionList li:contains('" + id + "')").bind("click", function (event) {
        showControlBar(id, event.pageX, event.pageY);
    });

    if (ismsg)
        alert("进入学生:" + name, "success");
}

//根据ID退出一个学生
function deleteOneStudent(id) {
    $("#studionList li:contains('" + id + "')").fadeOut(800, function () {
        $("#studionList li:contains('" + id + "')").remove();
    });
    stundioWrapper.refresh();
}

//根据ID取消一个状态
function removestate(id) {
    $("#studionList li:contains('" + id + "') img").removeClass();
}

function showQuestions() {
    $("#questionsModal").modal('show');
    $("#questionsList").show();
    $("#resultView").hide();
}

function showFile(index) {
    $("#currentfile").find("img").remove();
    $("#currentfile").find("span").remove();
    $("#currentfile").find(".selectfileid").remove();
    $('#fileModal').modal('show');

    switch (index) {
        case 1:
            $('#myTabFile a[href="#filesysDocument"]').tab('show');
            getSpeechList();
            break;
        case 2:
            $('#myTabFile a[href="#filesysQuestionbank"]').tab('show');
            getQuestionList();
            break;
        case 3:

            $('#myTabFile a[href="#filesysVideo"]').tab('show');
            getVideoList();
            break;
    }


}

function showQuestionsStudio() {
    $("#questionsStudioModal").modal('show');
}

function playVideo(link) {
    getGirlOjbect().playYoutubeVideo(link);
}

//根据ID，State状态值（1，2，3）设置状态，bit是否需要排序到最上.
function tabstate(id, state, bit) {
    var _state;
    switch (state) {
        case 1:
            _state = "userState1";
            break;
        case 2:
            _state = "userState2";
            break;
        case 3:
            _state = "userState3";
            break;
        case 4:
            _state = "userState4";
            break;
        case 5:
            _state = "userState5";
            break;
    }

    if (bit)
        studioSortUp(id);

    $("#studionList li:contains('" + id + "') img").addClass(_state).animate({borderWidth: "0"}).animate({borderWidth: "6"}).animate({borderWidth: "0"}).animate({borderWidth: "6"}).animate({borderWidth: "0"}).animate({borderWidth: "6"}).animate({borderWidth: "0"}).animate({borderWidth: "6"}).animate({borderWidth: "0"}).animate({borderWidth: "6"}).animate({borderWidth: "0"}).animate({borderWidth: "6"});
}

//提交选择的题
function seletedQuestions() {
    if ($('input[name="selectQuestion"]:checked').val() != undefined)
        getGirlOjbect().seletedQuestions($('input[name="selectQuestion"]:checked').val());
}

function seletedFile(fileID, pageNum) {
    getGirlOjbect().seletedFile(fileID, pageNum);
}

//根据ID排序到最上面
function studioSortUp(id) {
    $("#studionList").prepend($("#studionList li:contains('" + id + "')"));
}

function sendMessageTeacher(content) {
    getGirlOjbect().sendMessage(content);
}


// function seletedQuestion()
// {
// 	if($('input[name="selectQuestion"]:checked').val() != undefined)
// 		getGirlOjbect().seletedQuestions($('input[name="selectQuestion"]:checked').val());
// }

//显示学生信息 name 学生名字,imgpath头像路径,content内容,bit 1左边 0右边
function ShowMessage(name, imgpath, content, bit) {
    if (content == "")
        return;

    var inithight = $("#charList").height();
    var isleft;
    if (bit)
        isleft = "pull-left";
    else
        isleft = "pull-right";

    var chatMessage = "<div class='chatMessage'>" +
            "<div class='" + isleft + "' style='width:70px;'>" +
            "<img class='chatPortraitImg' src='" + imgpath + "'  />" +
            "<div class='chatPortraitTitle'>" + name + "</div>" +
            "</div>" +
            "<div style='width: 290px;' class='" + isleft + "'>" +
            "<div class='chatContent'>" + content + "</div>" +
            "</div>" +
            "</div><div class='clearfix'></div>"

    $("#charList").append(chatMessage);

    chatWrapper.refresh();

    if (inithight < 200)
        chatWrapper.scrollTo(0, $("#charList").height() - $("#chatWrapper").height(), 200, true);
    else
        chatWrapper.scrollTo(0, $("#charList").height() - inithight, 200, true);
}


</script>

<style type="text/css" media="all">
    .userId {
        display: none;
    }

    .fileid {
        display: none;
    }

    .videolink {
        display: none;
    }

    .question {
        display: none;
    }

    .pageNum {
        display: none;
    }

    .fileDirectory {
        display: none;
    }

    .category {
        display: none;
    }

    .questionid {
        display: none;
    }

    #stundioWrapper {
        position: relative;
        left: 0;
        width: 100%;
        overflow: auto;
        z-index: 0;
    }

    #stundioWrapper ul {
        list-style: none;
        padding: 0;
        margin: 0;
        width: 100%;
    }

    #chatWrapper {
        position: relative;
        left: 0;
        width: 100%;
        overflow: auto;
    }

    #chatWrapper ul {
        list-style: none;
        padding: 0;
        margin: 0;
        width: 100%;
    }

    #currentfile img {
        width: 46px;
        height: 46px;
    }

    #studionList {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 385px;
    }

    #studionList li {
        margin: 3px 3px 3px 0;
        padding: 1px;
        float: left;
        width: 88px;
        height: 90px;
        text-align: center;
        background-color: transparent;
        border-width: 0px;
    }

    .fileList {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 550px;
    }

    .fileList li {
        margin: 3px 3px 3px 0;
        padding: 1px;
        float: left;
        width: 105px;
        text-align: center;
        background-color: transparent;
        border-width: 0px;
    }

    .listanswer {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 550px;
        margin-top: 5px;
    }

    .listanswer li {
        margin: 3px 3px 3px 0;
        padding: 1px;
        float: left;
        width: 95px;
        text-align: center;
        background-color: transparent;
        border-width: 0px;
    }
</style>

<div id="images"></div>
<!-- <div class="btn-group" style="margin:5px;">
<button type="button" class="btn btn-success" id="btnaddUser">进入用户</button>
<button type="button" class="btn btn-success" id="btndeleteOneStudent">退出用户</button>
<button type="button" class="btn btn-success" id="btnreceivemessage">接收消息</button>
<button type="button" class="btn btn-success" id="btnsendmessage">发送消息</button>
<button type="button" class="btn btn-success" id="btnOpenFile">打开文件</button>
<button type="button" class="btn btn-success" id="btnOpenQuestions">打开试题</button>
<button type="button" class="btn btn-success" id="btnQuestionsStudio">收到试题</button>
<button type="button" class="btn btn-success" id="btnask">学生提问</button>
<button type="button" class="btn btn-success" id="btncancelask">取消提问</button>
<button type="button" class="btn btn-success" id="btnEvent">事件测试1</button>
<button type="button" class="btn btn-success" id="btnEvent2">事件测试2</button>
<button type="button" class="btn btn-success" id="btnEvent3">事件测试3</button>
</div> -->

<span id="currentUserId" style="display: none">8F92FEFB-C5D5-B9AA-24BB-908DB20C2B7C</span>
<span id="currentName" style="display: none">shucan</span>
<span id="currentUserName" style="display: none">Scan</span>
<span id="currentimgPath" style="display: none">htm/Demo/FirstPage_Formal/gogowisestyle/image/portrait5.jpg</span>

<%--<div id="top"></div>--%>
<div class="container">
    <div>
        <div class="thinline"></div>
        <div class="classSchoolinfo" style="text-align: center;">
            <ul class="list-inline">
                <li class="classstatusbar">School Name: GoGoWise Guide Team</li>
                <li class="classstatusbar">Lecturers Name: GoGoWise Coach</li>
                <li class="classstatusbar">Course Name: Welcome to GoGoWise</li>
            </ul>
        </div>

        <div class="pull-left">
            <div class="classVedioPanel">
                <!-- <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="720" height="560" id="Teacher_1">
                <param name="movie" value="VC_Demo.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#000000" />
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="wmode" value="transparent">
                <param name="allowFullScreen" value="true" />
                -->
                <!--[if !IE]>
                -->
                <!-- <object type="application/x-shockwave-flash" data="VC_Demo.swf" width="720" height="560">
                <param name="quality" value="high" />
                <param name="bgcolor" value="#000000" />
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="true" />
            </object>
            <!--<![endif]-->
                <!-- </object>
                -->
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                        codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                        width="720" height="560" name="Girl" id="Girl" wmode="transparent">
                    <param name="movie" value="htm/Demo/FirstPage_Formal/VC_Demo.swf"/>
                    <param name="quality" value="high"/>
                    <param name="wmode" value="transparent"/>
                    <param name="allowFullScreen" value="true"/>
                    <embed src="htm/Demo/FirstPage_Formal/VC_Demo.swf" allowFullScreen="true" width="720" height="560"
                           quality="high"
                           pluginspage="http://www.macromedia.com/go/getflashplayer"
                           type="application/x-shockwave-flash" wmode="transparent" name="Girl" id="GirlEmbed"></embed>
                </object>
            </div>
        </div>

        <div class="pull-left">

            <div class="classBasePanel">
                <div id="studiowindow">
                    <div class="classPanleHead">
                        <div class="classPanleTitle">Student List</div>
                    </div>
                    <div class="classPanleBody">

                        <div id="btnControlBar" style="display: none;z-index: 1">
                            <div class="btn-group btn-group-sm" role="toolbar">
                                <button type="button" class="btn btn-success" id="btnSetMic">
                                    <span class="glyphicon glyphicon-headphones" style="margin-right: 10px;"></span>
                                    GIVEMIC
                                </button>
                                <button type="button" class="btn btn-success" id="btnGetMic">

                                    <span class="glyphicon glyphicon-ban-circle" style="margin-right: 10px;"></span>
                                    TAKEMIC
                                </button>
                                <button type="button" class="btn btn-success" id="btnSetPencil">
                                    <span class="glyphicon glyphicon-pencil" style="margin-right: 10px;"></span>
                                    GIVEPENCIL
                                </button>
                                <button type="button" class="btn btn-success" id="btnGetPencil">
                                    <span class="glyphicon glyphicon-ban-circle" style="margin-right: 10px;"></span>
                                    TAKEPENCIL
                                </button>
                                <button type="button" class="btn btn-success" id="btnKickuser">
                                    <span class="glyphicon glyphicon-exclamation-sign"
                                          style="margin-right: 10px;"></span>
                                    KICKAWAY
                                </button>
                                <button type="button" class="btn btn-success" id="btnCloseBar">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </button>
                            </div>

                            <span class="userId"></span>
                        </div>

                        <div id="stundioWrapper" style="width: 100%; height: 195px; overflow: auto;">
                            <ul>
                                <li>
                                    <ul id="studionList">
                                        <!-- <li class="ui-state-default">
                                            <a href="#">
                                                <div class="studioPortraitPanel">
                                                    <img src="htm/Demo/FirstPage_Formal/gogowisestyle/image/bportrait7.jpg" alt="">
                                                    <p>name</p>
                                                </div>
                                            </a>

                                            <span class="userId">u1</span>
                                        </li>
                                        <li class="ui-state-default">
                                            <a href="#">
                                                <div class="studioPortraitPanel">
                                                    <img src="htm/Demo/FirstPage_Formal/gogowisestyle/image/bportrait6.jpg" alt="">
                                                    <p>name</p>
                                                </div>
                                            </a>
                                            <span class="userId">u2</span>
                                        </li>
                                        <li class="ui-state-default">
                                            <a href="#">
                                                <div class="studioPortraitPanel">
                                                    <img src="htm/Demo/FirstPage_Formal/gogowisestyle/image/bportrait1.jpg" alt="">
                                                    <p>Name</p>
                                                </div>
                                            </a>
                                            <span class="userId">u3</span>
                                        </li>-->

                                    </ul>
                                    <div class="clearfix"></div>
                                </li>

                            </ul>
                        </div>

                    </div>
                </div>
                <br/>

                <div id="chatWindow">

                    <div class="classPanleHead">
                        <div class="classPanleTitle">Chat</div>
                    </div>

                    <div class="classPanleBody">
                        <div id="chatWrapper" style="width: 100%; height: 235px; overflow: auto;">
                            <ul>
                                <li>
                                    <div id="charList">
                                        <!--left message-->
                                        <!-- <div  class="chatMessage">
                                            <div class="pull-left" style="width:70px;">
                                                <img class="chatPortraitImg" src="htm/Demo/FirstPage_Formal/gogowisestyle/image/portrait2.jpg"  />
                                                <div class="chatPortraitTitle">Name</div>
                                            </div>
                                            <div style="width: 290px;" class="pull-left">
                                                <div class="chatContent">
                                                    I liked it becaug. hahaI liked it becaug. hahaI likedI liked it becaug. hahaI liked it becaug. hahaI liked it becaug. I liked it becaug. hahaI liked it becaug. hahaI liked it becaug.
                                                </div>
                                            </div>

                                        </div>
                                        <div class="clearfix"></div> -->

                                        <!--right message-->
                                        <!-- <div  class="chatMessage">
                                            <div class="pull-right" style="width:70px;">
                                                <img class="chatPortraitImg" src="htm/Demo/FirstPage_Formal/gogowisestyle/image/portrait2.jpg"  />
                                                <div class="chatPortraitTitle">Name</div>
                                            </div>
                                            <div style="width: 290px;" class="pull-right">
                                                <div class="chatContent">
                                                    I liked it becaug. hahaI liked it becaug. hahaI liked it becaug.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div> -->

                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            </ul>
                        </div>

                        <div class="splitLineGray"></div>

                        <div class="input-group" style="padding: 7px;">
                            <input type="text" class="form-control" id="txtContent">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" id="btnSendMsg">Send</button>
						</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<%--<div id="detailfooters"></div>--%>

<div class="modal fade" id="fileModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <h1 class="Subject24">Open File</h1>
                </h4>

            </div>
            <div class="modal-body">

                <ul class="nav nav-tabs" id="myTabFile">
                    <li class="active">
                        <a href="#filesysDocument" data-toggle="tab">
                            <span class="glyphicon glyphicon-list-alt" style="margin-right: 5px;"></span>
                            Speech Draft
                        </a>
                    </li>
                    <li>
                        <a href="#filesysVideo" data-toggle="tab">
                            <span class="glyphicon glyphicon-film" style="margin-right: 5px;"></span>
                            Video
                        </a>
                    </li>
                    <li>
                        <a href="#filesysQuestionbank" data-toggle="tab">
                            <span class="glyphicon glyphicon-list" style="margin-right: 5px;"></span>
                            QuestionBank
                        </a>
                    </li>
                    <!-- <li>
                        <a href="#filesysUploading" data-toggle="tab">
                            <span class="glyphicon glyphicon-cloud-upload" style="margin-right: 5px;"></span>
                            Uploading File
                        </a>
                    </li> -->
                </ul>
            </div>
            <div class="tab-content" style="text-align: center;" id="allfileList">
                <div class="tab-pane active" id="filesysDocument">
                    <div class="container">
                        <div id="speechDraftPanle" class="fileList">
                            <!-- <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_pdf.png"  />
                                        <p class="fileName">file name 1</p>
                                        <span class="fileDirectory">http://google.com</span>
                                        <span class="category">http://google.com</span>
                                        <span class="pageNum">http://google.com</span>
                                    </div>
                                </a>
                            </li>
                            -->
                        </div>
                    </div>
                    <div style="text-align: center;">
                        <input type="file" name="fileSpeech"
                               style="position:absolute; z-index:100; margin-left:-180px; font-size:35px;opacity:0;filter:alpha(opacity=0); margin-top:-5px;">
                        <span style="padding-right: 10px;color: red;">Or</span>
                        <button type="button" class="btn btn-success">Select a Local File</button>
                        <p class="help-block">doc,docx,pdf,xls,xlsx,ppt,pptx</p>
                        <button type="submit" class="btn btn-default" id="btnUploadspeech">Upload</button>
                    </div>
                </div>

                <div class="tab-pane" id="filesysVideo">
                    <div class="container">
                        <div id="videoPanle" class="fileList">
                            <!-- <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_mpeg.png"  />
                                        <p>file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li> -->
                        </div>
                    </div>

                    <div class="container">
                        <p style="padding-right: 10px;color: red;" class="text-left">Or</p>

                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-link"
                                                                  style="color: #999;"></span></span>
                            <input type="text" class="form-control" placeholder="Input A Link of Youtube File">
                        </div>
                        <div class="input-group input-group-sm" style="margin-top: 5px;margin-bottom: 5px;">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-file"
                                                                  style="color: #999;"></span></span>
                            <input type="text" class="form-control" placeholder="Input A Name for the Link">
                        </div>
                        <button type="button" class="btn btn-success btn-sm btn-block">Add Video</button>
                    </div>
                </div>
                <div class="tab-pane" id="filesysQuestionbank">
                    <div class="container">
                        <div id="questionbankPanle" class="fileList">
                            <!-- <li>
                            <a href="#">
                                <div class="fileItem">
                                    <img class="fileicon" src="htm/Demo/FirstPage_Formal/gogowisestyle/image/icon_text.png"  />
                                    <p class="filetext">file name 1</p>
                                    <span class="fileid"></span>
                                </div>
                            </a>
                        </li>
                        -->
                        </div>

                    </div>
                    <div style="text-align: center;">
                        <input type="file" name="fileQuestion"
                               style="position:absolute; z-index:100; margin-left:-180px; font-size:35px;opacity:0;filter:alpha(opacity=0); margin-top:-5px;">
                        <span style="padding-right: 10px;color: red;">Or</span>
                        <button type="button" class="btn btn-success">Select a Local File</button>
                        <p class="help-block">doc,docx,pdf</p>
                        <button type="submit" class="btn btn-default" id="btnUploadquestion">Upload</button>
                    </div>

                </div>
                <div class="tab-pane" id="filesysUploading">
                    <div class="container"></div>
                </div>

            </div>
            <div class="modal-footer">
                <div class="pull-left" id="currentfile"></div>

                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btnSelectFile">Ok</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="questionsStudioModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <h1 class="Subject24">Questions</h1>
                </h4>

            </div>
            <div class="modal-body">

                <div class="studioQuestionItem">
                    <div class="questionsItemText">
                        1.Which of these network devices primarily functions at the OSI Network layer (layer 3)?
                    </div>
                    <span class="questionid"></span>

                    <div class="listanswer">
                        <li>
                            <label class="answerItem">
                                <p>A</p>
                                <input type="radio" name="questionid1"></label>
                        </li>
                        <li>
                            <label class="answerItem">
                                <p>B</p>
                                <input type="radio" name="questionid1"></label>
                        </li>
                        <li>
                            <label class="answerItem">
                                <p>C</p>
                                <input type="radio" name="questionid1"></label>
                        </li>
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div class="studioQuestionItem">
                    <div class="questionsItemText">
                        2.Which of these network devices primarily functions at the OSI Network layer (layer 3)?
                    </div>
                    <span class="questionid"></span>

                    <div class="listanswer">
                        <li>
                            <label class="answerItem">
                                <p>A</p>
                                <input type="radio" name="questionid2"></label>
                        </li>
                        <li>
                            <label class="answerItem">
                                <p>B</p>
                                <input type="radio" name="questionid2"></label>
                        </li>
                        <li>
                            <label class="answerItem">
                                <p>C</p>
                                <input type="radio" name="questionid2"></label>
                        </li>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Ok</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="questionsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <h1 class="Subject24">Questions</h1>
                </h4>

            </div>
            <div class="modal-body">
                <div id="questionsList">
                    <!-- <div class="questionsItem">
                        <label>
                            <input type="radio" name="selectQuestion" value="1">
                            <span class="questionsItemText">Who invented IP and some related Internet protocols?</span>
                            <span class="questionid">1</span>
                        </label>
                    </div>

                    <div class="questionsItem">
                        <label>
                            <input type="radio" name="selectQuestion" value="2">
                            <span class="questionsItemText">The upper layers of the OSI model are, in correct order</span>
                            <span class="questionid">2</span>
                        </label>
                    </div>

                    <div class="questionsItem">
                        <label>
                            <input type="radio" name="selectQuestion" value="3">
                            <span class="questionsItemText">
                                Which of these network devices primarily functions at the OSI Network layer (layer 3)?
                            </span>
                            <span class="questionid">3</span>
                        </label>
                    </div> -->
                </div>
                <div id="resultView" style="display: none;text-align: center;">
                    <canvas id="canvas" height="450" width="450"></canvas>
                    <br/>
                    <br/>
                    <ul class="list-inline">
                        <li>
                            <div class="ColorlumpRight"></div>
                            <span class="ColorlumpText">Right:24</span>
                        </li>
                        <li>
                            <div class="ColorlumpWrong"></div>
                            <span class="ColorlumpText">Wrong:16</span>
                        </li>
                        <li>
                            <div class="ColorlumpNoresponse"></div>
                            <span class="ColorlumpText">NoResponse:2</span>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btnQuestionResult">Result View</button>
                <button type="button" class="btn btn-primary" id="btnSubmitQuestions">Ok</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

</body>
</html>