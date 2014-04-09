<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/zhibi/zhibi.css" rel="stylesheet" type="text/css"/>
<link href="css/zhibi/transfer.css" rel="stylesheet" type="text/css"/>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="">
            <a href="myGGWAccount.html"><s:property value="%{getText('usermenu.item.zhibi.myAccount')}"/></a>
        </li>
        <li class="">
            <a href="#"><s:property value="%{getText('usermenu.item.zhibi.fulfilment')}"/></a>
        </li>
        <li class="stand_out">
            <a href="initTransfer.html"><s:property value="%{getText('usermenu.item.zhibi.change')}"/></a>
        </li>
        <li class="">
            <a href="initConsumption.html"><s:property value="%{getText('usermenu.item.zhibi.query')}"/></a>
        </li>
        <li class="">
            <a href="javascript:;"><s:property value="%{getText('usermenu.item.zhibi.to.cash')}"/></a>
        </li>
    </ul>
</div>

<div class="container">
    <s:form id="transfer_form" action="executeTransfer" validate="true" theme="css_xhtml" method="post">
        <div class="block">
            <h3><s:property value="%{getText('gogowise.zhibi.transfer.step1')}"/></h3>
            <table>
                <tr>
                    <td><s:property value="%{getText('gogowise.zhibi.transfer.receiver')}"/></td>
                    <td><s:textfield name="receiver.nickName" id="toName"/></td>
                    <td><s:property value="%{getText('gogowise.zhibi.transfer.receiver.nickName')}"/></td>
                </tr>
                <tr>
                    <td><s:property value="%{getText('gogowise.zhibi.transfer.account')}"/></td>
                    <td><s:textfield name="receiver.email" id="toEmail"/></td>
                    <td><s:property
                            value="%{getText('gogowise.zhibi.transfer.receiver.email')}"/>&nbsp;&nbsp;&nbsp;<span
                            class="tip_words" id="toEmail_tip"></span></td>
                </tr>
            </table>
        </div>
        <div class="block">
            <h3><s:property value="%{getText('gogowise.zhibi.transfer.step2')}"/></h3>
            <table>
                <tr>
                    <td><s:property value="%{getText('gogowise.zhibi.transfer.zhibi.type')}"/></td>
                    <td><s:property value="%{getText('label.zhibi.true')}"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td><s:property value="%{getText('gogowise.zhibi.transfer.total')}"/></td>
                    <td><s:textfield name="transferMoney" id="transferMoney"/></td>
                    <td><s:property value="%{getText('label.zhibi.true')}"/>&nbsp;&nbsp;&nbsp;<span class="tip_words"
                                                                                                    id="transferMoney_tip"></span>
                    </td>
                </tr>
                <tr>
                    <td><s:property value="%{getText('gogowise.zhibi.transfer.message')}"/></td>
                    <td><s:textfield name="transferMessage"/></td>
                    <td><s:property value="%{getText('gogowise.zhibi.transfer.tips')}"/></td>
                </tr>
            </table>
        </div>
        <div class="block">
            <h3><s:property value="%{getText('gogowise.zhibi.transfer.step3')}"/></h3>
            <table>
                <tr>
                    <td><s:property value="%{getText('gogowise.zhibi.transfer.payer.account')}"/></td>
                    <td><s:property value="#session.email"/></td>
                    <td></td>
                </tr>
            </table>
        </div>
        <div class="block">
            <h3><s:property value="%{getText('gogowise.zhibi.transfer.step4')}"/></h3>
            <table>
                <s:hidden name="confirmCode" id="transfer_confirmCode"/>
                <tr>
                    <td><s:property value="%{getText('gogowise.zhibi.transfer.confirmCode')}"/></td>
                    <td><s:textfield name="checkCode" id="confirmCode"/></td>
                    <td><input type="button"
                               value="<s:property value="%{getText('gogowise.zhibi.transfer.achieve.confirmCode')}"/>"
                               onclick="getConfirmCode();"/>&nbsp;&nbsp;&nbsp;<span class="tip_words"
                                                                                    id="confirmCode_tip"></span></td>
                </tr>
            </table>
        </div>
        <div class="confirm">
            <input type="submit" onclick="return checkTransferForm();"
                   value="<s:property value="%{getText('confirm.to.transfer')}"/>"/>
        </div>
    </s:form>
</div>

<script type="text/javascript">
    var confirmCode = "";


    function getConfirmCode() {

        $.post("getTransferConfirmCode.html", function (data) {
            $("#transfer_confirmCode").attr('value', data.confirmCode);
            confirmCode = $("#transfer_confirmCode").val().toLowerCase();
            $.fancybox({
                content: "<s:text name='gogowise.transfer.login.email.to.get.confirmCode'/>",
                onComplete: function () {
                    setTimeout("$.fancybox.close();", "3000")
                }
            });
        });
    }

    function checkTransferForm() {
        var b1 = checkNecessaryEmail($("#toEmail"), "toEmail_tip");
        var b2 = checkTransferPrice();
        var b3 = checkConfirmCode();
        var result = b1 && b2 && b3;
        return result;
    }

    function checkConfirmCode() {
        $("#confirmCode_tip").html();
        var inputConfirmCode = $("#confirmCode").toLowerCase();
        if (inputConfirmCode == "") {
            $("#confirmCode_tip").html("<s:text name='please.input.confirmCode'/>");
            return false;
        } else if (confirmCode != inputConfirmCode) {
            $("#confirmCode_tip").html("<s:text name='confirmCode.error'/>");
            return false;
        } else {
            return true;
        }
    }

    function checkNecessaryEmail(obj, tipSpanId) {
        var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
        var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
        if (email == "") {
            $("#" + tipSpanId).html("<s:text name='onlive.term.email.empty'/>");
            return false;
        }
        else if (!pattern.test(email)) {
            $("#" + tipSpanId).html("<s:text name='onlive.term.email.error'/>");
            return false;
        }
        return true;
    }
    function checkUnnecessaryEmail(obj, tipSpanId) {
        var email = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
        var pattern = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
        if (email != "" && !pattern.test(email)) {
            $("#" + tipSpanId).html("<s:text name='onlive.term.email.error'/>");
        }
    }
    function checkTransferPrice() {
        $("#transferMoney_tip").html("");
        var price = $("#transferMoney").val().replace(/(^\s*)|(\s*$)/g, "");
        var priceExp = /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
        if (price.length == 0) {
            $("#transferMoney_tip").html("金额不能为空");
            return false;
        } else if (!priceExp.test(price)) {
            $("#transferMoney_tip").html("请输入有效的金额");
            return false;
        } else {
            return true;
        }
    }
</script>