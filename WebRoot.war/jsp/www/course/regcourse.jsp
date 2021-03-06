<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<div class="container">
    <div class="thinline"></div>
    <h1 class="courseSubjectRow">*****<a href="voaCourseBlog.html?course.id=<s:property value="course.id"/>"
                                         title="<s:property value="name"/>"><s:property value="course.name"/></a></h1>
    <a href="voaCourseBlog.html?course.id=<s:property value="course.id"/>" title="<s:property value="name"/>">
        <img src="<s:property value="course.logoUrl" />" class="courseInfoImg"/>
    </a>
    <ul class="list-inline">
        <li class="searchItemState"><s:text name="course.school"/>:<a
                href="orgBlog.html?org.id=<s:property value="course.organization.id"/>"
                title="<s:property value="course.organization.nickName"/>"><s:property value="course.organization.schoolName"/></a></li>
        <li class="searchItemState"><s:text name="courses.info.lecturer"/>:<a
                href="userBlog.html?user.id=<s:property value="course.teacher.id"/>"
                title="<s:property value="course.teacher.nickName"/>"><s:property value="course.teacher.nickName"/></a>
        </li>
        <li class="searchItemState"><s:text name="label.forcast.enrollment"/>:<s:property value="course.observationNum"/></li>
        <li class="searchItemState"><s:text name="lable.course.date"/>:<s:date
                name="course.startDate" format="%{getText('dateformat')}"/></li>
        <li class="searchItemState"><s:text name="label.online.class.totalperods"/>:<s:property value="course.totalHours"/>&nbsp;<s:text name="label.online.class.perods"/></li>
        <li class="searchItemState"><s:text name="label.course.fee"/>:
            <s:property value="course.charges"/>
            <s:if test="course.consumptionType">
                <s:text name="label.zhibi.true"/>
            </s:if>
            <s:else>
                <s:text name="label.course.zhiquan"/>
            </s:else>
    </ul>
    <h4 class="courseBody">
        <a href="voaCourseBlog.html?course.id=<s:property value="course.id"/>"
           title="<s:property value="course.name"/>">
            <s:if test="course.description.length() > 200">
                <s:property value="course.description.substring(0,200)+'...'"/>
            </s:if>
            <s:else>
                <s:property value="course.description"/>
            </s:else>
        </a>
    </h4>

    <table class="table">
        <s:if test="course.classes != null && course.classes.size > 0">
            <thead>
            <tr>
                <th>#</th>
                <th><s:text name="lable.course.nickname"/></th>
                <th><s:text name="lable.course.starttime"/></th>
                <th><s:text name="label.lastingtime"/></th>
            </tr>
            </thead>
            <tbody>
            <s:if test="course.getForcastClasses() == null || course.getForcastClasses().size()==0">
                <s:iterator value="course.classes">
                    <tr class="fontRedBold">
                        <td><s:property value="name"/></td>
                        <td><s:property value="nickName"/></td>
                        <td><s:date name="date" format="%{getText('global.display.hour.minute')}"/></td>
                        <td><s:property value="duration"/></td>
                    </tr>
                </s:iterator>
            </s:if>
            <s:elseif test="course.getForcastClasses().size()>0">
                <s:iterator value="course.classes" begin="0"
                            end="course.classes.size() - course.getForcastClasses().size() - 1">
                    <tr class="fontRedBold">
                        <td><s:property value="name"/></td>
                        <td><s:property value="nickName"/></td>
                        <td><s:date name="date" format="%{getText('global.display.hour.minute')}"/></td>
                        <td><s:property value="duration"/></td>
                    </tr>
                </s:iterator>
                <s:iterator value="course.getForcastClasses()">
                    <tr>
                        <td><s:property value="name"/></td>
                        <td><s:property value="nickName"/></td>
                        <td><s:date name="date" format="%{getText('global.display.hour.minute')}"/></td>
                        <td><s:property value="duration"/></td>
                    </tr>
                </s:iterator>
            </s:elseif>
            </tbody>
        </s:if>
    </table>

    <div style="text-align: center;font-size: 16;color: red">

        <s:actionerror></s:actionerror>


    </div>
    <div style="text-align: center;">
        <div class="row">

            <s:if test="course.charges!=0">

                <s:if test="errorMessagePaypalStatu">
                    <s:form action="purchaseCourse" method="POST" theme="css_xhtml" id="purchaseCourse_Form">
                        <s:hidden name="course.id"/>

                        <div class="col-sm-6">
                                <%--<input type="button" class="btn btn-primary btn-lg btn-block" value="" id="reservationconfirmed"/> --%>
                            <button type="button" class="btn btn-primary btn-lg btn-block" value="" id="reservationconfirmed">
                                <s:text name="button.course.confirm.registration"/></button>
                        </div>
                        <div class="col-sm-6">
                                <%-- <button type="button" class="btn btn-danger btn-lg btn-block">Cancel</button> --%>
                            <input type="button" class="btn btn-danger btn-lg btn-block"
                                   value="<s:text name="button.cancel"/>"/>
                        </div>
                    </s:form>
                </s:if>
                <s:else>


                    <s:form action=" https://www.paypal.com/cgi-bin/webscr" method="POST" theme="css_xhtml" id="purchaseCourse_Form" onsubmit="return validatePaypal();">
                        <s:hidden name="course.id"/>
                        <s:hidden name="course.charges"/>
                        <input type="hidden" name="cmd" value="_xclick">
                        <input type="hidden" name="business" value="zeng_zeng@gogowise.com"><!--这里填写你的paypal账户email-->
                        <input type="hidden" name="item_name" value="<s:property value="course.name" /> "><!--这里填写客户订单的一些相关信息，当客户连到paypal网站付款的时候将看到这些信息-->
                        <input type="hidden" name="amount" value="<s:property value="course.charges" />"><!--订单的总金额信息-->
                        <input type="hidden" name="currency_code" value="SGD"><!--订单总金额对应的货币类型 ,客户可以用其他币种来付款,比如这里订单币种是美元USD,客户可以用欧元EUR来付款,由paypal根据当前汇率自动实现币种之间的换算-->

                        <input type="hidden" name="notify_url"
                               value="<s:property value="host" />/ipn.html?userID=<s:property value="%{#session.userID}"/>&courseID=<s:property value="course.id"/>"><!--这里告诉paypal付款的通信url,即当客户付款后调用这个url通知系统-->
                        <input type="hidden" name="return"
                               value="<s:property value="host" />/courseCenter.html?flag=paypalBack&courseID=<s:property value="course.id"/> ">

                        <s:if test="errorMessageStatu==false ">

                            <div class="col-sm-6">
                                    <%--<input type="button" class="btn btn-primary btn-lg btn-block" value="" id="reservationconfirmed"/> --%>

                                <button type="button" class="btn btn-primary btn-lg btn-block" value="" id="reservationconfirmed">
                                    <s:text name="button.course.confirm.Buy"/></button>


                            </div>
                            <div class="col-sm-6">
                                    <%-- <button type="button" class="btn btn-danger btn-lg btn-block">Cancel</button> --%>
                                <input type="button" class="btn btn-danger btn-lg btn-block"
                                       value="<s:text name="button.cancel"/>"/>
                            </div>
                        </s:if>
                    </s:form>
                </s:else>
            </s:if>


            <s:else>
                <s:form action="purchaseCourse" method="POST" theme="css_xhtml" id="purchaseCourse_Form">
                    <s:hidden name="course.id"/>

                    <div class="col-sm-6">
                            <%--<input type="button" class="btn btn-primary btn-lg btn-block" value="" id="reservationconfirmed"/> --%>
                        <button type="button" class="btn btn-primary btn-lg btn-block" value="" id="reservationconfirmed">
                            <s:text name="button.course.confirm.registration"/></button>
                    </div>
                    <div class="col-sm-6">
                            <%-- <button type="button" class="btn btn-danger btn-lg btn-block">Cancel</button> --%>
                        <input type="button" class="btn btn-danger btn-lg btn-block" id="addIteam"
                               value="<s:text name="button.cancel"/>"/>
                    </div>
                </s:form>

            </s:else>


        </div>

    </div>
</div>

<script type="text/javascript">
    var notenough = "<s:text name='label.not.enough'/>";
    var time = 10;
    function descTime() {
        time = time - 1;
        if (time < 0) {
            time = 0;
        }
        $("#time").text(time);
    }

    function goUrl() {
        window.location.href = "myForcastClass.html";
    }
    $(document).ready(function () {
        $("#reservationconfirmed").click(function () {
            $("#purchaseCourse_Form").submit();
        });

        <%--$("#reservationconfirmed").click(function(){--%>
        <%--var url = "courseconfirm.html";--%>
        <%--var zhibi = <s:property value="userAccountInfo.zhiBi"/> +'';--%>
        <%--var zhiquan = <s:property value="userAccountInfo.zhiQuan"/>+'';--%>
        <%--var cost =  <s:property value="course.charges" />;--%>
        <%--<%--var cost = <s:if test="%{course.personalTeacher == null}"><s:property value="%{4 * course.classes.size}"/></s:if><s:else><s:property value="course.charges" /></s:else> ;--%>
        <%--if((zhibi+zhiquan) >= cost){--%>
        <%--$.post(url,{'course.id':"<s:property value="course.id"/>"},function(data){--%>
        <%--// alert(data.message);--%>
        <%--$("#msg").text(data.message);--%>
        <%--if(data.state){--%>
        <%--$("#zhibi").text(data.zhiBi);--%>
        <%--$("#zhiquan").text(data.zhiQuan);--%>
        <%--$("#panelinfo").css({"display":"block"});--%>
        <%--setTimeout(goUrl,10000)//500是0.5秒 \--%>
        <%--setInterval('descTime()',1000);--%>
        <%--}--%>
        <%--});--%>
        <%--} else{--%>
        <%--$("#msg").text(notenough);--%>
        <%--}--%>

        <%--});--%>
    })
    function validatePaypal() {


        var value = $("#purchaseCourse_Form_course_charges").val();


        $("#paypalAmount").val(value);

        return true;
    }
</script>

