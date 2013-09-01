<%--<link href="css/orgLeague/orgLeague.css" rel="stylesheet" type="text/css"/>--%>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link href="css/orgLeague/<s:text name='orgleague.css.filename'/>" rel="stylesheet" type="text/css"/>
<style type="text/css">


    #orgLeagueDiv #orgCenterDiv {
        float: left;
        margin-top: 20px;
        margin-right: 40px;
        margin-bottom: 20px;
        margin-left: 40px;
        height: 425px;
        width: 844px;
        padding-top: 30px;
        padding-right: 55px;
        padding-left: 40px;
        position: relative;
    }

    .forthhead {
        width: 100%;
        float: left;
    }

    .boxy:hover {
        text-decoration: underline;
    }

    .clauseCheckTip {
        display: none;
        font-size: 12px;
        color: red;
        font-weight: lighter;
    }
</style>

<script type="text/javascript">
    //    var rule = "<s:text name='rule'/>";
    var rule = "<s:text name='orgleague.info.clause'/>";
    $(function () {
        $(".boxy").boxy({title:rule, closeable:true, modal:true});
    });

    $(document).ready(function () {
        $("#clauseCheck").click(function () {
            if ($(this).is(":checked")) {
                $(".clauseCheckTip").hide();
            } else {
                $(".clauseCheckTip").show();
            }
        });
    });

    function formCheck() {
        if ($("#clauseCheck").attr("checked")) {
            return true;
        } else {
            $(".clauseCheckTip").show();
            return false;
        }
    }
</script>

<s:form action="saveForthStep">
    <s:hidden name="org.id"/>
    <div id="orgLeagueDiv">
        <div id="orgCenterDiv">
            <p class="forthhead"><s:property value="%{getText('orgleague.info.pleaseCofirm')}"/></p>

            <div class="fourthLeft">
                <ul>
                    <li class="leftAndRightHead headTittle"><s:property value="%{getText('orgleague.info.orgInfo')}"/></li>
                    <li class="leftAndRightHead">
                        <s:property value="%{getText('orgleague.info.orgName')}"/>：<br/><s:property value="org.schoolName"/></li>
                    <li class="leftAndRightHead"><s:property
                            value="%{getText('orgleague.info.orgIntro')}"/>：<br/><s:property value="org.description"/>
                    </li>
                    <li class="leftAndRightHead"><s:property
                            value="%{getText('orgleague.info.accountName')}"/>：<br/><s:property
                            value="org.depositName"/></li>
                    <li class="leftAndRightHead"><s:property
                            value="%{getText('orgleague.info.accountNo')}"/>：<br/><s:property
                            value="org.depositBankAccount"/></li>
                    <li class="leftAndRightHead"><s:property value="%{getText('orgleague.info.orgSize')}"/>：<s:property
                            value="%{getText('org.label.membersize.'+org.memberSize)}"/></li>
                    <li class="leftAndRightHead">
                        <div class="imgWords"><s:property value="%{getText('orgleague.info.orgLogo')}"/>：<br/><img
                                src="<s:property value="org.logoUrl"/> " width="111" height="89"
                                onerror="javascript:this.src='images/nopic.jpg'"></div>
                            <%--<img src="images/orgLeague/testImg.png" width="111" height="89" alt="组织Logo" />--%>

                    </li>
                </ul>
            </div>
            <div class="fourthMid">
                <ul>
                    <li class="leftAndRightHead headTittle"><s:property
                            value="%{getText('orgleague.info.contactMethod')}"/></li>
                    <li class="leftAndRightHead"><s:property
                            value="%{getText('orgleague.info.officerName')}"/>：<br/><s:property
                            value="org.contactName"/></li>
                    <li class="leftAndRightHead"><s:property
                            value="%{getText('orgleague.info.mobile')}"/>：<br/><s:property value="org.cellPhone"/></li>
                    <li class="leftAndRightHead"><s:property
                            value="%{getText('orgleague.info.address')}"/>:<br/><s:property
                            value="org.businessAddress"/></li>
                    <li class="leftAndRightHead">
                        <div class="imgWords"><s:property value="%{getText('orgleague.info.cetification')}"/>：<br/><img
                                src="<s:property value="org.businessLicenseUrl"/> " width="111" height="89"
                                onerror="javascript:this.src='images/nopic.jpg'"></div>

                    </li>
                </ul>
            </div>
            <div class="fourthRight">
                <ul>
                    <li class="leftAndRightHead headTittle"><s:property
                            value="%{getText('orgleague.info.personInCharge')}"/></li>
                    <li class="leftAndRightHead"><s:property value="%{getText('orgleague.info.name')}"/>：<s:property
                            value="org.responsiblePerson.userName"/></li>
                    <li class="leftAndRightHead"><s:property value="%{getText('orgleague.info.birth')}"/>：<s:date
                            name="org.responsiblePerson.birthDay"
                            format="%{getText('global.display.date')}"/></li>
                    <li class="leftAndRightHead"><s:property value="%{getText('orgleague.info.id')}"/>：<s:property
                            value="org.responsiblePerson.cardId"/></li>
                    <li class="leftAndRightHead">
                        <div class="imgWords"><s:property value="%{getText('orgleague.info.id.card')}"/>：<br/><img
                                src="<s:property value="org.responsiblePerson.idCardUrl"/> " width="162" height="108"
                                onerror="javascript:this.src='images/nopic.jpg'"></div>

                    </li>
                </ul>
            </div>
            <div class="backAndNext">
                    <%--<form action="" method="post">--%>
        <span class="beforeBN"><input name="" id="clauseCheck" type="checkbox" value=""/>
        <a href="<%=request.getContextPath()%>/jsp/gogowise/org/orgLeague/orgLeagueClause.html" class="boxy"><s:property
                value="%{getText('orgleague.info.accept')}"/></a><br/>
        <span class="clauseCheckTip"><s:property value="%{getText('orgleague.info.acceptClause')}"/></span></span>


                <div class="nextAndBack">
                    <s:if test="confirmCode == null">
                        <a href="initThirdStep.html">
                            <div class="back"></div>
                        </a>
                        <s:a action="saveForthStep" onclick="return formCheck();">
                            <s:param name="org.id" value="org.id"/>
                            <div class="next"></div>
                        </s:a>
                    </s:if>
                    <s:if test="confirmCode != null">
                        <div style="height: 37px;width: 420px;float: right;display: block;margin-left: 400px;">
                            <s:property value="%{getText('orgleague.info.userMail')}"/>： <font color="red"><s:property
                                value="org.responsiblePerson.email"/></font><s:property
                                value="%{getText('orgleague.info.isConfirmed')}"/> :
                            <font color="red"><s:property
                                    value="%{getText('lable.yesno.'+org.confirmed)}"/></font>
                            <s:if test="#session.HIG_SEC_USER_EMAIL != null">
                            <s:hidden name="confirmCode"/>
                            <s:submit action="higSecConfirmOrg" key="orgleague.info.confirm" ></s:submit>
                            </s:if>
                        </div>
                    </s:if>
                </div>
                    <%--</form>--%>
            </div>
            <ul class="orgStep">
                <li><s:property value="%{getText('org.warmtip')}"/></li>
                <li><s:property value="%{getText('orgleague.identity.confirm')}"/></li>
                <li><s:property value="%{getText('orgleague.info.fill')}"/></li>
                <li class="fourth"><s:property value="%{getText('orgleague.info.submit')}"/></li>
            </ul>
        </div>
    </div>
</s:form>