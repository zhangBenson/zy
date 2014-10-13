<%@ taglib prefix="s" uri="/struts-tags" %>
<%--<link href="css/orgLeague/orgLeague.css" rel="stylesheet" type="text/css" />--%>
<link href="css/orgLeague/<s:text name='orgleague.css.filename'/>" rel="stylesheet" type="text/css"/>

<s:if test="org!=null">
    <script type="text/javascript">
        var tips = "<s:text name='message.have.org'/>";
        var ok = "<s:text name='button.ok'/>";
        Boxy.ask(tips, [ok], function (val) {
            if (document.referrer && document.referrer.indexOf('easyLogon.html') > 0) {
                window.location.href = 'index.html';
            } else {
                window.history.back();
            }

        }, {title: '<s:text name="org.warmtip"/>'});
    </script>
</s:if>


<div id="orgLeagueDiv">
    <div id="tipImgDiv"><span><s:text name="org.warmtip"/></span></div>
    <div id="orgCenterDiv">
        <div class="tiphead"><span><s:text name="org.sayhello"/></span><s:property value="%{getText('orgleague.need')}"/></div>
        <ul class="attentionList">
            <li>1、 <s:text name="orgleague.one"/>；</li>
            <%--<li>2、	<s:text name="orgleague.two"/>；</li>--%>
            <li>&nbsp;</li>
            <li>2、 <s:text name="orgleague.three"/>；</li>
            <%--<li>4、	<s:text name="orgleague.four"/>；</li>--%>
            <%--<li>5、	<s:text name="orgleague.five"/>。</li>--%>
        </ul>
        <div class="ifReady">
            <form action="" method="post">
                <span class="wenhao">？&nbsp;</span><span class="beforeWord"><s:property value="%{getText('orgleague.ifReady')}"/></span>
                <a href="initThirdStep.html">
                    <div class="ifReadyYes"><span class="yesword"><s:property value="%{getText('lable.yesno.true')}"/></span></div>
                </a>
                <a href="index.html">
                    <div class="ifReadyNo"><span class="noword"><s:property value="%{getText('lable.yesno.false')}"/></span></div>
                </a>
            </form>
        </div>
        <ul class="orgStep">
            <li class="first"><s:text name="org.warmtip"/></li>
            <%--<li><s:text name="orgleague.identity.confirm"/></li>--%>
            <li><s:text name="orgleague.info.fill"/></li>
            <li><s:text name="orgleague.info.submit"/></li>
        </ul>
    </div>
</div>
