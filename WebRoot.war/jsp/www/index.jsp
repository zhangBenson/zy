<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<script type="text/javascript">
    $(document).ready(function(){
        $('.bxslider').bxSlider({
            speed: 1000,
            auto: true,
            infiniteLoop:true,
            pause:8000,
            controls:false
        });

        $('.bxsliderLogolist').bxSlider({
            auto: true,
            autoControls: true,
            pause: 3000,
            slideMargin: 20,
            pager:false,
            speed: 1000,
            mode: 'fade'
        });
    });
</script>

<div class="container">

    <ul class="bxslider">
        <li><a href="<s:property value="posterLink2" />"><img src="../../images/index/pic2.jpg" class="bannerImg" /></a></li>
        <li><a href="<s:property value="posterLink3" />"><img src="../../images/index/pic3.jpg" class="bannerImg" /></a></li>
        <li><a href="<s:property value="posterLink4" />"><img src="../../images/index/pic4.jpg" class="bannerImg" /></a></li>
        <li><a href="<s:property value="posterLink1" />"><img src="../../images/index/pic1.jpg" class="bannerImg" /></a></li>
    </ul>

    <%--<s:form method="post" action="searchResult" theme="simple" validate="true">--%>

    <%--<s:hidden name="searchType" value="1"/>--%>
    <%--&lt;%&ndash;<input name="courseName" class="keyWords"/>&ndash;%&gt;--%>
    <%--<s:textfield cssClass="keyWords" name="searchStr" />--%>
    <%--<input type="hidden" name="searchTyp" value="1"/>--%>
    <%--<input class="searchButton" type="submit" value="" />--%>
    <%--&lt;%&ndash;<a class="searchButton" href="search.html"></a>&ndash;%&gt;--%>
    <%--</s:form>--%>
    <s:form method="post" action="searchAnswer" theme="simple" validate="true">
        <%-- <s:hidden name="searchType" value="4"/> --%>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-6">
                <s:textfield cssClass="form-control input-lg" name="searchStr" placeholder="search"  ></s:textfield>
            </div>
            <div class="col-sm-4">
                <button type="submit" class="btn btn-default btn-lg">
                    <span class="glyphicon glyphicon-search"></span>
                    <s:property value="%{getText('menu.item.search')}"/>
                </button>
            </div>
        </div>
    </s:form>
</div>

<br/>

<div class="container">
    <div class="row">
        <div class="col-sm-6">

            <div class="pull-left"><img src="../../images/index/icon_new.png"  /></div>
            <div class="pull-left"><div class="courseSubhead"><s:property value="%{getText('usermenu.item.newestcourses')}"/></div></div>
            <div class="clearfix"></div>

            <s:iterator value="Courses" status="status">
                <s:if test="#status.index<4">
                    <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                        <div class="coursePanel">
                            <div class="coursePanelInfoLeft">
                                <img class="coursePanelPortrait" src="<s:property value="logoUrl"/>"/>
                            </div>

                            <div class="coursePanelInfoRight">
                                <p class="textOverSinglerow"><s:property value="name"/></p>
                                <p class="textOverSinglerow"><s:property value="%{getText('course.school')}"/>:&nbsp;<s:property value="organization.schoolName" /></p>
                                <p class="textOverSinglerow"><s:property value="%{getText('label.index.classes.start')}"/>:&nbsp;<s:date name="publicationTime" format="%{getText('dateformat.forclass')}"/></p>
                            </div>
                        </div>
                    </a>
                </s:if>
            </s:iterator>

            <!--Panel1 -->
            <%--<a href="#">--%>
            <%--<div class="coursePanel">--%>
            <%--<div class="coursePanelInfoLeft">--%>
            <%--<img class="coursePanelPortrait" src="gogowisestyle/image/recommended5.jpg"  />--%>

            <%--</div>--%>
            <%--<div class="coursePanelInfoRight">--%>
            <%--<p>Pellentesque habitant morbi tristique senectus.</p>--%>
            <%--<p>School:MITx</p>--%>
            <%--<p>Clases start:16 Oct 2013</p>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</a>--%>


            <a href="courseCenter.html"><p class="text-right"><s:property value="%{getText('others.more')}"/></p></a>
        </div>

        <div class="col-sm-6">
            <div class="pull-left"><img src="../../images/index/icon_MOOC.png"  /></div>
            <div class="pull-left"><div class="courseSubhead"><s:property value="%{getText('usermenu.item.mooc')}"/></div></div>
            <div class="clearfix"></div>

            <s:iterator value="moocCourses" status="status">
                <s:if test="#status.index<4">
                    <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                        <div class="coursePanel">
                            <div class="coursePanelInfoLeft">
                                <img class="coursePanelPortrait" src="<s:property value="logoUrl"/>" />
                            </div>
                            <div class="coursePanelInfoRight">
                                <p class="textOverSinglerow"><s:property value="name"/></p>
                                <p class="textOverSinglerow"><s:property value="%{getText('course.school')}"/>:&nbsp;<s:property value="organization.schoolName" /></p>
                                <p class="textOverSinglerow"><s:property value="%{getText('label.index.classes.start')}"/>:&nbsp;<s:date name="publicationTime" format="%{getText('dateformat.forclass')}"/></p>
                            </div>
                        </div>
                    </a>
                </s:if>
            </s:iterator>

            <a href="courseCenter.html"><p class="text-right"><s:property value="%{getText('others.more')}"/></p></a>

        </div>
    </div>
</div>

<div class="container">

    <div class="pull-left">
        <img src="images/org/icon_organizations.png"  />
    </div>
    <div class="pull-left">
        <div class="courseSubhead"><s:property value="%{getText('label.index.schools')}"/></div>
    </div>
    <div class="clearfix"></div>

    <div id="carousel-example-captions" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <s:iterator value="organizations" status="status">
                <s:if test="#status.index==0"><div class="item active" style="text-align: center;"><ul class="list-inline"></s:if>
                <s:if test="#status.index%4==0 && #status.index > 0"><div class="item" style="text-align: center;"><ul class="list-inline"></s:if>
                <li class="popItme">
                    <a href="orgBlog.html?org.id=<s:property value="id"/>" >
                        <img src="<s:property value="logoUrl" />"  alt="<s:property value="schoolName"/>" class="popOrgLogo" /></a>
                </li>
                <s:if test="#status.index%4==3"></ul></div></s:if>
                <s:elseif test="#status.last"> </ul></div></s:elseif>

            </s:iterator>
        </div>
        <a class="left carousel-control" href="#carousel-example-captions" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" style="position: relative;left:-70px;top: 50px;"></span>
        </a>

        <a class="right carousel-control" href="#carousel-example-captions" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" style="position: relative;left:70px;top: 50px;"></span>
        </a>
    </div>
</div>

<%--
<div class="container">
    <ul class="bxsliderLogolist">

            <s:iterator value="organizations" status="status">
                <s:if test="#status.index%4==0"><li><ul class="list-inline"></s:if>

                <li><a href="orgBlog.html?org.id=<s:property value="id"/>" >
                    <img src="<s:property value="logoUrl" />"  alt="<s:property value="schoolName"/>" class="popOrgLogo" /></a>
                </li>

                <s:if test="#status.index%4==3"></ul></li></s:if>
                <s:elseif test="#status.last"></ul></li></s:elseif>

            </s:iterator>
    </ul>

</div>
--%>