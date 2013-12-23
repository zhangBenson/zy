<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>


<div class="container">
    <s:hidden value="%{#session.userID}" id="hidSessionId"/>
	<div class="thinline"></div>
	<div class="row">
		<div class="col-sm-8">
			<div id="schoolInfo">
				<img src="<s:property value="org.logoUrl"/>" class="schoolPortrait"/>
				
				<h1 class ="courseSubject"><s:property value="org.schoolName"/></h1>

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
				<!-- <div class="forumsinfo">
					<div class="forumsUserContainer">
						<img src="gogowisestyle/image/portrait2.jpg" alt="" class="forumportrait">
						<p class="textOverSinglerow">Name</p>
					</div>
					<div class="forumsContentContainer">
						<div class="forumText">
							For students, that means you really have to pay attention in all your computer scienceclasses.For students, that means you really have to pay attention in all your computer scienceclasses.
						</div>
						<p class="text-right">2013-11-12</p>
					</div>
					<div class="clearfix"></div>
				</div> -->
                <%--<div id="message_list_ul">
                   <s:set var="flag" value="true"/>
                   <s:iterator value="comments" status="idx">

                        <s:if test="flag">
                            <div class="row">
                                <div class="forumsinfo">
                                    <div class="forumsUserContainer">
                                        <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="commenter.id"/><img src="<s:property value="commenter.pic"/>" alt="" class="forumportrait"/></s:a>
                                        <s:a action="userBlog" cssClass="nick_name"><s:param name="user.id" value="commenter.id"/><p class="textOverSinglerow"><s:property value="commenter.nickName"/></p></s:a>
                                    </div>

                                    <div class="forumsContentContainer">
                                        <div class="forumText"><s:property value="content"/></div>
                                        <p class="text-right"><s:date name="commentTime" format="%{getText('global.display.datetime')}"/></p>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>

                            </div>
                            <s:if test="#idx.index > 3"><s:set var="flag" value="false"/></s:if>
                        </s:if>

                    </s:iterator>
                </div>
                   --%>

                <div id="message_list_ul">
                    <s:iterator value="comments" status="idx">
                        <s:if test="#idx.index < 3">
                            <div class="row">
                                <div class="forumsinfo">
                                    <div class="forumsUserContainer">
                                        <s:a action="userBlog" ><s:param name="user.id" value="commenter.id"/><img src="<s:property value="commenter.pic"/>"  alt="" class="forumportrait"/></s:a>
                                        <br/>
                                         <span>
                                            <s:a action="userBlog" ><s:param name="user.id" value="commenter.id"/><s:property value="commenter.nickName"/></s:a>
                                        </span>
                                    </div>
                                </div>
                                <div class="forumsContentContainer">
                                    <div class="forumContent">
                                        <s:property value="description"/>
                                    </div>

                                    <div class="forumContentDate">
                                        <p class="text-right"><s:date name="createDate" format="%{getText('global.display.datetime')}"/></p>

                                    </div>
                                </div>
                            </div>
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
					<div class="col-sm-6">
						<div class="statisticsItem">
							<img src="/images/org/icon_founded.png" alt="">
							<span><s:property value="orgCreateDate"/></span>
						</div>
						<div class="statisticsItem">
							<span><img src="/images/org/icon_course.png" alt=""></span>
							<span><s:property value="orgCourseNum"/></span>
						</div>
					</div>
					<div class="col-sm-6">
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
							<div class="row">
								<div class="col-md-4">
									<img src="../../images/course/portrait2.jpg" class="normalPortrait"/>
									<p class="textOverSinglerow">Name</p>
								</div>
								<div class="col-md-4">
									<img src="../../images/course/portrait4.jpg" class="normalPortrait"/>
									<p class="textOverSinglerow">Name</p>
								</div>
								<div class="col-md-4">
									<img src="../../images/course/portrait5.jpg" class="normalPortrait"/>
									<p class="textOverSinglerow">Name</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<img src="../../images/course/portrait2.jpg" class="normalPortrait"/>
									<p class="textOverSinglerow">Name</p>
								</div>
								<div class="col-md-4">
									<img src="../../images/course/noportrait.jpg" class="normalPortrait"/>
									<p class="textOverSinglerow">Available</p>
								</div>
							</div>
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
    var SellerScroll = function(options) {
        this.SetOptions(options);
        this.lButton = this.options.lButton;
        this.rButton = this.options.rButton;
        this.oList = this.options.oList;
        this.showSum = this.options.showSum;

        this.iList = $("#" + this.options.oList + " > li");
        this.iListSum = this.iList.length;
        this.iListWidth = this.iList.outerWidth(true);
        this.moveWidth = this.iListWidth * this.showSum;

        this.dividers = Math.ceil(this.iListSum / this.showSum);	//共分为多少块
        this.moveMaxOffset = (this.dividers - 1) * this.moveWidth;
        this.LeftScroll();
        this.RightScroll();
    };
    SellerScroll.prototype = {
        SetOptions: function(options) {
            this.options = {
                lButton: "left_scroll",
                rButton: "right_scroll",
                oList: "scroll_ul",
                showSum: 4    //一次滚动多少个items
            };
            $.extend(this.options, options || {});
        },
        ReturnLeft: function() {
            return isNaN(parseInt($("#" + this.oList).css("left"))) ? 0 : parseInt($("#" + this.oList).css("left"));
        },
        LeftScroll: function() {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.lButton).click(function() {
                currentOffset = _this.ReturnLeft();
                if (currentOffset == 0) {
                    for (var i = 1; i <= _this.showSum; i++) {
                        $(_this.iList[_this.iListSum - i]).prependTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth });
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, { duration: "slow", complete: function() {
                        for (var j = _this.showSum + 1; j <= _this.iListSum; j++) {
                            $(_this.iList[_this.iListSum - j]).prependTo($("#" + _this.oList));
                        }
                        $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 1) });
                    } });
                } else {
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, "slow");
                }
            });
        },
        RightScroll: function() {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.rButton).click(function() {
                currentOffset = _this.ReturnLeft();
                if (Math.abs(currentOffset) >= _this.moveMaxOffset) {
                    for (var i = 0; i < _this.showSum; i++) {
                        $(_this.iList[i]).appendTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 2) });

                    $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, { duration: "slow", complete: function() {
                        for (var j = _this.showSum; j < _this.iListSum; j++) {
                            $(_this.iList[j]).appendTo($("#" + _this.oList));
                        }
                        $("#" + _this.oList).css({ left: 0 });
                    } });
                } else {
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, "slow");
                }
            });
        }
    };
    $(document).ready(function() {
        var ff = new SellerScroll();

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

    function getSubString(parentStr,shortLength){
        if(/.*[\u4e00-\u9fa5]+.*$/.test(parentStr)){
            if(parentStr.length>shortLength){
                return parentStr.substring(0,shortLength)+"...";
            }
        }else{
            if(parentStr.length>2*shortLength){
                return parentStr.substring(0,2*shortLength)+"...";
            }
        }
    }

    function replyToComment(nickName,userID){
        var prefixStr = "回复";
        $("#message_textarea").val(prefixStr+nickName+": ");
        $("#message_textarea").focus();
        $.post("putUserIDtoSession.html",{'user.id':userID},function(data){});
    }
    function deleteThisComment(obj,commentId){
        $(obj).parents("li.li_out").remove();
        $.post("deleteOrgComment.html",{'comment.id':commentId},function(data){});

    }

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