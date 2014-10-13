<%--<link href="css/orgLeague/orgLeague.css" rel="stylesheet" type="text/css"/>--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/orgLeague/<s:text name='orgleague.css.filename'/>" rel="stylesheet" type="text/css"/>
<style type="text/css">


    /*#orgLeagueDiv #orgCenterDiv {*/
    /*float: left;*/
    /*margin-top: 20px;*/
    /*margin-right: 40px;*/
    /*margin-bottom: 20px;*/
    /*margin-left: 40px;*/
    /*height: 425px;*/
    /*width: 844px;*/
    /*padding-top: 30px;*/
    /*padding-right: 55px;*/
    /*padding-left: 40px;*/
    /*position: relative;*/
    /*}*/

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
    //    var rule = "
    <s:text name='rule'/>";
    var rule = "<s:text name='orgleague.info.clause'/>";
    $(function () {
        $(".boxy").boxy({title: rule, closeable: true, modal: true});
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
            <p class="forthhead"><s:text name="orgleague.info.pleaseCofirm"/></p>

            <div class="fourthLeft">
                <ul>
                    <li>&nbsp;&nbsp;</li>
                    <li>&nbsp;&nbsp;</li>
                    <li class="leftAndRightHead">组织负责人姓名：<s:property value="org.responsiblePerson.userName"/></li>
                    <li>&nbsp;&nbsp;</li>
                    <li class="leftAndRightHead">
                        <s:text name="orgleague.info.orgName"/><s:property value="org.schoolName"/></li>
                    <li>&nbsp;&nbsp;</li>
                    <li class="leftAndRightHead"><s:text name="orgleague.info.contact"/><s:property value="org.responsiblePerson.telphone"/></li>
                </ul>
            </div>
            <div class="fourthMid">
                <ul>
                    <li class="leftAndRightHead">
                        <div class="imgWords"><s:text name="orgleague.info.orgLogo"/><br/><img
                                src="<s:property value="org.logoUrl"/> " width="111" height="89"
                                onerror="javascript:this.src='images/nopic.jpg'"></div>
                    </li>
                    <li class="leftAndRightHead">
                        <div class="imgWords"><s:text name="orgleague.info.cetification"/><br/><img
                                src="<s:property value="org.businessLicenseUrl"/> " width="111" height="89"
                                onerror="javascript:this.src='images/nopic.jpg'"></div>
                    </li>
                </ul>
            </div>
            <div class="backAndNext">
                    <%--<form action="" method="post">--%>
        <span class="beforeBN"><input name="" id="clauseCheck" type="checkbox" value=""/>
        <a href="<%=request.getContextPath()%>/jsp/gogowise/org/orgLeague/orgLeagueClause.html" class="boxy"><s:text name="orgleague.info.accept"/></a><br/>
        <span class="clauseCheckTip"><s:text name="orgleague.info.acceptClause"/></span></span>


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
                            <s:text name="orgleague.info.userMail"/>：
                            <font color="red"><s:property value="org.responsiblePerson.email"/></font>
                            <s:text name="orgleague.info.isConfirmed"/> :
                            <font color="red"><s:property value="%{getText('lable.yesno.'+org.confirmed)}"/></font>
                            <s:if test="#session.HIG_SEC_USER_EMAIL != null">
                                <s:hidden name="confirmCode"/>
                                <s:submit action="higSecConfirmOrg" key="orgleague.info.confirm"></s:submit>
                            </s:if>
                        </div>
                    </s:if>
                </div>
                    <%--</form>--%>
            </div>
            <ul class="orgStep">
                <li><s:text name="org.warmtip"/></li>
                    <%--<li><s:text name="orgleague.identity.confirm"/></li>--%>
                <li><s:text name="orgleague.info.fill"/></li>
                <li class="fourth"><s:text name="orgleague.info.submit"/></li>
            </ul>
        </div>
    </div>
</s:form>
