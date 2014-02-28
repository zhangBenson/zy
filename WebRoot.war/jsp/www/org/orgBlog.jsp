<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>


<div class="container">
    <s:hidden value="%{#session.userID}" id="hidSessionId"/>
	<div class="thinline"></div>
	<div class="row">
		<div class="col-sm-8">
			<div id="schoolInfo">
				<img src="<s:property value="org.logoUrl"/>" class="schoolPortrait"/>
				<div class="courseSubject" >
				    <h1 style="white-space: pre-wrap;word-wrap: break-word"><s:property value="org.schoolName"/></h1>
                </div>
				<h4 class="courseBody">
					<s:property escapeHtml="false" value="org.description"/>
				</h4>	
			</div>
			<br/>
			<div class="thickline"></div>
			<h3 class="courseSubhead"><s:property value="%{getText('org.blog.exquiste.course')}"/></h3>
			<!--school curriculum-->
			<div id="schoolcurriculum">
				<div class="row">
					 <s:iterator value="hotCourses" status="idx"> <%--hotCourses--%>
                        <s:if test="#idx.index < 6">
                            <div class="col-sm-4">
                               <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                                   <div class="recommended"><img src="<s:property value="logoUrl"/>" alt="" /><br/><span><s:property value="name"/></span></div>
                               </a>
                            </div>
                        </s:if>
		            </s:iterator>
				</div>
				<br/>
				<p class="text-right"><a href="#"><s:property value="%{getText('others.more')}"/></a></p>
			</div>
			<br/>

			<div id="Mooc">
				<div class="thickline"></div>
				<h3 class="courseSubhead"><s:property value="%{getText('usermenu.item.mooc')}"/></h3> <%--Mooc--%>
				<div id="Mooccurriculum">
				<div class="row">
                    <s:iterator value="moocs" status="idx">
                    <s:if test="#idx.index < 6">
                            <div class="col-sm-4">
                                <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                                    <div class="recommended"><img src="<s:property value="logoUrl"/>" alt="" /><br/><span><s:property value="name"/></span></div>
                                </a>
                            </div>
                        </s:if>
                    </s:iterator>
				</div>
				<br/>
				<p class="text-right"><a href="#"><s:property value="%{getText('others.more')}"/></a></p>
			</div>
			</div>

			<!--Forums-->
			<br/>
			<div id="Forums">

				<div class="thickline"></div>
				<h3 class="courseSubhead"><s:property value="%{getText('blog.message.board')}"/></h3>


                <div id="message_list_ul">
                    <s:iterator value="comments" status="idx">
                        <s:if test="#idx.index < 3">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="portrait">
                                        <span><s:a action="userBlog" ><s:param name="user.id" value="commenter.id"/><img src="<s:property value="commenter.pic"/>"  alt="" class="forumportrait"/></s:a></span>
                                        <br/>
                                        <span><s:a action="userBlog" ><s:param name="user.id" value="commenter.id"/><s:property value="commenter.nickName"/></s:a></span>
                                    </div>
                                </div>
                                <div class="col-md-10">
                                    <div class="forumContent">
                                        <s:property value="description"/>
                                    </div>
                                    <div class="forumContentDate">
                                        <p class="text-right"><s:date name="createDate" format="%{getText('global.display.datetime')}"/></p>
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
                        <a href="javascript:;" class="btn btn-primary btn-lg btn-block" id="message_submit_btn" ><s:property value="%{getText('blog.comments.submit')}"/></a>
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
				<!-- excellent Lecturers -->

				<%-- <div class="gogopanelWhole">
					<div class="gogopanelBodyText">
						<s:iterator value="hotTeachers" status="idx">
							<p class="teacherTitle"><s:property value="nickName"/></p>
			                <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>"><img class="teacherPortrait" src="<s:property value="pic"/>"/></a>
			                <div>
				                <p class="teacherTitle"><s:property value="nickName"/></p>
				                <br/>
				                <p><s:property value="selfDescription"/></p>
			                </div>
			                <s:if test="!#idx.last">
			                	<div class="thicklineExtra"></div>
		                	</s:if>
			            </s:iterator>
					</div>
				</div>
                --%>
				<br/>
				<br/>
				<!-- Lecturers -->
				<div class="gogopanelHead">
					<div class="gogopanelTitle"><s:property value="%{getText('course.lecturer')}"/></div>
				</div>
				<div class="gogopanelBody">
					<div class="gogopanelBodyText">
						<s:iterator value="latestTeachers" status="idx">
                            <s:if test="#idx.index<3">
                                <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>"><img class="teacherPortrait" src="<s:property value="pic"/>"/></a>
                                <div>
                                    <p class="teacherTitle"><s:property value="nickName"/></p>
                                    <s:if test="selfDescription==null || selfDescription.length()==0">
                                        <br/>
                                    </s:if>
                                    <p>
                                        <s:if test="selfDescription.length() > 50">
                                            <s:property value="selfDescription.substring(0,50)+'...'" />
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
                            <div class="text-right"><s:property value="%{getText('label.org.lecturer.see.all')}"/></div>
                        </a>
					</div>
				</div>

				<br/>

				<div class="gogopanelHead">
					<div class="gogopanelTitle"><s:property value="%{getText('label.course.class.room')}"/></div>
				</div>
				<div class="gogopanelBody">
					<div class="gogopanelBodyText">
						<s:if test="course.FinshedClassNum < course.ClassesNum">
		                    <s:iterator value="course.ForcastClasses" begin="0" end="0" status="idx">
		                        <div><s:property value="%{getText('lable.course.nickname')}"/>: <s:property value="nickName"/></div>
		                        <p></p>
		                        <div><s:property value="%{getText('lable.course.no')}"/>:
		                            <s:property value="%{getText('lable.class.no1')}" />
		                            <s:property value="course.FinshedClassNum+1"/>
		                            <s:property value="%{getText('lable.class.no2')}" />
		                        </div>
		                        <p></p>
		                        <div><s:property value="%{getText('lable.course.starttime')}"/>:<s:date name="date" format="%{getText('dateformat.forclass')}"/></div>
		                        <p></p>
		                        <div><s:property value="%{getText('courses.info.lecturer')}"/>: <s:property value="course.teacher.nickName"/></div>
                                <p></p>
                                <div><s:property value="%{getText('word.audience')}"/>:</div>
                                <br/>
		                    </s:iterator>
               		 	</s:if>
                        <s:else>
                            <s:iterator value="course.classes" begin="course.ClassesNum-1" end="course.ClassesNum -1" status="idx">
                                <div><s:property value="%{getText('lable.course.nickname')}"/>: <s:property value="nickName"/></div>
                                <p></p>

                                <div><s:property value="%{getText('lable.course.no')}"/>:
                                    <s:property value="%{getText('lable.class.no1')}"/><s:property value="course.ClassesNum"/><s:property value="%{getText('lable.class.no2')}"/>
                                </div>
                                <p></p>
                                <div><s:property value="%{getText('lable.course.starttime')}"/>:<s:date name="date" format="%{getText('dateformat.forclass')}"/></div>
                                <p></p>
                                <div><s:property value="%{getText('courses.info.lecturer')}"/>: <s:property value="course.teacher.nickName"/></div>
                                <p></p>
                                <div><s:property value="%{getText('word.audience')}"/>:</div>
                                <br/>
                            </s:iterator>
                        </s:else>

						<button type="button" class="btn btn-primary btn-block"><s:property value="%{getText('button.enter')}"/></button>
					</div>
				</div>

				<br/>
				<!--Panel 3-->
				<div class="gogopanelHead">
					<div class="gogopanelTitle"><s:property value="%{getText('label.course.discussion.room')}"/></div>
				</div>
				<div class="gogopanelBody">
					<div class="gogopanelBodyText">
                        <div><s:property value="%{getText('label.discussion.room.start.time')}"/>:</div>
                        <p></p>
                        <div><s:property value="%{getText('label.discussion.room.duration')}"/>:</div>
                        <p></p>

                        <div id="DisUserArea" style="text-align: center;">
                            <s:if test="allTeachersNum != null">
                                <div class="row">
                                    <s:iterator value="allTeachersForOrg" status="idx">
                                        <s:if test="#idx.index < 5">
                                            <div class="col-md-4">
                                                <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                                                    <img  class="normalPortrait" src="<s:property value="pic" />"/>
                                                </a>
                                                <p class="textOverSinglerow"><s:property value="nickName"/></p>
                                            </div>
                                        </s:if>
                                    </s:iterator>
                                    <s:if test="allTeachersForOrg.size() < 5">
                                        <s:iterator var="counter" begin="allTeachersForOrg.size() + 1" end = "5">
                                            <div class="col-md-4">
                                                <img src="/images/course/noportrait.jpg" class="normalPortrait"/>
                                                <p class="textOverSinglerow">Available</p>
                                            </div>
                                        </s:iterator>
                                    </s:if>
                                </div>
                            </s:if>
                            <s:else>
                                <div class="row">
                                    <s:iterator var="counter" begin="1" end = "5">
                                        <div class="col-md-4">
                                            <img src="/images/course/noportrait.jpg" class="normalPortrait"/>
                                            <p class="textOverSinglerow">Available</p>
                                        </div>
                                    </s:iterator>
                                </div>
                            </s:else>
                        </div>

                        <%-- <div id="DisUserArea" style="text-align: center;">
                            <div class="row">
                                <div class="col-md-4">
                                    <img src="images/course/portrait2.jpg" class="normalPortrait"/>
                                    <p class="textOverSinglerow">Name</p>
                                </div>
                                <div class="col-md-4">
                                    <img src="images/course/portrait4.jpg" class="normalPortrait"/>
                                    <p class="textOverSinglerow">Name</p>
                                </div>
                                <div class="col-md-4">
                                    <img src="images/course/portrait5.jpg" class="normalPortrait"/>
                                    <p class="textOverSinglerow">Name</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <img src="images/course/portrait2.jpg" class="normalPortrait"/>
                                    <p class="textOverSinglerow">Name</p>
                                </div>
                                <s:if test="allTeachersNum>0">
                                    <div class="row">
                                        <s:iterator value="allTeachersForOrg" status="idx" begin="0" end="0">
                                            <div class="col-md-4">
                                                <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                                                    <img  class="normalPortrait" src="<s:property value="pic" />"/>
                                                </a>
                                                <p class="textOverSinglerow"><s:property value="nickName"/></p>
                                            </div>
                                        </s:iterator>
                                    </div>
                                </s:if>
                                <s:else>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <img src="/images/course/noportrait.jpg" class="normalPortrait"/>
                                            <p class="textOverSinglerow">Available</p>
                                        </div>
                                    </div>
                                </s:else>
                            </div>
                        </div>--%>
						<br/>
						<button type="button" class="btn btn-primary btn-block"><s:property value="%{getText('button.classroom.enter')}"/></button>
					</div>
				</div>
				<br/>
			</div>
		</div>
</div>

    <div class="modal fade" id="modalReminder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow:hidden;">
        <div class="modal-dialog" style="width: 1000px;height:580px;margin-top: 5%;background:rgba(255,255,255,.9);border-radius: 12px;">
            <div style="font-size: 36px;color: #6E8B3D;text-align: center;font-family: 'Trebuchet MS', Helvetica, sans-serif;">BUY ALL COURSES</div>
            <div style="text-align: center;color: #aaa;">(<s:property value="org.schoolName"/>)</div>
            <div style="font-size: 12px;color: #aaa;text-align: center;margin-top: 30px;">
                Read the course catalogs at the schools you’re applying to and familiarize yourself with the offerings.
            </div>
            <div class="linegray1"></div>
            <div class="row" style="margin-top: 30px;">

                <div class="col-sm-4" style="text-align: center;">
                    <img src="/images/payMoney/sale1.png">
                    <label style="width: 100px;">
                        <input type="radio" name="sale" value="0" >
                        <span style="font-size: 12px;font-weight: lighter;color: #aaa;">Select (1 Year)</span>
                    </label>
                </div>
                <div class="col-sm-4" style="text-align: center;">
                    <img src="/images/payMoney/sale2.png">
                    <label style="width: 100px;">
                        <input type="radio" name="sale" value="0" >
                        <span style="font-size: 12px;font-weight: lighter;color: #aaa;">Select (3 Month)</span>
                    </label>
                </div>
                <div class="col-sm-4" style="text-align: center;">
                    <img src="/images/payMoney/sale3.png">
                    <label style="width: 100px;">
                        <input type="radio" name="sale" value="0" >
                        <span style="font-size: 12px;font-weight: lighter;color: #aaa;">Select (1 Month)</span>
                    </label>
                </div>
            </div>
            <div class="linegray1"></div>
            <div style="font-size: 12px;font-weight: lighter;color: #aaa;text-align: center;width: 80%;margin: 0 auto;margin-top: 30px;margin-bottom: 30px;">

                As well, there is some financial support available to each participant for career enhancements, such as enrolling in relevant courses, purchasing textbooks and supplies, and credential assessments.
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"><button type="button" class="btn btn-primary btn-lg btn-block">Confirm Buy</button></div>
                <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
                    <%--<input type="hidden" name="cmd" value="_s-xclick">--%>
                    <%--<input type="hidden" name="hosted_button_id" value="CPR764EY9Y6HS">--%>
                    <%--<input type="image" src="https://www.paypalobjects.com/en_GB/SG/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online.">--%>
                    <%--<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">--%>
                    <%--<input type="hidden" name="org.id" value="<s:property value="org.id" />">--%>
                    <input type="hidden" name="cmd" value="_xclick">
                    <input type="hidden" name="business" value="1072805997@qq.com">
                    <input type="hidden" name="item_name" value="Course">
                    <input type="hidden" name="item_number" value="2">
                    <input type="hidden" name="quantity" value="1">
                    <input type="hidden" name="amount" value="10.00">
                    <input type="hidden" name="currency_code" value="USD">
                    <input type="hidden" name="bn" value="IC_Sample">
                    <input type="hidden" name="no_shipping" value="1">
                    <%--<input type="hidden" name="custorm" value="sessionID">--%>
                    <input type="hidden" name="notify_url" value="http://test.gogowise.com/ipn.html?userID=<s:property value="%{#session.userID}"/>&orgID=<s:property value="org.id"/>" >
                    <input type="hidden" name="return_url" value="http://test.gogowise.com/courseCenter.html">
                    <input type="hidden" name="cancel_url" value="http://test.gogowise.com/error.html">
                    <input type="image" src="https://www.paypalobjects.com/en_GB/SG/i/btn/btn_buynowCC_LG.gif" name="submit" alt="Make payments with payPal - it's fast,">
                    <img alt=""src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
                </form>

                <div class="col-sm-4"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function() {
        $("#message_submit_btn").bind('click', function () {
            if(validateLogo()){
                var messageText = $("#message_textarea").val();
                if(messageText == ""){
                    $("#message_area_tip").html("留言不能为空");
                    return;
                }
//                if (validateForm_saveUserBlogComments()){
                    $.post("saveOrgComment.html", {'org.id':'<s:property value="org.id"/>', 'comment.description':messageText ,'commentsNum':<s:property value="commentsNum"/>} ,function (data) {
                        $("#message_list_ul").html(data);
                    });
//                }
                $("#message_textarea").attr('value',"");
                $("#message_area_tip").html("");
            }
        })

        $("#message_textarea").keyup(function(){
            changeWordNumber($(this),$("#message_area_tip"),250);
        });

        $('#btnBuy').click(function(){
            $('#modalReminder').modal("show");
        });
    });
    function validateLogo(){
        if(document.getElementById('hidSessionId').value > 0) {
            return true;
        } else {
            $('#modalLogin').modal("show");
            return false;
        }
    }
</script>