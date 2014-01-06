<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>



<div class="container">
    <div class="thinline"></div>
    <br/>
    <div class="container">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <div class="input-group">
                    <div class="input-group-btn">
                        <s:form method="post" action="searchAnswer" theme="simple" validate="true">
                            <s:textfield cssClass="form-control input-lg" name="searchStr" placeholder="search"></s:textfield>
                            <button type="submit" class="btn btn-default btn-lg">
                                <span class="glyphicon glyphicon-search"></span>
                                <s:property value="%{getText('menu.item.search')}"/>
                            </button>
                        </s:form>
                    </div>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
    </div>
</div>
<div class="searchContent">
    <!--Course-->
    <s:if test="centerCourses != null && centerCourses.size()>0">
        <s:iterator value="centerCourses" status="idx">
            <div class="searchCourseItem">
                <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                    <img src="<s:property value="logoUrl" />" class="searchCourseImg"/>
                </a>

                <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                    <h1 class = "searchCourseName"><s:property value="name"/></h1>
                </a>

                <h4 class="searchCourseBody">
                    <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                        <s:if test="description.length() > 200">
                            <s:property value="description.substring(0,200)+'...'" />
                        </s:if>
                        <s:else>
                            <s:property value="description"/>
                        </s:else>
                    </a>
                </h4>

                <div class="text-right">
                    <ul class="list-inline">
                        <li class="searchItemState"><s:property value="%{getText('course.school')}"/>:<a href="orgBlog.html?org.id=<s:property value="organization.id"/>" title="<s:property value="organization.nickName"/>"><s:property value="organization.schoolName"/></a></li>
                        <li class="searchItemState"><s:property value="%{getText('courses.info.lecturer')}"/>:<a href="userBlog.html?user.id=<s:property value="teacher.id"/>" title="<s:property value="teacher.nickName"/>"><s:property value="teacher.nickName"/></a></li>
                        <li class="searchItemState"><s:property value="%{getText('label.student')}"/>:<s:property value="studentNum"/></li>
                        <li class="searchItemStateBlue"><s:property value="%{getText('usermenu.item.mooc')}"/></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <s:if test="!#idx.last">
                <div class="imaginaryline"></div>
            </s:if>
        </s:iterator>
    </s:if>
    <s:else>
        <div class="searchCourseItem" style="text-align: center;">
            <strong><s:property value = "%{getText('search.course.no.result.message')}"/></strong>
        </div>
    </s:else>
</div>

<br/>
<div style="text-align: center;">
    <ul class="pagination pagination-lg">
        <li class="active"><a id="searchType0" href="javascript:startSearch(0);">A-D</a></li>
        <li><a id="searchType1" href="javascript:startSearch(1);">E-H</a></li>
        <li><a id="searchType2" href="javascript:startSearch(2);">I-L</a></li>
        <li><a id="searchType3" href="javascript:startSearch(3);">M-P</a></li>
        <li><a id="searchType4" href="javascript:startSearch(4);">Q-T</a></li>
        <li><a id="searchType5" href="javascript:startSearch(5);">U-Z</a></li>
        <li><a id="searchType6" href="javascript:startSearch(6);"><s:property value="%{getText('label.school.center.button.show.other')}"/></a></li>
        <li><a id="searchType7" href="javascript:startSearch(7);"><s:property value="%{getText('label.school.center.button.show.all')}"/></a></li>

        <form action="courseCenter.html" method="POST" id="page_show_form">
            <s:hidden name="coursePageShowType" id="showType_msg"/>
        </form>
    </ul>
</div>

<script type="text/javascript">
    /* $(function(){
     var coursePageShowType = <s:property value="coursePageShowType"/>;
     switch(coursePageShowType){
     case 0: $("#searchType0").addClass("search_stand_out");break;
     case 1: $("#searchType1").addClass("search_stand_out");break;
     case 2: $("#searchType2").addClass("search_stand_out");break;
     case 3: $("#searchType3").addClass("search_stand_out"); break;
     case 4: $("#searchType4").addClass("search_stand_out"); break;
     case 5: $("#searchType5").addClass("search_stand_out"); break;
     case 6: $("#searchType6").addClass("search_stand_out"); break;
     case 6: $("#searchType7").addClass("search_stand_out"); break;
     }
     });
     */
    function startSearch(coursePageShowType){
        // window.location.href = "searchResult.html?searchType="+searchType+"&searchStr="+encodeURI($("#searchStr_id").val());
        //alert (coursePageShowType);
        $("#showType_msg").attr('value',coursePageShowType);
        $("#page_show_form").submit();
    }
</script>