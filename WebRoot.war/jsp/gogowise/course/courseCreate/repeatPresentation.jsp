<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/course/courseCreation_js.jsp" %>
<link href="css/courseCreation.css" rel="stylesheet" type="text/css"/>

<div class="course_create_container">
    <div class="create_tabs">
        <ul>
            <div class="left_border"></div>
            <li>1、<s:property value="%{getText('title.select.type')}"/></li>
            <li>2、<s:property value="%{getText('titie.info.course')}"/></li>
            <li>3、<s:property value="%{getText('title.info.class')}"/></li>
            <li class="stand_out">4、<s:property value="%{getText('title.course.confirm')}"/></li>
            <div class="right_border"></div>
        </ul>
    </div>
    <div class="create_content">
        <div class="content_course_class_info">
            <h3 id="share_title"><s:property value="%{getText('course.info')}"/></h3>
            <ul>
                <li><span class="blue_tittle"><s:property value="%{getText('course.info.courseName')}"/>：</span><span
                        class="orangeWords"><s:property value="course.name"/></span></li>
                <li><span class="blue_tittle"><s:property value="%{getText('lable.course.date')}"/>：</span><span
                        class="orangeWords"><s:date name="course.startDate"
                                                    format="%{getText('global.display.date.cn')}"/></span></li>

                <li><span class="blue_tittle"><s:property
                        value="%{getText('course.info.of.student.type')}"/>：</span><span class="orangeWords"><s:property
                        value="course.studentType"/></span></li>
                <li><span class="blue_tittle"><s:property
                        value="%{getText('course.info.of.teaching.book')}"/>：</span><span
                        class="orangeWords"><s:property value="course.courseTeachingBook"/></span></li>
                <li><span class="blue_tittle"><s:property
                        value="%{getText('course.info.of.course.type')}"/>：</span><span class="orangeWords"><s:property
                        value="%{getText('course.type.'+course.courseType)}"/></span></li>

                <li><span class="blue_tittle"><s:property value="%{getText('label.online.class.totalperods')}"/>：</span><span
                        class="orangeWords"><s:property value="course.totalHours"/></span></li>
                <li><span class="blue_tittle"><s:property value="%{getText('label.online.class.tutor.price')}"/>：</span><span
                        class="orangeWords"><s:property value="course.charges"/>&nbsp;<s:property
                        value="%{getText('label.zhibi.'+course.consumptionType)}"/></span></li>
                <li><span class="blue_tittle"><s:property value="%{getText('label.forcast.lecturer')}"/>：</span><span
                        class="orangeWords">
            <s:if test="course.teacherEmail != null">
                <s:property value="course.teacherEmail"/>
            </s:if>
            <s:else>
                <s:property value="course.teacher.email"/>
            </s:else>
        </span></li>
            </ul>
            <div class="course_logo"><span class="blue_tittle"><s:property
                    value="%{getText('course.logo')}"/></span><br/><br/>
                <img id="share_pic" src="<s:property value="course.logoUrl"/>"/>
            </div>
            <s:if test="courseInviteStudents.size != 0">
                <div class="invited_students"><span class="blue_tittle"><s:property
                        value="%{getText('course.invite.student.list')}"/>：</span><span class="orangeWords"><s:iterator
                        value="courseInviteStudents"><s:property value="invitedStudentEmail"/>;</s:iterator></span>
                </div>
            </s:if>
            <div class="course_intro"><span class="blue_tittle"><s:property
                    value="%{getText('course.info.description')}"/>：</span><br/><span class="orangeWords"
                                                                                      id="share_desc"><s:property
                    value="course.description"/></span></div>
            <h3><s:property value="%{getText('course.classes.info')}"/></h3>

            <div class="info_class">
                <table>
                    <tr>
                        <td class="htitle"><s:property value="%{getText('lable.course.no')}"/></td>
                        <td class="htitle"><s:property value="%{getText('lable.course.nickname')}"/></td>
                        <td class="htitle"><s:property value="%{getText('lable.course.starttime')}"/></td>
                        <td class="htitle"><s:property value="%{getText('label.lastingtime')}"/></td>
                    </tr>
                    <tbody>
                    <s:iterator value="course.classes">
                        <tr>
                            <td><s:property value="name"/></td>
                            <td><s:property value="nickName"/></td>
                            <td><s:date name="date" format="%{getText('global.display.hour.minute')}"/></td>
                            <td><s:property value="duration"/></td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
            <div class="fabu_div">
                <span class="fabu_btn" onclick="fabu(<s:property value="course.id"/>);"><s:property
                        value="%{getText('course.maintenance.confirm')}"/></span>
            </div>
      <span style="display: none;" id="share_link">
          http://www.gogowise.com/voaCourseBlog.html?course.id=<s:property value="course.id"/>
      </span>

            <div class="share_div">
                <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare" data="">
                    <span style="float:left;line-height: 30px;margin-left: 10px;"><s:property
                            value="%{getText('label.shared.with')}"/>：</span>
                    <a class="bds_qzone">QQ空间</a>
                    <a class="bds_tsina">新浪微博</a>
                    <a class="bds_tqq">腾讯微博</a>
                    <a class="bds_renren">人人网</a>
                    <a class="bds_fbook">Facebook</a>
                    <a class="bds_twi">Twitter</a>
                    <span class="bds_more"><s:property value="%{getText('others.more')}"/></span>
                </div>
                <script type="text/javascript" id="bdshare_js" data="type=tools"></script>
                <script type="text/javascript" id="bdshell_js"></script>
                <script type="text/javascript">
                    var share_title = document.getElementById("share_title").innerText + "@GoGoWise" + "  <s:text name="message.course.wonderful"/>";
                    var share_pic = document.getElementById("share_pic").src;
                    var share_comment = "<s:text name="message.course.wonderful"/>";
                    var share_desc = document.getElementById("share_desc").innerText;
                    var share_link = document.getElementById("share_link").innerText;
                    var _data = "{'text':'" + share_title + "'," +
                            "'comment':'" + share_comment + "'," +
                            "'url':'" + share_link + "'}";

                    document.getElementById("bdshare").setAttribute("data", _data);


                    var bds_config = {'bdText': share_title,
                        'bdDesc': share_desc, //qq，开心
                        'bdComment': share_comment,
                        'bdPopTitle': 'GoGoWise Share',
                        'bdPic': share_pic
                    };
                    document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
                </script>
            </div>
        </div>
    </div>
    <div class="direction_wrap">
        <input type="button" class="act_btn back" onclick="goback2repeatClass();"
               value="<s:property value="%{getText('page.previous')}"/>"/>
    </div>
    <%--<div class="create_back_forth"> <span name="" class="_go_back" onclick="goback2repeatClass();"></span> <span name="" class="_go_forth" onclick="fabu(<s:property value="course.id"/>);"></span> </div>--%>
</div>