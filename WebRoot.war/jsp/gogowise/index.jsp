<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%--<!doctype html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
    <%--<meta charset="UTF-8">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1.0">--%>

    <script src="gogowisestyle/js/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="gogowisestyle/css/jquery.bxslider.css">

    <%--<title>index</title>--%>
<%--</head>--%>
<script type="text/javascript">
    $(document).ready(function(){
        $('.bxslider').bxSlider({
            speed: 1000,
            auto: true,
            infiniteLoop:true,
            pause:8000,
            controls:false
        });

        $('.bxsliderLogolist').bxSlider({
            auto: true,
            autoControls: true,
            pause: 3000,
            slideMargin: 20,
            pager:false,
            speed: 1000,
            mode: 'fade'
        });
    });
</script>

<body style="text-align: center;">

<div class="container">

    <ul class="bxslider">
        <li>
            <img src="gogowisestyle/image/pic1.jpg" class="bannerImg" />
        </li>
        <li>
            <img src="gogowisestyle/image/pic2.jpg" class="bannerImg" />
        </li>
        <li>
            <img src="gogowisestyle/image/pic3.jpg" class="bannerImg" />
        </li>
        <li>
            <img src="gogowisestyle/image/pic4.jpg" class="bannerImg" />
        </li>
    </ul>


    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-6">
            <input class="form-control input-lg" type="text" placeholder="<s:property value="%{getText('menu.item.search')}"/>"></div>
        <div class="col-sm-4">
            <button type="button" class="btn btn-default btn-lg">
                <span class="glyphicon glyphicon-search"></span>
                <s:property value="%{getText('menu.item.search')}"/>
            </button>
        </div>
    </div>

</div>

<br/>

<div class="container">
    <div class="row">
        <div class="col-sm-6">

            <div class="courseSubhead"><s:property value="%{getText('usermenu.item.newestcourses')}"/></div>

            <s:iterator value="Courses">
                <a href="voaCourseBlog.html?course.id=<s:property value="id"/>" title="<s:property value="name"/>">
                    <div class=coursePanel>
                        <div class="coursePanelInfoLeft">
                            <img src="<s:property value="logoUrl"/>"/>
                        </div>

                        <div class="coursePanelInfoRight">
                            <p><s:property value="name"/></p>
                            <p>School:MITx</p>
                            <p>Clases start:16 Oct 2013</p>
                        </div>
                    </div>
                </a>
            </s:iterator>

            <!--Panel1 -->
            <%--<a href="#">--%>
                <%--<div class="coursePanel">--%>
                    <%--<div class="coursePanelInfoLeft">--%>
                        <%--<img class="coursePanelPortrait" src="gogowisestyle/image/recommended5.jpg"  />--%>

                    <%--</div>--%>
                    <%--<div class="coursePanelInfoRight">--%>
                        <%--<p>Pellentesque habitant morbi tristique senectus.</p>--%>
                        <%--<p>School:MITx</p>--%>
                        <%--<p>Clases start:16 Oct 2013</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</a>--%>


            <a href="#"><p class="text-right">more</p></a>
        </div>
        <div class="col-sm-6">

            <div class="courseSubhead">MOOC</div>

            <!--Panel4 -->
            <a href="">
                <div class="coursePanel">
                    <div class="coursePanelInfoLeft">
                        <img class="coursePanelPortrait" src="gogowisestyle/image/recommended3.jpg"  />

                    </div>
                    <div class="coursePanelInfoRight">
                        <p>Pellentesque habitant morbi tristique senectus.</p>
                        <p>School:MITx</p>
                        <p>Clases start:16 Oct 2013</p>
                    </div>
                </div>
            </a>
            <!--Panel5 -->
            <a href="#">
                <div class="coursePanel">
                    <div class="coursePanelInfoLeft">
                        <img class="coursePanelPortrait" src="gogowisestyle/image/recommended6.jpg"  />

                    </div>
                    <div class="coursePanelInfoRight">
                        <p>Pellentesque habitant morbi tristique senectus.</p>
                        <p>School:MITx</p>
                        <p>Clases start:16 Oct 2013</p>
                    </div>
                </div>
            </a>
            <!--Panel6 -->
            <a href="#">
                <div class="coursePanel">
                    <div class="coursePanelInfoLeft">
                        <img class="coursePanelPortrait" src="gogowisestyle/image/recommended7.jpg"  />

                    </div>
                    <div class="coursePanelInfoRight">
                        <p>Pellentesque habitant morbi tristique senectus.</p>
                        <p>School:MITx</p>
                        <p>Clases start:16 Oct 2013</p>
                    </div>
                </div>
            </a>

            <!--Panel6 -->
            <a href="#">
                <div class="coursePanel">
                    <div class="coursePanelInfoLeft">
                        <img class="coursePanelPortrait" src="gogowisestyle/image/recommended7.jpg"  />

                    </div>
                    <div class="coursePanelInfoRight">
                        <p>Pellentesque habitant morbi tristique senectus.</p>
                        <p>School:MITx</p>
                        <p>Clases start:16 Oct 2013</p>
                    </div>
                </div>
            </a>

            <a href="#"><p class="text-right">more</p></a>

        </div>
    </div>
</div>

<div class="container">
    <ul class="bxsliderLogolist">
        <li>
            <img src="gogowisestyle/image/orgLogolist1.jpg" alt="">
        </li>
        <li>
            <img src="gogowisestyle/image/orgLogolist2.jpg" alt="">
        </li>
        <li>
            <img src="gogowisestyle/image/orgLogolist3.jpg" alt="">
        </li>
    </ul>

</div>
