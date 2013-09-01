<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/course/courseBlog.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.rate.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.js"></script>

<div class="lcu">
        <div class="lcu_1">
            <h4 id="share_title"><s:property value="course.name"/></h4>
            <span>
               <s:if test="course.organization==null">
                  <s:property value="%{getText('label.tutor.1to'+course.teachingNum)}" />
              </s:if>
              <s:else>
                   <s:property value="%{getText('label.no.public.1to'+course.teachingNum)}"/>
              </s:else>
            </span>
        </div>
        <div class="lcu_2">
            <img id="share_pic" src="<s:property value="course.logoUrl" />" title="<s:property value="course.name"/>" />
        </div>
        <div class="lcu_3">
            <ul>
                <li><s:property value="%{getText('show.bid.price')}"/>：<s:if test="course.charges == 0"><span class="orWord"><s:property value="%{getText('course.without.charges')}"/></span></s:if><s:else><span class="orWord"><s:property value="course.charges" /></span><s:property value="%{getText('course.consumptionType.true')}"/></s:else> &nbsp;&nbsp;
                    <%--|&nbsp;&nbsp;优惠价格：<span class="orWord_large">20</span>&nbsp;知币&nbsp;&nbsp;--%>
                    |&nbsp;&nbsp;<s:property value="%{getText('course.blog.total.terms')}"/>&nbsp;&nbsp;<span class="orWord"><s:property value="courseTermsNum" /></span>&nbsp;&nbsp;<s:property value="%{getText('course.blog.total.terms.tail')}"/></li>
                <li><s:property value="%{getText('course.blog.zonghe.evaluation')}"/>：<span class="type2????"></span><span id="rate_00"><span class="orWord"><s:property value="course.synthetical" /></span></span><s:property value="%{getText('user.evaluate.grade')}"/>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="orWord"><s:property value="courseCommentsNum" /></span>&nbsp;&nbsp;<s:property value="%{getText('course.blog.zonghe.evaluation.num')}"/></li>
                <li>
                    <span class="orWord"><s:property value="course.courseStudentsNum" /></span>&nbsp;&nbsp;<s:property value="%{getText('course.blog.purchase.num')}"/>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="orWord"><s:property value="course.courseRecommendNum" /></span>&nbsp;&nbsp;<s:property value="%{getText('course.blog.recommend.num')}"/>&nbsp;&nbsp;
                    <%--|&nbsp;&nbsp;<span class="orWord">50</span>次浏览--%>
                </li>
                <li>
                    <%-- 如果课程已结束就没有注册课程 --%>
                    <s:if test="!course.courseFinished">
                        <a href="javascript:;" id="register_btn" class="act_btn register_btn"><s:property value="%{getText('label.course.register')}"/></a>
                    </s:if>
                    <a href="#reservepanel" id="reserve_btn" class="act_btn reserve_btn" title="<s:property value="%{getText('button.booking.our.course')}"/>"><s:property value="%{getText('label.course.purchase.new.course')}"/></a>
                    <a href="#recommdatepanel" id="recommend_btn" class="act_btn recommend_btn" title="<s:property value="%{getText('button.recommend.our.course')}"/>"><s:property value="%{getText('label.course.recommend.to.friend')}"/></a>
                </li>
                <div class="save_pop">
                    <div class="save save_done"><s:property value="%{getText('message.change.pwd.success')}"/></div>
                    <div class="save save_fail"><s:property value="%{getText('message.old.pwd.error')}"/></div>
                </div>
            </ul>
        </div>
        <div style="display: none" id="share_desc"><s:property value="course.description"/></div>
        <div class="lcu_4">
            <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare" data="">
                <span style="float:left;line-height: 30px;margin-left: 10px;"><s:property value="%{getText('label.shared.with')}"/>：</span><br/><br/>
                <a class="bds_qzone">QQ空间</a>
                <a class="bds_tsina">新浪微博</a>
                <a class="bds_tqq">腾讯微博</a><br/>
                <a class="bds_renren">人人网</a>
                <a class="bds_fbook">Facebook</a>
                <a class="bds_twi">Twitter</a><br/>
                <span class="bds_more"><s:property value="%{getText('others.more')}"/></span>
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
        </div>
</div>

<%-- 预定Div --%>
<div style="display: none;">
<div id="reservepanel">
    <div id="dateMsg"></div>
    <div class="reservepanel_inner">
        <div class="reserveLeft">
            <table border="0" cellspacing="0" cellpadding="0">
                <s:iterator value="course.classes">
                    <tr>
                        <td width="70px"><s:property value="name"/></td>
                        <td width="430px">&nbsp;&nbsp;<s:property value="nickName"/></td>
                        <td width="140px"><s:property value="%{getText('label.day.of.week.'+weekDay)}"/> &nbsp;&nbsp;<s:date name="date" format="%{getText('dateformat.hour.minute')}"/></td>
                    </tr>
                </s:iterator>
            </table>
        </div>

        <s:form id="courseReservationForm" action="saveCourseReservation" method="POST">
            <s:hidden name="course.id"/>
        <div class="reserveRight">
            <table>
                <tr><td align="right"><s:property value="%{getText('label.anticipated.earliest.time')}"/>&nbsp;</td><td><s:textfield id="courseReservationInitial" name="courseReservation.initial" readonly="true" cssClass="Wdatepicker" onfocus="WdatePicker({lang:'%{getText('language')}',startDate:'%y-%M-01 00:00:00',dateFmt:'%{getText('dateformat.forclass')}',alwaysUseStartDate:true})"/></td>
                    <td align="right"><s:property value="%{getText('label.anticipated.lastest.time')}"/>&nbsp;</td><td><s:textfield id="courseReservationAtLatest" name="courseReservation.atLatest" readonly="true" cssClass="Wdatepicker" onfocus="WdatePicker({lang:'%{getText('language')}',startDate:'%y-%M-01 00:00:00',dateFmt:'%{getText('dateformat.forclass')}',alwaysUseStartDate:true})"/></td>
                </tr>
                <tr><td align="right" valign="top"><s:property value="%{getText('button.message')}"/>&nbsp;</td><td colspan="3"><textarea name="courseReservation.comments" class="reserve_area" placeholder="<s:property value="%{getText('message.no.special.req')}"/>"></textarea></td></tr>
                <tr><td></td><td colspan="3"><input type="button" class="reserve_submit"  value="<s:property value="%{getText('button.book.course')}"/>" onclick="checkCourseReservation();"/>&nbsp;&nbsp;<span class="reserve_close"><s:property value="%{getText('button.close')}"/></span>&nbsp;&nbsp;<span id="reservation_message"></span></td></tr>
            </table>
        </div>
        </s:form>

    </div>
</div>
</div>

<%-- 推荐Div --%>
<div style="display: none;">

      <div id="recommdatepanel">

        <div id="recommendMsg"></div>
        <s:form id="recommendCourseForm" action="recommendCourse" method="POST">
        <s:hidden name="course.id"/>
            <div class="recommdatepanel_inner">
                <table>
                    <tr><td></td><td class="add_friend_email"><s:property value="%{getText('button.add.email.friend')}"/></td></tr>
                    <tr><td width="80px" align="right" valign="top"><s:property value="%{getText('label.email.friend')}"/>&nbsp;</td><td><s:textfield cssClass="recommdate_email" value="" type ="text" name="emails" onblur="checkEmail(this);"/></tr>
                    <tbody class="added_line"></tbody>
                    <tr><td align="right" valign="top"><s:property value="%{getText('button.message')}"/>&nbsp;</td><td><s:textarea cssClass="recommdate_message" placeholder="%{getText('message.course.wonderful')}" name="comments"></s:textarea></td></tr>
                    <tr><td></td><td><input class="recommdate_submit" type="button" onclick="checkCourseRecommend();" value="<s:property value="%{getText('button.submit')}" />" />&nbsp;&nbsp;<span class="recommdate_close recommdatebtn"><s:property value="%{getText('button.close')}"/></span>&nbsp;&nbsp;<span id="recommend_message"></span></td></tr>
                </table>
            </div>
        </s:form>
       </div>

</div>

<div class="lcl">
    <s:hidden value="%{#session.userID}" id="hidSessionId"/>
    <div class="lcl_1"></div>
    <div class="lcl_2">
        <h4><s:property value="%{getText('course.info')}"/></h4>
        <div class="info">
            <h5><s:property value="%{getText('course.info.description')}"/></h5>
            <p class="desc"><s:property value="course.description"/></p>
            <h5><s:property value="%{getText('course.create.info')}"/></h5>
            <table class="tup">
                <tr>
                    <td class="title"><s:property value="%{getText('course.maintenance.coursestyle')}"/></td><td>
                      <s:if test="course.organization==null">
                          <s:property value="%{getText('label.tutor.1to'+course.teachingNum)}" />
                      </s:if>
                      <s:else>
                           <s:property value="%{getText('label.no.public.1to'+course.teachingNum)}" />
                      </s:else></td>
                </tr>
                <tr><td class="title"><s:property value="%{getText('show.total.terms')}"/></td><td><s:property value="courseTermsNum" /></td></tr>
                <tr><td class="title"><s:property value="%{getText('course.this.classes.duration')}"/></td><td><s:property value="course.classesNum" /></td></tr>
                <tr><td class="title"><s:property value="%{getText('course.start.time')}"/></td><td><s:date name="course.startDate" format="%{getText('dateformat')}"/></td></tr>
            </table>
            <s:if test="course.studentType != null || course.studentType !=''">
                <h5><s:property value="%{getText('course.info.of.student.type')}"/></h5>
                <p class="book_recommended">
                    <s:property value="course.studentType"/>
                </p>
            </s:if>
            <h5><s:property value="%{getText('course.total.detail.info')}"/></h5>
            <table class="tdown">
            <tr><td><s:property value="%{getText('lable.course.no')}" /></td><td><s:property value="%{getText('lable.course.nickname')}"/></td><td><s:property value="%{getText('lable.course.starttime')}"/></td><td><s:property value="%{getText('label.lastingtime')}"/></td><td><s:property value="%{getText('course.class.at.weekdays')}"/></td></tr>
            <s:iterator value="course.classes">
            <tr><td><s:property value="name"/></td><td><s:property value="nickName"/></td><td><s:date name="date" format="%{getText('global.display.datetime')}"/></td><td><s:property value="duration" /></td><td><s:property value="%{getText('label.day.of.week.'+weekDay)}" /></td></tr>
            </s:iterator>
            </table>
            <s:if test="course.courseTeachingBook != null || course.courseTeachingBook !=''">
                <h5><s:property value="%{getText('course.info.of.teaching.book')}"/></h5>
                <p class="book_recommended">
                    <%--<a href="http://product.china-pub.com/3662181" target="_blank" title="点击查看书籍详细信息">《Erlang/OTP并发编程实战(首部OTP开发部署实战指南)》</a>&nbsp;&nbsp;&nbsp;&nbsp;--%>
                    <%--<a href="http://product.china-pub.com/3662181" target="_blank" title="点击查看书籍详细信息">《大象——Thinking in UML(第二版)》</a>--%>
                    <a href="javascript:;"><s:property value="course.courseTeachingBook"/></a>
                </p>
            </s:if>
        </div>
    </div>
    <div class="lcl_3"></div>
    <div class="lcl_5">
        <h4><s:property value="%{getText('students.of.this.course')}" /></h4>
        <ul>
            <s:iterator value="course.seniorClassRooms">
                <li><a href="userBlog.html?user.id=<s:property value="student.id"/>" title="<s:property value="student.nickName"/>"><img src="<s:property value="student.pic"/>"/></a></li>
            </s:iterator>
            <s:if test="course.studentNum > 14">
                <li class="li_turn"><a href="javascript:;" class="turn_left" title="<s:property value="%{getText('pagination.last.page')}" />"></a><a href="javascript:;"class="turn_right" title="<s:property value="%{getText('pagination.next.page')}" />"></a></li>
            </s:if>
        </ul>
    </div>
    <div class="lcl_6">
        <h4><s:property value="%{getText('blog.message.board')}" /></h4> <p id="message_area_tip"></p>
        <s:form theme="css_xhtml" name="commentsForm" method="post" id="commentForm">
            <textarea id="message_textarea"></textarea>
            <a href="javascript:;" class="submit_btn" id="message_submit_btn" ><s:property value="%{getText('blog.comments.submit')}" /></a>
        </s:form>
        <div id="message_list_ul">
            <s:iterator value="courseComments" status="idx">
                <p>
                    <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="commenter.id"/><img src="<s:property value="commenter.pic"/>"/></s:a>
                    <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="commenter.id"/><s:property value="commenter.nickName"/></s:a>
                    <span class="span_out">
                        <span class="span1"><s:property value="content"/></span>
                        <s:if test="course.teacher.id == #session.userID && commenter.id != #session.userID">
                            <a class="span2" href="####" onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:property value="%{getText('blog.comments.reply')}"/></a>
                            <a class="span2" href="####" onclick="deleteThisComment(this,<s:property value="id"/>)"><s:property value="%{getText('blog.comments.delete')}"/></a>
                        </s:if>
                        <s:elseif test="course.teacher.id != #session.userID && commenter.id != #session.userID">
                            <a class="span2" href="####" onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:property value="%{getText('blog.comments.reply')}"/></a>
                        </s:elseif>
                        <s:elseif test=" #session.userID == null">
                            <a class="span2" href="####" onclick="replyToComment('<s:property value="commenter.nickName"/>',<s:property value="commenter.id"/>)"><s:property value="%{getText('blog.comments.reply')}"/></a>
                        </s:elseif>
                        <s:else>
                            <a class="span2" href="####" onclick="deleteThisComment(this,<s:property value="id"/>)"><s:property value="%{getText('blog.comments.delete')}"/></a>
                        </s:else>
                        <span class="span3"><s:date name="commentTime" format="%{getText('global.display.datetime')}"/></span>
                    </span>
                </p>
            </s:iterator>
             <s:if test="commentsNum != 0">
                    <s:if test="!commentsNumOverflow">
                        <a href="javascript:;" class="more_or_close" onclick="getMoreComments();"><s:property value="%{getText('blog.comments.more.result')}"/>&gt;&gt;</a>
                    </s:if>
                    <s:elseif test="commentsNumOverflow && commentsNum>=10">
                        <a href="javascript:;" class="more_or_close" onclick="rollBack();">&lt;&lt;<s:property value="%{getText('blog.comments.rollBack')}"/></a>
                    </s:elseif>
             </s:if>
              <script type="text/javascript">
                    function getMoreComments(){
                        $.post("moreCourseComments.html",{'course.id':<s:property value="course.id"/>,'commentsNum':<s:property value="commentsNum"/>},function(data){
                            $("#message_list_ul").html(data);
                        });
                    }

                    function rollBack(){
                        $.post("moreCourseComments.html",{'course.id':<s:property value="course.id"/>,'commentsNum':0},function(data){
                            $("#message_list_ul").html(data);
                        });
                    }
              </script>
        </div>
    </div>
</div>

<div class="lcr">
    <%-- 如果课程的老师存在 则有，不存在则这一块没有 --%>
    <s:if test="course.teacher != null">
    <div class="lcr_2">
        <h5><s:property value="%{getText('label.forcast.lecturer')}"/></h5>
        <p class="pl">
            <a href="userBlog.html?user.id=<s:property value="course.teacher.id"/>" title="<s:property value="course.teacher.nickName"/>"><img src="<s:property value="course.teacher.pic"/>"/></a>
            <a href="userBlog.html?user.id=<s:property value="course.teacher.id"/>" class="nick_name" title="<s:property value="course.teacher.nickName"/>"><s:property value="course.teacher.nickName"/></a>
            <span class="under">
                <%--<span class="orWord">5</span>学生&nbsp;|&nbsp;--%>
                <span class="orWord"><s:property value="course.teacher.fansNum"/></span>&nbsp;&nbsp;<s:property value="%{getText('onlive.fensi')}"/>&nbsp;|&nbsp;<span class="orWord"><s:property value="teacherCourseNum"/></span>&nbsp;&nbsp;<s:property value="%{getText('course.invite.student.email.content.course')}"/></span>
            <s:if test="!focusedCourseTeacher">
                  <a href="javascript:;" id="focus_center" class="focus" onclick="addFocus(<s:property value="user.id"/>);"><s:property value="%{getText('user.add.focus')}"/></a>
            </s:if>
        </p>
        <p class="pr">
            <span><s:property value="course.teacher.selfDescription"/></span>
        </p>
    </div>
    </s:if>

    <%-- 授课老师和开课组织这两个Div根据情况只选择一个 --%>
    <s:if test="course.organization != null">
            <div class="lcr_3">
                <h5><s:property value="%{getText('creation.course.organization')}"/></h5>
                <p class="pl">
                    <a href="orgBlog.html?org.id=<s:property value="course.organization.id"/>" title="<s:property value="course.organization.nickName"/>"><img src="<s:property value="course.organization.logoUrl"/>"/></a>
                    <a href="orgBlog.html?org.id=<s:property value="course.organization.id"/>" class="nick_name" title="<s:property value="course.organization.nickName"/>"><s:property value="course.organization.nickName"/></a>
                    <span class="under">
                        <%--<span class="orWord">5</span>学生&nbsp;|&nbsp;--%>
                        <span class="orWord">5</span><s:property value="%{getText('label.teacher')}"/>&nbsp;|&nbsp;<span class="orWord"><s:property value="orgCourseNum"/></span><s:property value="%{getText('course.invite.student.email.content.course')}"/></span>
                    <%--<a href="javascript:;" class="focus">关注</a>--%>
                </p>
                <p class="pr">
                    <span><s:property value="course.organization.description"/></span>
                </p>
            </div>
    </s:if>
    <div class="lcr_1">
        <h5><s:property value="%{getText('org.or.teacher.another.courses')}"/></h5>
        <ul>
            <s:iterator value="courses2teacher">
                <li><a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a></li>
            </s:iterator>
            <li class="li_turn"><a href="javascript:;" class="turn_left" title="<s:property value="%{getText('pagination.last.page')}" />"></a><a href="javascript:;"class="turn_right" title="<s:property value="%{getText('pagination.next.page')}" />"></a></li>
        </ul>
    </div>
    <div class="lcr_1">
        <h5><s:property value="%{getText('course.hottest')}" /></h5>
        <ul>
            <s:iterator value="courses2teacher">
                <li><a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>"><img src="<s:property value="logoUrl"/>"/></a></li>
            </s:iterator>
            <li class="li_turn"><a href="javascript:;" class="turn_left" title="<s:property value="%{getText('pagination.last.page')}" />"></a><a href="javascript:;"class="turn_right" title="<s:property value="%{getText('pagination.next.page')}" />"></a></li>
        </ul>
    </div>
    <div class="lcr_news">
        <h5><s:property value="%{getText('courses.new.events')}"/></h5>
        <ul class="list03 fblue">
            <s:iterator value="courseNewEvents">
              <li><a href="courseEventRead.html?courseNewEvent.id=<s:property value="id"/>" title="<s:property value="title"/>">&gt;&nbsp;&nbsp;<s:property value="title"/></a></li>
            </s:iterator>
        </ul>
    </div>
    <div class="lcr_news">
        <h5><s:property value="%{getText('label.course.materials')}"/></h5>
        <ul class="list03 fblue">
              <%--<li><a href="javascript:;" target="_blank" title="怎么创建新的课程？" target="_blank">&gt;&nbsp;&nbsp;怎么创建新的课程？</a></li>--%>
              <%--<li><a href="javascript:;" target="_blank" title="德总统因不忍安保改造扰邻决定携女友搬家">&gt;&nbsp;&nbsp;德总统因不忍安保改造扰邻决定携女友搬</a></li>--%>
              <%--<li><a href="javascript:;" target="_blank" title="英国女子为病重丈夫捐肾作为银婚礼物">&gt;&nbsp;&nbsp;英国女子为病重丈夫捐肾作为银婚礼物</a></li>--%>
              <%--<li><a href="javascript:;" target="_blank" title="贝克汉姆向奥巴马赠送50条代言内裤">&gt;&nbsp;&nbsp;贝克汉姆向奥巴马赠送50条代言内裤</a></li>--%>
              <%--<li><a href="javascript:;" target="_blank" title="突尼斯自焚小贩母亲获缓刑">&gt;&nbsp;&nbsp;突尼斯自焚小贩母亲获缓刑</a></li>--%>
              <%--<li><a href="javascript:;" target="_blank" title="美经历55年不遇大旱 农业部长称每天跪地求雨">&gt;&nbsp;&nbsp;美经历55年不遇大旱 农业部长称每天跪地</a></li>--%>
              <%--<li><a href="javascript:;" target="_blank" title="查尔斯戴安娜婚礼日吃剩面包片拍得230英镑">&gt;&nbsp;&nbsp;查尔斯戴安娜婚礼日吃剩面包片拍得230英</a></li>--%>
              <%--<li><a href="javascript:;" target="_blank" title="日本六旬老汉空手生擒酒后闹事美国宪兵">&gt;&nbsp;&nbsp;日本六旬老汉空手生擒酒后闹事美国宪兵</a></li>--%>
              <%--<li><a href="javascript:;" target="_blank" title="美公布冷战录像:5名军官在原子弹下看爆炸">&gt;&nbsp;&nbsp;美公布冷战录像:5名军官在原子弹下看爆</a></li>--%>
        </ul>
    </div>

    <div class="lcr_4">
        <h5><s:property value="%{getText('course.total.evalations.grade')}"/></h5>
        <table>
            <tr><td colspan="2"><s:property value="%{getText('course.total.evalations.grade.average')}"/>：<span class="orWord">4.1</span> <s:property value="%{getText('user.evaluate.grade')}"/>&nbsp;&nbsp;<s:property value="%{getText('course.total.evalations.grade.highest')}"/>：<span class="orWord">5.0</span><s:property value="%{getText('user.evaluate.grade')}"/>&nbsp;&nbsp;<s:property value="%{getText('course.total.evalations.grade.lowest')}"/>：<span class="orWord">3.0</span><s:property value="%{getText('user.evaluate.grade')}"/>&nbsp;&nbsp;</td></tr>
            <tr><td colspan="2"><div id="rate_t_1" class="type2"></div><span class="grade" id="grade_1"><s:property value="course.interest"/></span>&nbsp;<s:property value="%{getText('user.evaluate.grade')}"/></td></tr>
        </table>
        <div class="save_pop">
            <div class="save save_done"><s:property value="%{getText('message.change.pwd.success')}"/></div>
            <div class="save save_fail"><s:property value="%{getText('message.old.pwd.error')}"/></div>
        </div>
    </div>
</div>


<script type="text/javascript">
 var  del = "<s:text name='course.class.delete'/>";
 var friendEmail="<s:text name='label.email.friend'/>";
 var earlytimeEmpty="<s:text name='message.earliest.time.empty'/>";
 var lasttimeEmpty="<s:text name='message.lastest.time.empty'/>";
 var earliesterror="<s:text name='message.earlist.time.cannot.realy'/>";
 var latesterror="<s:text name='message.latiest.time.cannot.realy'/>";
 var score="<s:text name='label.scrore.compre'/>";
 var box;
    $(function(){
        $("#rate_t_00").rate({
            selected:<s:property value="course.synthetical"/>,
            selectable:false,
            decimal:true,
            revert:true,
            fullStar:false
        });
        $("#rate_t_1").rate({
            selected:<s:property value="course.interest"/>,
            selectable:true,
            decimal:true,
            revert:true,
            fullStar:false,
            initCallBack:function(val, obj) {
                val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
                $("#grade_1").html(val);
            },
            mouseOutCallBack:function(val, obj) {
                $("#grade_1").html() < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
            },
            selectedCallBack:function(val, obj) {
                val < 3 ? $(obj).addClass("type2-bad") : $(obj).removeClass("type2-bad");
            },
            clickCallBack:function(val, obj) {
                $("#grade_1").html(val);

                $(".lcr_4 .save_pop").css("right","100px");
                $(".lcr_4 .save_pop").css("bottom","40px");
                $(".lcr_4 .save_pop").fadeIn("slow");
                $(".lcr_4 .save_pop .save_done").html("<s:text name='thanks.for.ur.evaluation'/>");
                $(".lcr_4 .save_pop .save_done").show();
                setTimeout(function(){
                    $(".lcr_4 .save_pop").fadeOut("slow");
                    $(".lcr_4 .save_pop .save_done").hide();
                },2000);
            }
        });

        $('#register_btn').click(function(){
            if(validateLogo()){
                 <s:if test="course.charges == 0 && !course.limitOver && !course.courseFinished">
                            $.post("courseconfirm.html",{'course.id':"<s:property value="course.id"/>"},function(data){
                                  window.location.href = "myRegistration.html";
                                  return true;
                            });
                 </s:if>
                 <s:if test="course.charges > 0 && !course.limitOver && !course.courseFinished">
                                 window.location.href = "initCourseconfirm.html?course.id=<s:property value="course.id"/>";
                                 return true;
                 </s:if>
                 <s:else>
                       window.location.href =  "myRegistration.html";
                 </s:else>
            }
        });
        $('#reserve_btn').fancybox({
            "titlePosition":"over",
            "transitionIn":"fade",
            "transitionOut":"elastic"
        });

        $('#recommend_btn').fancybox({
            "titlePosition":"over",
            "transitionIn":"fade",
            "transitionOut":"elastic"
        });

        $("#evaluatebtn").click(function() {
            $("#evaluatepanel").slideToggle(500);
        });


        $(".reserve_close").click(function(){
            $.fancybox.close();
        });

        $(".recommdate_close").click(function() {
            $.fancybox.close();
        });

    });

    function saveEvaluation(cid) {
        var ret = validateLogo();
        if (!ret) return false;
        var interest = document.getElementById("grade_1").innerHTML;
        var available = document.getElementById("grade_2").innerHTML;
        var interaction = document.getElementById("grade_3").innerHTML;
        var costPerformance = document.getElementById("grade_4").innerHTML;

        var url = "saveCourseEvaluation.html";
        var postJsonDate = {"courseEvaluation.interest":interest,"courseEvaluation.available":available,"courseEvaluation.interaction":interaction,"courseEvaluation.costPerformance":costPerformance,"courseEvaluation.course.id":cid};
        $.post(url,postJsonDate,function(data){
            var str = data.split("$");
            if(str[1] != 0){
                $("#grade_0").html(str[1]);
                $("#save_pop").fadeIn("slow");
                $("#save_pop .save_done").html(str[0]);
                $("#save_pop .save_done").show();
                setTimeout(function(){
                    $("#save_pop").fadeOut("slow");
                    $("#save_pop .save_done").hide();
                },2000);
            }else{
                $("#save_pop").fadeIn("slow");
                $("#save_pop .save_fail").html(str[0]);
                $("#save_pop .save_fail").show();
                setTimeout(function(){
                    $("#save_pop").fadeOut("slow");
                    $("#save_pop .save_fail").hide();
                },2000);
            }
        });
    }

    function  setUser2LiveFollower(liveChannelID){
        if(validateLogo()) {
                $.post("addUser2LiveFollower.html",{'liveChannel.id':liveChannelID},function(data){
                    Boxy.alert("<s:text name='onlive.add.focus.success'/>");
                });
        }
    }

   $("#message_submit_btn").bind('click', function () {
         if(validateLogo()){

            var messageText = $("#message_textarea").val();
            if(messageText == ""){
                $("#message_area_tip").html("<s:text name='blog.left.message.empty'/>");
                return;
            }
            $.post("saveComment.html",{'course.id':<s:property value="course.id"/>,'courseComment.content':$("#message_textarea").val(),'commentsNum':<s:property value="commentsNum"/>}, function (data) {
                $("#message_list_ul").html(data);
            });
            $("#message_textarea").attr('value',"");
            $("#message_area_tip").html("");


         }

    })

     function replyToComment(nickName,userID){
        var prefixStr = "<s:text name='blog.message.reply'/>";
        $("#message_textarea").val(prefixStr+nickName+": ");
        $("#message_textarea").focus();
        $.post("putUserIDtoSession.html",{'user.id':userID},function(data){});
     }
     function deleteThisComment(obj,commentId){
        $(obj).parents("li.li_out").remove();
        $.post("deleteCourseComment.html",{'courseComment.id':commentId},function(data){});
     }
     function addFocus(userID){
        if(validateLogo()){
            $.post("addUserFocus.html",{'user.id':userID},function(data){
                 Boxy.alert("<s:text name='operation.success'/>");
                 $("#focus_center").html("");
           });
        }
    }
    function checkCourseReservation(){
       if(validateLogo()){
           $("#reservation_message").html("");
           $("#dateMsg").text("");
           if($("#courseReservationInitial").val()==""){
                 $("#dateMsg").text(earlytimeEmpty);
                 return false;
           }else{
               var initial = new Date($("#courseReservationInitial").val().replace(/-/g,"/"));
               if(initial<new Date()){
                   $("#dateMsg").text(earliesterror);
                   return false;
               }
               if($("#courseReservationAtLatest").val()==""){
                 $("#dateMsg").text(lasttimeEmpty);
                 return false;
               }else{
                   var atLatest = new Date($("#courseReservationAtLatest").val().replace(/-/g,"/"));
                   if(atLatest<initial){
                      $("#dateMsg").text(latesterror);
                       return false;
                   }
               }
           }
            var vas = $("#courseReservationForm").serialize();
            $.post("saveCourseReservation.html",vas,function(data){
                    if(data.length > 5){
                         $("#reservation_message").html("<s:text name='congrats.for.purchase.success'/>");
                         $("#reservation_message").css('color','green');
                   }else{
                         $("#reservation_message").html("<s:text name='u.have.already.pur.this.course'/>");
                         $("#reservation_message").css('color','red');
                   }
            },"html");
            window.setTimeout("closeFancybox()","3000");
            return true;
       }
    }

     $(document).ready(function(){
        $(".add_friend_email").click(function(){
             $(".added_line").append("<tr><td align='right' valign='top'>"+friendEmail+"&nbsp;&nbsp;</td><td><input class='recommdate_email' type ='text' name='emails' onblur='checkEmail(this);'>&nbsp;&nbsp;<span class='recommdate_delete' onclick='deleteRow(this)'>"+del+"</span></td></tr>");
        });
    });
    function checkEmail(object){
        var content = $(object).attr('value');
        var reMail = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
        var emailContent = content.replace(/(^\s*)|(\s*$)/g, "");
        $("#recommendMsg").text("");

        if (!reMail.test(emailContent)) {
            $("#recommendMsg").text("<s:text name='course.email.input.error'/>");
            return false;
        }
        var mySession = "<s:property value="#session.email"/>";
        //alert(mySession+":"+emailContent);
        if (emailContent == mySession) {
            $("#recommendMsg").text("<s:text name='course.email.input.myself'/>");
            return false;
        }
        $(object).attr('value', emailContent);
        return true;
    }



    function checkCourseRecommend(){
        for(var i=0;i<$(document.getElementsByName("emails")).size();i++){

            var content = $($(document.getElementsByName("emails"))[i]).attr('value');
            var reMail = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;
            var emailContent = content.replace(/(^\s*)|(\s*$)/g, "");
            $("#recommendMsg").text("");
            if(emailContent!=""){
                 if (!reMail.test(emailContent)) {
                    $("#recommendMsg").text("<s:text name='course.email.input.error'/>");
                    return false;
                 }
                  var mySession = "<s:property value="#session.email"/>";
                  if (emailContent == mySession) {
                       $("#recommendMsg").text("<s:text name='course.email.input.myself'/>");
                       return false;
                  }
            }else{
                  $("#recommendMsg").text("<s:text name='emailEmpty'/>");
                  return false;
            }
        }
        var vas = $("#recommendCourseForm").serialize();
        $.post("recommendCourse.html",vas,function(data){
               $("#recommend_message").html("<s:text name='course.recommend.success'/>");
               $("#recommend_message").css('color','green');
               window.setTimeout("closeFancybox()","3000");
        });
        return true;
    }

    function closeFancybox(){
         $.fancybox.close();
    }

     function deleteRow(obj){
             $(obj).parent().parent().remove();
    }

</script>