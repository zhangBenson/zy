<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<div class="container">
<s:hidden value="%{#session.userID}" id="hidSessionId"/>
<div class="thinline"></div>
<div class="row">
<div class="col-sm-8">
    <div id="schoolInfo">
        <img src="<s:property value="org.logoUrl"/>" class="schoolPortrait"/>

        <div class="courseSubject">
            <h1 style="white-space: pre-wrap;word-wrap: break-word"><s:property value="org.schoolName"/></h1>
        </div>
        <h4 class="courseBody">
            <s:property escapeHtml="false" value="org.description"/>
        </h4>
    </div>
    <br/>

    <div class="thickline"></div>
    <h3 class="courseSubhead"><s:text name="org.blog.internal.courses"/></h3>
    <!--school curriculum-->
    <div id="schoolcurriculum">
        <div class="row">
            <%--<s:iterator value="hotCourses" status="idx"> &lt;%&ndash;hotCourses&ndash;%&gt;--%>
            <s:iterator value="privateCourses" status="idx"> <%--private Courses--%>
                <s:if test="#idx.index < 6">
                    <div class="col-sm-4">
                        <a href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                           title="<s:property value="name"/>">
                            <div class="recommended">
                                <img src="<s:property value="logoUrl"/>" alt=""/><br/>
                                <span><s:property value="name"/></span>
                            </div>
                        </a>
                    </div>
                </s:if>
            </s:iterator>
            <s:if test="privateCourses.size() > 6">More</s:if>
        </div>

        <br/>

        <%--<p class="text-right"><a href="orgMoreCourse.html?org.id=<s:property value="org.id"/>"><s:property--%>
        <%--value="%{getText('others.more')}"/></a></p>--%>
    </div>
    <br/>

    <div id="Mooc">
        <div class="thickline"></div>
        <h3 class="courseSubhead"><s:text name="usermenu.item.mooc"/></h3> <%--Mooc--%>
        <div id="Mooccurriculum">
            <div class="row">
                <s:iterator value="moocs" status="idx">
                    <s:if test="#idx.index < 6">
                        <div class="col-sm-4">
                            <a href="voaCourseBlog.html?course.id=<s:property value="id"/>"
                               title="<s:property value="name"/>">
                                <div class="recommended"><img src="<s:property value="logoUrl"/>"
                                                              alt=""/><br/><span><s:property value="name"/></span></div>
                            </a>
                        </div>
                    </s:if>
                </s:iterator>
            </div>
            <br/>

            <p class="text-right">
                <s:if test="moocs.size()>5">
                    <a href="orgMoreMooc.html?org.id=<s:property value="org.id"/>"><s:text name="others.more"/></a>
                </s:if>
            </p>
        </div>
    </div>

    <!--Forums-->
    <br/>

    <div id="Forums">

        <div class="thickline"></div>
        <h3 class="courseSubhead"><s:text name="blog.message.board"/></h3>


        <div id="message_list_ul">
            <s:iterator value="comments" status="idx">
                <s:if test="#idx.index < 3">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="portrait">
                                <span><s:a action="userBlog"><s:param name="user.id" value="commenter.id"/><img
                                        src="<s:property value="commenter.pic"/>" alt=""
                                        class="forumportrait"/></s:a></span>
                                <br/>
                                <span><s:a action="userBlog"><s:param name="user.id" value="commenter.id"/><s:property value="commenter.nickName"/></s:a></span>
                            </div>
                        </div>
                        <div class="col-md-10">
                            <div class="forumContent">
                                <s:property value="description"/>
                            </div>
                            <div class="forumContentDate">
                                <p class="text-right"><s:date name="createDate"
                                                              format="%{getText('global.display.datetime')}"/></p>
                            </div>
                        </div>
                    </div>
                    <br/>
                </s:if>
            </s:iterator>
        </div>

        <br/>

        <div>
            <s:form theme="css_xhtml" name="commentsForm" method="post" validate="true">
                <textarea id="message_textarea" class="form-control" rows="3"></textarea>
                <br/>
                <a href="javascript:;" class="btn btn-primary btn-lg btn-block" id="message_submit_btn"><s:text name="blog.comments.submit"/></a>
            </s:form>
        </div>
    </div>
</div>


<div class="col-sm-4">
<div class="container">
<div class="row">
    <div class="col-sm-6" style="width:53%;">
        <div class="statisticsItem">
            <img src="/images/org/icon_founded.png" alt="">
            <span><s:property value="orgCreateDate"/></span>
        </div>
        <div class="statisticsItem">
            <span><img src="/images/org/icon_course.png" alt=""></span>
            <span><s:property value="orgCourseNum"/></span>
        </div>
    </div>
    <div class="col-sm-6 " style="width:47%;">
        <div class="statisticsItem">
            <span><img src="/images/org/icon_teacher.png" alt=""></span>
            <span><s:property value="allTeachersNum"/></span>
        </div>

        <div class="statisticsItem">
            <span><img src="/images/org/icon_student.png" alt=""></span>
            <span><s:property value="studentsNum"/></span>
        </div>
    </div>
</div>


<br/>
<br/>

<div class="basePanelTextLeft">
    <button type="button" class="btn btn-primary btn-block" id="btnBuy">BUY COURSES</button>
</div>


    <br/>
<br/>
<!-- Lecturers -->
<div class="gogopanelHead">
    <div class="gogopanelTitle"><s:text name="course.lecturers"/></div>
</div>
<div class="gogopanelBody">
    <div class="gogopanelBodyText">
        <s:iterator value="latestTeachers" status="idx">
            <s:if test="#idx.index<3">
                <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>"><img
                        class="teacherPortrait" src="<s:property value="pic"/>"/></a>

                <div>
                    <p class="teacherTitle"><s:property value="nickName"/></p>
                    <s:if test="selfDescription==null || selfDescription.length()==0">
                        <br/>
                    </s:if>
                    <p>
                        <s:if test="selfDescription.length() > 50">
                            <s:property value="selfDescription.substring(0,50)+'...'"/>
                        </s:if>
                        <s:else>
                            <s:property value="selfDescription"/>
                        </s:else>
                    </p>

                </div>
                <s:if test="!#idx.last">
                    <div class="thicklineExtra"></div>
                </s:if>
            </s:if>
        </s:iterator>
        <a href="#">
            <div class="text-right">
                <a href="orgMoreTeacher.html?org.id=<s:property value="org.id"/>">
                    <s:text name="label.org.lecturer.see.all"/>
                </a>
            </div>
        </a>
    </div>
</div>

<br/>




<br/>
</div>
</div>
</div>

<div class="modal fade" id="modalReminder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
     style="overflow:hidden;">
    <div class="modal-dialog"
         style="width: 1000px;height:580px;margin-top: 5%;background:rgba(255,255,255,.9);border-radius: 12px;">
        <div style="font-size: 36px;color: #6E8B3D;text-align: center;font-family: 'Trebuchet MS', Helvetica, sans-serif;">
            BUY ALL COURSES
        </div>
        <div style="text-align: center;color: #aaa;">(<s:property value="org.schoolName"/>)</div>
        <div style="font-size: 12px;color: #aaa;text-align: center;margin-top: 30px;">
            Read the course catalogs at the schools you’re applying to and familiarize yourself with the offerings.
        </div>
        <div class="linegray1"></div>
        <div class="row" style="margin-top: 30px;">

            <div class="col-sm-4" style="text-align: center;">
                <img src="/images/payMoney/sale1.png">
                <label style="width: 100px;">
                    <input type="radio" name="sale" value="0">
                    <span style="font-size: 12px;font-weight: lighter;color: #aaa;">Select (1 Year)</span>
                </label>
            </div>
            <div class="col-sm-4" style="text-align: center;">
                <img src="/images/payMoney/sale2.png">
                <label style="width: 100px;">
                    <input type="radio" name="sale" value="0">
                    <span style="font-size: 12px;font-weight: lighter;color: #aaa;">Select (3 Month)</span>
                </label>
            </div>
            <div class="col-sm-4" style="text-align: center;">
                <img src="/images/payMoney/sale3.png">
                <label style="width: 100px;">
                    <input type="radio" name="sale" value="0">
                    <span style="font-size: 12px;font-weight: lighter;color: #aaa;">Select (1 Month)</span>
                </label>
            </div>
        </div>
        <div class="linegray1"></div>
        <div style="font-size: 12px;font-weight: lighter;color: #aaa;text-align: center;width: 80%;margin: 0 auto;margin-top: 30px;margin-bottom: 30px;">

            As well, there is some financial support available to each participant for career enhancements, such as
            enrolling in relevant courses, purchasing textbooks and supplies, and credential assessments.
        </div>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <button type="button" class="btn btn-primary btn-lg btn-block">Confirm Buy</button>
            </div>
            <form name="palypaForm" action="https://www.paypal.com/cgi-bin/webscr" target="_top" method="post" onsubmit="return validatePaypal();">       <%-- xiaoyl  add--   xiaoyl     --%>
                <input type="hidden" name="cmd" value="_xclick">
                <input type="hidden" name="business" value="zeng_zeng@gogowise.com">
                <input type="hidden" name="item_name" value="Course">
                <input type="hidden" name="amount" value="1.00" id="paypalAmount">
                <input type="hidden" name="currency_code" value="USD">
                <input type="hidden" name="on0" value="customerId">
                <input type="hidden" name="os0" value="stephen">
                <input type="hidden" name="on1" value="address">
                <input type="hidden" name="os1" value="shanghai china">
                <input type="hidden" name="notify_url"
                       value="http://54.191.219.119/ipn.html?userID=<s:property value="%{#session.userID}"/>&orgID=<s:property value="org.id"/>">
                <input type="hidden" name="return" value="http://54.191.219.119/courseCenter.html">

                <input type="image" src="https://www.paypalobjects.com/en_GB/SG/i/btn/btn_buynowCC_LG.gif" name="submit"
                       alt="Make payments with payPal - it's fast,">
                <img alt="" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
            </form>

            <div class="col-sm-4"></div>
        </div>
    </div>
</div>
</div>

<script type="text/javascript">

    $(document).ready(function () {
        $("#message_submit_btn").bind('click', function () {
            if (validateLogo()) {
                var messageText = $("#message_textarea").val();
                if (messageText == "") {
                    $("#message_area_tip").html("留言不能为空");
                    return;
                }
//                if (validateForm_saveUserBlogComments()){
                $.post("saveOrgComment.html", {'org.id': '<s:property value="org.id"/>', 'comment.description': messageText, 'commentsNum':<s:property value="commentsNum"/>}, function (data) {
                    $("#message_list_ul").html(data);
                });
//                }
                $("#message_textarea").attr('value', "");
                $("#message_area_tip").html("");
            }
        })

        $("#message_textarea").keyup(function () {
            changeWordNumber($(this), $("#message_area_tip"), 250);
        });

        $('#btnBuy').click(function () {
            $('#modalReminder').modal("show");
        });
    });
    function validateLogo() {
        if (document.getElementById('hidSessionId').value > 0) {
            return true;
        } else {
            $('#modalLogin').modal("show");
            return false;
        }
    }

    function validatePaypal() {
        var value = $("input[name='sale']:checked").val();
        if (value == null || value == undefined || value == '') {
            alert("请选择课程");
            return false;
        }
        return true;
    }

</script>
