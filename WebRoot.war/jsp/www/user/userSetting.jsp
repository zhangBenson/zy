<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<script src="gogowisestyle/js/bootstrap-datepicker.js"></script>
<script src="gogowisestyle/js/icheck.min.js"></script>
<link rel="stylesheet" href="gogowisestyle/css/datepicker3.css">
<link rel="stylesheet" href="gogowisestyle/skins/all.css">

<script type="text/javascript">
    $('#txtBirthday').datepicker({
        orientation: "top left",
        autoclose: true
    });

    $('input').iCheck({
        checkboxClass: 'icheckbox_polaris',
        radioClass: 'iradio_square red',
        increaseArea: '20%' // optional
    });
</script>

<div class="container">

    <div class="thinline"></div>
    <br/>

    <div class="col-sm-7">

        <div class="basePanelTextLeft">
            <h1 class="courseSubject"><s:property value="%{getText('table.base.info')}"/></h1>

            <form class="form-horizontal" role="form" action="updateUserInfo.html">
                <div class="form-group">
                    <label><s:property value="%{getText('menber.reg.nickName')}"/></label>
                    <input type="text" class="form-control" placeholder="<s:property value="%{getText('menber.reg.nickName')}"/>"
                           name="user.nickName" value="<s:property value="user.nickName"/>" />
                </div>
                <div class="form-group">
                    <label><s:property value="%{getText('label.realname')}"/></label>
                    <input type="text" class="form-control" placeholder="<s:property value="%{getText('label.realname')}"/>"
                           name="user.userName" value="<s:property value="user.userName"/>" />
                </div>
                <div class="form-group">
                    <label><s:property value="%{getText('orgleague.info.birth')}"/></label>
                    <input type="text" class="form-control" placeholder="<s:property value="%{getText('orgleague.info.birth')}"/>"
                           name="user.birthDay" value="<s:date name="user.birthDay" format="yyyy-MM-dd HH:mm"/>"
                           class="form_datetime" id="txtBirthday" />
                </div>

                <div class="form-group">
                    <label><s:property value="%{getText('sex')}"/></label>
                    <br/>
                    <label style="width: 100px;">
                        <input type="radio" name="user.sexy" value="true" <s:if test="user.sexy">checked="checked"</s:if> >
                        <span><s:property value="%{getText('male')}"/></span>
                    </label>

                    <label>
                        <input type="radio" name="user.sexy" value="false" <s:if test="!user.sexy">checked="checked"</s:if> >
                        <span><s:property value="%{getText('female')}"/></span>
                    </label>
                </div>

                <div class="form-group">
                    <label><s:property value="%{getText('label.user.self.introduction')}"/></label>
                    <textarea type="text" class="form-control" placeholder="Self introduction" rows="3" name="user.selfDescription"><s:property value="user.selfDescription"/></textarea>
                </div>
                <div class="form-group">
                    <label><s:property value="%{getText('email')}"/></label>
                    <input type="email" class="form-control" placeholder="Email" disabled value="<s:property value="user.email"/>"></div>

                <div class="form-group">
                    <label>Registration Time：</label>
                    <input type="email" class="form-control" placeholder="Registration Time" disabled value="<s:date name="user.regDate" format="yyyy-MM-dd HH:mm"/>">
                </div>
                <div class="form-group">
                    <label>Last Logging in Time：</label>
                    <input type="email" class="form-control" placeholder="Last Logging in Time" disabled value="<s:date name="user.lastLoginDate" format="yyyy-MM-dd HH:mm"/>">
                </div>
                <button type="submit" class="btn btn-primary btn-block">Submit</button>
            </form>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="basePanelshadow">

            <img src="gogowisestyle/image/largeportrait.jpg" style="width: 100px;height: 100px;border-radius: 12px;">
            <br/>
            <br/>
            <button type="button" class="btn btn-success">Change Logo</button>
        </div>
        <br/>

        <div class="basePanelTextLeft">

            <h1 class="courseSubject"><s:property value="%{getText('table.change.password')}"/></h1>

            <div class="form-group">
                <label><s:property value="%{getText('label.old.password')}"/></label>
                <input type="text" class="form-control" placeholder="<s:property value="%{getText('label.old.password')}"/>" name='user.password'>
            </div>
            <div class="form-group">
                <label><s:property value="%{getText('label.new.password')}"/></label>
                <input type="text" class="form-control" placeholder="<s:property value="%{getText('label.new.password')}"/>" name='newPassword'>
            </div>
            <div class="form-group">
                <label><s:property value="%{getText('label.new.password.confirm')}"/></label>
                <input type="email" class="form-control" placeholder="<s:property value="%{getText('label.new.password.confirm')}"/>" name='newPasswordConfirm'>
            </div>
            <button type="button" class="btn btn-danger btn-block"><s:property value="%{getText('button.submit')}"/></button>
        </div>
    </div>
</div>