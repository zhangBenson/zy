<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>



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

           <%--<input type="text" class="form-control" name="searchStr" placeholder="search">
                <s:textfield cssClass="form-control input-lg" name="searchStr" placeholder="search"  ></s:textfield>
                <s:property value="searchType"/>
                <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" style="margin-right: 15px;"></span><s:property value="%{getText('menu.item.search')}"/></button>
                </div>        --%>
            </div>
            <div class="col-sm-2"></div>
        </div>
    </div>
</div>
<div class="searchContent">

    <!-- <div class="searchItem">
        <h1 class = "courseSubject">Rice</h1>
        <div class="searchCourseBody">
            <a href="#">
            Founded in 1861, the University of Washington is one of the oldest state-supported institutions of higher education on the West Coast and is one of the preeminent research universities in the world.
            </a>
        </div>

        <div class="searchrecommended">
            <ul class="list-inline">
                <li>
                    <a href="#">
                        <div class="searchrecommendedItem">
                            <img src="gogowisestyle/image/recommended1.jpg" alt="" data-toggle="tooltip" title="Early Christianity: The Letters of Paul:The course “Early Christianity: The Letters of Paul” explores the context of these letters in the Roman Empire and the impact of these powerful texts today.">
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="searchrecommendedItem">
                            <img src="gogowisestyle/image/recommended4.jpg" alt="" data-toggle="tooltip" title="course name 2">
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="searchrecommendedItem">
                            <img src="gogowisestyle/image/recommended5.jpg" alt="" data-toggle="tooltip" title="course name 3">
                        </div>
                    </a>
                </li>
            </ul>
        </div>
        <p class="text-left">
            <ul class="list-inline">
              <li class="searchItemState">Studio:109</li>
              <li class="searchItemState">Course:12</li>
              <li class="searchItemState">Lecturer:6</li>
            </ul>
        </p>
    </div> -->

    <!--Course-->
    <s:iterator value="courses" status="idx">
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
            <br/>
            <p class="text-left">
                <ul class="list-inline">
                  <li class="searchItemState"><s:property value="%{getText('label.student')}"/>:<s:property value="studentNum"/></li>
                  <li class="searchItemState"><s:property value="%{getText('course.school')}"/>:<a href="orgBlog.html?org.id=<s:property value="organization.id"/>" title="<s:property value="organization.nickName"/>"><s:property value="organization.schoolName"/></a></li>
                  <li class="searchItemState"><s:property value="%{getText('courses.info.lecturer')}"/>:<a href="userBlog.html?user.id=<s:property value="teacher.id"/>" title="<s:property value="teacher.nickName"/>"><s:property value="teacher.nickName"/></a></li>
                </ul>
            </p>
            <div class="clearfix"></div>
        </div>
    </s:iterator>
</div>
<tiles:insertTemplate template="../common/pagination.jsp">
    <tiles:putAttribute name="pagination" value="${pagination}"/>
</tiles:insertTemplate>

