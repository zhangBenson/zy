<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/user/updateUserInfo_js.jsp" %>

<link rel="stylesheet" href="css/user/updateUserInfo.css" type="text/css"/>
<script type="text/javascript" src="js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox-1.3.4.css" media="screen"/>


<div id="userinfo_container">
    <div id="tabtag2" class="tabtag">
        <ul>
            <li class="cur basic_info"><s:text name="table.base.info"/></li>
            <li class="password_change"><s:text name="table.change.password"/></li>
        </ul>
    </div>
    <div class="userinfo_content">
        <form action="updateUserInfo.html" method="post" class="userinfo_form">
            <s:hidden name="user.lockedOut"/>
            <input type="hidden" id="picHidden" name="user.pic" value="<s:property value="user.pic" />"/>

            <div class="userinfo_tittle"><span><s:text name="label.account.setting"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="_change_userinfo">
                <s:text name="link.click.to.change"/></span></div>
            <div class="userinfo_detail">
                <div class="userinfo_basic">
                    <div class="basic_left">
                        <ul>
                            <li><span class="option_tittle"><s:text name="menber.reg.nickName"/>：</span>
                                <span class="_nickname"><s:property value="user.nickName"/></span>
                            </li>
                            <li><span class="option_tittle"><s:text name="label.realname"/>：</span>
                                <span class="_username"><s:property value="user.userName"/></span>
                            </li>
                            <li>
                                <span class="option_tittle"><s:text name="email"/>：</span>
                                <span class="_email"><s:property value="user.email"/></span>
                                <s:hidden name="user.email"/>
                            </li>
                            <li><span class="option_tittle"><s:text name="sex"/>：</span>
                                <s:set name="male" value="%{getText('male')}"/>
                                <s:set name="female" value="%{getText('female')}"/>
                                <s:radio list="#{'true':#male,'false':#female}" name="user.sexy" id="usersexy" listKey="key"
                                         listValue="value"/>
                            </li>

                        </ul>
                    </div>
                    <div class="basic_right">
                        <div class="portraitBorder">
                            <img src="<s:property value='#session.userLogoUrl'/>" id="reImg" class="portraitImg"/>
                        </div>
                      <span class="fileDiv">
                          <a class="change_portrait" id="change_portrait" href="userPortraitCrop.html"><s:text name="button.change.head"/></a>
                          <%--<input type="button" class="change_portrait"  href="#image_manipulate_container" value="<s:text name="button.change.head"/>"/>--%>
                          <span class="_file_Msg _change_Msg"></span>
                      </span>
                    </div>
                </div>

                <div class="userinfo_lessimport">
                    <ul>
                        <%--<li style="height:30px">
                             <span class="option_tittle"><s:text name="orgleague.info.id"/>：</span>
                             <span class="_cardID"><s:property value="user.cardId"/></span>&lt;%&ndash;<s:textfield name="user.nickName" type="text" id="nickName" size="20"/>&ndash;%&gt;
                        </li>--%>
                        <li>
                            <span class="option_tittle"><s:text name="label.user.self.introduction"/></span><span class='_self_description_Msg input_msg'></span><br/>
                            <span class="_self_description "><s:property value="user.selfDescription"/></span>
                        </li>
                        <li><span class="option_tittle"><s:text name="label.account.left"/>：</span>
                            <s:text name="label.zhibi.true"/>：<s:property value="userAccountInfo.zhiBi"/>&nbsp;&nbsp;&nbsp;
                            <s:text name="label.zhibi.false"/>：
                            <s:property value="userAccountInfo.zhiQuan"/>
                        </li>
                        <li>
                            <table class="account_table">
                                <tr>
                                    <td colspan="2"><span class="option_tittle"><s:text name="label.account.info1"/>
                                    <span class="accountTip"><s:text name="messege.account.bank"/></span></span></td>
                                </tr>
                                <tr>
                                    <td class="td_tittle"><s:text name="label.bank.name"/>：</td>
                                    <td><span class="_bankName"><s:property value="userAccountInfo.bankName"/></span></td>
                                </tr>
                                <tr>
                                    <td class="td_tittle"><s:text name="label.account.name"/>：</td>
                                    <td><span class="_disposeName"><s:property value="userAccountInfo.disposeName"/></span></td>
                                </tr>
                                <tr>
                                    <td class="td_tittle"><s:text name="label.account.no"/>：</td>
                                    <td><span class="_bankAccount"><s:property value="userAccountInfo.bankAccount"/></span></td>
                                </tr>
                            </table>
                        </li>
                        <li><span class="option_tittle"><s:text name="label.reg.time"/>：</span>
                            <s:date name="user.regDate" format="%{getText('global.display.date')}"/></li>
                        <li><span class="option_tittle"><s:text name="label.last.log.time"/>：</span>
                            <s:date name="user.lastLoginDate" format="%{getText('global.display.date')}"/>
                        </li>
                    </ul>
                </div>
                <div class="userinfo_commit" style="display:none;">
                    <span class="commitBtn" onclick="checkForm();"><s:text name="button.account.submit"/></span>
                </div>
            </div>
        </form>
    </div>
    <div class="password_change_content">
        <div class="content_compa">
            <div class="password_change_inner">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="td_left"><s:text name="label.old.password"/>：</td>
                        <td class="td_right"><s:password cssClass="old_password" name='user.password'/><span class="old_password_msg input_msg"></span></td>
                    </tr>
                    <tr>
                        <td class="td_left"><s:text name="label.new.password"/>：</td>
                        <td class="td_right"><s:password cssClass="new_password" name='newPassword'/><span class="new_password_msg input_msg"></span></td>
                    </tr>
                    <tr>
                        <td class="td_left"><s:text name="label.new.password.confirm"/>：</td>
                        <td class="td_right"><s:password cssClass="new_password_repeat" name='newPasswordConfirm'/><span class="new_password_repeat_msg input_msg"></span></td>
                    </tr>
                </table>
            </div>
            <div class="password_change_submit">
                <input type="submit" value="<s:text name="button.submit"/>">

                <div id="save_pop">
                    <div class="save save_done"><s:text name="message.change.pwd.success"/></div>
                    <div class="save save_fail"><s:text name="message.old.pwd.error"/></div>
                </div>
            </div>
        </div>
    </div>
</div>
