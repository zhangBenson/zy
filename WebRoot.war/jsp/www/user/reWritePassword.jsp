<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<s:head/>

<div class="container">
    <s:form action="reWritePassword" theme="css_xhtml" validate="true" method="post" id="form">
        <s:hidden name="user.email"/>
        <style type="text/css">
            #mainRe{ width:600px; margin-left:auto; margin-right: auto; text-align: center; margin-bottom: 60px; margin-top:80px; background:url(images/title_login_4.gif) left top no-repeat; font-family:"微软雅黑", "宋体"; font-size:12px;}
            #get_back_pwd{color:rgb(0,138,255);background:url(images/title_login_4.gif) left top no-repeat;padding-left:50px;text-align:left;height:57px;font-size: 18px;line-height: 40px;}
            #center{ margin-top:10px; width:500px;}
            #center table{width:500px;float:left;}
            #center table tr{float:left;width:500px;clear:both;padding: 5px;}
                /*#center table tr td{ height:30px;}*/
            h1{ font-family: "微软雅黑", "宋体"; color:#333; font-size:12px;}
            .tdleft{ text-align:right; width:150px;}
            .tdright{width:200px;}
            .con{ background:#EAEAEA;}
            #question{ float:right; font-size:10px;}
            #question a{ color:#666;}
            .btn{ text-align:center;}
            .btn a img{ border:none;}
            #info{ font-size:12px; color:#333; width:400px;text-align: left;float:left;margin-bottom: 10px;}
            .errorinfo{ color:#F00; font-size:10px;}
            .repassword_submit_btn{border:none;color:#FFF;font-size:16px;display:block;float:left;background:#9acd32;height:30px;margin-top:8px;margin-left:100px;margin-bottom:10px;line-height: 30px;padding-left:15px;padding-right: 15px;box-shadow: 0px 1px 2px rgba(0,0,0,0.3);border-radius: 3px; }
        </style>

        <div id="mainRe">
            <hr />
            <div id="get_back_pwd"><span><s:property value="%{getText('label.get.back.password')}"/></span></div>
            <div id="center">
                <table width="420" cellpadding="0" cellspacing="0">
                        <%--<tr>--%>
                        <%--<td colspan="2"><h1><img src="images/change.gif" width="25" height="25" />修改密码</h1></td>--%>
                        <%--</tr>--%>
                    <tr>
                        <td colspan="2" id="info"><img src="images/change.gif" width="25" height="25"/><s:property value="%{getText('label.setting.new.password')}"/><br/>
                            <s:property value="%{getText('message.insert.new.password')}"/>
                        </td>
                    </tr>
                    <tr class="con" height="30px">
                        <td class="tdleft"><s:property value="%{getText('label.new.password')}"/>：</td>
                        <td class="tdright">
                            <label>
                                <s:password type="text" name="user.password" id="textfield"/>
                            </label><span class="errorinfo">*</span></td>
                    </tr>
                    <tr class="con"  height="30px" >
                        <td class="tdleft"><s:property value="%{getText('label.new.password.confirm')}"/>：</td>
                        <td class="tdright"><s:password type="text" name="rePwd" id="textfield2"/><span class="errorinfo">*</span></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="btn"><s:submit cssClass="repassword_submit_btn"  value="%{getText('button.submit')}"/></td>
                    </tr>
                </table>
            </div>
        </div>
    </s:form>
</div>