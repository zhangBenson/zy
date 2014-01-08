<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<link type="text/css" href="css/course/courseBlog.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.rate.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.js"></script>


<div class="container">
    <div class="thinline"></div>
    <br/>
    <div class="container">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <s:form method="post" action="searchSchool" theme="simple" validate="true">
                    <div class="input-group">
                        <s:textfield cssClass="form-control input-lg" name="searchStr" placeholder="search"></s:textfield>
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-default btn-lg">
                                <span class="glyphicon glyphicon-search"></span>
                                <s:property value="%{getText('menu.item.search')}"/>
                            </button>
                        </div>
                    </div>
                </s:form>
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
                        <div class="pull-left" style="width:500px;">
                            <a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                                <div id = "share_title" class="courseSubject"><s:property value="schoolName"/></div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <div class="pull-right">
                            <p class="text-left">
                            <ul class="list-inline">
                                <li class="searchItemState"><s:property value="%{getText('label.student')}"/>:<s:property value="getStudentsNumByOrgId(id)"/></li>
                                <li class="searchItemState"><s:property value="%{getText('search.header.course')}"/>:<s:property value="courseDao.findByOrg(id,null).size()"/></li>
                                <li class="searchItemState"><s:property value="%{getText('course.lecturer')}"/>:<s:property value="organizationTeachers.size()"/></li>
                            </ul>
                            </p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                            <img id="share_pic" src="<s:property value="logoUrl"/>"  alt="" class="Schoolminlogo"/>
                        </a>
                    </div>
                    <div class="col-sm-9">
                        <div class="clearfix"></div>
                        <div id="share_desc" class="searchCourseBody">
                            <a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                                <s:if test="parseSchoolDescription(id).length() > 350">
                                    <s:property  value="parseSchoolDescription(id).substring(0,350)+'...'" />
                                </s:if>
                                <s:else>
                                    <s:property  value="parseSchoolDescription(id)"/>
                                </s:else>
                            </a>
                        </div>
                    </div>
                    <p class="text-right"><a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="nickName"/>"><s:property value="%{getText('label.school.comments')}"/>(<s:property value="organizationCommentDao.findOrgCommentByOrgId(id, null).size()"/>)</a></p>
                    <%-- <p class="text-right"><a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="nickName"/>"><s:property value="%{getText('label.school.comments')}"/>(<s:property value="organizationCommentDao.findOrgCommentByOrgId(id, null).size()"/>)</a> | <a href="#"><s:property value="%{getText('label.shared.with')}"/></a></p> --%>
                    <%--<s:property value="%{getText('label.shared.with')}"/>--%>
                    <%--
                    <div style="float: right">
                        <div style="float:left"><a href="orgBlog.html?org.id=<s:property value="id"/>" title="<s:property value="nickName"/>"><s:property value="%{getText('label.school.comments')}"/>(<s:property value="organizationCommentDao.findOrgCommentByOrgId(id, null).size()"/>)</a> | </div>
                        <div style="float:left" id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
                            <a class="bds_fbook facebook" title="Facebook"></a>
                            <a class="bds_twi twitter" title="Twitter"></a>
                            <a class="bds_linkedin LinkedIn" title="LinkedIn"></a>
                            <a class="bds_deli delicious" title="Delicious"></a>

                        </div>
                        <script type="text/javascript" id="bdshare_js" data="type=tools" ></script>
                        <script type="text/javascript" id="bdshell_js"></script>
                        <script type="text/javascript">
                            var share_title = document.getElementById("share_title").innerText+"@GoGoWise"+"  <s:text name="message.course.wonderful"/>";
                            var share_pic =  document.getElementById("share_pic").src;
                            var share_comment = "<s:text name="message.course.wonderful"/>";
                            var share_desc = document.getElementById("share_desc").innerText;

                            var _data = "{'text':'"+share_title + "',"+
                                    "'comment':'"+share_comment + "',"+
                                    "'url':'"+window.location.href+"'}";

                            document.getElementById("bdshare").setAttribute("data",_data);


                            var bds_config = {'bdText':share_title,
                                'bdDesc':share_desc, //qq，开心
                                'bdComment':share_comment,
                                'bdPopTitle':'GoGoWise Share',
                                'bdPic':share_pic
                            };
                            document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
                        </script>
                    </div> --%>
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
            <li id="searchType0"><a href="javascript:startSearch(0);">A-D</a></li>
            <li id="searchType1"><a href="javascript:startSearch(1);">E-H</a></li>
            <li id="searchType2"><a href="javascript:startSearch(2);">I-L</a></li>
            <li id="searchType3"><a href="javascript:startSearch(3);">M-P</a></li>
            <li id="searchType4"><a href="javascript:startSearch(4);">Q-T</a></li>
            <li id="searchType5"><a href="javascript:startSearch(5);">U-Z</a></li>
            <li id="searchType6"><a href="javascript:startSearch(6);"><s:property value="%{getText('label.school.center.button.show.other')}"/></a></li>
            <li id="searchType7"><a href="javascript:startSearch(7);"><s:property value="%{getText('label.school.center.button.show.all')}"/></a></li>
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
    $(document).ready(function() {
        var schoolPageShowType = "<s:property value="schoolPageShowType"/>";
        if (schoolPageShowType == null || schoolPageShowType == ""){
            $("#searchType7").addClass("active");
            return ;
        }
        switch(parseInt(schoolPageShowType)){
            case 0: $("#searchType0").addClass("active");break;
            case 1: $("#searchType1").addClass("active");break;
            case 2: $("#searchType2").addClass("active");break;
            case 3: $("#searchType3").addClass("active"); break;
            case 4: $("#searchType4").addClass("active"); break;
            case 5: $("#searchType5").addClass("active"); break;
            case 6: $("#searchType6").addClass("active"); break;
            case 7: $("#searchType7").addClass("active"); break;
            default :
                break;
        }
    });
    function startSearch(schoolPageShowType){
        // window.location.href = "searchResult.html?searchType="+searchType+"&searchStr="+encodeURI($("#searchStr_id").val());
        //alert (schoolPageShowType);
        $("#showType_msg").attr('value',schoolPageShowType);
        $("#page_show_form").submit();
    }
</script>


