<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('.bxslider').bxSlider({
            speed: 1000,
            auto: true,
            infiniteLoop: true,
            pause: 8000,
            controls: false
        });

        $('.bxsliderLogolist').bxSlider({
            auto: true,
            autoControls: true,
            pause: 3000,
            slideMargin: 20,
            pager: false,
            speed: 1000,
            mode: 'fade'
        });
    });

    function getMoreCousre(pageNow, type) {
        var pageNext = pageNow + 1;

        if(type == 1){
            document.getElementById("foreignLink" + pageNow).style.display = "none";
            $.post("getMoreCourse.html", {'forignPagination.pageNow': pageNext, 'type':type}, function (data) {
                $("#foreignCourseList" + pageNext).html(data);
            });
        }
        if(type == 2){
            document.getElementById("zhongXueLink" + pageNow).style.display = "none";
            $.post("getMoreCourse.html", {'zhongXuePagination.pageNow': pageNext, 'type':type}, function (data) {
                $("#zhongXueCourseList" + pageNext).html(data);
            });
        }
        if(type == 3){
            document.getElementById("xiaoXueLink" + pageNow).style.display = "none";
            $.post("getMoreCourse.html", {'xiaoXuePagination.pageNow': pageNext, 'type':type}, function (data) {
                $("#xiaoXueCourseList" + pageNext).html(data);
            });
        }
        if(type == 4){
            document.getElementById("childLink" + pageNow).style.display = "none";
            $.post("getMoreCourse.html", {'childPagination.pageNow': pageNext, 'type':type}, function (data) {
                $("#childCourseList" + pageNext).html(data);
            });
        }
    }
</script>

<style>
    .courselists{
        margin-top: 20px;
        clear: both;
    }
</style>

<div class="container" >

    <ul class="bxslider">
        <li><a href="<s:property value="posterLink1" />"><img src="../../images/index/pic1.jpg" class="bannerImg"/></a>
        </li>
        <li><a href="<s:property value="posterLink2" />"><img src="../../images/index/pic2.jpg" class="bannerImg"/></a>
        </li>
        <%--<li><a href="<s:property value="posterLink3" />"><img src="../../images/index/pic3.jpg" class="bannerImg" /></a></li>--%>
        <%--<li><a href="<s:property value="posterLink4" />"><img src="../../images/index/pic4.jpg" class="bannerImg" /></a></li>--%>
    </ul>

    <s:form method="post" action="searchAnswer" theme="simple" validate="true">
        <%-- <s:hidden name="searchType" value="4"/> --%>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-6">
                <s:textfield cssClass="form-control input-lg" name="searchStr" placeholder="search"></s:textfield>
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

    <div class="courselists">

        <div class="pull-left"><img src="../../images/index/icon_new.png"/></div>
        <div class="pull-left">
            <div class="courseSubhead"><s:property value="%{getText('label.index.foreign')}"/></div>
        </div>
        <div class="clearfix"></div>

        <div style="width:1180px;" id="foreignCourseList<s:property value="forignPagination.pageNow"/>">

            <s:iterator value="forignCourses" status="status">
                <s:if test="#status.index<10">
                    <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"
                       class="newLeft">
                        <div class="coursePanel" style="width:550px;">
                            <div class="coursePanelInfoLeft">
                                <img class="coursePanelPortrait" src="<s:property value="logoUrl"/>"/>
                            </div>

                            <div class="coursePanelInfoRight">
                                <p class="textOverSinglerow"><s:property value="name"/></p>

                                <p class="textOverSinglerow"><s:property
                                        value="%{getText('course.school')}"/>:&nbsp;<s:property
                                        value="organization.schoolName"/></p>

                                <p class="textOverSinglerow">
                                    <s:property value="%{getText('courses.info.lecturer')}"/>:&nbsp;
                                    <s:if test="teacher.userName != null"><s:property value="teacher.userName"/></s:if>
                                    <s:else><s:property value="teacher.nickName"/></s:else>
                                </p>
                            </div>
                        </div>
                    </a>
                    <s:if test="#status.index%2==1"><br/></s:if>
                </s:if>
            </s:iterator>


        </div>

        <div id="foreignCourseList<s:property value="forignPagination.pageNow+1"/>"></div>
        <s:if test="forignPagination.hasNext">
            <a href="javascript:;" id="foreignLink<s:property value="forignPagination.pageNow"/>"
               onclick="getMoreCousre(<s:property value="forignPagination.pageNow"/>, 1);">
                <p class="text-right" style="margin-right: 0px;"><s:property value="%{getText('others.more')}"/></p>
            </a>
        </s:if>
    </div>

    <div class="courselists">

        <div class="pull-left"><img src="../../images/index/icon_new.png"/></div>
        <div class="pull-left">
            <div class="courseSubhead"><s:property value="%{getText('label.index.zhongXue')}"/></div>
        </div>
        <div class="clearfix"></div>

        <div style="width:1180px;" id="zhongXueCourseList<s:property value="zhongXuePagination.pageNow"/>">

            <s:iterator value="zhongXueCourses" status="status">
                <s:if test="#status.index<10">
                    <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"
                       class="newLeft">
                        <div class="coursePanel" style="width:550px;">
                            <div class="coursePanelInfoLeft">
                                <img class="coursePanelPortrait" src="<s:property value="logoUrl"/>"/>
                            </div>

                            <div class="coursePanelInfoRight">
                                <p class="textOverSinglerow"><s:property value="name"/></p>

                                <p class="textOverSinglerow"><s:property
                                        value="%{getText('course.school')}"/>:&nbsp;<s:property
                                        value="organization.schoolName"/></p>

                                <p class="textOverSinglerow">
                                    <s:property value="%{getText('courses.info.lecturer')}"/>:&nbsp;
                                    <s:if test="teacher.userName != null"><s:property value="teacher.userName"/></s:if>
                                    <s:else><s:property value="teacher.nickName"/></s:else>
                                </p>
                            </div>
                        </div>
                    </a>
                    <s:if test="#status.index%2==1"><br/></s:if>
                </s:if>
            </s:iterator>

        </div>

        <div id="zhongXueCourseList<s:property value="zhongXuePagination.pageNow+1"/>"></div>
        <s:if test="zhongXuePagination.hasNext">
            <a href="javascript:;" id="zhongXueLink<s:property value="zhongXuePagination.pageNow"/>"
               onclick="getMoreCousre(<s:property value="zhongXuePagination.pageNow"/>, 2);">
                <p class="text-right" style="margin-right: 0px;"><s:property value="%{getText('others.more')}"/></p>
            </a>
        </s:if>
    </div>

    <div class="courselists">

        <div class="pull-left"><img src="../../images/index/icon_new.png"/></div>
        <div class="pull-left">
            <div class="courseSubhead"><s:property value="%{getText('label.index.xiaoXue')}"/></div>
        </div>
        <div class="clearfix"></div>

        <div style="width:1180px;" id="xiaoXueCourseList<s:property value="xiaoXuePagination.pageNow"/>">

            <s:iterator value="xiaoXueCourses" status="status">
                <s:if test="#status.index<10">
                    <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"
                       class="newLeft">
                        <div class="coursePanel" style="width:550px;">
                            <div class="coursePanelInfoLeft">
                                <img class="coursePanelPortrait" src="<s:property value="logoUrl"/>"/>
                            </div>

                            <div class="coursePanelInfoRight">
                                <p class="textOverSinglerow"><s:property value="name"/></p>

                                <p class="textOverSinglerow"><s:property
                                        value="%{getText('course.school')}"/>:&nbsp;<s:property
                                        value="organization.schoolName"/></p>

                                <p class="textOverSinglerow">
                                    <s:property value="%{getText('courses.info.lecturer')}"/>:&nbsp;
                                    <s:if test="teacher.userName != null"><s:property value="teacher.userName"/></s:if>
                                    <s:else><s:property value="teacher.nickName"/></s:else>
                                </p>
                            </div>
                        </div>
                    </a>
                    <s:if test="#status.index%2==1"><br/></s:if>
                </s:if>
            </s:iterator>

        </div>

        <div id="xiaoXueCourseList<s:property value="xiaoXuePagination.pageNow+1"/>"></div>

        <s:if test="xiaoXuePagination.hasNext">
            <a href="javascript:;" id="xiaoXueLink<s:property value="xiaoXuePagination.pageNow"/>"
               onclick="getMoreCousre(<s:property value="forignPagination.pageNow"/>, 3);">
                <p class="text-right" style="margin-right: 0px;"><s:property value="%{getText('others.more')}"/></p>
            </a>
        </s:if>

    </div>

    <div class="courselists">

        <div class="pull-left"><img src="../../images/index/icon_new.png"/></div>
        <div class="pull-left">
            <div class="courseSubhead"><s:property value="%{getText('label.index.child')}"/></div>
        </div>
        <div class="clearfix"></div>

        <div style="width:1180px;" id="childCourseList<s:property value="childPagination.pageNow"/>">

            <s:iterator value="childCourses" status="status">
                <s:if test="#status.index<10">
                    <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"
                       class="newLeft">
                        <div class="coursePanel" style="width:550px;">
                            <div class="coursePanelInfoLeft">
                                <img class="coursePanelPortrait" src="<s:property value="logoUrl"/>"/>
                            </div>

                            <div class="coursePanelInfoRight">
                                <p class="textOverSinglerow"><s:property value="name"/></p>

                                <p class="textOverSinglerow"><s:property
                                        value="%{getText('course.school')}"/>:&nbsp;<s:property
                                        value="organization.schoolName"/></p>

                                <p class="textOverSinglerow">
                                    <s:property value="%{getText('courses.info.lecturer')}"/>:&nbsp;
                                    <s:if test="teacher.userName != null"><s:property value="teacher.userName"/></s:if>
                                    <s:else><s:property value="teacher.nickName"/></s:else>
                                </p>
                            </div>
                        </div>
                    </a>
                    <s:if test="#status.index%2==1"><br/></s:if>
                </s:if>
            </s:iterator>
        </div>

        <div id="childCourseList<s:property value="childPagination.pageNow+1"/>"></div>
        <s:if test="childPagination.hasNext">
            <a href="javascript:;" id="childLink<s:property value="childPagination.pageNow"/>"
               onclick="getMoreCousre(<s:property value="childPagination.pageNow"/>, 4);">
                <p class="text-right" style="margin-right: 0px;"><s:property value="%{getText('others.more')}"/></p>
            </a>
        </s:if>
    </div>

</div>

<div class="container">

    <div class="pull-left">
        <img src="images/org/icon_organizations.png"/>
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
                    <a href="orgBlog.html?org.id=<s:property value="id"/>">
                        <img src="<s:property value="logoUrl" />" alt="<s:property value="schoolName"/>"
                             class="popOrgLogo"/></a>
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
