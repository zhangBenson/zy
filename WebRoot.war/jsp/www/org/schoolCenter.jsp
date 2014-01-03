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
                        <s:form method="post" action="searchSchool" theme="simple" validate="true">
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

    <br/>
    <br/>

    <s:if test="organizations != null && organizations.size() > 0">
        <s:iterator value="organizations" status="idx">
            <div class="schoolRow">
                <div class="row">
                    <div class="col-sm-3">
                        <a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                            <img src="<s:property value="logoUrl"/>"  alt="" class="Schoolminlogo"/>
                        </a>
                    </div>
                    <div class="col-sm-9">
                        <div class="pull-left" style="width:500px;">
                            <a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                                <div class="courseSubject"><s:property value="schoolName"/></div>
                            </a>
                        </div>

                        <div class="pull-right">
                            <p class="text-left">
                                <ul class="list-inline">
                                    <s:property value="studentsNumByOrgId(id)"/>

                                    <li class="searchItemState"><s:property value="%{getText('label.student')}"/>:<s:property value="getStudentsNumByOrgId(id)"/></li>
                                    <li class="searchItemState"><s:property value="%{getText('search.header.course')}"/>:<s:property value="courseDao.findByOrg(id,null).size()"/></li>
                                    <li class="searchItemState"><s:property value="%{getText('course.lecturer')}"/>:<s:property value="organizationTeachers.size()"/></li>
                                </ul>
                            </p>
                        </div>
                        <div class="clearfix"></div>
                        <div class="searchCourseBody">
                            <a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                                <s:if test="description.length() > 100">
                                    <s:property escapeHtml="false" value="description.substring(0,100)+'...'" />
                                </s:if>
                                <s:else>
                                    <s:property escapeHtml="false" value="description"/>
                                </s:else>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </s:iterator>
    </s:if>
    <s:else>
        <div class="schoolRow" style="text-align: center;">
            <div class="row">
               <strong><s:property value="%{getText('school.center.page.no.schools.message')}"/></strong>
            </div>
        </div>
    </s:else>

    <br/>
    <div style="text-align: center;">
        <ul class="pagination pagination-lg">

            <li><a id="searchType0" href="javascript:startSearch(0);">A-D</a></li>
            <li><a id="searchType1" href="javascript:startSearch(1);">E-H</a></li>
            <li><a id="searchType2" href="javascript:startSearch(2);">I-L</a></li>
            <li><a id="searchType3" href="javascript:startSearch(3);">M-P</a></li>
            <li><a id="searchType4" href="javascript:startSearch(4);">Q-T</a></li>
            <li><a id="searchType5" href="javascript:startSearch(5);">U-Z</a></li>
            <li><a id="searchType6" href="javascript:startSearch(6);"><s:property value="%{getText('label.school.center.button.show.other')}"/></a></li>
            <li><a id="searchType7" href="javascript:startSearch(7);"><s:property value="%{getText('label.school.center.button.show.all')}"/></a></li>

            <form action="schoolCenter.html" method="POST" id="page_show_form">
                <s:hidden name="schoolPageShowType" id="showType_msg"/>
            </form>

          <%-- <li><a href="#">A-D</a></li>
            <li><a href="#">E-H</a></li>
            <li><a href="#">I-L</a></li>
            <li><a href="#">M-P</a></li>
            <li><a href="#">Q-T</a></li>
            <li><a href="#">U-Z</a></li>
            <li><a href="#">Other</a></li>
            <li><a href="#">Show All</a></li>--%>
        </ul>
    </div>
</div>

<script type="text/javascript">
   /* $(function(){
        var schoolPageShowType = <s:property value="schoolPageShowType"/>;
        switch(schoolPageShowType){
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
    function startSearch(schoolPageShowType){
        // window.location.href = "searchResult.html?searchType="+searchType+"&searchStr="+encodeURI($("#searchStr_id").val());
        //alert (schoolPageShowType);
        $("#showType_msg").attr('value',schoolPageShowType);
        $("#page_show_form").submit();
    }
</script>


