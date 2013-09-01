<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link href="css/zhibi/zhibi.css" rel="stylesheet" type="text/css"/>
<link href="css/zhibi/transfer.css" rel="stylesheet" type="text/css"/>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="">
            <a href="myGGWAccount.html"><s:property value="%{getText('usermenu.item.zhibi.myAccount')}"/></a>
        </li>
        <li class="stand_out">
            <a href="#"><s:property value="%{getText('usermenu.item.zhibi.fulfilment')}"/></a>
        </li>
        <li class="">
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
    <s:form id="transfer_form" action="" validate="true" theme="css_xhtml" method="post">
            <div class="block">
               <h3>知元充值中心欢迎您</h3>
                <table>
                    <tr><td>充值账号：</td><td>hailinchl@yeah.net</td></tr>
                    <tr><td>充值类型：</td><td>知币 &nbsp;&nbsp;&nbsp;&nbsp;1 知币 =  1 元（人民币）</span> </td></tr>
                    <tr><td>充值数额：</td>
                        <td>
                            <%--<input type="radio" name="chargeAmount" value="30"/>  &nbsp; 30知币 &nbsp;--%>
                            <%--<input type="radio" name="chargeAmount" value="60"/>  &nbsp; 60知币 &nbsp;--%>
                            <%--<input type="radio" name="chargeAmount" value="120"/> &nbsp; 120知币 &nbsp;--%>
                            <%--<input type="radio" name="chargeAmount" value="-1"/>  &nbsp; 其他--%>
                            <s:radio list="#{'30':'30知币','60':'60知币','120':'120知币','-1':'其他'}" listKey="key" listValue="value" name="chargeAmount" cssClass="charge_amount" id="charge_amount" value="30"/>
                            <input type="text" name="chargeAmountOther" id="input_chargeAmount"/> &nbsp;知币    <span id="money_msg">请输入有效的数额，如：45</span>
                        </td>
                    </tr>
                    <tr><td>付款金额：</td><td><span id="finalMoney">30</span> &nbsp;&nbsp; 元 </td></tr>
                </table>
            </div>

            <div class="confirm">
                <input type="submit" onclick="return checkSubmit();" value="银行卡支付" />
            </div>
    </s:form>
</div>

<script type="text/javascript">
     $(document).ready(function(){
           $(".charge_amount").change(function(){
               if($(this).val() != -1) {
                   $("#finalMoney").html($(this).val());
               }else{
                   var input_chargeMoney = $("#input_chargeAmount").val();
                   if(input_chargeMoney.length==0)  input_chargeMoney = 0;
                   $("#finalMoney").html(input_chargeMoney);
               }

           });

          $("#input_chargeAmount").blur(function(){
                if(checkInput(this)){
                      $("#finalMoney").html($(this).val());
                }
          });




     });

          function checkSubmit(){
              return  checkInput($("#input_chargeAmount"));
          }

          function checkInput(obj){
                 var parten = /^[0-9]*[1-9][0-9]*$/;
                 var input_chargeMoney = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
                 if(input_chargeMoney.length==0) {
                     $("#money_msg").html("请输入充值金额");
                     return false;
                 }else if(!parten.test(input_chargeMoney)){
                     $("#money_msg").html("您输入的金额有误");
                     return false;
                 }
                 $("#money_msg").html("请输入有效的数额，如：45");
                 return true;
          }

</script>
