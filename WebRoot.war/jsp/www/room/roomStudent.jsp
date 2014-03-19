<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--<%@ include file="/js/virtualClass/virtualClass_js.jsp" %>--%>
<link rel="stylesheet" href="css/room/bootstrap.min.css">
<link rel="stylesheet" href="css/room/gogowise.css">
<link rel="stylesheet" href="css/room/messenger.css">
<link rel="stylesheet" href="css/room/messenger-theme-future.css">
<link rel="stylesheet" href="css/skins/all.css">

<%--<script src="js/room/bootstrap.min.js"></script>--%>
<script src="js/room/iscroll.js"></script>
<script src="js/room/messenger.min.js"></script>
<script src="js/room/icheck.min.js"></script>
<script src="js/room/Chart.min.js"></script>

<script type="text/javascript">
var stundioWrapper;
var chatWrapper;
var currentMIC = null;
var currentPencil = null;


$(document).ready(function() {
    stundioWrapper = new iScroll('stundioWrapper');
    chatWrapper = new iScroll('chatWrapper');

    $('input').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
    });

    $("body").keydown(function(e){
        var curKey = e.which;
        if(curKey == 13){
            $('#btnSendMsg').click();
        }
    });

    //绑定单击
    // $("#studionList li a").bind("click",function(event){
    //        			var id = $(this).parent().find("span").text();
    //        			showControlBar(id,event.pageX,event.pageY);
    //        		});

    $(".fileList li a").bind("click",function(event){
        $("#currentfile").find("img").remove();
        $("#currentfile").find("span").remove();
        $("#currentfile").append("<img src="+$(this).find('img').attr('src')+"></img>");
        $("#currentfile").append("<span>"+$(this).find('.filetext').text()+"</span>");

    });

    $(function () {
        $('#myTabFile a:last').tab('show')
    });
    $._messengerDefaults = {
        extraClasses: 'messenger-fixed messenger-theme-block messenger-on-top'
    }

    //$("#top").load("top.html");
    //$("#detailfooters").load("footers.html");

    $("#btnaddUser").click(function() {
        addOneStudent("Scan","gogowisestyle/image/portrait5.jpg","c1",1,1);
    });

    $("#btndeleteOneStudent").click(function() {
        deleteOneStudent("u2");
    });

    /**
     * 取回画笔
     * @return {[type]}
     */
    $("#btnGetPencil").click(function() {
        if(currentPencil == $("#btnControlBar").find('.userId').text())
            takePencil();
    });

    //设置画笔
    $("#btnSetPencil").click(function() {
        givePencil();
    });

    //获取麦克风
    $("#btnGetMic").click(function() {
        if(currentMIC == $("#btnControlBar").find('.userId').text())
            takeMIC();
    });

    //设置麦克风
    $("#btnSetMic").click(function() {
        giveMIC();
    });


    //踢出用户
    $("#btnKickuser").click(function() {
        kickUser();
    });




    $("#btnreceivemessage").click(function(){
        ShowMessage("Scan","gogowisestyle/image/portrait5.jpg","^_^ test message.........^_^ test message.........^_^ test message.........",1);
    });

    $("#btnsendmessage").click(function(){
        ShowMessage("Scan","gogowisestyle/image/portrait5.jpg","^_^ test message.........^_^ test message.........^_^ test message.........",0);
    });

    $("#btnask").click(function(event){
        studentAskSpeak("u2");
    });

    $("#btncancelask").click(function(event){
        cancelStudentSpeak("u2");
    });

    $("#btnCloseBar").click(function(event){
        $("#btnControlBar").hide('200', function() {
            $("#btnControlBar").find('.userId').text("");
        });
    });

    $("#btnEvent").click(function(event){

        if(currentMIC == "")
            alert(currentMIC);
        else if(currentMIC ==null)
            alert(currentMIC);
        else
            alert(currentMIC);
    });

    $("#btnEvent2").click(function(event){

        $("#studionList li a").bind("click",function(event){
            var id = $(this).parent().find("span").text();
            showControlBar(id,event.pageX,event.pageY);
        });
    });

    $("#btnEvent3").click(function(event){
        getGirlOjbect().askSpeak("1");
    });


    $("#btnSendMsg").click(function(){
        var str = $("#txtContent").val();
        $("#txtContent").val("");
        sendMessageStudent(str);
    });

    $("#btnOpenFile").click(function(){
        $('#fileModal').modal('show')
    });


    $("#btnOpenQuestions").click(function(){
        showQuestions();
    });

    $("#btnQuestionsStudio").click(function(){
        showQuestionsStudio();
    });

    //查看问题结果
    $("#btnQuestionResult").click(function(){

    });


    $("#btnQuestion").click(function(){
        if($('input[name="studentQuestion"]:checked').val() != undefined)
            setQuestionResult($('input[name="studentQuestion"]:checked').val());
        $("#questionsStudentModal").modal('hide');
    });

    //提交选择题目;
    $("#btnQuestionResult").click(function(){
        $("#resultView").show();
        $("#questionsList").hide();
        getQuestionResult(24,16,2);
    });

});

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
document.addEventListener('onload', function () { setTimeout(loaded, 200); }, false);

function getGirlOjbect() {
    if (/msie/.test(navigator.userAgent.toLowerCase())) {
        return  document.getElementById("Girl");
    } else {
        return  document.getElementById("GirlEmbed");
    }
}


function sendMessageStudent(content)
{
    getGirlOjbect().sendMessage(content);
}

/**
 * 生成图形结果
 * @param right 答对人数
 * @param wrong 答错人数
 * @param noresponse 没有应答
 */
function getQuestionResult(right,wrong,noresponse)
{
    var pieData = [
        {
            value: right,
            color:"#F38630"
        },
        {
            value : wrong,
            color : "#E0E4CC"
        },
        {
            value : noresponse,
            color : "#69D2E7"
        }

    ];

    var myPie = new Chart(document.getElementById("canvas").getContext("2d")).Pie(pieData);
}

function setQuestionResult(result)
{
    $.ajax({
        type: 'POST',
        url: "saveQuestionResult.html",
        data:{"questionId":$("#currentQuestionId").text(),"userId":<s:property value="#session.userID"/>,"questionItemIndex":result,"courseClassId":<s:property value="courseClass.id"/>},
        dataType:"json",
        success: function(data)
        {
            //alert("success");
            getGirlOjbect().submitAnswer();
        },
        error:function(){
            //alert("error....");
        }
    });
}

function giveMIC()
{
    if(currentMIC != null)
    {
        removestate(currentMIC);
        if(currentMIC == currentPencil)
            tabstate(currentMIC,3,false);
        currentMIC = null;
    }

    var id = $("#btnControlBar").find('.userId').text();
    currentMIC = id;

    if(id == currentPencil)
        tabstate(id,4,false);
    else
        tabstate(id,2,false);

    $("#btnControlBar").hide('200', function(){
        $("#btnControlBar").find('.userId').text("");
    });
}

function takeMIC()
{
    var id = $("#btnControlBar").find('.userId').text();
    currentMIC = null;
    removestate(id);

    if(id == currentPencil)
        tabstate(id,3,false);

    $("#btnControlBar").hide('200', function(){
        $("#btnControlBar").find('.userId').text("");
    });
}

function givePencil()
{
    if(currentPencil != null)
    {
        removestate(currentPencil);

        if(currentPencil == currentMIC)
            tabstate(currentPencil,2,false);

        currentPencil = null;
    }

    var id = $("#btnControlBar").find('.userId').text();
    currentPencil = id;

    if(id == currentMIC)
        tabstate(id,4,false);
    else
        tabstate(id,3,false);



    $("#btnControlBar").hide('200', function(){
        $("#btnControlBar").find('.userId').text("");
    });
}

function takePencil()
{
    var id = $("#btnControlBar").find('.userId').text();

    currentPencil = null;
    removestate(id);

    if(id == currentMIC)
        tabstate(id,2,false);

    $("#btnControlBar").hide('200', function(){
        $("#btnControlBar").find('.userId').text("");
    });
}

function kickUser()
{
    var id = $("#btnControlBar").find('.userId').text();

    if(currentMIC != null)
    {
        removestate(currentMIC);
        currentMIC = null;
    }

    if(currentPencil != null)
    {
        removestate(currentPencil);
        currentPencil = null;
    }

    deleteOneStudent(id);
    $("#btnControlBar").hide('400', function(){
        $("#btnControlBar").find('.userId').text("");
    });
}

//学生发言
function studentAskSpeak(id)
{
    tabstate(id,1,true);
    studioSortUp(id);
}

//学生取消发言
function cancelStudentSpeak(id)
{
    removestate(id);
}

//根据id显示用户控制面板,x,y为显示位置
function showControlBar(id,x,y)
{
    if($("#btnControlBar").css("display") != "none")
        $("#btnControlBar").css("display","none");


    $("#btnControlBar").css("position","absolute");
    $("#btnControlBar").css("left",x-500+"px");
    $("#btnControlBar").css("top",y + 30 + "px");
    $("#btnControlBar").show(200);
    $("#btnControlBar").find(".userId").text(id);
}

//控制面板动作 1.给与mic 2.取回mic 3.给与画笔 4.取回画笔 5.踢出教室
function controlAction(actioncode)
{
    var id = $("#btnControlBar").find('.userId').text();
    switch(actioncode)
    {
        case 1:
            tabstate(id,3,false);
            break;
        case 2:
            removestate(id);
            break;
        case 3:
            tabstate(id,4,false);
            break;
        case 4:
            removestate(id);
            break;
        case 5:
            deleteOneStudent(id);
            break;
    }

    $("#btnControlBar").hide('600', function(){
        $("#btnControlBar").find('.userId').text("");
    });
}

//重写提示消息
function alert(content,type)
{
    $.globalMessenger().post({
        message: content,
        type: type,
        showCloseButton: true
    });
}

function getQuestionInfo(id)
{


    $.ajax({
        type:"GET",
        url:"question.html",
        data:{"questionId":id},
        dataType:"json",
        success:function(data){
            $("#studentQuestionItem div").remove();
            $("#currentQuestionId").text(id);

            $("#studentQuestionItem").append("<div>"+
                    "<div class='questionsItemText'>"+data.vo["description"]+"</div>"+
                    "<span class='questionid'>"+data.vo["id"]+"</span>"+
                    "<div class='listanswer'></div>");
            var index =1;
            $.each(data.vo.items,function(key,info){
                $("#studentQuestionItem").find(".listanswer").append("<div style='margin-top:10px;'>"+
                        "<label class='answerItem'>"+
                    // "<p>"+info["itemname"]+"</p>"+
                        "<input type='radio' name='studentQuestion' value='"+index+"'>"+
                        "<span style='display:none;'>"+index+"</span>"+
                        "<span>"+info+"</span>"+
                        "</label>"+
                        "</div>");
                index++;
            });


            $('input').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        },
        error:function(){
            //alert("no data....");
        }
    });
}

//添加一个学生到学生列表
function addOneStudent(name,imgpath,id,ismsg,isMic)
{
    $("#studionList").prepend("<li class='ui-state-default' style='display:none;'>"+
            "<a href='#'><div class='studioPortraitPanel'>"+
            "<img src='"+imgpath+"'>"+
            "<p>"+name+"</p>"+
            "</div></a>"+
            "<span class='userId'>"+id+"</span></li>");

    $("#studionList li:contains('"+id+"')").fadeIn(800,function(){
        stundioWrapper.refresh();
    });

    // $("#studionList li:contains('"+id+"')").bind("click",function(event){
    //        			showControlBar(id,event.pageX,event.pageY);
    //        		});

    //if(ismsg)
        //alert("进入学生:"+name,"success");
}

//根据ID退出一个学生
function deleteOneStudent(id)
{
    $("#studionList li:contains('"+id+"')").fadeOut(800,function(){
        $("#studionList li:contains('"+id+"')").remove();
    });
    stundioWrapper.refresh();
}

//根据ID取消一个状态
function removestate(id)
{
    $("#studionList li:contains('"+id+"') img").removeClass();
}

function showQuestions()
{
    $("#questionsModal").modal('show');
    $("#questionsList").show();
    $("#resultView").hide();
}

function showFile()
{
    $('#fileModal').modal('show');
}

function showQuestionsStudio(id,isSubmit)
{
    getQuestionInfo(id);
    $("#questionsStudentModal").modal('show');

    if(isSubmit)
        $("#btnQuestion").removeAttr("disabled");
    else
        $("#btnQuestion").attr("disabled","disabled");

}

//根据ID，State状态值（1，2，3）设置状态，bit是否需要排序到最上.
function tabstate(id,state,bit)
{
    var _state;
    switch(state)
    {
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

    if(bit)
        studioSortUp(id);

    $("#studionList li:contains('"+id+"') img").addClass(_state).animate({borderWidth:"0"}).animate({borderWidth:"6"}).animate({borderWidth:"0"}).animate({borderWidth:"6"}).animate({borderWidth:"0"}).animate({borderWidth:"6"}).animate({borderWidth:"0"}).animate({borderWidth:"6"}).animate({borderWidth:"0"}).animate({borderWidth:"6"}).animate({borderWidth:"0"}).animate({borderWidth:"6"});
}

//根据ID排序到最上面
function studioSortUp(id)
{
    $("#studionList").prepend($("#studionList li:contains('"+id+"')"));
}

//显示学生信息 name 学生名字,imgpath头像路径,content内容,bit 1左边 0右边
function ShowMessage(name,imgpath,content,bit)
{
    if(content == "")
        return;


    var inithight = $("#charList").height();
    var isleft;
    if(bit)
        isleft = "pull-left";
    else
        isleft = "pull-right";

    var chatMessage = "<div class='chatMessage'>"+
            "<div class='"+isleft+"' style='width:70px;'>"+
            "<img class='chatPortraitImg' src='"+imgpath+"'  />"+
            "<div class='chatPortraitTitle'>"+name+"</div>"+
            "</div>"+
            "<div style='width: 290px;' class='"+isleft+"'>"+
            "<div class='chatContent'>"+content+"</div>"+
            "</div>"+
            "</div><div class='clearfix'></div>"

    $("#charList").append(chatMessage);

    chatWrapper.refresh();

    if(inithight<200)
        chatWrapper.scrollTo(0, $("#charList").height() - $("#chatWrapper").height(), 200, true);
    else
        chatWrapper.scrollTo(0, $("#charList").height() - inithight, 200, true);
}
</script>

<style type="text/css" media="all">
    .userId { display:none; }
    .fileid { display:none; }
    .questionid { display:none; }
    #stundioWrapper { position:  relative; left: 0; width: 100%; overflow:auto; z-index: 0; }
    #stundioWrapper ul { list-style:none; padding:0; margin:0; width: 100%; }
    #chatWrapper { position:  relative; left: 0; width: 100%; overflow:auto; }
    #chatWrapper ul { list-style:none; padding:0; margin:0; width: 100%; }
    #currentfile img { width: 46px; height: 46px; }
    #studionList { list-style-type: none; margin: 0; padding: 0; width: 385px; }
    #studionList li { margin: 3px 3px 3px 0; padding: 1px; float: left; width: 88px; height: 90px;  text-align: center; background-color: transparent;border-width: 0px;}
    .fileList { list-style-type: none; margin: 0; padding: 0; width: 550px; }
    .fileList li { margin: 3px 3px 3px 0; padding: 1px; float: left; width: 105px;   text-align: center; background-color: transparent;border-width: 0px;}
</style>

<%-- Initial js code of virtual room --%>
<script language="JavaScript" type="text/javascript">
    function CreateRoom() {
        var url = window.location.href;
        var urlarr = url.split("/");
        urlarr[urlarr.length - 1] = "";
        url = urlarr.join("/");
        getGirlOjbect().CreateRoomComplete("<s:property value='initSeesionString' escape='false' />", "");
    }
    function CloseBrowser(){
        getGirlOjbect().closeBrowser();
        /*window.location.href="closeBrowser.html?roleType=<s:property value='roleType'/>";*/
        //TODO: temperarily redirect to personal center
        window.location.href="personalCenter.html";
    }
    function InRoom(){
        getGirlOjbect().InRoomComplete("<s:property value='initSeesionString' escape='false' />", "");
    }
    function saveChatRecord(courseID, userID, msg){
        $.post("saveChatRecord.html",{'course.id':courseID,'user.id':userID,'courseComment.content':msg},function(data){});
    }
</script>

<%--
<div class="btn-group" style="margin:5px;">
    <button type="button" class="btn btn-success" id="btnaddUser">进入用户</button>
    <button type="button" class="btn btn-success" id="btndeleteOneStudent">退出用户</button>
    <button type="button" class="btn btn-success" id="btnreceivemessage">接收消息</button>
    <button type="button" class="btn btn-success" id="btnsendmessage">发送消息</button>
    <button type="button" class="btn btn-success" id="btnQuestionsStudio">收到试题</button>
    <button type="button" class="btn btn-success" id="btnask">学生提问</button>
    <button type="button" class="btn btn-success" id="btncancelask">取消提问</button>
    <button type="button" class="btn btn-success" id="btnEvent">事件测试1</button>
    <button type="button" class="btn btn-success" id="btnEvent2">事件测试2</button>
    <button type="button" class="btn btn-success" id="btnEvent3">事件测试3</button>
</div>
--%>

<span id="currentUserId" style="display: none"><s:property value="#session.userID" /></span>
<span id="currentName" style="display: none"><s:property value="#session.email" /></span>
<span id="currentUserName" style="display: none"><s:property value="#session.nickName" /></span>
<span id="currentimgPath" style="display: none"><s:property value="#session.userLogoUrl" /></span>
<span id="currentQuestionId" style="display: none"></span>

<%--<div id="top"></div>--%>

<div class="container">
<div class="thinline"></div>
<div class="classSchoolinfo" style="text-align: center;">
    <ul class="list-inline">
        <li  class="classstatusbar">School Name:<s:property value="courseClass.course.organization.schoolName" /></li>
        <li  class="classstatusbar">Lecturers Name:<s:property value="courseClass.course.teacher.nickName"/></li>
        <li  class="classstatusbar">Course Name:<s:property value="courseClass.course.name"/></li>
    </ul>
</div>

<div class="pull-left">
    <div class="classVedioPanel" >
        <!-- <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="720" height="560" id="Teacher_1">
        <param name="movie" value="Teacher_1.swf" />
        <param name="quality" value="high" />
        <param name="bgcolor" value="#000000" />
        <param name="allowScriptAccess" value="sameDomain" />
        <param name="wmode" value="transparent">
        <param name="allowFullScreen" value="true" />
        -->
        <!--[if !IE]>
        -->
        <!-- <object type="application/x-shockwave-flash" data="Teacher_1.swf" width="720" height="560">
        <param name="quality" value="high" />
        <param name="bgcolor" value="#000000" />
        <param name="allowScriptAccess" value="sameDomain" />
        <param name="allowFullScreen" value="true" />
    </object>
    <!--<![endif]-->
        <!-- </object>
        -->
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="720" height="560" name="Girl" id="Girl" wmode="transparent">
            <param name="movie" value="flash/Student_1.swf" />
            <param name="quality" value="high" />
            <param name="wmode" value="transparent" />
            <param name="allowFullScreen" value="true" />
            <embed src="flash/Student_1.swf" allowFullScreen="true" width="720" height="560" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" name="Girl" id="GirlEmbed"></embed>
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
                            <span class="glyphicon glyphicon-exclamation-sign" style="margin-right: 10px;"></span>
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
                                            <img src="gogowisestyle/image/bportrait7.jpg" alt="">
                                            <p class="t">name</p>
                                        </div>
                                    </a>
                                    <span class="userId">u1</span>
                                </li>
                                <li class="ui-state-default">
                                    <a href="#">
                                        <div class="studioPortraitPanel">
                                            <img src="gogowisestyle/image/bportrait6.jpg" alt="">
                                            <p>name</p>
                                        </div>
                                    </a>
                                    <span class="userId">u2</span>
                                </li>
                                <li class="ui-state-default">
                                    <a href="#">
                                        <div class="studioPortraitPanel">
                                            <img src="gogowisestyle/image/bportrait1.jpg" alt="">
                                            <p>Name</p>
                                        </div>
                                    </a>
                                    <span class="userId">u3</span>
                                </li>
                                <li class="ui-state-default">
                                    <a href="#">
                                        <div class="studioPortraitPanel">
                                            <img src="gogowisestyle/image/bportrait5.jpg" alt="">
                                            <p>Name</p>
                                        </div>
                                    </a>
                                    <span class="userId">u4</span>
                                </li>
                                <li class="ui-state-default">
                                    <a href="#">
                                        <div class="studioPortraitPanel">
                                            <img src="gogowisestyle/image/portrait1.jpg" alt="">
                                            <p>Name</p>
                                        </div>
                                    </a>
                                    <span class="userId">u5</span>
                                </li>
                                <li class="ui-state-default">
                                    <a href="#">
                                        <div class="studioPortraitPanel">
                                            <img src="gogowisestyle/image/portrait2.jpg" alt="">
                                            <p>Name</p>
                                        </div>
                                    </a>
                                    <span class="userId">u6</span>
                                </li>
                                <li class="ui-state-default">
                                    <a href="#">
                                        <div class="studioPortraitPanel">
                                            <img src="gogowisestyle/image/portrait3.jpg" alt="">
                                            <p>Name</p>
                                        </div>
                                    </a>
                                    <span class="userId">u7</span>
                                </li>
                                <li class="ui-state-default">
                                    <a href="#">
                                        <div class="studioPortraitPanel">
                                            <img src="gogowisestyle/image/portrait4.jpg" alt="">
                                            <p>Name</p>
                                        </div>
                                    </a>
                                    <span class="userId">u8</span>
                                </li>
                                <li class="ui-state-default">
                                    <a href="#">
                                        <div class="studioPortraitPanel">
                                            <img src="gogowisestyle/image/portrait4.jpg" alt="">
                                            <p>Name</p>
                                        </div>
                                    </a>
                                    <span class="userId">u9</span>
                                </li> -->

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
                                        <img class="chatPortraitImg" src="gogowisestyle/image/portrait2.jpg"  />
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
                                        <img class="chatPortraitImg" src="gogowisestyle/image/portrait2.jpg"  />
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

<%--<div id="detailfooters"></div>--%>

<div class="modal fade" id="questionsStudentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <h1 class = "Subject24">Questions</h1>
                </h4>

            </div>
            <div class="modal-body">
                <div id="studentQuestionItem">
                    <div>
                        <div class="questionsItemText">
                            1.Which two statements are correct if IGMP snooping is enabled on a Cisco WLC? (Choose two.)
                        </div>
                        <span class="questionid"></span>
                        <div class="listanswer">
                            <div style="margin-top: 5px;">
                                <label class="answerItem">
                                    <p>A</p>
                                    <input type="radio" name="questionid1">
								<span >
									The router IGMP table is updated with the IP address of the wireless clients as the last reporter.
								</span>
                                </label>
                            </div>

                            <div style="margin-top: 5px;">
                                <label class="answerItem">
                                    <p>B</p>
                                    <input type="radio" name="questionid1">
								<span>
									The IGMP packets from the wireless clients are forwarded to the router without modifications.
								</span>
                                </label>
                            </div>
                            <div style="margin-top: 5px;">
                                <label class="answerItem">
                                    <p>C</p>
                                    <input type="radio" name="questionid1">
								<span>
									The IGMP packets from the wireless clients are received at the Cisco WLC, which in turn generates a query for the client.
								</span>
                                </label>
                            </div>
                            <div style="margin-top: 5px;">
                                <label class="answerItem">
                                    <p>D</p>
                                    <input type="radio" name="questionid1">
								<span>
									The IGMP packets from the wireless clients are received at the WLC and are used to update the router via Cisco Group Management Protocol update from the Cisco WLC.
								</span>
                                </label>
                            </div>
                            <div style="margin-top: 5px;">
                                <label class="answerItem">
                                    <p>E</p>
                                    <input type="radio" name="questionid1">
								<span>
									The router IGMP table is updated with the IP address of the Cisco WLC as the last reporter.
								</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnQuestion">Ok</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

