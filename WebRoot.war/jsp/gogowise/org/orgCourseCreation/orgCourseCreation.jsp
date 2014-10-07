<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>


<link href="css/orgLeague/<s:text name='orgleague.css.filename'/>" rel="stylesheet" type="text/css"/>
<style type="text/css">
    #orgLeagueDiv #orgCenterDiv {
        height: 401px;
        width: 899px;
        padding-top: 45px;
        padding-right: 25px;
        padding-left: 25px;
    }

    #orgLeagueDiv #orgCenterDiv .tiphead {
        margin-top: 50px;
    }

    #orgLeagueDiv #orgCenterDiv .orgStep li {
        margin-left: 40px;
    }

    #orgCenterDiv .orgStep .warmTip {
        color: rgb(249, 149, 34);
    }

    #orgCenterDiv .orgStep li {
        font-size: 14px;
    }
</style>

<div id="orgLeagueDiv">
    <div id="tipImgDiv"><span><s:text name="org.warmtip"/></span></div>
    <div id="orgCenterDiv">
        <div class="tiphead"><span>&nbsp;&nbsp;<s:text name="org.course.sayhello"/></span><s:property
                value="%{getText('org.course.notprincipal')}"/>：
        </div>
        <div class="courseCreation">
            <a href="createCourse.html?courseType=1">
                <div class="bgImg"></div>
            </a>

            <p class="buttonTip"><s:text name="org.course.selfID"/>！</p>
        </div>
        <div class="orgLeague">
            <a href="initOrgLeague.html">
                <div class="bgImg"></div>
            </a>

            <p class="buttonTip"><s:text name="org.course.join"/>！</p>
        </div>
        <div class="simulateOrgCourseCreation">
            <a href="createCourse.html?courseType=2">
                <div class="bgImg"></div>
            </a>

            <p class="buttonTip"><s:text name="org.course.demo"/>！</p>
        </div>
        <ul class="orgStep">
            <li></li>
            <li><s:text name="orgleague.identity.confirm"/></li>
            <li class="warmTip"><s:text name="org.warmtip"/></li>
            <li><s:text name="org.course.creation"/>/<s:property
                    value="%{getText('org.course.league')}"/>/<s:property
                    value="%{getText('org.course.simulate')}"/></li>
        </ul>
    </div>
</div>
