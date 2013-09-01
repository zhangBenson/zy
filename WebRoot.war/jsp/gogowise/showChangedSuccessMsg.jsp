<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<style type="text/css">
    #protocol {
        width: 700px;
        margin: 100px auto 16px;
        font-family: "微软雅黑", "宋体";
    }

    #protocol img {
        width: 700px;
        height: 9px;
        border: none;
    }

    #protocol h2 {
        text-align: center;
        font-size: 18px;
        font-weight: bold;
    }

    #protocol h1 {
        background-color: #6699CC;
        margin: 0;
        padding: 0;
        text-decoration: none;
        width: 700px;
        height: 45px;
        color: #FFF;
        font-size: 24px;
    }

    #protocol #cons {
        margin: 10px;
        height: 430px;
        overflow-x: hidden;
        overflow-y: scroll;
        border: #F0F0F0 1px solid;
        text-align: left;
        font-size: 14px;
        padding: 5px 8px 0px;
    }

    #protocol #cons table tr {
        height: 30px;
        font-size: 12px;
    }

    #protocol #bottom {
        margin: 6px;
        text-align: center;
    }

    #protocol p {
        text-indent: 2em;
    }

    .highlight {
        color: #0080C0;
    }

    #protocol #bianma {
        text-align: right;
        font-size: 12px;
        color: #999;
    }
    #message{ font-family:"微软雅黑", "宋体"; font-size:14px; text-align: center;}
    #message b{ color:#800040;}
    #message a{ text-decoration: underline; color:#0000ff;}
</style>
<div>
    <div id="protocol">
        <img src="form/top.png" alt="">

        <h1><a>&nbsp;Gogowise</a></h1>

        <div id="cons">
            <p>

            <h2><s:property value="changeResponserHistory.organization.schoolName"/> 组织机构变更知元网<s:property
                    value="changeResponserHistory.organization.schoolName"/> 组织注册组织负责人协议 </h2>

            <p id="bianma"> 协议编码：<span class="highlight"><s:property value="changeResponserHistory.id"/></span>  </p>
            </p>
            <p>因为工作的需要，<span class="highlight"><s:property value="changeResponserHistory.newResponser.userName"/></span>申请变更<s:property
                    value="changeResponserHistory.organization.schoolName"/>组织变在知元网<span class="highlight"><s:property
                    value="changeResponserHistory.organization.schoolName"/></span>组织负责人。
            </p>

            <p>原负责人信息：姓名：<span class="highlight"><s:property
                    value="changeResponserHistory.currentResponser.userName"/></span>，注册email: <span
                    class="highlight"><s:property
                    value="changeResponserHistory.currentResponser.email"/></span>，联系电话：<span
                    class="highlight"><s:property value="changeResponserHistory.currentResponser.telphone"/></span>。将停止负责知元网<s:property
                    value="changeResponserHistory.organization.schoolName"/>注册组织的所有工作。 </p>

            <p>申请人信息：姓名：<span class="highlight"><s:property
                    value="changeResponserHistory.newResponser.userName"/></span>, 注册email:<span
                    class="highlight"><s:property value="changeResponserHistory.newResponser.email"/></span>，联系电话：<span
                    class="highlight"><s:property
                    value="changeResponserHistory.newResponser.telphone"/></span>，身份证号码：<span
                    class="highlight"><s:property
                    value="changeResponserHistory.newResponser.cardId"/></span>，将成为知元网<s:property
                    value="changeResponserHistory.organization.schoolName"/>注册组织新负责人，至变更生效日期起，将享有负责人的所有责任和权益。

            <p>
                此协议一式四份，申请人一份，原负责人一份，学校一份，长沙知金电子科技有限公司（知元网所属公司）一份。申请人签字，原负责人签字，学校签字、盖章后生效。知元网审核确认真实以后，协议生效。正式生效日期为知元网收到协议当日算起，以邮戳日期为准。</p>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="50%">原负责人</td>
                    <td>申请人</td>
                </tr>
                <tr>
                    <td>姓名：</td>
                    <td>姓名：</td>
                </tr>
                <tr>
                    <td>身份证号码：</td>
                    <td>身份证号码：</td>
                </tr>
                <tr>
                    <td>签字：</td>
                    <td>签字：</td>
                </tr>
                <tr>
                    <td>日期：</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><s:property value="changeResponserHistory.organization.schoolName"/>组织</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>负责人签字：</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>公章：</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>日期：</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <p>&nbsp;</p>
        </div>
        <div id="bottom">
            <input type="button" name="button" id="button" value="我已阅读，同意" style=" color:#0063C6; margin:4px;"
                   onclick="disshow();"/>
        </div>
        <img src="form/bottom.png" alt="">
    </div>
    <div style="display:none;" id="tizhuan">
        <table width="680" border="0" cellspacing="0" cellpadding="0">

            <tr>

                <td id="message"><p>您好，<s:property value="changeResponserHistory.newResponser.userName"/>，系统已经发送变更合同至您的邮箱，请及时确认。还有<span
                        id="time">10</span>秒将跳至首页</p><a href="index.html" id="href">点击此处直接转向首页</a>

            </tr>
        </table>
    </div>
</div>
<script type="text/javascript">
    var time = 10;
    function descTime(){
        time = time -1;
        if(time < 0){
            time = 0;
        }
       $("#time").text(time);
    }

   function goUrl(){
        window.location.href='index.html';
   }
    function disshow(){
        $("#protocol").css('display', 'none');
        $("#tizhuan").css('display', 'block');
        setTimeout(goUrl,10000)//500是0.5秒 \
        setInterval('descTime()',1000);
    }
</script>