<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

    #message {
        font-family: "微软雅黑", "宋体";
        font-size: 14px;
        text-align: center;
    }

    #message b {
        color: #800040;
    }

    #message a {
        text-decoration: underline;
        color: #0000ff;
    }
</style>
<div>
    <div id="protocol">
        <img src="form/top.png" alt="">

        <h1><a>&nbsp;Gogowise</a></h1>

        <div id="cons">
            <p>

            <h2><s:property value="organization.schoolName"/>组织免费使用嘉兴移动公开课教学平台协议 </h2> <p id="bianma"> 协议编码：<span
                class="highlight"><s:property value="organization.id"/></span>  </p>
            </p>
            <p><span class="highlight"><s:property value="organization.schoolName"/></span>组织（以下简称甲方）同长沙知金电子科技有限公司（以下简称乙方）就甲方免费使用乙方所属的嘉兴移动公开课网络教学平台达成以下协议：
            </p>

            <p>1、 甲方及所属所有教师使用嘉兴移动公开课进行网络教学，如实时网络公开课等，嘉兴移动公开课将不收取任何费用； </p>

            <p> 2、甲方及所属所有教师在嘉兴移动公开课进行网络教学所产生的收益，包括网络实时教学、教学录像、教学课件等（以下简称为甲方版权收益），乙方将支付甲方此收益的20%作为甲方的版权收益；</p>

            <p> 3、甲方所属教师（此教师）在嘉兴移动公开课进行网上教学所产生的收益，包括此老师的网络实时教学、教学录像、教学课件等（以下简称为甲方此教师版权收益），乙方将支付此教师此收益的30%作为此教师的版权收益； </p>

            <p> 4、甲方指定甲方教师: 姓名:<span class="highlight"><s:property value="organization.responsiblePerson.userName"/></span>，身份证号码:<span class="highlight"><span
                    class="highlight"><s:property value="organization.responsiblePerson.cardId"/></span>，嘉兴移动公开课注册email:<span
                    class="highlight"><s:property value="organization.responsiblePerson.email"/></span>, 联系电话号码:<s:property value="organization.responsiblePerson.telphone"/>,
                为甲方在嘉兴移动公开课上甲方注册组织唯一指定负责人，全权负责课程的开设、教师身份的确认、课堂内容的监管等实体学校相同的工作，并承担相关的责任，保证教学内容健康、合法。乙方将支付此负责人在负责期间内甲方新教学课件所产生的版权收益（以下简称负责人负责期内甲方版权收益）的8%作为此负责人的劳动报酬；
            </span></p>

            <p> 5、甲方有权随时变更嘉兴移动公开课负责人，通过<span class="highlight">嘉兴移动公开课首页&gt;&gt;组织机构&gt;&gt;变更负责人</span>进入负责人变更流程。一旦变更完成，原负责人将终生拥有其负责期内甲方版权收益的8%，同时乙方开始支付新负责人其负责期内所开办新的课程产生版权收益的8%作为其劳动报酬。我们收到贵校负责人变更协议后生效，生效日期以邮戳为准。
            </p>

            <p> 6、甲方有责任为乙方工作人员，如摄像师等提供相应的便利，保证乙方正常工作的开展； </p>

            <p> 7、乙方将在不影响甲方正常教学的前提下，免费为甲方提供实时教学摄像、录像剪辑、教学视频点播、教学课件上传和下载功能、学校形象宣传等服务；</p>

            <p> 8、乙方工作人员在为甲方提供服务之前，必须获得相关老师以及学校负责人的批准，批准流程在嘉兴移动公开课中实现；</p>

            <p> 9、乙方将按季度定期结算甲方的收益，乙方将相关收益转账至甲方对公账户，同时附上收益清单，如果出现异议，甲方有清查甲方学校收益的权利；</p>

            <p>
                10、乙方将按季度定期结算甲方负责人以及原负责人（如果发生负责人变更）的收益，乙方将相关收益转账至甲方负责人及原负责人的私人账户，同时附上收益清单，如果出现异议，甲方负责人及原负责人有清查个人收益的权利，甲方负责人须在嘉兴移动公开课上提交真实的个人账户信息； </p>

            <p> 11、甲方对公账户信息：开户名称：<span class="highlight"><s:property value="organization.depositName"/></span>,
                开户银行：<span class="highlight"><s:property value="organization.depositBankName"/></span>，开户账号：<span
                        class="highlight"><s:property value="organization.depositBankAccount"/></span></p>

            <p> 12、为了避免恶性竞争影响甲方正常的教学次序，严禁甲方接受除乙方以外其他非官方网站提供的同乙方相类似的服务，否则，乙方将有权终止支付甲方及甲方所属老师的版权收益；</p>

            <p> 13、甲乙双方都应遵守相关法律，如果合作过程中出现违法的情况，双方将各自独立承担相关的法律责任，不存在联带责任。 </p>

            <p>
                14、此协议一式四份，甲方一份、甲方嘉兴移动公开课负责人一份，乙方两份，乙方收到两份甲方签字、盖章协议原件以及一份加盖甲方公章的甲方法人执照复印件后，经乙方审核确认真实后协议生效，生效日期以邮件收到日邮戳为准。</p>

            <p> 15、未尽事宜，甲乙双方协商解决。</p>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="50%">甲方：</td>
                    <td>乙方：</td>
                </tr>
                <tr>
                    <td>名称： </td>
                    <td>名称：长沙知金电子科技有限公司</td>
                </tr>
                <tr>
                    <td>负责人签字：</td>
                    <td>法人代表：曾锃</td>
                </tr>
                <tr>
                    <td>签署时间：</td>
                    <td>签署时间：<%=new SimpleDateFormat("yyyy年MM日dd天").format(new Date())%>
                    </td>
                </tr>
                <tr>
                    <td>公章：</td>
                    <td>公章：此为系统自动生成，不需要盖章</td>
                </tr>
            </table>
        </div>
        <div id="bottom">
            <input type="button" name="button" id="button" value="我已阅读，同意" style=" color:#0063C6; margin:4px;"
                   onclick="index();"/>
        </div>
        <img src="form/bottom.png" alt="">
    </div>
    <div style="display:none;" id="tizhuan">
        <table width="680" border="0" cellspacing="0" cellpadding="0">

            <tr>

                <td id="message"><p>您好，<b><s:property value="organization.responsiblePerson.userName"/></b>，系统已经发送申请合同至您的邮箱，请及时确认。还有<span
                        id="time">10</span>秒将跳至首页</p><a href="index.html" id="href">点击此处直接转向首页</a>

            </tr>
        </table>
    </div>
</div>
<script type="text/javascript">
    var time = 10;
    function descTime() {
        time = time - 1;
        if (time < 0) {
            time = 0;
        }
        $("#time").text(time);
    }

    function goUrl() {
        window.location.href = 'index.html';
    }
    function index() {
        $("#protocol").css('display', 'none');
        $("#tizhuan").css('display', 'block');
        setTimeout(goUrl, 10000)//500是0.5秒 \
        setInterval('descTime()', 1000);
    }
</script>
