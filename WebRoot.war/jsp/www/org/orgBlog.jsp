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
                               <a href="#">
                                   <div class="recommended">
                                        <s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>
                                            <img src="<s:property value="logoUrl"/> " title="<s:property value="description"/>"  />
                                        </s:a>
                                        <br/>
                                        <span title="<s:property value="name"/>"><s:a action="voaCourseBlog"><s:param name="course.id" value="id"/><s:property value="name"/></s:a></span>
                                    </div>
                               </a>
                            </div>
                        </s:if>
		            </s:iterator>
				</div>
				<br/>
				<p class="text-right">more</p>
			</div>
			<br/>

			<div id="Mooc">
				<div class="thickline"></div>
				<h3 class="courseSubhead"><s:property value="%{getText('live.term.live.room')}"/></h3> <%--Mooc--%>
				<div id="Mooccurriculum">
				<div class="row">
					 <s:iterator value="hotCourses" status="idx">
                        <s:if test="#idx.index < 6">
                            <div class="col-sm-4">
                                <a href="#">
                                    <div class="recommended">
                                        <s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>
                                            <img src="<s:property value="logoUrl"/> " title="<s:property value="description"/>" />
                                        </s:a>
                                        <br/>
                                        <span title="<s:property value="name"/>"><s:a action="voaCourseBlog"><s:param name="course.id" value="id"/><s:property value="name"/></s:a></span>
                                    </div>
                                </a>
                            </div>
                        </s:if>
                    </s:iterator>
				</div>
				<br/>
				<p class="text-right">more</p>
			</div>
			</div>

			<!--Forums-->
			<br/>
			<div id="Forums">

				<div class="thickline"></div>
				<h3 class="courseSubhead">Forums</h3>


                <div id="message_list_ul">
                    <s:iterator value="comments" status="idx">
                        <s:if test="#idx.index < 3">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="portrait">
                                        <span><s:a action="userBlog" ><s:param name="user.id" value="commenter.id"/><img src="<s:property value="commenter.pic"/>"  alt="" class="forumportrait"/></s:a></span>
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
							<span>
								<img src="/images/org/icon_teacher.png" alt=""></span>
							<span><s:property value="allTeachersNum"/></span>
						</div>

						<div class="statisticsItem">
							<span>
								<img src="/images/org/icon_student.png" alt=""></span>
							<span><s:property value="studentsNum"/></span>
						</div>
					</div>
				</div>


				<br/>
				<br/>
				<!-- excellent Lecturers -->
				
				<div class="gogopanelWhole">
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

				<br/>
				<br/>
				<!-- Lecturers -->
				<div class="gogopanelHead">
					<div class="gogopanelTitle">Lecturers</div>
				</div>
				<div class="gogopanelBody">
					<div class="gogopanelBodyText">
						<s:iterator value="latestTeachers" status="idx">
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

				<br/>

				<div class="gogopanelHead">
					<div class="gogopanelTitle">Classroom</div>
				</div>
				<div class="gogopanelBody">
					<div class="gogopanelBodyText">
						<s:if test="course.FinshedClassNum < course.ClassesNum">
		                    <s:iterator value="course.ForcastClasses" begin="0" end="0" status="idx">
		                        <div>Topic: <s:property value="nickName"/></div>
		                        <p></p>
		                        <div>Numbers:
		                            <s:property value="%{getText('lable.class.no1')}" />
		                            <s:property value="course.FinshedClassNum+1"/>
		                            <s:property value="%{getText('lable.class.no2')}" />
		                        </div>
		                        <p></p>
		                        <div>Times:<s:date name="date" format="%{getText('dateformat.forclass')}"/></div>
		                        <p></p>
		                        <div>Teacher: <s:property value="course.teacher.nickName"/></div>
		                        <br/>
		                    </s:iterator>
               		 	</s:if>
						<br/>
						<button type="button" class="btn btn-primary btn-block">Enter</button>
					</div>
				</div>

				<br/>
				<!--Panel 3-->
				<div class="gogopanelHead">
					<div class="gogopanelTitle">Discussion Room</div>
				</div>
				<div class="gogopanelBody">
					<div class="gogopanelBodyText">
						<div id="DisUserArea" style="text-align: center;">
                            <s:if test="allTeachersNum>0">
                                <div class="row">
                                    <s:iterator value="allTeachersForOrg" status="idx">
                                        <div class="col-md-4">
                                            <span><s:a action="userBlog"><s:param name="user.id" value="id"/>
                                                <img class="teacherPortrait" src="<s:property value="pic"/> " title="<s:property value="nickName"/>"  />
                                            </s:a></span>
                                            <%-- <a href="userBlog.html?user.id=<s:property value="id"/>" title="<s:property value="nickName"/>">
                                                <img class="teacherPortrait" src="<s:property value="pic" />"/>
                                            </a> --%>
                                            <div style="clear: left">
                                            </div>
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
						
						<br/>
						<button type="button" class="btn btn-primary btn-block">Booking</button>
					</div>
				</div>
				<br/>
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
    });
    function validateLogo(){
        if(document.getElementById('hidSessionId').value > 0) {
            return true;
        } else {
            $.fancybox({
                "type":"iframe",
                "href":"login.html",
                "width":350,
                "height":270
            });
            return false;
        }
    }

</script>