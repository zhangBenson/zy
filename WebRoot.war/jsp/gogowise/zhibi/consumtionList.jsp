<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link href="css/zhibi/zhibi.css" rel="stylesheet" type="text/css"/>
<link href="css/zhibi/consumption.css" rel="stylesheet" type="text/css"/>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="">
            <a href="myGGWAccount.html"><s:property value="%{getText('usermenu.item.zhibi.myAccount')}"/></a>
        </li>
        <li class="">
            <a href="#"><s:property value="%{getText('usermenu.item.zhibi.fulfilment')}"/></a>
        </li>
        <li class="">
            <a href="initTransfer.html"><s:property value="%{getText('usermenu.item.zhibi.change')}"/></a>
        </li>
        <li class="stand_out">
            <a href="initConsumption.html"><s:property value="%{getText('usermenu.item.zhibi.query')}"/></a>
        </li>
        <li class="">
            <a href="javascript:;"><s:property value="%{getText('usermenu.item.zhibi.to.cash')}"/></a>
        </li>
    </ul>
</div>

<div class="contents1">
    <%--<s:form action="findConsumption" method="POST">--%>
    <%--<div id="select">请输入查找时间：起--%>
    <%--<s:textfield name="beginDate" id="dateb" cssClass="date" readonly="true"/>--%>
    <%--&nbsp; 止： <s:textfield name="endDate" cssClass="date" readonly="true" id="datee"/>--%>
    <%--&nbsp;--%>
    <%--<s:submit value="查找"/>--%>
    <%--</div>--%>
    <%--</s:form>--%>
    <div class="toggle">

        <div id="mainss">
            <table>
                <tr>
                    <td class="tdleft"><s:property value="%{getText('consumption.order.time')}"/></td>
                    <td class="tdleft"><s:property value="%{getText('consumption.order.id')}"/></td>
                    <td class="tdleft"><s:property value="%{getText('consumption.order.details')}"/></td>
                    <td class="tdleft"><s:property value="%{getText('gogowise.zhibi.available.left')}"/></td>
                    <td class="tdleft"><s:property value="%{getText('consumption.order.curr.left.details')}"/></td>
                    <td class="tdleft"><s:property value="%{getText('consumption.order.curr.left')}"/></td>
                    <td class="tdleft"><s:property value="%{getText('consumption.order.use.description')}"/></td>
                    <td class="tdleft"></td>
                </tr>

                <s:iterator value="records" var="sp" status="st">
                    <tr>
                        <td class="tdleft"><s:date name="createTime" format="%{getText('global.display.date')}"/></td>
                        <td class="tdleft"><s:property value="consumptionOrder.orderId"/></td>
                        <td class="tdleft"><s:property value="availableBalanceCharge"/></td>
                        <td class="tdleft"><s:property value="availableBalance"/></td>
                        <td class="tdleft"><s:property value="balanceCharge"/></td>
                        <td class="tdleft"><s:property value="balance"/></td>
                        <td class="tdleft"><s:property value="%{getText(consumptionOrder.remarks)}"/></td>
                        <td class="tdlef">
                            <s:if test="consumptionOrder.state == 1">
                                <input type="button" value="确认"
                                       onclick="orderConfirm(<s:property value="consumptionOrder.id"/>);"/>
                            </s:if>
                        </td>

                    </tr>

                </s:iterator>
            </table>
            <tiles:insertTemplate template="../pagination.jsp">
                <tiles:putAttribute name="pagination" value="${pagination}"/>
            </tiles:insertTemplate>
        </div>

    </div>

</div>

<script type="text/javascript">
    function orderConfirm(orderID) {
        window.location.href = "orderConfirmForPurchase.html?consumptionOrder.id=" + orderID;

    }
</script>

