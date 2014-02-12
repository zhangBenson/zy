<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/js/user/updateUserInfo_js.jsp" %>

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

            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label><s:property value="%{getText('menber.reg.nickName')}"/></label>
                    <input type="text" class="form-control" placeholder="Nick Name" name="user.nickName" value="<s:property value="user.nickName"/>"></div>
                <div class="form-group">
                    <label><s:property value="%{getText('label.realname')}"/></label>
                    <input type="text" class="form-control" placeholder="Real Name" name="user.userName" value="<s:property value="user.userName"/>"></div>
                <div class="form-group">
                    <label><s:property value="%{getText('orgleague.info.birth')}"/></label>
                    <input type="text" class="form-control" placeholder="Birthday" name="user.birthDay" value="<s:property value="user.birthDay"/>" class="form_datetime"
                           id="txtBirthday">
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
                    <label>Self introduction</label>
                    <textarea type="text" class="form-control" placeholder="Self introduction" rows="3"></textarea>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" placeholder="Email" disabled></div>

                <div class="form-group">
                    <label>Registration Time：</label>
                    <input type="email" class="form-control" placeholder="2013-1-24" disabled>
                </div>
                <div class="form-group">
                    <label>Last Logging in Time：</label>
                    <input type="email" class="form-control" placeholder="2013-1-24" disabled>
                </div>
                <button type="button" class="btn btn-primary btn-block">Submit</button>
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
                <label>Old Password</label>
                <input type="text" class="form-control" placeholder="Old Password"></div>
            <div class="form-group">
                <label>New Password</label>
                <input type="text" class="form-control" placeholder="New Password"></div>
            <div class="form-group">
                <label>Repeat Password</label>
                <input type="email" class="form-control" placeholder="Repeat Password"></div>
            <button type="button" class="btn btn-danger btn-block">Submit</button>
        </div>
    </div>
</div>