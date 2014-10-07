<%--
  Created by IntelliJ IDEA.
  User: Ji JianHui
  Date: 14-8-20
  Time: 下午3:59
  Email: jhji@ir.hit.edu.cn
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript">
    $(document).ready(function(){
        $(".QuestionList").hide();
        $(".details").click(function(){
            $(this).parent().parent().find(".QuestionList").toggle("slow");
        })
    })
</script>

<link type="text/css" rel="stylesheet" href="/css/user/question_result.css"/>


<div class="container">

    <div class="thinline"></div>

    <br/>


    <div class="qeustionItem">

            <a href="voaCourseBlog.html?course.id=<s:property value="course.id"/>">
            <img src="<s:property value="course.logoUrl"/>" class="searchCourseImg">
            </a>

            <div>
                <div>
                    <div class="questionTitle"><s:property value="course.name"/></div>
                    <div class="statistics">Total Episodes:<span><s:property value="course.classes.size()"/> </span></div>
                    <div class="statistics">Episodes finished: <span>XX</span></div>
                    <div class="statistics">Total Question:<span><s:property value="questionResults.size()"/> </span></div>
                    <div class="statistics">Right Answer:<span><s:property value="answeredCorrect"/> </span></div>
                </div>

                <div class="percentage"><s:property value="answeredCorrectRate"/>%</div>
                <div class="detailstext"><a href="#"  class="details">Details</a></div>
                <div class="clearfix"></div>

                <div class="questionDiv">
                    <div class="QuestionList">

                        <s:iterator value="classes" id="class" status="status">
                            <s:set name="index" value="1" />
                            <div class="QuestionItem">

                                <%--显示Courseclass的名称--%>
                                <s:iterator value="questionResults" id="questionResult">
                                    <s:if test = "#questionResult.courseClass.id==#class.id&&#index==1">
                                        <span class="lessontext"><s:property value="name"/><s:property value="nickName"/></span>
                                        <s:set name="index" value="2"/>
                                    </s:if>
                                </s:iterator>

                                <%--显示用户回答的答案--%>
                                <s:iterator value="questionResults" id="questionResult">

                                    <s:if test="#questionResult.courseClass.id==#class.id">

                                        <div class="questionstext">
                                            <s:property value="#questionResult.question.description"/>
                                        </div>

                                        <%--问题的选项--%>
                                        <div class="option">
                                            <s:iterator value="#questionResult.question.questionItems" status="#status" id="questionItem">
                                                <span>
                                                    <s:property value="#questionItem.indexValue"/>:
                                                    <s:property value="#questionItem.description"/>
                                                </span>
                                            </s:iterator>
                                        </div>

                                        <div class="answeroption">

                                            <span>All Answer:<s:property value="#questionResult.question.answeredNum" /></span>
                                            <br>
                                            <span>Right Answer: <s:property value="#questionResult.question.answeredCorrectNum"/></span>
                                            <span>( <s:property value="#questionResult.question.getAnsweredAccurcy()"/>% )</span>

                                        </div>

                                        <br/>

                                    </s:if>
                                </s:iterator>

                            </div>
                        </s:iterator>

                    </div>
                </div>

            </div>

            <div class="clearfix"></div>
            <br/>

        </div>

</div>
