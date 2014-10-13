<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/recommendForFriend_js.jsp" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%--<link href="css/course/myRegisteredClass.css" rel="stylesheet" type="text/css"/>--%>
<link href="css/user/user_center_list.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="js/uploadify/swfobject.js"></script>

<div class="mf_1">
    <ul class="sub_nav cf">
        <li>
            <a href="myForcastClass.html"><s:text name="usermenu.item.my.created.courses"/></a>
        </li>
        <li class="stand_out">
            <a href="javascript:;"><s:text name="usermenu.item.my.reged.courses"/></a>
        </li>
        <%--<li class="">
            <a href="createCourseAllInOne.html"><s:text name="usermenu.item.createcourse"/></a>
        </li>--%>
    </ul>
</div>
<div class="mf_2">

    <s:iterator value="courses" status="idx">
        <div class="course_item">
            <p class="course_logo"><a href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                                      title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a>
            </p>

            <div class="course_info infoWrap">
                <h4><a href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                       title="<s:property value="name"/>"><s:property value="name"/></a></h4>

                <p class="teacher"><s:text name="label.forcast.lecturer"/>：<a
                        href="userBlog.html?user.id=<s:property value='teacher.id'/>"
                        title="<s:property value='teacher.nickName'/>"><s:property value='teacher.nickName'/></a></p>

                <p class="date"><s:date name="startDate" format="%{getText('dateformat')}"/></p>

                <p class="maintenance">
                    <s:if test="personalTeacher!=null">
                        <s:if test="teachingNum==1"><s:text name="label.tutor.1to1"/></s:if>
                        <s:if test="teachingNum==2"><s:text name="label.tutor.1to2"/></s:if>
                        <s:if test="teachingNum==3"><s:text name="label.tutor.1to3"/></s:if>
                        <s:if test="teachingNum==4"><s:text name="label.tutor.1to4"/></s:if>
                    </s:if>
                    <s:else>
                        <s:if test="opened"><s:text name="label.online.class.public"/></s:if>
                        <s:else>
                            <s:if test="teachingNum==1"><s:text name="label.tutor.1to1"/></s:if>
                            <s:if test="teachingNum==2"><s:text name="label.tutor.1to2"/></s:if>
                            <s:if test="teachingNum==3"><s:text name="label.tutor.1to4"/></s:if>
                        </s:else>
                    </s:else>
                    <strong>•</strong>
                    <a class="upcoming_class" href="javascript:;">[<s:text name="span.ready.course"/>]</a>
                    <strong>•</strong>
                    <s:property value="charges"/>&nbsp;<s:property value="%{getText('label.zhibi.'+consumptionType)}"/>
                    <strong>•</strong>
                    <s:property value="totalHours"/>&nbsp;<s:text name="label.online.class.perods"/>
                    <strong>•</strong>
                    <s:property value="courseStudentsNum"/><s:text name="course.blog.purchase.num"/>
                </p>

                <p class="details cf">
                    <span class="fl"><s:property value="description"/></span>
                </p>

                <p class="time">
                    <a class="manage_course" href="javascript:;"><s:text name="course.cancel.reg"/></a>
                    <a class="manage_course" id="courseRecommend<s:property value="#idx.index"/>"
                       href="#recommdatepanel<s:property value="#idx.index"/>"><s:text name="label.recommend.course"/></a>
                        <%--<a class="manage_course" id="courseNewEvents<s:property value="#idx.index"/>"  href="#course_newEvent<s:property value="#idx.index"/>"><s:text name="add.course.new.event.in"/></a>--%>
                    <a class="manage_course" <%--id="courseNewEvents<s:property value="#idx.index"/>" --%>
                       href="initAddCourseEvent.html?course.id=5"><s:text name="add.course.new.event.in"/></a>
                    <a href="myCourseQuestionResult.html?course.id=<s:property value="id"/>"><s:text name="course.courseQuestionResult"/></a>
                </p>
            </div>

            <div class="classintro">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <s:iterator value="forcastClasses">
                        <tr>
                            <td class="td1"><s:property value="name"/></td>
                            <td><b><s:property value="nickName"/></b></td>
                            <td><s:text name="lable.course.starttime"/>：<b><s:date name="date"
                                                                                   format="%{getText('dateformat.forclass')}"/></b>
                            </td>
                            <td><s:text name="lable.course.endtime"/>：<b><s:date name="finishDate"
                                                                                 format="%{getText('dateformat.forclass')}"/></b>
                            </td>
                        </tr>
                    </s:iterator>
                </table>
            </div>
        </div>

        <div style="display: none;">
            <div id="course_newEvent<s:property value="#idx.index"/>">
                <form id="course_newEvent_form<s:property value="#idx.index"/>">
                    <input type="hidden" name="course.id" value="<s:property value="id"/>">
                    <li>
                        <div class="highlight">
                            <div class="area">
                                <p><s:text name="new.events.title"/> &nbsp; &nbsp; &nbsp;<span
                                        style="color:red;" id="form_msg<s:property value="#idx.index"/>"></span></p>
                                <input type="text" css="highlight_file" name="courseNewEvent.title"
                                       id="courseNewEvent_title<s:property value="#idx.index"/>"/>
                            </div>
                            <div class="area">
                                <p><s:text name="new.events.logoUrl"/></p>
                                    <%--<input type="file" css="highlight_file" name="" id="courseNewEvent_logUrl"/>--%>
                                <div>
                                    <span class="tip_message" id="logo_tip<s:property value="#idx.index"/>"></span>
                                    <img src="images/defaultImgs/course.gif"
                                         id="logo_preview<s:property value="#idx.index"/>"/>
                                </div>
                                <input type="file" id="courseNewEvent_logo<s:property value="#idx.index"/>"
                                       name="upload" class="highlight_file"/>
                                <input type="hidden" id="courseNewEvent_logoUrl<s:property value="#idx.index"/>"
                                       name="courseNewEvent.logoUrl"/>
                            </div>
                            <div class="area">
                                <p><s:text name="term.info.update.right.there"/><span
                                        class="live_term_highlight_tip"></span></p>
                                <textarea name="courseNewEvent.content"
                                          id="courseNewEvent_content<s:property value="#idx.index"/>"></textarea>
                            </div>
                            <div class="handle">
                                <a href="#fancybox" class="submit"
                                   onclick="submitCourseNewEvent(<s:property value="#idx.index"/>);"><s:text name="term.info.save"/></a>
                                <a href="javascript:;" class="cancel"><s:text name="term.info.reset"/></a>
                            </div>
                        </div>
                    </li>
                </form>
            </div>
        </div>

        <%-- 推荐Div --%>
        <div style="display: none;">

            <div id="recommdatepanel<s:property value="#idx.index"/>" style="font-size: 16px;color:#666;">

                <div id="recommendMsg<s:property value="#idx.index"/>"
                     style="float:left;margin-top: 3px;color:red;font-size: 12px;"></div>
                <form id="recommendCourseForm<s:property value="#idx.index"/>"
                      name="recommendCourseForm<s:property value="#idx.index"/>">
                    <input type="hidden" name="course.id" value="<s:property value="id"/>"/>

                    <div class="recommdatepanel_inner">
                        <table>
                            <tr>
                                <td></td>
                                <td class="add_friend_email"
                                    onclick="addFriendEmail(<s:property value="#idx.index"/>);"><s:text name="button.add.email.friend"/></td>
                            </tr>
                            <tr>
                                <td width="80px" align="right" valign="top"><s:text name="label.email.friend"/>&nbsp;</td>
                                <td><input class="recommdate_email" value="" type="text" name="emails"
                                           onblur="checkEmail(this,<s:property value="#idx.index"/>);"/>
                            </tr>
                            <tbody class="added_line" id="added_line<s:property value="#idx.index"/>"></tbody>
                            <tr>
                                <td align="right" valign="top"><s:text name="button.message"/>&nbsp;</td>
                                <td><s:textarea cssClass="recommdate_message"
                                                placeholder="%{getText('message.course.wonderful')}"
                                                name="comments"></s:textarea></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input class="recommdate_submit" type="button"
                                           onclick="checkCourseRecommend(<s:property value="#idx.index"/>);"
                                           value="<s:text name="button.submit"/>"/>&nbsp;&nbsp;<span
                                        class="recommdate_close recommdatebtn" onclick="$.fancybox.close();"><s:text name="button.close"/></span>&nbsp;&nbsp;
                                    <div id="recommend_message<s:property value="#idx.index"/>"></div>
                                </td>
                            </tr>
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


    <s:iterator value="courses" status="idx">
    $("#courseNewEvents<s:property value="#idx.index"/>").fancybox({});
    $("#courseRecommend<s:property value="#idx.index"/>").fancybox({});
    $("#courseNewEvent_logo<s:property value="#idx.index"/>").uploadify({
        /*注意前面需要书写path的代码*/
        'uploader': 'js/uploadify/uploadify.swf',
        'script': 'utils/uploadFile.html',
        'cancelImg': 'js/uploadify/cancel.png',
        'queueID': 'fileQueue1', //和存放队列的DIV的id一致
        'fileDataName': 'fileupload', //和以下input的name属性一致
        'auto': true, //是否自动开始
        'multi': false, //是否支持多文件上传
        'buttonText': "Upload", //按钮上的文字
        'simUploadLimit': 1, //一次同步上传的文件数目
        'sizeLimit': 2000000, //设置单个文件大小限制
        'queueSizeLimit': 1, //队列中同时存在的文件个数限制
        //'scriptData'     : $("#userInfoForm").serialize(),
//            'fileDataName' : 'uploads',
        'folder': 'upload/file/tmp',
        'fileDesc': 'jpg/gif/jpeg/png/bmp.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
        'fileExt': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.png', //允许的格式
        onComplete: function (event, queueID, fileObj, response, data) {
            var jsonRep = $.parseJSON(response);
            var real_path = fileObj.filePath.replace(fileObj.name, jsonRep.genFileName);
            document.getElementById('courseNewEvent_logoUrl<s:property value="#idx.index"/>').value = jsonRep.genFileName;
            $("#logo_preview<s:property value="#idx.index"/>").attr("src", real_path);
            $("#logo_tip<s:property value="#idx.index"/>").html("<s:text name='image.logo.upload.success'/>");
        },
        onError: function (event, queueID, fileObj) {
            $("#logo_tip").html("file:" + fileObj.name + "upload failed");
        },
        onCancel: function (event, queueID, fileObj) {
            $("#logo_tip").html("cancel " + fileObj.name);
        },
        onUploadStart: function (event, queueID, fileObj) {
            $("#logo_tip").html("<s:text name='image.logo.start.upload'/>");
        }
    });
    </s:iterator>

    function checkFormData(id) {
        var title = $("#courseNewEvent_title" + id).val().replace(/(^\s*)|(\s*$)/g, "");
        var content = $("#courseNewEvent_content" + id).val().replace(/(^\s*)|(\s*$)/g, "");
        if (title.length == 0 || content.length == 0) {
            $("#form_msg" + id).html("<s:text name='write.title.and.main.conent'/>");
            return false;
        }
        return true;
    }

    function submitCourseNewEvent(formID) {
        var formData = $("#course_newEvent_form" + formID).serialize();
        if (checkFormData(formID)) {
            $.post("saveCourseNewEvent.html", formData);
            window.setTimeout("$.fancybox.close();", "1500");
        }
    }

    $(function () {
        $(".upcoming_class").click(function () {
            $(".classintro").not($(this).parents("div.course_item").children()).hide();
            $(this).parents("div.course_item").children("div.classintro").slideToggle(500);
        });
    });

    function checkCourseRecommend(index) {
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
        var vas = $("#recommendCourseForm" + index).serialize();
        $.post("recommendCourse.html", vas);
        $("#recommend_message" + index).html(right_div + "<s:text name='course.recommend.success'/>");
        $("#recommend_message" + index).css('color', 'green');
        window.setTimeout("$.fancybox.close();", "1500");
        return true;
    }
</script>
