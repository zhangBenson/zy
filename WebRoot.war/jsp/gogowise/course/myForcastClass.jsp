<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/recommendForFriend_js.jsp" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%--<link href="css/course/myForcastClass.css" rel="stylesheet" type="text/css"/>--%>
<link href="css/user/user_center_list.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>

<style>
    .col-sm-4{
        position:relative;min-height:1px;padding-right:10px;padding-left:0px;float:left;width:46%;
        border-left: 1px;
    }
    .pull-left{float:left!important}
    .pull-left2{ float:right!important}


    .lessonOrange,.lessonGreen
    {
        background-color: #e65c18;
        border-radius: 6px;
        font-family: Arial, Helvetica, sans-serif;
        text-align: center;
        background-repeat: no-repeat;
        width: 50px;
        height: 50px;
        text-align: center;
        padding-top: 5px;
        color: #fff;
        font-size: 16px;
    }

    .lessonOrange{
        background-color: #e65c18;
    }
    .lessonGreen
    {
        background-color: #6ab600;
    }

    .lessonName
    {
        padding-top: 4px; font-size: 12px;font-family: Arial, Helvetica, sans-serif;color: #999;
        width: 130px;word-wrap:break-word;padding-left: 5px;text-align: center;height: 40px;overflow: hidden;
    }

    .lessonTime
    {
        text-align: center;height: 6px;font-family: Arial, Helvetica, sans-serif;font-size: 12px;color: #999;
    }

    .lessonOrange div,.lessonGreen div
    {
        font-size: 12px;
    }

    .makeVideo, .viewVideo{
        width: 90px;
        height: 70%;
        margin-bottom: 20%;
        margin-top: 5%;
    }
    .makeVideo a{
        color: red;
    }
    .viewVideo{
        color: #006400;
    }

</style>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li class="stand_out">
            <a href="javascript:;"><s:property value="%{getText('usermenu.item.my.created.courses')}"/></a>
        </li>
        <li class="">
            <a href="myRegistration.html"><s:property value="%{getText('usermenu.item.my.reged.courses')}"/></a>
        </li>
        <%--<li class="">
            <a href="createCourseAllInOne.html"><s:property value="%{getText('usermenu.item.createcourse')}"/></a>
        </li>--%>
    </ul>
</div>
<div class="mf_2">
    <%--<div class="overview cf">--%>
        <%--<div class="sub_info fl">--%>
            <%--<p class="number">102<span>学生</span></p>--%>

            <%--<p class="describe">上过我的课程</p>--%>
        <%--</div>--%>
        <%--<div class="sub_info sub_info_center fl">--%>
            <%--<p class="number"><s:property value="totalNumOfViewVideo"/>172<span><s:property value="%{getText('the.static.times')}"/></span></p>--%>

            <%--<p class="describe"><s:property value="%{getText('the.num.of.onlive.record.open.times')}"/></p>--%>
        <%--</div>--%>
        <%--<div class="sub_info fl">--%>
            <%--<p class="number"><s:property value="totalNumOfLiveChannels"/>34<span><s:property value="%{getText('the.static.terms')}"/></span></p>--%>

            <%--<p class="describe">课程总数</p>--%>
        <%--</div>--%>
    <%--</div>--%>
    <s:iterator value="courses" status="idx">
        <div class="course_item">
            <p class="course_logo"> <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>" /></a></p>
            <div class="infoWrap">
                <h4><a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"><s:property value="name"/></a></h4>
                <p class="date"><s:date name="startDate" format="%{getText('dateformat')}"/></p>
                <p class="maintenance">
                    <s:if test="personalTeacher!=null">
                            <s:if test="teachingNum==1"><s:property value="%{getText('label.tutor.1to1')}"/></s:if>
                            <s:if test="teachingNum==2"><s:property value="%{getText('label.tutor.1to2')}"/></s:if>
                            <s:if test="teachingNum==3"><s:property value="%{getText('label.tutor.1to3')}"/></s:if>
                            <s:if test="teachingNum==4"><s:property value="%{getText('label.tutor.1to4')}"/></s:if>
                    </s:if>
                    <s:else>
                        <s:if test="opened"><s:property value="%{getText('label.online.class.public')}"/></s:if>
                        <s:else>
                            <s:if test="teachingNum==1"><s:property value="%{getText('label.tutor.1to1')}"/></s:if>
                            <s:if test="teachingNum==2"><s:property value="%{getText('label.tutor.1to2')}"/></s:if>
                            <s:if test="teachingNum==3"><s:property value="%{getText('label.tutor.1to4')}"/></s:if>
                        </s:else>
                    </s:else>
                    <strong>•</strong>
                    <a class="upcoming_class" href="javascript:;" >[<s:property value="%{getText('span.ready.course')}"/>]</a>
                    <strong>•</strong>
                    <s:property value="charges"/>&nbsp;<s:property value="%{getText('label.zhibi.'+consumptionType)}"/>
                    <strong>•</strong>
                    <s:property value="totalHours"/>&nbsp;<s:property value="%{getText('label.online.class.perods')}"/>
                    <strong>•</strong>
                    <s:property value="courseStudentsNum"/><s:property value="%{getText('course.blog.purchase.num')}"/>
                </p>

                <p class="details cf">
                    <span class="fl"><s:property value="description"/></span>
                </p>

                <p class="time">
                <%--<a class="manage_course" href="initCourseInfoModify.html?course.id=<s:property value="id"/>"><s:property value="%{getText('my.forcast.course.info.manage')}"/></a>--%>
                <a class="manage_course" href="maintenanceCourse.html?course.id=<s:property value="id"/>"><s:property value="%{getText('my.forcast.course.info.manage')}"/></a>
                <a class="manage_course" id="courseRecommend<s:property value="#idx.index"/>" href="#recommdatepanel<s:property value="#idx.index"/>"><s:property value="%{getText('recommend.course')}"/></a>
                <%--<a class="manage_course" id="courseNewEvents<s:property value="#idx.index"/>" href="newEventsManage.html?course.id=<s:property value="id"/>"><s:property value="%{getText('course.new.events.management')}"/></a>--%>
                <%--<a class="makeVideos" id="makeVideos<s:property value="#idx.index"/>"  href="javascript:;"><s:property value="%{getText('course.makeVideos')}"/></a>--%>
                <a class="makeVideos"  href="/makeCourseVideo.html?course.id=<s:property value="id"/>"><s:property value="%{getText('course.makeVideos')}"/></a>
                <a class="manage_course" id="" href="uploadCourseMaterial.html?course.id=<s:property value="id"/>"><s:property value="%{getText('course.resource.upload')}"/></a>
                <%--<a class="manage_course" id="" href="uploadCourseMaterial.html?course.id=<s:property value="id"/>">Upload Questions</a>--%>
            </p>
            </div>

            <div class="classintro">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <s:iterator value="forcastClasses">
                        <tr>
                            <td class="td1"><s:property value="name"/></td>
                            <td><b><s:property value="nickName"/></b></td>
                            <td><s:property value="%{getText('lable.course.starttime')}"/>：<b><s:date name="date" format="%{getText('dateformat.forclass')}"/></b></td>
                            <td><s:property value="%{getText('lable.course.endtime')}"/>：<b><s:date name="finishDate" format="%{getText('dateformat.forclass')}"/></b></td></tr></s:iterator>
                </table>
            </div>

            <%--<div class="allClassesInfo">--%>
                <%--&lt;%&ndash;<link href="/css/course/gogowise.css" rel="stylesheet" type="text/css"/>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<link rel="stylesheet" href="/css/course/bootstrap.min.css">&ndash;%&gt;--%>
                <%--<table width="100%" border="0" cellspacing="0" cellpadding="0">--%>
                    <%--<s:iterator value="classes" status="status">--%>
                        <%--<s:if test="#status.index<6">--%>
                            <%--<s:if test="#status.index % 2 == 0"><div class="row"></s:if>--%>

                        <%--<div class="col-sm-4" >--%>
                            <%--<div class="pull-left">--%>
                                <%--<s:if test="record">--%>
                                <%--<div class="lessonGreen" onclick="enterPlayerRoom(<s:property value="id"/>)" style="cursor:pointer;">--%>
                                    <%--</s:if>--%>
                                    <%--<s:else>--%>
                                    <%--<div class="lessonOrange">--%>
                                        <%--</s:else>--%>
                                        <%--<span><s:property value="#status.index+1"/></span><div>Lesson</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="pull-left">--%>
                                    <%--<div class="lessonName"><s:property value="nickName"/></div>--%>
                                    <%--<div class="lessonTime"><s:date name="date" format="%{getText('dateformat.forclass')}"/></div>--%>
                                <%--</div>--%>
                                <%--<div class="pull-left2">--%>
                                    <%--<div class="makeVideo">--%>
                                        <%--<a href="javascript:getVideoUrl('<s:property value="id"/>','<s:property value="teachingNum"/>');">--%>
                                        <%--Make Video--%>
                                    <%--</a></div>--%>
                                    <%--<s:if test="record">--%>
                                    <%--<div class="viewVideo"><a href="javascript:enterPlayerRoom('<s:property value="id"/>');">View Video</a></div>--%>
                                    <%--</s:if>--%>
                                <%--</div>--%>
                            <%--</div>--%>

                            <%--<s:if test="#status.index % 2 == 1||#status.last"></div><div style="clear: both;height: 10px;"></div></s:if>--%>
                        <%--</s:if>--%>
                    <%--</s:iterator>--%>
                <%--</table>--%>
            <%--</div>--%>
        <%--</div>--%>


        <%-- 推荐Div --%>
        <div style="display: none;">

              <div id="recommdatepanel<s:property value="#idx.index"/>" style="font-size: 16px;color:#666;">

                <div id="recommendMsg<s:property value="#idx.index"/>" style="float:left;margin-top: 3px;color:red;font-size: 12px;"></div>
                <form id="recommendCourseForm<s:property value="#idx.index"/>" name="recommendCourseForm<s:property value="#idx.index"/>">
                    <input type="hidden" name="course.id" value="<s:property value="id"/>"/>
                    <div class="recommdatepanel_inner">
                        <table>
                            <tr><td></td><td class="add_friend_email" onclick="addFriendEmail(<s:property value="#idx.index"/>);"><s:property value="%{getText('button.add.email.friend')}"/></td></tr>
                            <tr><td width="80px" align="right" valign="top"><s:property value="%{getText('label.email.friend')}"/>&nbsp;</td><td><input class="recommdate_email" value="" type ="text" name="emails" onblur="checkEmail(this,<s:property value="#idx.index"/>);"/></tr>
                            <tbody class="added_line" id="added_line<s:property value="#idx.index"/>"></tbody>
                            <tr><td align="right" valign="top"><s:property value="%{getText('button.message')}"/>&nbsp;</td><td><s:textarea cssClass="recommdate_message" placeholder="%{getText('message.course.wonderful')}" name="comments"></s:textarea></td></tr>
                            <tr><td></td><td><input class="recommdate_submit" type="button" onclick="checkCourseRecommend(<s:property value="#idx.index"/>);" value="<s:property value="%{getText('button.submit')}" />" />&nbsp;&nbsp;<span class="recommdate_close recommdatebtn" onclick="$.fancybox.close();"><s:property value="%{getText('button.close')}"/></span>&nbsp;&nbsp;<div id="recommend_message<s:property value="#idx.index"/>"></div></td></tr>
                        </table>
                    </div>
                </form>
               </div>

        </div>

    </s:iterator>
    <tiles:insertTemplate template="../pagination.jsp">
           <tiles:putAttribute name="pagination" value="${pagination}"/>
    </tiles:insertTemplate>

</div>

<script type="text/javascript">
     var friendEmail="<s:text name='label.email.friend'/>";
     var  del = "<s:text name='course.class.delete'/>";
     var right_div = "<div class='tip_right'></div>";
    $(function(){
        $(".upcoming_class").click(function(){
            $(".classintro").not($(this).parents("div.course_item").children()).hide();
            $(this).parents("div.course_item").children("div.classintro").slideToggle(500);
        });

        $(".makeVideos").click(function(){
            $(".allClassesInfo").not($(this).parents("div.course_item").children()).hide();
            $(this).parents("div.course_item").children("div.allClassesInfo").slideToggle(500);
        });
    });

    <s:iterator value="courses" status="idx">
      $("#courseRecommend<s:property value="#idx.index"/>").fancybox({});
    </s:iterator>

      function checkCourseRecommend(index){
//        alert( $("input[name=emails]",document.forms['recommendCourseForm'+index]).size());
        <%--for(var i=0;i<$(document.getElementsByName("emails")).size();i++){--%>

            <%--var content = $($(document.getElementsByName("emails"))[i]).attr('value');--%>
            <%--var reMail = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;--%>
            <%--var emailContent = content.replace(/(^\s*)|(\s*$)/g, "");--%>
            <%--$("#recommendMsg").text("");--%>
            <%--if(emailContent!=""){--%>
                 <%--if (!reMail.test(emailContent)) {--%>
                    <%--$("#recommendMsg").text("<s:text name='course.email.input.error'/>");--%>
                    <%--return false;--%>
                 <%--}--%>
                  <%--var mySession = "<s:property value="#session.email"/>";--%>
                  <%--if (emailContent == mySession) {--%>
                       <%--$("#recommendMsg").text("<s:text name='course.email.input.myself'/>");--%>
                       <%--return false;--%>
                  <%--}--%>
            <%--}else{--%>
                  <%--$("#recommendMsg").text("<s:text name='emailEmpty'/>");--%>
                  <%--return false;--%>
            <%--}--%>
        <%--}--%>
        var vas = $("#recommendCourseForm"+index).serialize();
        $.post("recommendCourse.html",vas);
        $("#recommend_message"+index).html(right_div+"<s:text name='course.recommend.success'/>");
        $("#recommend_message"+index).css('color','green');
        window.setTimeout("$.fancybox.close();","1500");
        return true;
    }

     function enterPlayerRoom(courseClassId){
//        if(validateLogo()){
         window.location.href = "playerClass.html?courseClass.id="+courseClassId;
//        }
     }

     function getVideoUrl(cid,type){
         if(type == 1){
             window.location.href = "openClassSession.html?courseClass.id="+cid;
         }
         if(type == 2){
             window.location.href = "one2twoSession.html?courseClass.id="+cid;
         }
         if(type == 3){
             window.location.href = "one2threeSession.html?courseClass.id="+cid;
         }
         if(type == 4){
//           window.location.href = "one2manySession.html?courseClass.id="+cid;
             window.location.href = "lecturerClass.html?courseClass.id="+cid;
         }
     }

</script>