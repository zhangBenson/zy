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
                    <a href="#" class="navlink">SCHOOLS</a>
                </li>
            </ul>
        </div>
        <!--<div class="col-md-4">-->
        <div class="col-md-3">
            <div class="pull-right">
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        User Name
                        <span class="caret"></span>
                    </button>

                    <ul class="dropdown-menu" role="menu">

                        <li>
                            <a href="#">Personal Center</a>
                        </li>
                        <li>
                            <a href="#">Profile Settings</a>
                        </li>

                        <li class="divider"></li>
                        <li>
                            <a href="#">Log out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


        <!-- <div class="col-md-4">
            <div class="pull-right">
                <ul class="list-inline">
                    <li>
                        <a href="#">Help</a>
                    </li>
                    <li>
                        <a href="#">Sign up</a>
                    </li>
                    <li>
                        <a href="#">Log in</a>
                    </li>
                </ul>
            </div>
        </div> -->

    </div>
</div>
