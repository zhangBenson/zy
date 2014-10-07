<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link type="text/css" href="css/solution/solution.css" rel="stylesheet"/>

<div id="solutionWrap">
    <div id="contentUp">
        <p class="TextSet"><s:text name="introduction.param1"/>
        </p>

        <p class="TextSet"><s:text name="introduction.param2"/>
        </p>
    </div>

    <div id="contentLeft">
        <p><a class="TextSet2" href="#MySupervisingRoom"><s:text name="contentLeft.param1"/></a></p>

        <ul>
            <li><a class="TextSet21" href="#homeUse"><s:text name="contentLeft.param4"/></a></li>
            <li><a class="TextSet21" href="#companyUse"><s:text name="contentLeft.param5"/></a></li>
        </ul>
        <div id="StartUse" class="StartUseIt"><a class="begin_live1 act_btn1"
                                                 href="openUserChannelResult.html"><s:property
                value="%{getText('contentLeft.param9')}"/></a></div>

        <%--<p><a class="TextSet2" href="#PublicMultipointLive"><s:text name="contentLeft.param2"/></a></p>--%>
        <%--<ul>--%>
        <%--<li><a class="TextSet21" href="#schoolTeachUse"><s:text name="contentLeft.param6"/></a></li>--%>
        <%--<li><a class="TextSet21" href="#schoolActivityUse"><s:text name="contentLeft.param7"/></a></li>--%>
        <%--<li><a class="TextSet21" href="#amuseUse"><s:text name="contentLeft.param8"/></a></li>--%>
        <%--</ul>--%>
        <%--<div  class="StartUseIt"><a class="begin_live1 act_btn1" href="openUserChannelResult.html"><s:text name="contentLeft.param9"/></a></div>--%>
    </div>

    <div id="contentRight">
        <div id="privateApply">
            <div id="privateApplyHeader" class="ApplyHeader">
                <div id="MySupervisingRoom" class="ApplyHeaderLeft"><s:property
                        value="%{getText('contentRight.privateApply.ApplyHeader.param1')}"/></div>

                <div class="ApplyHeaderCenter"></div>
            </div>

            <div id="homeUse" class="insideHeader">
                <div class="insideTitle">
                    <div class="headerUseUpLeft">1.<s:property
                            value="%{getText('contentRight.privateApply.homeUse.headerUseUpLeft.param1')}"/></div>
                </div>

                <div class="png1"><img src="images/solution/homeMonitoring.png" alt="title.solution.home.image"></div>
                <div class="TextSet3"><s:property
                        value="%{getText('contentRight.privateApply.homeUse.TextSet3.param1')}"/></div>

            </div>
            <div id="companyUse">
                <div class="insideTitle">
                    <div class="headerUseUpLeft">2.<s:property
                            value="%{getText('contentRight.privateApply.companyUse.headerUseUpLeft.param2')}"/></div>
                </div>

                <div class="png1"><img src="images/solution/companyMonitoring.png" alt="title.solution.company.image">
                </div>
                <div class="TextSet3"><s:property
                        value="%{getText('contentRight.privateApply.companyUse.TextSet3.param2')}"/></div>
                <div class="TextSet4"><s:property
                        value="%{getText('contentRight.privateApply.companyUse.TextSet4.param1')}"/>

                </div>
            </div>
        </div>
        <%--<div id="publicApply">--%>
        <%--<div id="publicApplyHeader" class="ApplyHeader">--%>
        <%--<div id="PublicMultipointLive" class="ApplyHeaderLeft"><s:property value = "%{getText('contentRight.publicApply.ApplyHeader.param1')}"/></div>--%>
        <%--<div class="ApplyHeaderCenter"></div>--%>
        <%--</div>--%>
        <%--<div id="schoolTeachUse">--%>
        <%--<div class="insideTitle">--%>
        <%--<div class="headerUseUpLeft">1.<s:property value = "%{getText('contentRight.publicApply.schoolTeachUse.headerUseUpLeft.param1')}"/></div>--%>
        <%--</div>--%>
        <%--<div class="png1"><img src="images/solution/schoolTeachMonitoring.png">   </div>--%>
        <%--<div class="TextSet3">    <s:property value = "%{getText('contentRight.publicApply.schoolTeachUse.TextSet3.param1')}"/>--%>
        <%--</div>--%>

        <%--</div>--%>

        <%--<div id="schoolActivityUse">--%>
        <%--<div class="insideTitle">--%>
        <%--<div class="headerUseUpLeft">2.<s:property value = "%{getText('contentRight.publicApply.schoolActivityUse.headerUseUpLeft.param2')}"/></div>--%>
        <%--</div>--%>
        <%--<div class="png1"><img src="images/solution/schoolActivityMonitoring.png">   </div>--%>
        <%--<div class="TextSet3">    <s:property value = "%{getText('contentRight.publicApply.schoolActivityUse.TextSet3.param2')}"/>--%>
        <%--</div>--%>
        <%--</div>--%>

        <%--<div  id="amuseUse">--%>
        <%--<div class="insideTitle">--%>
        <%--<div class="headerUseUpLeft">3.<s:property value = "%{getText('contentRight.publicApply.amuseUse.headerUseUpLeft.param3')}"/></div>--%>
        <%--</div>--%>
        <%--<div class="png1"><img src="images/solution/amuseUseMonitoring.png">   </div>--%>
        <%--<div class="TextSet3">   <s:property value = "%{getText('contentRight.publicApply.amuseUse.TextSet3.param3')}"/></div>--%>
        <%--<div class="TextSet3"><s:property value = "%{getText('contentRight.publicApply.TextSet3.param4')}"/></div>--%>
        <%--<div class="TextSet4" id="WarningInfo">--%>
        <%--<s:property value = "%{getText('contentRight.publicApply.TextSet4.param1')}"/>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <div id="OperationalPolicy">
            <p class="TextSet5"><s:text name="OperationalPolicy.TextSet5.param1"/></p>

            <p class="TextSet3"><s:text name="OperationalPolicy.TextSet3.param1"/></p>
            <table id="table" cellspacing="0" cellpadding="0">
                <tr>
                    <th><s:text name="OperationalPolicy.table.param0"/>1</th>
                    <td align=left>9.8<s:text name="OperationalPolicy.table.param1"/></td>
                </tr>
                <tr>
                    <th><s:text name="OperationalPolicy.table.param0"/>2</th>
                    <td align=left>98<s:text name="OperationalPolicy.table.param2"/></td>
                </tr>

            </table>
        </div>
    </div>


</div>

<script type="text/javascript">
    $(function () {
        $(".menu_base_solutions").addClass("menu_base_current");
    });
</script>
