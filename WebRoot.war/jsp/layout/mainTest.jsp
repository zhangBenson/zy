<%@ page language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<html>
<head>
    <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
<script type="text/javascript">
          function unloadF () {
              alert(333);
          alert(location.href);
      }
//    document.body.onunload = unloadF;
</script>
</head>


<body onunload="unloadF" onload="unloadF">
<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var indexOfMessage = 0;
    var timeoutId;
    var messageString = "";
    var urlString = "";
    var Persider = false;
    var isManuallyScroll = false;
    var presenterId = 0;

    function doChangeUrlAjax() {
        if ($("#urlText")[0].value == '') return true;
        disableButton();
        messageString = "";
        presenterId = 0
        urlString = $("#urlText")[0].value;
        doAjaxWithTimeOut();
    }

    function doChangeUserAjax(id) {
        disableButton();
        urlString = "";
        messageString = "";
        this.presenterId = id;
        doAjaxWithTimeOut();
    }

    function doChagAeMessageAjax() {
        if ($('#messageBox')[0].value == '') return true;
        disableButton();
        messageString = $('#messageBox')[0].value;
        urlString = "";
        presenterId = 0
        $('#messageBox').attr('value', '');
        doAjaxWithTimeOut();
    }

    function enterHandlerUrl(event) {
        var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        if (keyCode == 13) {

            doChangeUrlAjax();
        }
    }

    function enterHandlerMsg(event) {
        var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        if (keyCode == 13) {
            doChagAeMessageAjax();
        }
    }

    function doAjax() {
        changeUrlWithoutReason(urlString);
        var a = Math.random();
        $.getJSON('doAjax.html', {groupId: <s:property value="groupId"/>, presenterId:presenterId ,url: urlString, message:messageString,  indexOfMessage: indexOfMessage,rand:a}, ajaxComplete);


    }

    function doAjaxWithTimeOut() {
        clearTimeout(timeoutId);
        clearInterval(intervalProcess);
        intervalProcess = setInterval(doAjaxWithInterval, 5000);
        timeoutId = window.setTimeout("doAjax()", 1000);

    }

    function ajaxComplete(jason) {
        var url = $(jason).attr("url");
        var users = $(jason).attr("users") ;
        var message = $(jason).attr("messages") ;
        indexOfMessage = jason.indexOfMessage;
        isPersider = jason.persider;
        changeURl(url);

        var nameString = ""
        for (var i = 0; i < users.length; i++) {
            nameString += "<div>" + users[i].name +
                          " <input type='button' id='cUser' name='cUser' onclick='doChangeUserAjax(" + users[i].id + ")' value='主持人'/> " +
                          "</div>";
        }
        $("#userList").html(nameString);

        var mesageString = "";
        for (var j = 0; j < message.length; j++) {
            mesageString += "<div>" + message[j].author.username + ":" + message[j].information + "</div>";

        }
        var messageListDiv = $("#messageList") ;
        messageListDiv.append(mesageString)
        if (!isManuallyScroll) messageListDiv.attr('scrollTop', messageListDiv.attr('scrollHeight'));
        enableButton();
    }

    function enableButton() {
        $("#messgeButton").removeAttr("disabled");
        $("#cUrl").removeAttr("disabled");
    }

    function disableButton() {
        $("#messgeButton").attr({"disabled":"disabled"});
        $("#cUrl").attr({"disabled":"disabled"});
    }

    function updateUser() {

    }

    function changeURl(url) {
        var urlBox = $('#urlText');
        var cUrl = $('#cUrl');
        if (isPersider) {
            urlBox.attr('disabled', false);
            cUrl.attr('disabled', false);
            if (urlBox.attr("value") == "")changeUrlWithoutReason(url);
        }
        else {
            urlBox.attr('disabled', true);
            cUrl.attr('disabled', true);
            changeUrlWithoutReason(url);
        }

    }
    function changeUrlWithoutReason(url) {
        var urlBox = $('#urlText');
        var iframeSrc = $('#iframe');
        if (iframeSrc.attr("src") != url && url != "") {
            var httpArray = url.split('//');
            if (httpArray.length == 0) return true;
            if (httpArray.length == 1 && httpArray[0] != 'http:' && httpArray[0] != 'https:') url = 'http://' + url;
            var urlArrsy = url.split('.');
            if (urlArrsy.length == 1 && url.split(':').length == 2) {
                url = url + '.com';
            }
            this.urlString = url;
            iframeSrc.attr("src", url);
            urlBox.attr("value", url);
        }
    }

    function doAjaxWithInterval() {
        messageString = "";
        urlString = "";
        doAjaxWithTimeOut();
    }
    doAjaxWithInterval();
    var intervalProcess = setInterval(doAjaxWithInterval, 5000);


</script>

<form id="form1" name="form1" method="post" action="">
    
    <table width="100%" height="100%" border="1" id="bigTable">



        <tr>
            <td width="85%" height="5%">
                <label>网站地址
                    <input id="urlText" name="textfield" type="text" size="100" onKeyPress="enterHandlerUrl(event);"
                           disabled="true"/>

                    <a href="http://localhost:7009">33333</a>
                    <a href="3333">111111111</a>
                    8888
                    <a href="9999"></a>
                </label>
                <label>
                    <input type="button" name="Submit" id="cUrl" onclick="doChangeUrlAjax()" value="提交"
                           disabled="true"/>
                </label>
            </td>
            <td width="15%" rowspan="2">
                <table height="100%">
                    <tr height="30%">
                        <td valign="top" >
                            <b>本组描述:</b> <br/>
                            <s:property value="group.comments"/>
                        </td>
                    </tr>
                    <hl></hl>
                    <tr height="30px">
                        <td>
                             <b>用户列表:</b>
                        </td>
                    </tr>
                    <tr>
                        <td id="userList" valign="top">

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="85%" size="1">
                <iframe id="iframe"  height="100%" width="100%"></iframe>
                <input type="hidden" id="srcHidden" value="http://www.google.cn">
            </td>
        </tr>

        <tr>
            <td height="100px" colspan="2">
                <div id="messageList" style="height:100px;overflow-y:scroll"
                     onmouseover="javascript:isManuallyScroll=true" onmouseout="javascript:isManuallyScroll=false">
                </div>
            </td>
        </tr>
        <tr>
            <td><label>发表意见
                <input name="message" id="messageBox" type="text" size="100" onKeyPress="enterHandlerMsg(event);"/>
            </label></td>
            <td><label>
                <input type="button" id="messgeButton" name="sumbitmessage" onclick="doChagAeMessageAjax()" value="发送"/>
            </label></td>
        </tr>
    </table>


</form>

<script type="text/javascript">
      var   mathString = /href\0*=\0*".+"/;
     var sHtml = $('#bigTable').html();

      sHtml.replace(mathString, "$$1" );
       var match = sHtml.match(mathString);
//      alert(match);
//    alert(sHtml);

      function unloadF () {
//          alert(location.href);
           alert(location.target);
//           alert(location.);
          
      }
    document.body.onunload = unloadF;

</script>


</body>
</html>


