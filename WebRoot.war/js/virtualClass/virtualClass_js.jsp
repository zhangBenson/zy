<%@ taglib prefix="s" uri="struts-tags.tld" %>
<script type="text/javascript">
    var box;
    var box2;
    var box_title = "<s:text name="course.invite.friend"/>";
    var box2_title = "<s:text name="course.report.course"/>";
    var box_close = "<s:text name="button.close"/>";
    var emailRightful = false;
    var email_empty = "<s:text name="course.email.not.empty"/>";
    var email_format_wrong = "<s:text name="course.email.input.error"/>";
    var inviting_sent = "<s:text name="course.invite.sent"/>";
    var browser_tip1 = "<s:text name="course.invite.setting"/>";
    var browser_tip2 = "<s:text name="course.invite.success"/>";
    function checkInviteEmail(obj){
        var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
        return checkEmail(email,"invite_email_msg");
    }
    function checkEmail(email,msg_span_id){
        var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
        if(email.length == 0){
            $("#"+msg_span_id).html(email_empty);
            return false;
        }else if(email.length != 0 ){
            if(!pattern.test(email)){
                $("#"+msg_span_id).html(email_format_wrong);
                return false;
            }
        }
        $("#"+msg_span_id).html("");
        return true;
    }
    function del_invite_student(obj){
        $(obj).parent().remove();
    }
    function copyToClipboard() {
            var txt = $("#inviteFriendHref").text();
            if(window.clipboardData) {
                window.clipboardData.clearData();
                window.clipboardData.setData("Text", txt);
            } else if(navigator.userAgent.indexOf("Opera") != -1) {
                window.location = txt;
            } else if (window.netscape) {
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                } catch (e) {
                    Boxy.alert(browser_tip1);
                }
                var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
                if (!clip)
                    return;
                var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
                if (!trans)
                    return;
                trans.addDataFlavor('text/unicode');
                var str = new Object();
                var len = new Object();
                var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
                var copytext = txt;
                str.data = copytext;
                trans.setTransferData("text/unicode",str,copytext.length*2);
                var clipid = Components.interfaces.nsIClipboard;
                if (!clip)
                    return false;
                clip.setData(trans,null,clipid.kGlobalClipboard);
                Boxy.alert(browser_tip2)
            }
            box.hide();
    }
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
    function startInvite(){
        var comments = $("#invite_comments").val();
        var friendsEmails = "";
        var emails = $("input.emails");
        var emailRightful = true;
        for(var i=0;i<emails.size();i++){
              var email=emails[i];
              emailRightful = emailRightful&&checkEmail(email.value,"invite_email_msg");
              friendsEmails = friendsEmails +"&emails="+ $(email).attr('value');
        }
        if(!emailRightful) return;
       var url = "virtualRoomEmailInviteFriends.html";
       var postStr = "courseClass.id=<s:property value='courseClass.id'/>&user.id=<s:property value="#session.userID"/>&inviteMessage="+comments+friendsEmails;
       var ajax = InitAjax();
       ajax.open("POST", url, true);
       ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
       ajax.send(postStr);
       ajax.onreadystatechange = function() {
           if (ajax.readyState == 4) {
               Boxy.alert(inviting_sent);
               box.hide();
           }
       }
    }

    function inviteFriends(){
        if(validateLogo()){
            var emails = $("input.emails");
            var emailRightful = true;
            for(var i=0;i<emails.size();i++){
                  var email=emails[i];
                  emailRightful = emailRightful&&checkEmail(email.value,"invite_email_msg");
            }
            if(!emailRightful) return;
            var postStr = $("#emailForm_personalOnlive").serialize();
           //   alert(postStr);
            $.post("personalVirtualRoomEmailInviteFriends.html",postStr,function(data){

                   $("#inviteMessage").html("<s:text name="personal.term.invite.friend.success"/>");
                   window.setTimeout("closeFancybox()","1000");
            });
        }
    }

    function closeFancybox(){
         $.fancybox.close();
    }

    function saveChatRecord(courseID, userID, msg){
       $.post("saveChatRecord.html",{'course.id':courseID,'user.id':userID,'courseComment.content':msg},function(data){});
    }

    $(document).ready(function () {
        $("#invite_students").click(function() {
            box = new Boxy($("#invite_student_container"), {
                  modal: true,
                  title:box_title,
                  closeText:box_close
            });
        });

        $("#report_class").click(function(){
            box = new Boxy($("#report_class_container"), {
                  modal: true,
                  title:box2_title,
                  closeText:box_close
            });
        });

        $("#invite_add_email").click(function() {
            $("#invite_email_list").append("<span><input type='text' class='emails' onblur='checkInviteEmail(this);' name='emails'></textfield><label onclick='del_invite_student(this)' class='invite_del_email delete_btn'><s:text name="course.class.delete"/></label></span>");
        });
    });


</script>