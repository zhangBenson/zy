<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link type="text/css" href="css/view.css" rel="stylesheet"/>
<script type="text/javascript" src="js/view.js"></script>

<script type="text/javascript">
    function deleteClass(id) {
        window.location.href = "deleteClass.html?courseClass.id=" + id;
    }

    function editClass(idx) {

        var className = document.getElementById("className" + idx).innerHTML;

        var nickName = document.getElementById("nickName" + idx).innerHTML;
        var startDate = document.getElementById("startDate" + idx).innerHTML;
        var startTime = document.getElementById("startTime" + idx).innerHTML;
        var endTime = document.getElementById("endTime" + idx).innerHTML;

        var classNameInput = document.getElementById("courseClassName");
        var startDateInput = document.getElementById("date");
        var nickNameInput = document.getElementById("nickName");
        var duration = document.getElementById("duration123");


        classNameInput.value = className;
        nickNameInput.value = nickName;
        var str = startTime.split("：");
        startDateInput.value = startDate + " " + str[0] + ":" + str[1];
        var str2 = endTime.split("：");
        var temp = str2[0] * 60 + parseInt(str2[1]) - str[0] * 60 - parseInt(str[1]);
        for (var i = 0; i < duration.options.length; i++) {
            if (temp == duration.options[i].value) {
                duration.options[i].selected = true;
            }
        }
    }
    var SellerScroll = function (options) {
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
        SetOptions: function (options) {
            this.options = {
                lButton: "left_scroll",
                rButton: "right_scroll",
                oList: "carousel_ul",
                showSum: 6	//一次滚动多少个items
            };
            $.extend(this.options, options || {});
        },
        ReturnLeft: function () {
            return isNaN(parseInt($("#" + this.oList).css("left"))) ? 0 : parseInt($("#" + this.oList).css("left"));
        },
        LeftScroll: function () {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.lButton).click(function () {
                currentOffset = _this.ReturnLeft();
                if (currentOffset == 0) {
                    for (var i = 1; i <= _this.showSum; i++) {
                        $(_this.iList[_this.iListSum - i]).prependTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth });
                    $("#" + _this.oList + ":not(:animated)").animate({ left: "+=" + _this.moveWidth }, { duration: "slow", complete: function () {
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
        RightScroll: function () {
            if (this.dividers == 1) return;
            var _this = this, currentOffset;
            $("#" + this.rButton).click(function () {
                currentOffset = _this.ReturnLeft();
                if (Math.abs(currentOffset) >= _this.moveMaxOffset) {
                    for (var i = 0; i < _this.showSum; i++) {
                        $(_this.iList[i]).appendTo($("#" + _this.oList));
                    }
                    $("#" + _this.oList).css({ left: -_this.moveWidth * (_this.dividers - 2) });

                    $("#" + _this.oList + ":not(:animated)").animate({ left: "-=" + _this.moveWidth }, { duration: "slow", complete: function () {
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
    $(document).ready(function () {
        var ff = new SellerScroll();
    });

    $(document).ready(function () {
        $("#evaluatebtn").click(function () {
            $("#evaluatepanel").slideToggle(500);
        })
    })
    $(document).ready(function () {
        $("#commentspry").click(function () {
            $("#infopanel").hide("fast");
            $("#communicatepanel").hide("fast");
            $("#commentpanel").show("fast");
        })
    })
    $(document).ready(function () {
        $("#communicatespry").click(function () {
            $("#infopanel").hide("fast");
            $("#communicatepanel").show("fast");
            $("#commentpanel").hide("fast");
        })
    })
    $(document).ready(function () {
        $("#infospry").click(function () {
            $("#infopanel").show("fast");
            $("#communicatepanel").hide("fast");
            $("#commentpanel").hide("fast");
        })
    })

    $(document).ready(function () {
        $(".replyall").click(function () {
            $(".ireply").hide();
            $(".replylist").not($(this).parents("div.commentdetail").children()).hide();
            $(this).parents("div.commentdetail").children("div.replylist").slideToggle(500);
        });
    });

    $(document).ready(function () {
        $(".iwillreply").click(function () {
            $(".replylist").hide();
            $(".ireply").not($(this).parents("div.commentdetail").children()).hide();
            $(this).parents("div.commentdetail").children("div.ireply").slideToggle(500);
        });
    });

    $(document).ready(function () {
        $(" dl dd").hide();
        $("dl dd.ddcurrent").show();
        $("dl dt").click(function () {
            $("dl dd").not($(this).next()).hide();
            $("dl dt").not($(this).next()).removeClass("current");
            $(this).next().slideToggle(500);
            $(this).toggleClass("current");
        });
    });

    $(document).ready(function () {
        $("#f123").click(function () {
            $($("#trFirst")[0]).before($($("#trFirst")[0]).clone());

        });
    });
</script>

<style type="text/css">
    #form_container h2 {
        text-align: left;
        font-size: 18px;
        color: #666;
    }

    .list1 {
        width: 640px;
        border-top: 1px solid #e5eff8;
        border-right: 1px solid #e5eff8;
        border-collapse: collapse;
        margin: 0px 0px 10px 0px;
    }

    .list1 tr.odd td {
        background: #f7fbff
    }

    .list1 tr.odd .column1 {
        background: #f4f9fe;
    }

    .list1 .column1 {
        background: #f9fcfe;
    }

    .list1 td {
        color: #678197;
        border-bottom: 1px solid #e5eff8;
        border-left: 1px solid #e5eff8;
        padding: .2em 1em;
        text-align: center;
    }

    .list1 th {
        font-weight: normal;
        color: #678197;
        text-align: left;
        border-bottom: 1px solid #e5eff8;
        border-left: 1px solid #e5eff8;
        padding: .1em 1em;

    }

    .list1 thead th {
        background: #f4f9fe;
        text-align: center;
        font: bold 1em/1.2em "Century Gothic", "Trebuchet MS", Arial, Helvetica, sans-serif;
        color: #66a3d3
    }

    #now {
        background: url(images/navigation-menu2.gif) bottom repeat-x;
        color: #fff;
    }

    #tabtitle {
        float: left;
        overflow: hidden;
        list-style: none;
        margin: 0;
        padding: 0;
        margin-left: 5px;
    }

    #tabtitle li {
        width: 120px;
        height: 25px;
        line-height: 24px;
        float: left;
        text-align: center;
        margin-right: 2px;
        list-style: none;
        font-size: 14px;
        font-weight: bold;
    }

    #tabtitle li a:link, #tabtitle li a:visited {
        text-decoration: none;
        background: url(images/navigation-menu4.gif) repeat-x bottom;
        display: block;
        width: 120px;
        height: 25px;
        color: #fff;
    }

    #tabtitle li a:hover, #tabtitle li a:active {
        background: url(images/navigation-menu5.gif) bottom repeat-x;
        color: #fff;
    }

    #html_1 {
        width: 800px;
        word-wrap: break-word;
        padding: 3px;
        float: left;
    }

    #commentpanel {
        width: 680px;
        margin-left: 15px;
        margin-bottom: 15px;
    }

    #communicatepanel {
        width: 680px;
        margin-left: 15px;
        margin-bottom: 15px;
        display: none;
    }
</style>
<div id="rightcontent">
<div id="html_1">

<div id="sinupfirst">
<img id="top" src="images/form/top.png" alt="">

<div id="form_container">


<h1><a>GoGoWise</a></h1>
<h4 align="center"><s:property value="%{getText('label.online.class.coursename')}"/><s:property
        value="course.name"/></h4>

<h2><s:property value="%{getText('label.created.course')}"/></h2>
<table class="list1">
    <thead>
    <tr class="odd">
        <th scope="col" abbr="Home"><s:property value="%{getText('lable.course.no')}"/></th>
        <th scope="col" abbr="Home"><s:property value="%{getText('lable.course.nickname')}"/></th>
        <%--<th scope="col" abbr="Home Plus"><s:property value="%{getText('lable.course.date')}" /></th>--%>
        <th scope="col" abbr="Business"><s:property value="%{getText('lable.course.starttime')}"/></th>
        <th scope="col" abbr="Business Plus"><s:property value="%{getText('lable.course.endtime')}"/></th>
        <th scope="col" abbr="Business Plus">&nbsp;</th>
        <th scope="col" abbr="Business Plus">&nbsp;</th>
    </tr>
    </thead>
    <tbody>

    <s:iterator value="classes">
        <tr>
            <td id="className<s:property value="id"/>"><s:property value="name"/></td>
            <td id="nickName<s:property value="id"/>"><s:property value="nickName"/></td>
            <td id="startDate<s:property value="id"/>"><s:date name="date"
                                                               format="%{getText('global.display.hour.minute')}"/></td>
                <%--<td id="startDate<s:property value="id"/>"><s:date name="date" format="%{getText('global.display.hour.minute1')}" /></td>--%>
                <%--<td id="startDate<s:property value="id"/>"><s:text name="date" ><s:param name="date" value="" ></s:param></s:text></td>--%>
                <%--<td id="finishDate<s:property value="id"/>"><s:text name="finishDate" ><s:param name="finishDate" value="" ></s:param></s:text></td>--%>
            <td id="finishDate<s:property value="id"/>"><s:date name="finishDate"
                                                                format="%{getText('global.display.hour.minute1')}"/></td>
            <td><input type="button" name="edit" value="" id="button<s:property value="id"/>"
                       onclick="editClass(<s:property value="id"/>)"
                       style="background:url(images/courseImages/edit.gif) no-repeat; width:60px; height:33px; border:none; cursor:pointer;"/>
            </td>
            <td><input type="button" name="delete" id="delete" value="" onclick="deleteClass(<s:property value="id"/>);"
                       style="background:url(images/courseImages/delete.gif) no-repeat; width:60px; height:33px; border:none; cursor:pointer;"/>
            </td>
        </tr>
    </s:iterator>

    </tbody>
</table>

<div id="tabs10">
    <ul>
        <li><a href="####" id="commentspry"><span>自定义排课</span></a></li>
        <li><a href="####" id="communicatespry"><span>自动排课系统</span></a></li>
    </ul>
</div>


<div>
    <s:form action="saveClass" validate="true" theme="css_xhtml" method="POST" id="commentpanel">
        <s:hidden name="course.id"/>
        <div class="appnitro">
            <div class="form_description">
                <h2>&nbsp;</h2>
            </div>
            <ul>
                <li id="li_1">
                    <label class="description" for="element_1"><s:property
                            value="%{getText('lable.course.name')}"/> </label>

                    <div>
                        <s:textfield name="courseClass.name" id="courseClassName" class="element text medium"
                                     type="text" maxlength="255" value="%{getText('class.count',{classCount})}"
                                     readonly="true"/>
                    </div>
                </li>
                <li>
                    <label class="description" for="element_1"><s:property
                            value="%{getText('lable.course.nickname')}"/></label>

                    <div>
                        <s:textfield name="courseClass.nickName" id="nickName" class="element text medium" type="text"
                                     maxlength="255" value=""/>
                    </div>
                </li>
                <li id="li_2">
                    <label class="description" for="element_2"><s:property
                            value="%{getText('lable.course.date')}"/> </label>
		<span>

			<!--s:textfield name="courseClass.date" id="date" value="" cssClass="date" readonly="true" /-->
            <!--s:textfield name="courseClass.date" id="date" /-->
             <s:textfield name="courseClass.date" id="date" value="" readonly="true" cssClass="WdateTime"
                          onfocus="WdatePicker({lang:'%{getText('language')}',startDate:'%y-%M-01 00:00:00',dateFmt:'%{getText('dateformat.forclass')}',alwaysUseStartDate:true})"/>
		</span>
                </li>
                    <%--<li id="li_3" >--%>
                    <%--<label class="description" for="element_3"><s:property value="%{getText('lable.course.starttime')}" /> </label>--%>
                    <%--<span>--%>
                    <%--<s:select  list="{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23}"--%>
                    <%--name="courseClass.startTimeHour" id="sth" theme="simple" value="" headerKey="0" headerValue="--"/>--%>
                    <%--<label>HH</label>--%>
                    <%--</span>--%>
                    <%--<span>--%>
                    <%--<s:select  list="{0,5,10,15,20,25,30,35,40,45,50,55}"--%>
                    <%--name="courseClass.startTimeMinite" id="stm" value="" theme="simple" headerKey="0" headerValue="--"/>--%>
                    <%--<label>MM</label>--%>
                    <%--</span>--%>
                    <%--</li>--%>
                <li id="li_4">
                    <label class="description" for="element_4">持续时间</label>
                    <s:select list="{55,50,45,40,35,30}" id="duration123" name="durations" theme="simple" headerKey="60"
                              headerValue="60"/>
                        <%--<span>--%>
                        <%--<s:select  list="{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23}"--%>
                        <%--name="courseClass.endTimeHour" id="eth" theme="simple" value="" headerKey="0" headerValue="--"/>--%>
                        <%--<label>HH</label>--%>
                        <%--</span>--%>
                        <%--<span>--%>
                        <%--<s:select  list="{0,5,10,15,20,25,30,35,40,45,50,55}"--%>
                        <%--name="courseClass.endTimeMinite" id="etm"  value="" theme="simple" headerKey="0" headerValue="--"/>--%>
                        <%--<label>MM</label>--%>
                        <%--</span>--%>
                </li>
                <li class="buttons">
                    <input type="submit" name="button1" id="button1" class="button"
                           value="<s:property value="%{getText('button.save')}" />"/>
                </li>
                <span class="info"></span>
            </ul>
        </div>
    </s:form>


    <s:form action="autoSaveClass" validate="true" theme="css_xhtml" method="POST">
        <s:hidden name="course.id"/>
        <div id="communicatepanel">
            <table width="498" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr>
                    <td colspan="4">上课时间</td>
                </tr>
                <tr>
                    <td colspan="3" align="right">
                        <table width="100%" border="0" cellspacing="2" cellpadding="0">

                            <tr id="trFirst">
                                <td>开始时间：</td>
                                <td>
                                    <s:textfield name="startTimes" value="" readonly="true" cssClass="WTime"/>
                                </td>
                                <td>持续时间：</td>
                                <td>
                                    <s:select list="{55,50,45,40,35,30}" name="durations" theme="simple" headerKey="60"
                                              headerValue="60"/>
                                </td>
                            </tr>

                        </table>
                        <input type="button" id="f123" value="添加"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table width="100%" border="0" cellspacing="2" cellpadding="0">
                            <tr>
                                <td>定期模式：</td>
                            </tr>

                            <tr>
                                <td align="center">
                                    <input type="checkbox" name="classDate" value="0"/>
                                    <label></label>
                                    星期天
                                    <input type="checkbox" name="classDate" value="1"/>
                                    <label></label>
                                    星期一
                                    <input type="checkbox" name="classDate" value="2"/>
                                    <label></label>
                                    星期二
                                    <input type="checkbox" name="classDate" value="3"/>
                                    <label></label>
                                    星期三
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <input type="checkbox" name="classDate" value="4"/>
                                    <label></label>
                                    星期四
                                    <input type="checkbox" name="classDate" value="5"/>
                                    <label></label>
                                    星期五
                                    <input type="checkbox" name="classDate" value="6"/>
                                    <label></label>
                                    星期六
                                </td>
                            </tr>

                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">重复范围：</td>
                </tr>
                <tr>
                    <td width="64">&nbsp;</td>
                    <td width="162">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4" align="center">重复<input name="repeatTimes" type="text" size="2"/>周结束</td>
                </tr>
                <tr>
                    <td colspan="3" align="center"><s:submit value="确定"/>&nbsp;&nbsp;&nbsp;<input type="button"
                                                                                                  value="取消"/></td>
                </tr>
            </table>
        </div>
    </s:form>
    <div id="footer">
        <s:property value="%{getText('text.backto')}"/><a href="coursePart.html"><s:property
            value="%{getText('menu.item.studyonline')}"/></a>
    </div>
</div>

<img id="bottom" src="images/form/bottom.png" alt="">
</div>
</div>


</div>
</div>

