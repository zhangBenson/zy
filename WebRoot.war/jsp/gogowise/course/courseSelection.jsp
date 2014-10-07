<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<script type="text/javascript" src="js/jquery.rate.js"></script>
<style type="text/css">
.blogframe ul, .blogframe li, .blogframe h1, .blogframe h2, .blogframe h3, .blogframe h4, .blogframe h5, .blogframe h6, .blogframe table {
    margin: 0px;
    padding: 0px;
    font-family: Verdana, Geneva, sans-serif;
    color: #666;
    background: #FFF;
    font-size: 12px;
}

.blogframe ul, li {
    list-style: none;
}

.blogframe div {
    float: left;
}

.blogframe {
    width: 660px;
    position: relative;
    padding-bottom: 15px;
    float: left;
    margin-left: 0px;
    font-size: 12px;
    background-image: url(images/blogindex/courseframecenter_small.gif);
    background-repeat: repeat-y;
    background-position: center;
    overflow: hidden;
}

.blogframe .video {
    display: inline;
    float: left;
    height: 90px;
    width: 120px;
    padding: 2px;
    border: 1px solid #ccc;
    margin: 8px 5px 8px 8px;
}

.blogframe .video img {
    height: 90px;
    width: 120px;
    border: none;
    cursor: pointer;
}

.courseinfo {
    width: 180px;
    margin: 8px 0 0 5px;
    text-align: left;
}

.courseinfo p {
    margin: 0;
    line-height: 24px;
}

b {
    color: #cc6600;
}

/*a:link, a:visited {*/
/*color: #cc6600;*/
/*}*/

.blogframe h6 .courseName {
    display: inline;
    float: left;
}

/*a:hover {*/
/*color: #F90;*/
/*}*/

b a {
    color: #F90;
    text-decoration: underline;
}

.blogframe h6 {
    color: #006699;
    font-size: 16px;
    font-weight: normal;
    float: left;
    width: 480px;
    position: relative;
}

#evaluate b {
    font-style: oblique;
}

#evaluate h3 {
    font-size: 18px;
    height: 28px;
    padding-bottom: 2px;
}

#evaluate h3 b {
    font-size: 24px;
}

img.frame1bottom {
    position: absolute;
    left: 0;
    bottom: 0;
}

.courseintro {
    width: 95%;
    margin-left: 15px;
    text-align: left;
    color: #666666;
    font-size: 12px;
    float: left;
}

.type2, .type2 .rate-current, .type2 .rate-on:hover, .type2-bad .rate-current, .type2-bad .rate-on:hover {
    background: url(images/blogindex/star.gif) repeat-x;
    color: #cc6600;
}

.type2 {
    position: relative;
    height: 18px;
    width: 110px;
}

.type2 .rate-on, .type2 .rate-current {
    position: absolute;
    top: 0;
    left: 0;
    height: 18px;
    outline: none;
}

.type2 .rate-current, .type2 .rate-on:hover {
    background-position: 0 -46px;
}

.type2-bad .rate-current, .type2-bad .rate-on:hover {
    background-position: 0 -23px;
}

.seeall {
    font-size: 16px;
    color: #cc6600;
    position: absolute;
    right: -10px;
    top: 45px;
    cursor: pointer;
    width: 136px;
    height: 35px;
}

.classintro {
    margin: 8px 0px 8px 40px;
    width: 85%;
    display: none;
}

.classintro tr {
    height: 28px;
}

.classintro td {
    padding: 3px 2px 3px 4px;
    border-bottom: 1px dashed #999;
    text-align: right;
}

.classintro .td1 {
    color: #006699;
    width: 60px;
}

h6 .type2 {
    position: absolute;
    top: 0;
    right: 20px;
}

h6 .seeallclass {
    position: absolute;
    top: 0;
    right: -110px;
    cursor: pointer;
    font-size: 16px;
}

#reservationbtn {
    background: url(images/blogindex/coursereservation.gif) no-repeat;
    width: 136px;
    height: 40px;
    border: 0;
    cursor: pointer;
}

.reservationsucceed {
    position: absolute;
    top: 95px;
    right: -50px;
    font-size: 12px;
    color: #006699;
}

.courseintro .introduction {
    float: left;
}
</style>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
}

#courseContent {
    float: left;
    width: 1000px;
    margin-right: auto;
    margin-left: auto;
}

#courseLeft {
    width: 68%;
    float: left;
    /*background: blue;*/
}

#courseRight {
    width: 32%;
    float: left;
    /*background: green;*/
}

#courseSearch {
    width: 100%;
    float: left;
    height: 50px;
}

#courseSearch .keyWords {
    display: block;
    float: left;
    height: 28px;
    line-height: 28px;
    width: 400px;
    margin-left: 25px;
    border: 1px solid #999;
    margin-top: 15px;
}

.advSearchButton {
    display: block;
    float: left;
    background-image: url(images/blogindex/searchBtnImg2.png);
    background-repeat: no-repeat;
    background-color: rgb(38, 138, 214);
    box-shadow: 0px 0px 3px 1px rgba(0, 0, 0, 0.25);
    border-radius: 5px;
    height: 32px;
    margin-left: 5px;
    margin-top: 15px;
    padding-left: 32px;
    padding-right: 5px;
    cursor: pointer;
}

.advSearchButton:hover {
    background-color: #066;
}

#hotCourse {
    float: left;
    width: 320px;
    margin-top: 15px;
    padding-left: 10px;
    padding-right: 10px;
}

#hotTeachers {
    float: left;
    width: 320px;
    padding-left: 10px;
    padding-right: 10px;
}

#hotOrganizations {
    float: left;
    height: 320px;
    width: 320px;
    padding-left: 10px;
    padding-right: 10px;
}

#courseRight .hotTittle {
    float: left;
    height: 30px;
    width: 100%;
    color: #FFF;
}

#courseRight .hotTittle .innerDiv {
    float: left;
    width: 100%;
    background-color: rgb(53, 171, 211);
    font-family: "微软雅黑", "Lucida Sans Unicode", "Lucida Grande", sans-serif;
}

#courseRight .hotTittle .leftWords {
    display: block;
    float: left;
    font-size: 14px;
    line-height: 20px;
    margin-left: 3px;
}

#courseRight .hotTittle .rightWords {
    font-size: 14px;
    line-height: 20px;
    color: #FFF;
    float: right;
    margin-right: 7px;
}

#courseRight .hotList {
    /*width:100%; */
    border-bottom: 1px solid rgb(70, 190, 250);
    border-left: 1px solid rgb(70, 190, 250);
    border-right: 1px solid rgb(70, 190, 250);
}

#courseRight .hotList ul {
    display: block;
    float: left;
    width: 100%;
}

#courseRight .hotList ul li {
    list-style-type: none;
    float: left;
    display: block;
    width: 130px;
    margin-left: 20px;
    margin-bottom: 10px;
    font-family: "微软雅黑", "Lucida Sans Unicode", "Lucida Grande", sans-serif;
    font-size: 14px;
}

#courseRight .hotList ul li span {
    display: block;
    float: left;
    width: 100%;
    text-align: center;
    color: #777;
}

#newCourses {
    float: left;
}

#newCourses .newCourseTittle {
    float: left;
    height: 35px;
    width: 680px;
}

#newCourses .newCourseTittle .innerDiv .leftWords {
    display: block;
    float: left;
    color: #FFF;
    font-size: 18px;
    font-family: "微软雅黑", "Lucida Sans Unicode", "Lucida Grande", sans-serif;
    line-height: 24px;
    margin-left: 5px;
}

#newCourses .newCourseTittle .innerDiv .rightWords {
    float: right;
    display: block;
    font-size: 16px;
    color: #FFF;
    margin-top: 1px;
    margin-right: 10px;
    font-family: "微软雅黑", "Lucida Sans Unicode", "Lucida Grande", sans-serif;
}

#newCourses .newCourseTittle .innerDiv {
    float: left;
    margin-right: 10px;
    margin-top: 9px;
    padding-top: 1px;
    border-top-width: 1px;
    border-top-style: solid;
    border-top-color: #CCC;
    width: 660px;
    background-color: #35ABD3;
}

#newCourses .newCourseList {
    width: 680px;
    float: left;
}

#newCourses .newCourseList .pagination {
    float: left;
    clear: both;
    width: 100%;
}

.advSearchButton span {
    font-family: "微软雅黑", "Lucida Sans Unicode", "Lucida Grande", sans-serif;
    color: #FFF;
    font-size: 18px;
    line-height: 32px;
    font-weight: bolder;
}

#courseRight .rightVideoBorder {
    float: left;
    width: 124px;
    height: 93px;
    border: solid 1px #ccc;
    background: #fff;
    padding: 2px;
    box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
}

#courseRight .rightVideoBorder img {
    width: 124px;
    height: 93px;
    border: none;
}

#courseRight .videoLi {
    display: block;
    float: left;
    width: 130px;
    height: 144px;
    text-align: center;
    overflow: hidden;
}

#courseright .videoLi .videoWords {
    display: block;
    float: left;
    font-size: 14px;
    line-height: 22px;
    overflow: hidden;
    height: 44px;
    width: 124px;
    background: #9acd32
}
</style>
<!--高级搜索Div的样式和js--->
<style type="text/css">
    * {
        margin: 0px;
        padding: 0px;
    }

    #courseSearch .advanceTittle {
        display: block;
        float: left;
        text-align: left;
    }

    .advanceTittle #advanceExtendOrClose {
        font-family: "宋体", "Microsoft Yahei", "Lucida Sans Unicode", "Lucida Grande", sans-serif;
        color: #999;
        font-size: 16px;
        cursor: pointer;
        float: left;
        /*clear: right;*/
        margin-left: 5px;
        margin-top: 26px;
        text-decoration: underline;
        margin-right: 8px;
    }

    .advanceTittle #advanceExtendOrClose:hover {
        color: #099
    }

    #normalSearch {
        display: block;
        text-align: left;
        float: left;
        width: 530px;
    }

    #searchDiv {
        display: block;
        width: 100%;
        float: left;
        overflow: hidden;
        color: #666;
        font-family: "宋体", "Microsoft Yahei", "Lucida Sans Unicode", "Lucida Grande", sans-serif;
        font-size: 18px;
    }

    #searchDiv .searchTip {
        width: 660px;
        display: block;
        float: left;
    }

    #searchDiv #advanceExtendDiv .searchTip .normalTip {
        display: block;
        width: 560px;
        float: left;
        /*clear: both;*/
        font-size: 16px;
        color: #444;
        margin-bottom: 8px;
        text-align: left;
    }

    #searchDiv form table {
        width: 100%;
    }

    .insertedWords {
        font-size: 18px;
        color: #444;
    }

    #searchDiv .advanceExtendDiv {
        width: 100%;
        display: none;
        float: left;
        padding-left: 60px;
    }

    #searchDiv #advanceExtendDiv form table tr {
        height: 28px;
    }

    #searchDiv #advanceExtendDiv form table {
        width: 100%;
    }

    #searchDiv #advanceExtendDiv form table tr td .inputField {
        border: 1px solid #CCEBFF;
        height: 26px;
        width: 180px;
    }
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

    var newLines = new Array();
    var parent;

    $(document).ready(function () {

        $("#addnewline").click(function () {
            addRow();
        });

        $("#deleteline").click(function () {
            deleteRow($(this));
        });

        $("#resetall").click(function () {
            clearNewLines();
        });

        $("#advanceExtendOrClose").click(function () {
            switchSearchFunction()
        });
        <%--<s:if test="searchTyp == \"adv\"">--%>
        <%--switchSearchFunction();--%>
        <%--</s:if>--%>


    })

    function switchSearchFunction() {
        $("#advanceExtendDiv").toggle();
        $("#normalSearch").toggle();
        if ($("#advanceExtendOrClose").text() == "<s:text name='course.selection.advSearch'/>") {
            $("#advanceExtendOrClose").text("<< <s:text name='course.selection.rollup'/>");
            $("#advanceExtendOrClose").css("margin-left", "45px");
        } else {
            $("#advanceExtendOrClose").text("<s:text name='course.selection.advSearch'/>");
            $("#advanceExtendOrClose").css("margin-left", "5px");
        }
    }

    function clearNewRules() {
        alert(parent.innerHTML);
        for (i = 0; i < newLines.length; i++) {
            parent.removeChild(newLines[i]);
            newLines.remove(newLines[i]);
            alert(newLines.length);
        }
    }


    function addRow() {
        var table = document.getElementById("tbody");
        var tr = document.createElement("tr");
        var td0 = document.createElement("td");
        var td1 = document.createElement("td");
        var td2 = document.createElement("td");
        var td3 = document.createElement("td");
        var td4 = document.createElement("td");
        td0.innerHTML = "<select name='dateLogic' id='dateLogic'><option name='dateLogic'><s:property value="%{getText('course.lecturer')}"/></option><option name='dateLogic'><s:property value="%{getText('course.invite.student.email.content.course')}"/></option><option name='dateLogic'><s:property value="%{getText('course.selection.language')}"/></option><option name='dateLogic'><s:property value="%{getText('course.selection.others')}"/></option></select><br/>";
        td1.innerHTML = "<select name='dateLogic' id='dateLogic'><option name='dateLogic'><s:property value="%{getText('course.selection.and')}"/></option><option name='dateLogic'><s:property value="%{getText('course.selection.or')}"/></option></select>";
        td2.innerHTML = "<input type='text' class='inputField' name='fieldset' id='fieldset' size='15'/><s:property value="%{getText('course.selection.in')}"/>";
        td3.innerHTML = "<input type='text' class='inputField' name='keyWord' id='keyWord' size='15'/>||<input type='button' name='deleteline' id='deleteline' onclick='deleteRow(this);' value='<s:text name='course.class.delete'/>' />";
        td4.innerHTML = "";
        tr.appendChild(td0);
        tr.appendChild(td1);
        tr.appendChild(td2);
        tr.appendChild(td3);
        tr.appendChild(td4);
        table.appendChild(tr);
    }

    function deleteRow(obj) {
        var child = obj.parentNode.parentNode;
        child.parentNode.removeChild(child);

    }
    function submitSearchForm() {
        document.getElementById('searchTyp').value = "reg";
        document.getElementById('pagenumForNow').value = 1;
        document.getElementById('postPageForm').submit()

    }
    function submitAdvForm() {
        document.getElementById('searchTyp').value = "adv";
        document.getElementById('pagenumForNow').value = 1;
        document.getElementById('postPageForm').submit();
    }

    $(document).ready(function () {
        <s:if test="courseName==null">
        $("#researchResult").text("<s:text name='usermenu.item.newestcourses'/>");
        </s:if>
        <s:else>
        $("#researchResult").text("<s:text name='course.selection.searchResults'/>");
        </s:else>

        $(".keyWords").keydown(function (e) {
            if (e.keyCode == 13) {
                submitSearchForm();
            }
        });
    });
    function saveReservation(idx, id, tid) {
        if (tid != 0) {
            window.location.href = "initCourseconfirm.html?course.id=" + id;
            return true;
        }
        return false;
    }

</script>
<!----->


<div id="courseContent">
<s:form action="courseSelection" theme="css_xhtml" id="postPageForm">
<s:hidden name="searchTyp" id="searchTyp"/>
<div id="courseLeft">
<div id="courseSearch">
    <div id="normalSearch">
        <s:textfield name="courseName" cssClass="keyWords"/>
            <%--<input name="keyWords" type="text" class="keyWords"/>--%>

        <div class="advSearchButton" onclick="javascript:submitSearchForm()">
            <span><s:property value="%{getText('menu.item.search')}"/> </span>
        </div>
    </div>
    <div class="advanceTittle"><span id="advanceExtendOrClose"><s:property
            value="%{getText('course.selection.advSearch')}"/></span></div>
</div>

<!--高级搜搜Div-->
<div id="searchDiv">
    <div class="advanceExtendDiv" id="advanceExtendDiv">
        <div class="searchTip">
            <p class="normalTip"><s:property value="%{getText('course.selection.tip')}"/></p>
                <%--<p class="warmTip"> <b>温馨提示</b>:点击添加按钮之后可以输入更多搜索选项 </p>--%>
        </div>

        <table border="0" align="left" cellpadding="0" cellspacing="0">
            <tr height="45px">
                <s:hidden name="searchConditions[0].orRelation" value="true"/>
                <s:hidden name="searchConditions[0].operationName" value="like"/>
                <td width="112px"></td>
                <td>
                    <s:select name="searchConditions[0].columnName"
                              list="#{'c.name':getText('course.info.courseName'),'c.teacher.nickName':getText('course.lecturer.nickname'),'c.organization.schoolName':getText('org.nickname'),'c.description':getText('course.content')}"> </s:select>
                </td>
                <td width="84px" class="insertedWords"><s:property
                        value="%{getText('course.selection.contain')}"/></td>
                <td width="200px">
                    <s:textfield name="searchConditions[0].value" type="text" cssClass="inputField" size="13"/>
                </td>
            </tr>

            <tr height="45px">
                <s:hidden name="searchConditions[1].operationName" value="like"/>
                <td width="60px">
                    <s:select name="searchConditions[1].orRelation"
                              list="#{'false':getText('course.selection.and'),'true':getText('course.selection.or')}"> </s:select>
                        <%--<select name="dateLogic">--%>
                        <%--<option name="dateLogic">并且</option>--%>
                        <%--<option name="dateLogic">或者</option>--%>
                        <%--</select>--%>
                </td>
                <td width="80px" align="right">
                    <s:select name="searchConditions[1].columnName"
                              list="#{'c.name':getText('course.info.courseName'),'c.teacher.nickName':getText('course.lecturer.nickname'),'c.organization.schoolName':getText('org.nickname'),'c.description':getText('course.content')}"> </s:select>
                </td>
                <td width="60px" class="insertedWords"><s:property
                        value="%{getText('course.selection.contain')}"/></td>
                <td width="188px">
                    <s:textfield name="searchConditions[1].value" type="text" cssClass="inputField" size="13"/>
                </td>
            </tr>

            <tr height=45px>
                <td width="60px">
                    <s:select name="searchConditions[2].orRelation"
                              list="#{'false':getText('course.selection.and'),'true':getText('course.selection.or')}"> </s:select>
                        <%--<select name="dateLogic" >--%>
                        <%--<option name="dateLogic">并且</option>--%>
                        <%--<option name="dateLogic">或者</option>--%>
                        <%--</select>--%>
                </td>
                <td width="80px">
                    <s:select name="searchConditions[2].columnName"
                              list="#{'c.startDate':getText('course.startDate'),'c.finishDate':getText('lable.course.endtime')}"> </s:select>
                        <%--<select name="courseTime">--%>
                        <%--<option name="courseTime">开始时间</option>--%>
                        <%--<option name="courseTime">结束时间</option>--%>
                        <%--</select>--%>
                </td>
                <td width="60px">
                    <s:select name="searchConditions[2].operationName"
                              list="#{'>':getText('course.selection.earlierThan'),'<':getText('course.selection.laterThan')}"> </s:select>
                        <%--<select name="beforeOrAfter">--%>
                        <%--<option name="beforeOrAfter">早于</option>--%>
                        <%--<option name="beforeOrAfter">晚于</option>--%>
                        <%--</select>--%>
                </td>
                <td width="188px" align="left">
                    <input type="text" class="Wdatepicker inputField" id="courseStartDateCalenderValue"
                           name="searchConditions[2].calendarValue"
                           value="<s:date name='searchConditions.{calendarValue}[2]' format="%{getText('global.display.date')}"/>"
                           size="13"/>
                </td>
            </tr>
            <tr height="45px">
                <td width="60px">
                    <s:select name="searchConditions[3].orRelation"
                              list="#{'false':getText('course.selection.and'),'true':getText('course.selection.or')}"> </s:select>
                        <%--<select name="dateLogic">--%>
                        <%--<option name="dateLogic">并且</option>--%>
                        <%--<option name="dateLogic">或者</option>--%>
                        <%--</select>--%>
                </td>
                <td width="80px">
                    <s:select name="searchConditions[3].columnName"
                              list="#{'zhiQuan':getText('course.zhiquan.fee'),'zhiBi':getText('course.zhibi.fee')}"> </s:select>
                </td>
                <td width="45px">
                    <s:select name="searchConditions[3].operationName"
                              list="#{'>':getText('course.selection.greaterThan'),'<':getText('course.selection.lessThan')}"> </s:select>
                        <%--<select name="beforeOrAfter">--%>
                        <%--<option name="beforeOrAfter">大于</option>--%>
                        <%--<option name="beforeOrAfter">小于</option>--%>
                        <%--</select>--%>
                </td>
                <td width="188px">
                    <s:textfield name="searchConditions[3].doubleValue" type="text" cssClass="inputField"
                                 size="13"/>
                        <%--<input name="conclude" type="text" class="inputField" size="13" /></td>--%>
                </td>
            </tr>

            <tbody id="tbody">

            </tbody>
            <tr height="32px">
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td></td>
                <td>
                    <div class="advSearchButton"
                         onclick="javascript:submitAdvForm()">
                        <span><s:property value="%{getText('menu.item.search')}"/></span></div>
                </td>
                    <%--<td><button id="advSearch"  onclick="javascript:document.getElementById('advSearchForm').submit()" >搜索</button></td>--%>
                <td></td>
            </tr>
        </table>

    </div>
    <!--end of searchExtendDiv-->

</div>
<!--end of searchDiv-->
<!--高级搜搜Div-->


<div id="newCourses">
    <div class="newCourseTittle">
        <div class="innerDiv"><span id="researchResult" class="leftWords"></span> <span class="rightWords"></span></div>
    </div>
    <div class="newCourseList">
        <s:iterator value="courses" status="idx">
            <div class="blogframe">
                <img src="images/blogindex/courseframetop.gif" width="660px"/>

                <div class="video"><s:a action="voaCourseBlog">
                    <s:param name="course.id" value="id"/>
                    <img src="<s:property value="logoUrl"/>" onerror="javascript:this.src='images/nopic.jpg'"
                         title="<s:property value="name"/>"/>
                </s:a></div>
                <h6><span class="courseName"><s:property value="name"/></span>
                    <span id="rate_t_0" class="type2"><span class="seeallclass"></span></span>
                    <span class="seeall">
                            <a onclick="saveReservation(
                                <s:property value="#idx.index"/> ,<s:property value="id"/>,
                                <s:if test="teacher!=null">
                                    <s:property value="teacher.id"/>
                                </s:if>
                                <s:else>0</s:else>);">
                                <input name="" type="button" value="" id="reservationbtn"/></a>
                    </span>
                    <span id="msg0" class="reservationsucceed"></span>
                </h6>

                <div class="courseinfo">
                    <p><s:property value="%{getText('label.online.class.org.name')}"/>：<b><s:a action="orgBlog"><s:param
                            name="org.id"
                            value="organization.id"/><s:property
                            value="organization.schoolName"/></s:a></b></p>

                    <p><s:property value="%{getText('label.forcast.lecturer')}"/>：<b><s:a action="userBlog"><s:param
                            name="user.id" value="teacher.id"/><s:property
                            value="teacher.nickName"/></s:a></b></p>

                    <p><s:property value="%{getText('label.online.class.startdate')}"/>：<b><s:date name="startDate"
                                                                                                   format="%{getText('dateformat')}"/></b>
                    </p>
                </div>
                <div class="courseinfo">
                    <p><s:property value="%{getText('course.bookFee')}"/>：<b><s:property
                            value="charges"/>&nbsp;<s:property value="%{getText('label.zhibi.'+consumptionType)}"/></b>
                    </p>

                    <p><s:property value="%{getText('label.online.class.totalperods')}"/>：<b><s:property
                            value="totalHours"/>&nbsp;<s:property
                            value="%{getText('label.online.class.perods')}"/></b></p>
                </div>
                    <%--<div class="courseinfo">--%>
                    <%--<p><s:property value="%{getText('label.forcast.enrollment')}"/>：<b><s:property--%>
                    <%--value="observationNum"/></b> 人</p>--%>

                    <%--<p><s:property value="%{getText('label.forcast.subscriber')}"/>：<b><s:property--%>
                    <%--value="buyAgesNum"/></b> 人</p>--%>
                    <%--</div>--%>
                <div class="courseintro"><span class="introduction"></span><strong><s:property
                        value="%{getText('course.intro')}"/>：</strong><s:property
                        value="description"/></div>
                <img src="images/blogindex/courseframebottom.gif" width="660px" class="frame1bottom"/></div>
            <!-- end of blogframe -->

        </s:iterator>
        <div class="pagination">
            <tiles:insertTemplate template="../pagination.jsp">
                <tiles:putAttribute name="pagination" value="${pagination}"/>
            </tiles:insertTemplate>
        </div>
    </div>

</div>
</div>
</s:form>

<div id="courseRight">
    <div id="hotCourse">
        <div class="hotTittle">
            <div class="innerDiv"><span class="leftWords"><s:property value="%{getText('course.hottest')}"/></span><span
                    class="rightWords"><s:property value="%{getText('others.more')}"/></span></div>
        </div>
        <div class="hotList">
            <ul>
                <s:iterator value="hotCourse">
                    <li class="videoLi">
                        <s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>
                            <div class="rightVideoBorder"><img
                                    src="<s:property value="logoUrl"/>"
                                    onerror="javascript:this.src='images/nopic.jpg'"
                                    title="<s:property value="name"/>"/>
                            </div>
                        </s:a>
                        <span class="videoWords"><s:property value="name"/></span></li>
                    </li>

                </s:iterator>
            </ul>
        </div>
    </div>
    <div id="hotTeachers">
        <div class="hotTittle">
            <div class="innerDiv"><span class="leftWords"><s:property
                    value="%{getText('teacher.hottest')}"/></span><span class="rightWords"><s:property
                    value="%{getText('others.more')}"/></span></div>
        </div>
        <div class="hotList">
            <ul>
                <s:iterator value="hotTeacher">
                    <li class="videoLi">
                        <s:a action="userBlog"><s:param name="user.id" value="id"></s:param>
                            <div class="rightVideoBorder"><img
                                    src="<s:property value= "pic"/>"
                                    onerror="javascript:this.src='images/nopic.jpg'"
                                    title="<s:property value="nickName"/>"/></div>
                        </s:a>
                        <span class="videoWords"><s:property value="nickName"/></span></li>

                    </li>

                </s:iterator>
            </ul>
        </div>
    </div>

    <%--<div id="hotOrganizations">--%>
    <%--<div class="hotTittle">--%>
    <%--<div class="innerDiv"><span class="leftWords"><s:property value="%{getText('org.hottest')}"/></span><span--%>
    <%--class="rightWords"><s:property value="%{getText('others.more')}"/></span></div>--%>
    <%--<div class="hotList">--%>
    <%--<ul>--%>
    <%--<s:iterator value="hotCourse">--%>
    <%--<li class="videoLi"><s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>--%>
    <%--<div class="rightVideoBorder"><img--%>
    <%--src="<s:property value="logoUrl"/>"--%>
    <%--onerror="javascript:this.src='images/nopic.jpg'"--%>
    <%--alt="courseIcon"/></div>--%>
    <%--</s:a>--%>
    <%--<span class="videoWords"><s:property value="name"/></span></li>--%>

    <%--</li>--%>

    <%--</s:iterator>--%>
    <%--&lt;%&ndash;<li><a href="#"><img src="images/blogindex/courseIcon.png" width="130" height="98"&ndash;%&gt;--%>
    <%--&lt;%&ndash;alt="courseIcon"/></a> <span><s:property value="%{getText('org.tittle')}"/></span></li>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<li><a href="#"><img src="images/blogindex/courseIcon.png" width="130" height="98"&ndash;%&gt;--%>
    <%--&lt;%&ndash;alt="courseIcon"/></a> <span><s:property value="%{getText('org.tittle')}"/></span></li>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<li><a href="#"><img src="images/blogindex/courseIcon.png" width="130" height="98"&ndash;%&gt;--%>
    <%--&lt;%&ndash;alt="courseIcon"/></a> <span><s:property value="%{getText('org.tittle')}"/></span></li>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<li><a href="v"><img src="images/blogindex/courseIcon.png" width="130" height="98"&ndash;%&gt;--%>
    <%--&lt;%&ndash;alt="courseIcon"/></a> <span><s:property value="%{getText('org.tittle')}"/></span></li>&ndash;%&gt;--%>
    <%--</ul>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
</div>
</div>
