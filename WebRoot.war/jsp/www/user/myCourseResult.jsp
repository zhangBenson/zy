<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript">
    $(document).ready(function(){
        $(".QuestionList").hide();
        $(".details").click(function(){
            $(this).parent().parent().find(".QuestionList").toggle("slow");
        })
    })
</script>
<style type="text/css">
    .questionTitle
    {
        color:#6ab600;font-size: 24px;
    }
    .statistics
    {
        float:left;margin-left: 35px;font-size: 14px;color: #0776A0;
    }
    .percentage
    {
        font-size: 36px;float:left;color:#6ab600;position:relative;bottom:24px;left:50px;
    }
    .detailstext
    {
        font-size: 12px;float:left;color:#6ab600;position:relative;bottom:-24px;left:-15px;
    }
    .details
    {
        color: #F29530;
    }
    .questionDiv
    {
        margin-left: 150px;
    }
    .lessontext
    {
        font-size: 24px;font-family: Verdana, Geneva, sans-serif;color: #6ab600;
    }
    .questionstext{
        margin-left: 10px;font-family: Verdana, Geneva, sans-serif;color: #00B266;
    }
    .option
    {
        margin-left: 10px;font-family: Verdana, Geneva, sans-serif;color: #6ab600;
    }
    .option span
    {
        margin-left: 20px;
    }
    .answeroption
    {
        margin-left: 30px;font-family: Verdana, Geneva, sans-serif;color: #6ab600;
    }
    .answerRight
    {
        font-size: 24px;color: #6ab600;
    }
    .answerWrong
    {
        font-size: 24px;color: red;
    }

</style>


<div class="container">

    <div class="thinline"></div>

    <br/>

    <div class="qeustionItem">
        <a href="voaCourseBlog.html?course.id=<s:property value="#course.id"/>">
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
                            <s:iterator value="questionResults" id="questionResult">
                                <s:if test = "#questionResult.courseClass.id==#class.id&&#index==1">
                                    <span class="lessontext"><s:property value="name"/><s:property value="nickName"/></span>
                                    <s:set name="index" value="2"/>
                                </s:if>
                            </s:iterator>

                            <s:iterator value="questionResults" id="questionResult">
                                    <s:if test="#questionResult.courseClass.id==#class.id">
                                        <div class="questionstext">
                                            <s:property value="#questionResult.question.description"/>

                                            <s:if test="#questionResult.isCorrect"><span class="answerRight">√</span></s:if>
                                            <s:else><span class="answerWrong">X</span></s:else>
                                        </div>

                                        <div class="option">
                                            <s:iterator value="#questionResult.question.questionItems" status="status" id="questionItem">
                                                <span>
                                                    <s:property value="#questionItem.indexValue"/>:
                                                    <s:property value="#questionItem.description"/>
                                                </span>
                                            </s:iterator>
                                        </div>

                                        <div class="answeroption">
                                            <span>Righte Answer:</span>
                                            <span>
                                                <s:iterator value="#questionResult.question.questionItems" id="rightQuestionItem">
                                                    <s:if test="#rightQuestionItem.isAnswer">
                                                        <s:property value="#rightQuestionItem.indexValue"/>:
                                                        <s:property value="#rightQuestionItem.description"/>
                                                    </s:if>
                                                </s:iterator>
                                            </span>
                                            <br>
                                            <span>Your Answer:</span>
                                            <span>
                                                <s:property value="#questionResult.questionItem.indexValue"/>
                                                <s:property value="#questionResult.questionItem.description"/>
                                            </span>
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