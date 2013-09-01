/**
 * 本文档中的js是将对话框和操作按钮从Flash独立出来
 */

function getGirlOjbect() {
    if ($.browser.msie) {
        return  document.getElementById("Girl");
    } else {
        return  document.getElementById("GirlEmbed");
    }
}
function setframe() {
    document.getElementById("messageList").style.display = "";
}
function AddMessage(message) {
    var msg = message.replace(/\r|\n/ig, "<br/>");
    var messageBox = document.getElementById('messageList');
    messageBox.innerHTML += parseFaceMsg(msg) + "<br/>";
    messageBox.scrollTop = 999999;
}
function parseFaceMsg(message){
    var facePattern  = /\[face[\d]+\]/gi;
//    var faceCodeMatches = facePattern.exec(message);
    var faceCodeMatches = message.match(facePattern);
    if(!faceCodeMatches) return message;
    var tempMessage = message;
    for(var i=0; i<faceCodeMatches.length;i++){
        var facecode = faceCodeMatches[i];
        var indexPattern = /[\d]+/;
        var faceIndex = indexPattern.exec(facecode)[0];
        tempMessage = tempMessage.replace(facecode,"<img src='images/face/"+faceIndex+".gif'/>");
    }
    return tempMessage;
}

function ClearMessage() {
    var messageBox = document.getElementById('messageList');
//    messageBox.innerHTML = "<br><br/>";
    messageBox.innerHTML = "";
}
function CloseBrowser() {
    getGirlOjbect().closeBrowser();
    window.location.href = "closeBrowser.html";
}

function FreshBrowser() {
    window.location.reload();
}

function liveroom() {
    getGirlOjbect().LiveRoom();
}

function gotourl(url) {
    window.location.href = url;
}


function favorite(homeurl, webname) {
    if (document.all) {
        window.external.addFavorite(homeurl, webname);
    }
    else if (window.sidebar) {
        window.sidebar.addPanel(webname, homeurl, "");
    }

}
function liveinroom() {
    getGirlOjbect().LiveInRoom();
}
function GoURLFlashPlayer() {
    window.location.href = "http://get.adobe.com/cn/flashplayer/";
}
function ClosePrivateRoom() {
    history.back();
}
function floatMessageArea(){
    $("#messages").css("z-index","4");
}
function sinkMessageArea() {
    $("#messages").css("z-index","2");
}


//$(document).ready(function() {
//        getGirlOjbect().closeBrowser();
//});

function backCourseblog(id){
      window.location.href = "voaCourseBlog.html?course.id="+id;
}

function setCurrentID(userID,onLiveID){
    $.post("resetOnLiveCurrentID.html",{'channelTerms.id':onLiveID,'channelTerms.currentID':userID},function(data){});
}
