<%@ taglib prefix="s" uri="/struts-tags" %>
<link rel="stylesheet" href="/css/course/bootstrap.min.css">
<link rel="stylesheet" href="/css/course/gogowise.css">
<link rel="stylesheet" href="/css/virtualClassRoom/messenger.css">
<link rel="stylesheet" href="/css/virtualClassRoom/messenger-theme-future.css">
<link rel="stylesheet" href="/css/virtualClassRoom/skins/all.css">

<script src="/js/jquery-1.10.2.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/iscroll.js"></script>
<script src="/js/virtualClassRoom/messenger.min.js"></script>
<script src="/js/virtualClassRoom/icheck.min.js"></script>
<script src="/js/virtualClassRoom/Chart.min.js"></script>



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

    //绑定单击
    $("#studionList li a").bind("click",function(event){
        var id = $(this).parent().find("span").text();
        showControlBar(id,event.pageX,event.pageY);
    });

    $(".fileList li a").bind("click",function(event){
        $("#currentfile").find("img").remove();
        $("#currentfile").find("span").remove();
        $("#currentfile").find(".selectfileid").remove();
        $("#currentfile").append("<img src="+$(this).find('img').attr('src')+"></img>");
        $("#currentfile").append("<span>"+$(this).find('.filetext').text()+"</span>");
        $("#currentfile").append("<span style='display:none;' id='selectfileid'>"+$(this).find('.fileid').text()+"</span>");
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
        addOneStudent("Scan","/images/virtualClassRoom/portrait5.jpg","c1");
    });

    $("#btndeleteOneStudent").click(function() {
        deleteOneStudent("u2");
    });

    /**
     * 取回画笔
     * @return {[type]}
     */
    $("#btnGetPencil").click(function() {
        takePencil();
    });

    //设置画笔
    $("#btnSetPencil").click(function() {
        givePencil();
    });

    //获取麦克风
    $("#btnGetMic").click(function() {
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

    //发送
    $("#btnSendMsg").click(function(){
        ShowMessage($("#currentName").text(),$("#currentimgPath").text(),$("#txtContent").val(),0);
        $("#txtContent").val("");
        sendMessageTeacher($("#txtContent").val(),$("#currentUserId").text());
    });

    $("#btnreceivemessage").click(function(){
        ShowMessage("Scan","/images/virtualClassRoom/portrait5.jpg","^_^ test message.........^_^ test message.........^_^ test message.........",1);
    });

    $("#btnsendmessage").click(function(){
        ShowMessage("Scan","/images/virtualClassRoom/portrait5.jpg","^_^ test message.........^_^ test message.........^_^ test message.........",0);
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
        seletedQuestion();
    });

    $("#btnOpenFile").click(function(){
        showFile();
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

    //提交选择题目;
    $("#btnQuestionResult").click(function(){
        $("#resultView").show();
        $("#questionsList").hide();
        getQuestionResult(24,16,2);
    });

    $("#btnSelectFile").click(function(){

        selectFile(($("#selectfileid").text()));
        $('#fileModal').modal('hide');
    });

});

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);

function getGirlOjbect() {
    if (/msie/.test(navigator.userAgent.toLowerCase())) {
        return  document.getElementById("Girl");
    } else {
        return  document.getElementById("GirlEmbed");
    }
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

    getGirlOjbect().giveMIC(id);

    $("#btnControlBar").hide('200', function(){
        $("#btnControlBar").find('.userId').text("");
    });


}

function takeMIC()
{
    if(currentMIC == $("#btnControlBar").find('.userId').text())
    {
        var id = $("#btnControlBar").find('.userId').text();
        currentMIC = null;
        removestate(id);

        if(id == currentPencil)
            tabstate(id,3,false);

        getGirlOjbect().takeMIC(id);

        $("#btnControlBar").hide('200', function(){
            $("#btnControlBar").find('.userId').text("");
        });
    }
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

    getGirlOjbect().givePencil(id);

    $("#btnControlBar").hide('200', function(){
        $("#btnControlBar").find('.userId').text("");
    });
}

function takePencil()
{
    if(currentPencil == $("#btnControlBar").find('.userId').text())
    {
        var id = $("#btnControlBar").find('.userId').text();

        currentPencil = null;
        removestate(id);

        if(id == currentMIC)
            tabstate(id,2,false);

        getGirlOjbect().takePencil(id);
        $("#btnControlBar").hide('200', function(){
            $("#btnControlBar").find('.userId').text("");
        });
    }
}

function selectFile(id)
{
    getGirlOjbect().selectFile(id);
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

    getGirlOjbect().kickAway(id);

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

//添加一个学生到学生列表
function addOneStudent(name,imgpath,id,ismsg)
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

    $("#studionList li:contains('"+id+"')").bind("click",function(event){
        //var id = $(this).parent().find("span").text();
        showControlBar(id,event.pageX,event.pageY);
    });

    if(ismsg)
        alert("进入学生:"+name,"success");
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

    //$("input[name='selectQuestion']:checked").attr('checked',false);

    $("#questionsModal").modal('show');
    $("#questionsList").show();
    $("#resultView").hide();
}

function showFile()
{
    $("#currentfile").find("img").remove();
    $("#currentfile").find("span").remove();
    $("#currentfile").find(".selectfileid").remove();
    $('#fileModal').modal('show')
}

function showQuestionsStudio()
{
    $("#questionsStudioModal").modal('show');
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

function sendMessageTeacher(content,id)
{
    getGirlOjbect().sendMessageTeacher(content,id);
}

//提交选择的题
function seletedQuestion()
{
    if($('input[name="selectQuestion"]:checked').val() != undefined)
        getGirlOjbect().seletedQuestions($('input[name="selectQuestion"]:checked').val());
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

    .userId
    {
        display:none;
    }

    .fileid
    {
        display:none;
    }

    .questionid
    {
        display:none;
    }

    #stundioWrapper {
        position:  relative;
        left:0;
        width:100%;
        overflow:auto;
        z-index: 0;
    }

    #stundioWrapper ul
    {
        list-style:none;
        padding:0;
        margin:0;
        width:100%;
    }

    #chatWrapper {
        position:  relative;
        left:0;
        width:100%;
        overflow:auto;
    }

    #chatWrapper ul
    {
        list-style:none;
        padding:0;
        margin:0;
        width:100%;
    }

    #currentfile img
    {
        width: 46px;
        height: 46px;
    }

    #studionList { list-style-type: none; margin: 0; padding: 0; width: 385px; }
    #studionList li { margin: 3px 3px 3px 0; padding: 1px; float: left; width: 88px; height: 90px;  text-align: center; background-color: transparent;border-width: 0px;}

    .fileList { list-style-type: none; margin: 0; padding: 0; width: 550px; }
    .fileList li { margin: 3px 3px 3px 0; padding: 1px; float: left; width: 105px;   text-align: center; background-color: transparent;border-width: 0px;}

    .listanswer { list-style-type: none; margin: 0; padding: 0; width: 550px; margin-top: 5px;}
    .listanswer li { margin: 3px 3px 3px 0; padding: 1px; float: left; width: 95px;   text-align: center; background-color: transparent;border-width: 0px;}

</style>

<body>
<div class="btn-group" style="margin:5px;">
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
</div>

<span id="currentUserId" style="display: none"><s:property value="#session.userID" /></span>
<span id="currentName" style="display: none"><s:property value="#session.nickName" /></span>
<span id="currentimgPath" style="display: none"><s:property value="#session.userLogoUrl" /></span>


<div class="container">
    <div>
        <div class="thinline"></div>
        <div class="classSchoolinfo" style="text-align: center;">
            <ul class="list-inline">
                <li  class="classstatusbar">School Name:<s:property value="courseClass.course.organization.schoolName" /></li>
                <li  class="classstatusbar">Lecturers Name:<s:property value="courseClass.course.teacher.nickName" /></li>
                <li  class="classstatusbar">Course Name:<s:property value="courseClass.course.name" /></li>
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
            <param name="allowFullScreen" value="true" /> -->
        <!--[if !IE]>
        -->
        <!-- <object type="application/x-shockwave-flash" data="Teacher_1.swf" width="720" height="560">
            <param name="quality" value="high" />
            <param name="bgcolor" value="#000000" />
            <param name="allowScriptAccess" value="sameDomain" />
            <param name="allowFullScreen" value="true" />
        </object>
        <!--<![endif]-->
        <!-- </object> -->
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="720" height="560" name="Girl" id="Girl" wmode="transparent">
            <param name="movie" value="Teacher_1.swf" />
            <param name="quality" value="high" />
            <param name="wmode" value="transparent" />
            <param name="allowFullScreen" value="true" />
            <embed src="<s:property value="flashPatch" />" allowFullScreen="true" width="720" height="560" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" name="Girl" id="GirlEmbed"></embed>
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
                                <li class="ui-state-default">
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
                                </li>

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
                                <div  class="chatMessage">
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

                                <div class="clearfix"></div>

                                <!--right message-->
                                <div  class="chatMessage">
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

                                <div class="clearfix"></div>

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
<%----%>
<div class="modal fade" id="fileModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"><h1 class = "Subject24">Open File</h1></h4>

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
                    <li>
                        <a href="#filesysUploading" data-toggle="tab">
                            <span class="glyphicon glyphicon-cloud-upload" style="margin-right: 5px;"></span>
                            Uploading File
                        </a>
                    </li>
                </ul>
            </div>
            <div class="tab-content" style="text-align: center;">
                <div class="tab-pane active" id="filesysDocument">
                    <div class="container">
                        <div id="speechDraftPanle" class="fileList">
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_pdf.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid">http://google.com</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_docx.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_pptx.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_pdf.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_docx.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_xlsx.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_docx.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_pdf.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_pptx.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                        </div>
                    </div>
                </div>

                <div class="tab-pane" id="filesysVideo">
                    <div class="container">
                        <div id="videoPanle" class="fileList">
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_mpeg.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_mov.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="filesysQuestionbank">
                    <div class="container">
                        <div id="questionbankPanle" class="fileList">
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_text.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="fileItem">
                                        <img class="fileicon" src="gogowisestyle/image/icon_text.png"  />
                                        <p class="filetext">file name 1</p>
                                        <span class="fileid"></span>
                                    </div>
                                </a>
                            </li>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="filesysUploading">...</div>
            </div>
            <div class="modal-footer">
                <div class="pull-left" id="currentfile">

                </div>

                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btnSelectFile">Ok</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="questionsStudioModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"><h1 class = "Subject24">Questions</h1></h4>

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

<div class="modal fade" id="questionsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <h1 class = "Subject24">Questions</h1>
                </h4>

            </div>
            <div class="modal-body">
                <div id="questionsList">
                    <div class="questionsItem">
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
                    </div>
                </div>
                <div id="resultView" style="display: none;text-align: center;">
                    <canvas id="canvas" height="450" width="450"></canvas>
                    <br/>
                    <br/>
                    <ul class="list-inline">
                        <li><div class="ColorlumpRight"></div><span class="ColorlumpText">Right:24</span></li>
                        <li><div class="ColorlumpWrong"></div><span class="ColorlumpText">Wrong:16</span></li>
                        <li><div class="ColorlumpNoresponse"></div><span class="ColorlumpText">NoResponse:2</span></li>
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
