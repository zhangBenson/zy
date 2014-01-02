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

    <br/>
    <br/>

    <s:if test="organizations != null && organizations.size() > 0">
        <s:iterator value="organizations" status="idx">
            <div class="schoolRow">
                <div class="row">
                    <div class="col-sm-3">
                        <a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                            <img src="<s:property value="logoUrl"/>"  alt=""  class="schoolPortrait"/>
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
                                    <li class="searchItemState"><s:property value="%{getText('label.student')}"/>:<s:property value="studentNum"/></li>
                                    <li class="searchItemState"><s:property value="%{getText('search.header.course')}"/>:<s:property value="orgCourseNum"/></li>
                                    <li class="searchItemState"><s:property value="%{getText('course.lecturer')}"/>:<s:property value="allTeachersNum"/></li>
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
            <div class="clearfix"></div>
            <br/>
        </s:iterator>
    </s:if>
    <s:else>
        <div class="schoolRow">
            <div class="row">
               <strong>No Schools!!</strong>
            </div>
        </div>
    </s:else>

    <br/>
    <div style="text-align: center;">
    <ul class="pagination pagination-lg">


      <li><a href="#">A-D</a></li>
      <li><a href="#">E-H</a></li>
      <li><a href="#">I-L</a></li>
      <li><a href="#">M-P</a></li>
      <li><a href="#">Q-T</a></li>
      <li><a href="#">U-Z</a></li>
      <li><a href="#">Show All</a></li>
    </ul>
</div>
</div>
