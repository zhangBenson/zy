function getGirlOjbect() {
    if ($.browser.msie) {
        return  document.getElementById("Girl");
    } else {
        return  document.getElementById("GirlEmbed");
    }
}

function getGirlOjbect1() {
    if ($.browser.msie) {
        return  document.getElementById("Girl1");
    } else {
        return  document.getElementById("GirlEmbed1");
    }
}

function getGirlOjbect2() {
    if ($.browser.msie) {
        return  document.getElementById("Girl2");
    } else {
        return  document.getElementById("GirlEmbed2");
    }
}

function setframe() {
    document.getElementById("messages").style.display = "";
}
function AddMessage(message) {
    message = message.replace(/\r/ig, "<br/>");
    message = message.replace(/\n/ig, "<br/>");
    var messageBox = window.frames["messages"].document.getElementById('messageList');
    messageBox.innerHTML += message + "<br>";
    messageBox.scrollTop = 999999;
}

function ClearMessage() {
    window.frames["messages"].document.body.innerHTML = "<br><br/>";
    window.frames["messages"].window.scroll(0, 999999);
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
