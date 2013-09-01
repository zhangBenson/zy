<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/userheader.css" rel="stylesheet"/>

<div class="uho">
    <div class="uh">
        <div class="uh1">
            <ul class="menu_section">
                <li class="hp_item">
                    <div class="menu_base menu_base_home">
                        <s:a action="index"><s:property value="%{getText('label.homepage')}"/></s:a>
                    </div>
                </li>
                <li class="hp_item">
                    <div class="menu_base menu_base_course">
                        <s:a action="courseSquare"><s:property value="%{getText('frame.course.center')}"/></s:a>
                    </div>
                </li>
                <li class="hp_item">
                    <div class="menu_base menu_base_show">
                        <s:a action="showSquare"><s:property value="%{getText('frame.show.center')}"/></s:a>
                    </div>
                </li>
                <%--<li class="hp_item">--%>
                    <%--<div class="menu_base menu_base_live">--%>
                        <%--<s:a action="liveSquare"><s:property value="%{getText('frame.onlive.center')}"/></s:a>--%>
                    <%--</div>--%>
                <%--</li>--%>


                  <li class="hp_item">
                    <div class="menu_base menu_base_download">
                        <a href="downloadRemoteEye.html"><s:property value="%{getText('download.center')}"/></a>
                    </div>
                    <div class="menu_popup popup1">
                        <ul class="menu_popup_section">
                            <li><a href="downloadRemoteEye.html"><s:property value="%{getText('control.room.ggw.remote.eye')}"/></a></li>
                            <li><a href="ggw4android.html"><s:property value="%{getText('download.ggw.interaction')}"/></a></li>
                        </ul>
                    </div>
                </li>

                <%--<li class="hp_item">--%>
                    <%--<div class="menu_base menu_base_solutions">--%>
                       <%--<a href="multiVideoSolution.html"><s:property value="%{getText('title.solutions')}"/></a>--%>
                    <%--</div>--%>
                <%--</li>--%>

                <li class="hp_item">
                   <div class="menu_base menu_base_userCenter">
                       <a href="myfirstPage.html"><s:property value="%{getText('usermenu.item.myhomepage')}"/></a>
                   </div>
               </li>

                <li class="hp_item">
                   <div class="menu_base menu_base_map">
                       <a href="liveBMap2.html"><s:property value="%{getText('live.map')}"/></a>
                   </div>
               </li>


                <li class="hp_item">
                    <div class="menu_base menu_base_about"><a href="aboutUs.html"><s:property value="%{getText('link.about.us')}"/></a></div>
                    <div class="menu_popup popup1">
                        <ul class="menu_popup_section">
                            <li><a href="aboutUs.html"><s:property value="%{getText('nav.firm.info')}"/></a></li>
                            <li><a href="team.html"><s:property value="%{getText('nav.team.info')}"/></a></li>
                            <li><a href="history.html"><s:property value="%{getText('nav.development.history')}"/></a></li>
                            <li><a href="contactUs.html"><s:property value="%{getText('nav.contact.us')}"/></a></li>
                        </ul>
                    </div>
                </li>


            </ul>
        </div>

        <div class="uh3">
            <s:if test="#session.email !=null">
            <div class="user_info">
                <ul class="ul_out">
                    <li id="account" class="account1" onmouseover="this.className='account2',document.getElementById('accountlist').className='accountlist2'" onmouseout="this.className='account1',document.getElementById('accountlist').className='accountlist1'">
                        <s:property value="%{getText('menu.item.account')}" /> ▼
                    </li>
                    <li id="accountlist" class="accountlist1" onmouseover="this.className='accountlist2',document.getElementById('account').className='account2'" onmouseout="this.className='accountlist1',document.getElementById('account').className='account1'">
                        <iframe></iframe>
                        <ul>
                            <li class="info">
                                <a href="userBlog.html?user.id=<s:property value="#session.userID"/>" title="<s:property value="#session.nickName"/>"><img id="userheader_user_img" src="<s:property value='#session.userLogoUrl' />" alt="<s:property value='#session.nickName'/>"/></a>
                                <span class="name">
                                    <s:if test="#session.nickName !=null && #session.nickName !=\"\""><s:property value="#session.nickName"/></s:if>
                                    <s:else><s:property value="#session.email"/> </s:else>
                                </span>
                            </li>
                            <li class="setting bg"><a href="initUpdate.html"><span></span><s:property value="%{getText('account.item.accountsettings')}" /></a></li>
                            <%--<li class="coupons bg"><a href="javascript:;"><span></span><s:property value="%{getText('menu.item.ticket')}" /></a></li>--%>
                            <li class="money bg"><a href="myGGWAccount.html"><span></span><s:property value="%{getText('usermenu.item.zhibi.myAccount')}" /></a></li>
                            <li class="exit bg"><a href="exitSystem.html"><span></span><s:property value="%{getText('href.logout')}" /></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            </s:if>
            <s:else>
                <div class="handle">
                    <a href="login.html" id="login_btn"><s:property value="%{getText('Login')}"/></a>&nbsp;&nbsp;<strong>|</strong>&nbsp;&nbsp;<a href="initReg.html"><s:property value="%{getText('user.info.identity.finish.reg')}"/></a>
                </div>
            </s:else>
        </div>

        <div class="uh2">
            <s:form method="post" action="searchResult" theme="simple" validate="true">

                <s:hidden name="searchType" value="1"/>
                <%--<input name="courseName" class="keyWords"/>--%>
                <s:textfield cssClass="keyWords" name="searchStr" />
                <input type="hidden" name="searchTyp" value="1"/>
                <input class="searchButton" type="submit" value="" />
                <%--<a class="searchButton" href="search.html"></a>--%>
            </s:form>
        </div>

    </div>
</div>

<script type="text/javascript">
    $(function(){
        $("#login_btn").fancybox({
            "type":"iframe",
            "width":350,
            "height":270
        });

        var nextItemList;
        $("div.menu_base").hover(function(){
            nextItemList = $(this).next("div");
            nextItemList.show();
        },function(){
            nextItemList.hide();
        });

        $("div.menu_popup").hover(function(){
            nextItemList.show();
        },function(){
            nextItemList.hide();
        });

    });
</script>