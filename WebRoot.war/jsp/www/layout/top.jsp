<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("#btnLogin").click(function(event) {
            $('#modalLogin').modal("show");
        });

    })

</script>

<%--<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>--%>
<div class="thickline"></div>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="topLogo"></div>

        </div>
        <div class="col-md-6">
            <ul class="nav nav-pills">
                <li>
                    <a href="index.html" class="navlink"><s:property value="%{getText('menu.item.index')}"/></a>
                </li>
                <li>
                    <s:a action="courseCenter" cssClass="navlink"><s:property value="%{getText('frame.course.center')}"/></s:a>
                </li>
                <li>
                    <a href="schoolCenter.html" class="navlink"><s:property value="%{getText('frame.schools.center')}"/></a>
                </li>
            </ul>
        </div>

        <div class="col-md-3">
            <div class="pull-right">
            <s:if test="#session.email !=null">
                <div class="btn-group">

                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span>
                        <a href="userBlog.html?user.id=<s:property value="#session.userID"/>" title="<s:property value="#session.nickName"/>">
                            <s:property value="#session.nickName"/>
                        </a>
                        <span class="caret"></span>
                    </button>

                    <ul class="dropdown-menu" role="menu">

                        <s:if test="#session.roleType==6">
                            <li><a href="personalCenter.html"><s:property value="%{getText('label.personalcenter')}"/></a></li>
                            <%--<a href="#">Profile Settings</a>--%>
                            <li><a href="initUpdate.html"><span></span><s:property value="%{getText('account.item.accountsettings')}" /></a></li>
                        </s:if>
                        <s:else>
                            <li><a href="myfirstPage.html"><s:property value="%{getText('label.personalcenter')}"/></a></li>
                            <li><a href="setting.html"><span></span><s:property value="%{getText('account.item.accountsettings')}" /></a></li>
                        </s:else>

                        <li class="divider"></li>

                            <%--<a href="#">Log out</a>--%>
                        <li><a href="exitSystem.html"><span></span><s:property value="%{getText('href.logout')}" /></a></li>

                    </ul>
                </div>
            </s:if>

            <s:else>
                <%@ include file="/jsp/www/log_reg/login.jsp" %>
                <ul class="list-inline">
                    <li>
                    </li>
                    <li>
                        <a href="initReg.html" target="_blank" ><s:property value="%{getText('user.info.identity.finish.reg')}"/></a>
                    </li>
                    <li>
                        <a href="#" id="btnLogin" ><s:property value="%{getText('Login')}"/></a>
                    </li>
                </ul>
            </s:else>

            </div>

        </div>

    </div>
</div>
