<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript">
    var box;
    var box2;
    var box_title = "<s:text name="course.invite.friend"/>";
    var box2_title = "举报课程";
    var box_close = "<s:text name="button.close"/>";
    var emailRightful = false;
    var email_empty = "<s:text name="course.email.not.empty"/>";
    var email_format_wrong = "<s:text name="course.email.input.error"/>";
    var inviting_sent = "<s:text name="course.invite.sent"/>";
    var browser_tip1 = "<s:text name="course.invite.setting"/>";
    var browser_tip2 = "<s:text name="course.invite.success"/>";
    function checkInviteEmail(obj) {
        var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
        return checkEmail(email, "invite_email_msg");
    }
    function checkEmail(email, msg_span_id) {
        var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
        if (email.length == 0) {
            $("#" + msg_span_id).html(email_empty);
            return false;
        } else if (email.length != 0) {
            if (!pattern.test(email)) {
                $("#" + msg_span_id).html(email_format_wrong);
                return false;
            }
        }
        $("#" + msg_span_id).html("");
        return true;
    }
    function del_invite_student(obj) {
        $(obj).parent().remove();
    }
    function copyToClipboard() {
        var txt = $("#inviteFriendHref").text();
        if (window.clipboardData) {
            window.clipboardData.clearData();
            window.clipboardData.setData("Text", txt);
        } else if (navigator.userAgent.indexOf("Opera") != -1) {
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
            trans.setTransferData("text/unicode", str, copytext.length * 2);
            var clipid = Components.interfaces.nsIClipboard;
            if (!clip)
                return false;
            clip.setData(trans, null, clipid.kGlobalClipboard);
            Boxy.alert(browser_tip2)
        }
        box.hide();
    }
</script>