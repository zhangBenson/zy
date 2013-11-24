<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>


<div class="container">
	<div class="thinline"></div>
	<div class="row">
		<div class="col-sm-8">
			<div id="schoolInfo">
				<img src="<s:property value="org.logoUrl"/>" class="schoolPortrait"/>
				
				<h1 class = "courseSubject"><s:property value="org.schoolName"/></h1>
				<h4 class="courseBody">
					<s:property value="org.description"/>
				</h4>
			</div>
			<br/>
			<div class="thickline"></div>
			<h3 class="courseSubhead"><s:property value="%{getText('org.blog.exquiste.course')}"/></h3>
			<!--school curriculum-->
			<div id="schoolcurriculum">
				<div class="row">
					 <s:iterator value="hotCourses">
					 	<div class="col-sm-4">
			               <div class="recommended">
			                    <s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>
			                        <img src="<s:property value="logoUrl"/> " title="<s:property value="description"/>"  />
			                    </s:a>
			                    <br/>
			                    <span title="<s:property value="name"/>"><s:a action="voaCourseBlog"><s:param name="course.id" value="id"/><s:property value="name"/></s:a></span>
			                </div>
		                </div>
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
					 <s:iterator value="hotCourses">
						<div class="col-sm-4">
                        	<div class="recommended">
                        		<s:a action="voaCourseBlog"><s:param name="course.id" value="id"/>
			                        <img src="<s:property value="logoUrl"/> " title="<s:property value="description"/>" />
			                    </s:a>
			                    <br/>
			                    <span title="<s:property value="name"/>"><s:a action="voaCourseBlog"><s:param name="course.id" value="id"/><s:property value="name"/></s:a></span>
                       	 	</div>
                       	</div>
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
				<s:iterator value="comments" status="idx">
					<s:if test="#idx.getCount() < 3">
						<div class="row">
			                <div class="col-md-2">
			                    <div class="portrait">
			                        <s:a action="userBlog" ><s:param name="user.id" value="commenter.id"/><img src="<s:property value="commenter.pic"/>"/></s:a>
			                        <br/>
								     <span>
			                    		<s:a action="userBlog" ><s:param name="user.id" value="commenter.id"/><s:property value="commenter.nickName"/></s:a>
			                    	</span>
			                    </div>
			                </div>
			                <div class="col-md-10">
			                    <div class="forumContent">
			                        <s:property value="content"/>
			                    </div>
			     
			                    <div class="forumContentDate">
			                        <s:date name="commentTime" format="%{getText('global.display.datetime')}"/>
			                    </div>
			                </div>
			            </div>
			        </s:if>
				</s:iterator>
				
				<br/>
				<div>
					<s:form theme="css_xhtml" name="commentsForm" method="post" action="saveUserBlogComments" validate="true">
	                <s:hidden name="user.id"/>
	                <textarea class="form-control" rows="3"></textarea>
	                <br/>
	                <input type="button" id="message_submit_btn" class="btn btn-primary btn-lg btn-block" value="提交留言" />
	            	</s:form>
				</div>
			</div>
		</div>
		

		<div class="col-sm-4">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="statisticsItem">
							<span><img src="/images/org/icon_founded.png" alt=""></span>
							<span>2013/11/24</span>
						</div>
						
						<div class="statisticsItem">
							<span>
								<img src="/images/org/icon_course.png" alt=""></span>
							<span><s:property value="orgCourseNum"/></span>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="statisticsItem">
							<span>
								<img src="/images/org/icon_teacher.png" alt=""></span>
							<span>123</span>
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
						<s:iterator value="hotTeachers">
			                <a href="userBlog.html?user.id=<s:property value="course.teacher.id"/>" title="<s:property value="course.teacher.nickName"/>"><img class="teacherPortrait" src="<s:property value="course.teacher.pic"/>"/></a>
			                <div>
			                <p class="teacherTitle"><s:property value="nickName"/></p>
			                <br/>
			                <p><s:property value="course.teacher.selfDescription"/></p>
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
			                <a href="userBlog.html?user.id=<s:property value="course.teacher.id"/>" title="<s:property value="course.teacher.nickName"/>"><img class="teacherPortrait" src="<s:property value="course.teacher.pic"/>"/></a>
			                <div>
			                <p class="teacherTitle"><s:property value="nickName"/></p>
			                <br/>
			                <p><s:property value="course.teacher.selfDescription"/></p>
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
		                        <div>topic: <s:property value="nickName"/></div>
		                        <p></p>
		                        <div>numbers:
		                            <s:property value="%{getText('lable.class.no1')}" />
		                            <s:property value="course.FinshedClassNum+1"/>
		                            <s:property value="%{getText('lable.class.no2')}" />
		                        </div>
		                        <p></p>
		                        <div>times:<s:date name="date" format="%{getText('dateformat.forclass')}"/></div>
		                        <p></p>
		                        <div>teacher: <s:property value="course.teacher.nickName"/></div>
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
						<div class="row">
							<div class="col-md-4"><img class="teacherPortrait" src="/images/org/portrait2.jpg"  /></div>
							<div class="col-md-4"><img class="teacherPortrait" src="/images/org/portrait4.jpg"  /></div>
							<div class="col-md-4"><img class="teacherPortrait" src="/images/org/portrait5.jpg"  /></div>
						</div>
						
						<br/>
						<button type="button" class="btn btn-primary btn-block">Enter</button>
					</div>
				</div>
				<br/>
			</div>
		</div>
</div>
</div>
