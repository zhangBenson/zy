<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="css/org/orgMatters.css" rel="stylesheet" type="text/css"/>

<div id="orgmatter_container">
    <div class="orgmatter_innerContainer">
        <div class="orgm_headerWords">
            <p><s:property value="%{getText('welcome.to.organization.center')}"/><span
                    class="welcome_org_name">&nbsp;<s:property value="org.schoolName"/></span></p>
        </div>
        <div class="orgm_options">
            <ul>
                <li>
                    <s:a action="initShowCreate"><h3><img src="images/org/arrow.png"/><span><s:property
                            value="%{getText('show.create.new.show')}"/></span></h3></s:a>
                    <p><s:property value="%{getText('show.create.new.show.tips')}"/></p>
                </li>
                <li>
                    <s:a action="showManageResult"><h3><img src="images/org/arrow.png"/><span><s:property
                            value="%{getText('personal.show.management')}"/></span></h3></s:a>
                    <p><s:property value="%{getText('show.manage.tips')}"/></p>
                </li>
                <li>
                    <s:a action="manageShowAd"><h3><img src="images/org/arrow.png"/><span><s:property
                            value="%{getText('show.management')}"/></span></h3></s:a>
                    <p><s:property value="%{getText('show.tips.for.bidding')}"/></p>
                </li>
                <li>
                    <s:a action="showRangeBoard"><h3><img src="images/org/arrow.png"/><span><s:property
                            value="%{getText('show.hero.list')}"/></span></h3></s:a>
                    <p><s:property value="%{getText('show.hero.list.tips')}"/></p>
                </li>
            </ul>
        </div>
    </div>
</div>