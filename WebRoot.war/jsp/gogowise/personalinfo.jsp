<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">

    body {
        font-family: "微软雅黑", "宋体";
    }

    .title {
        font-size: 16px;
        color: #800040;
        border-bottom: #999999 dotted 2px;
        height: 40px;
        vertical-align: bottom;
        text-align: center;
    }

    .item {
        text-align: right;
        font-size: 12px;
        width: 140px;
        border: #FFFFFF solid thin;
        height: 25px;
    }

    .item1 {
        font-size: 12px;
        color: #333333;
        border: #FFFFFF solid thin;
    }

    .table1 {
        background-color: #F2F2F2;
        border: #CCCCCC 2px solid;
        margin-top: 5px;
    }

</style>


<table width="680" cellspacing="0" class="table1">
    <tr>
        <td colspan="4" class="title">我的信息</td>
    </tr>
    <tr>
        <td class="item">昵称</td>
        <td class="item1">
            <form id="form2" name="form2" method="post" action="">
                <label>
                    <input type="text" name="textfield" id="textfield" value=
                    <s:property value="competitionPhase.competition.subject.owner.nickName"/>>
                </label>
            </form>
        </td>
        <td class="item">邮箱</td>
        <td class="item1">&nbsp;<s:property value="competitionPhase.competition.subject.owner.email"/></td>
    </tr>
    <tr>
        <td class="item">注册时间</td>
        <td class="item1">&nbsp;<s:property value="competitionPhase.competition.subject.owner.regDate"/></td>
        <td class="item">过期时间</td>
        <td class="item1">&nbsp;<s:property value="competitionPhase.competition.subject.owner.dueDate"/></td>
    </tr>
    <tr>
        <td class="item">会员类型</td>
        <td class="item1">&nbsp;<s:property value="competitionPhase.competition.subject.owner.userType"/></td>
        <td rowspan="2" class="item">相片</td>
        <td rowspan="2" class="item1"><input type="image" name="imageField" id="imageField"
                                             src="file:///G|/www.gogowise.com/Images/"<s:property value="competitionPhase.competition.subject.owner.pic"/> width="60px" height="65px;"/></td>
    </tr>
    <tr>
        <td class="item">是否激活</td>
        <td class="item1">&nbsp;<s:property value="competitionPhase.competition.subject.owner.isLockedOut"/></td>
    </tr>
    <tr>
        <td class="item">通信地址</td>
        <td class="item1">
            <form id="form7" name="form7" method="post" action="">
                <label>
                    <input type="text" name="textfield4" id="textfield4" value="湖南长沙"/>
                </label>
            </form>
        </td>
        <td rowspan="2" class="item"><p>照片规格：170*180px<br/>
            照片格式：gif\jpg\png</p></td>
        <td rowspan="2" class="item1">
            <form id="form4" name="form4" enctype="multipart/form-data" method="post" action="">
                <label>
                    <input name="fileField" type="file" id="fileField" size="15"/>
                </label>
            </form>
        </td>
    </tr>
    <tr>
        <td class="item">手机</td>
        <td class="item1">
            <form id="form8" name="form8" method="post" action="">
                <label>
                    <input type="text" name="textfield5" id="textfield5" value="0731-xxxxxxx"/>
                </label>
            </form>
        </td>
    </tr>
    <tr>
        <td class="item">金鸡蛋数</td>
        <td class="item1">&nbsp;<s:property value="competitionPhase.competition.subject.owner.zhiBi"/></td>
        <td class="item">最后登录时间</td>
        <td class="item1">&nbsp;<s:property value="competitionPhase.competition.subject.owner.lastLoginDate"/></td>
    </tr>
    <tr>
        <td class="item">是否锁定</td>
        <td class="item1">&nbsp;<s:property value="competitionPhase.competition.subject.owner.isLive"/></td>
        <td class="item">知币</td>
        <td class="item1">&nbsp;<s:property value="competitionPhase.competition.subject.owner.zhiBi"/></td>
    </tr>
    <tr>
        <td class="item">密码问题</td>
        <td class="item1">
            <form id="form5" name="form5" method="post" action="">
                <label>
                    <input type="text" name="textfield2" id="textfield2"
                           value="<s:property value="competitionPhase.competition.subject.owner.question"/> "/>
                </label>
            </form>
        </td>
        <td class="item">知券</td>
        <td class="item1">&nbsp;<s:property value="competitionPhase.competition.subject.owner.zhiQuan"/></td>
    </tr>
    <tr>
        <td class="item">密码答案</td>
        <td class="item1">
            <form id="form6" name="form6" method="post" action="">
                <label>
                    <input type="text" name="textfield3" id="textfield3"
                           value="<s:property value="competitionPhase.competition.subject.owner.answer"/> "/>
                </label>
            </form>
        </td>
        <td class="item">&nbsp;</td>
        <td class="item1">&nbsp;</td>
    </tr>
    <tr class="item">
        <td colspan="4" align="center" valign="middle">
            <form id="form1" name="form1" method="post" action="">
                <label>
                    <br/>
                    <input type="submit" name="button" id="button" value="修改"/>
                </label>
                <label>
                    &nbsp;&nbsp;<input type="submit" name="button2" id="button2" value="取消"/>
                </label>
                <br/>
                <br/>
            </form>
        </td>
    </tr>
</table>
<form id="form3" name="form3" method="post" action="">
    <label></label>
</form>

