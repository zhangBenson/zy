<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>

<div class="thickline"></div>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="topLogo"></div>
        </div>
        <!--<div class="col-md-5">-->
        <div class="col-md-6">
            <ul class="nav nav-pills">
                <li>
                    <a href="index.html" class="navlink"><s:property value="%{getText('menu.item.index')}"/></a>
                </li>
                <li>
                    <s:a action="courseSquare" cssClass="navlink"><s:property value="%{getText('frame.course.center')}"/></s:a>
                </li>
                <li>
                    <a href="#" class="navlink"><s:property value="%{getText('frame.schools.center')}"/></a>
                </li>
            </ul>
        </div>
        <!--<div class="col-md-4">-->
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

                        <%-- <li><a href="userBlog.html?user.id=<s:property value="#session.userID"/>">Personal Center</a></li>        --%>
                        <li><a href="personalCenter.html">Personal Center</a></li>

                            <%--<a href="#">Profile Settings</a>--%>
                        <li><a href="initUpdate.html"><span></span><s:property value="%{getText('account.item.accountsettings')}" /></a></li>

                        <li class="divider"></li>

                            <%--<a href="#">Log out</a>--%>
                        <li><a href="exitSystem.html"><span></span><s:property value="%{getText('href.logout')}" /></a></li>
                    </ul>
                </div>
            </s:if>

            <s:else>
                <div class="btn-group">

                    <p class="handle">
                        <a href="login.html" id="login_btn"><s:property value="%{getText('Login')}"/></a>
                        &nbsp;&nbsp;<strong>|</strong>&nbsp;&nbsp;
                        <a href="initReg.html" target="_blank" ><s:property value="%{getText('user.info.identity.finish.reg')}"/></a>
                    </p>
                <%--<span class="caret"></span>--%>

                    <%--<ul class="dropdown-menu" role="menu">--%>
                        <%--<li>--%>
                            <%--<a href="login.html" id="login_btn">--%>
                                <%--<s:property value="%{getText('Login')}"/>--%>
                            <%--</a>--%>
                        <%--</li>--%>

                        <%--<li>--%>
                            <%--<a href="initReg.html">--%>
                                <%--<s:property value="%{getText('user.info.identity.finish.reg')}"/>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                </div>

            </s:else>
            </div>
        </div>




    </div>
</div>


<script type="text/javascript">
    $(function(){
        $("#login_btn").fancybox({
            "type":'iframe',
            "scrolling":'no',
            "width":350,
            "border":0,
            "height":270
        });
    });
</script>