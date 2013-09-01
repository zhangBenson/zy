<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/virtualClass/personalVirtualRoom_js.jsp" %>
<%@ include file="/js/virtualClass/virtualClass_js.jsp" %>
<script type="text/javascript" src="js/jquery.jcountdown1.3.min.js"></script>
<script type="text/javascript" src="js/onlive/personal_virtual_room.js"></script>
<link href="css/onlive/personal_virtual_room.css" rel="stylesheet" type="text/css" />
<%--<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>--%>
<script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script>

<s:hidden value="%{#session.userID}" id="hidSessionId"/>
<div id="room_title">
    <h2>
        <s:if test="personalOnlive.owner.id == #session.userID">
            <s:property value="%{getText('contentLeft.param3')}"/>
        </s:if>
        <s:else>
            <s:property value="%{getText('per.onlive.room',{personalOnlive.owner.nickName})}"/>
        </s:else>
        <em>&gt;</em>
        <span id="share_title"><s:property value="personalOnlive.title"/></span>
    </h2>
    <p>
        <s:if test="personalOnlive.owner.id == #session.userID">
            <a  id="addLiveTitle" href="#add_live_title"><s:property value="%{getText('gogowise.personalOnlive.title')}" /></a>
            <a id="addLiveAnnounce" href="#add_live_announce"><s:property value="%{getText('per.onlive.announce')}" /></a>
            <a href="addLiveGoingAnnouncement.html" target="_blank"><s:property value="%{getText('live.trailer.announce')}"/></a>
        </s:if>
        <a id="guest_invite" href="#invite_student_container"><s:property value="%{getText('personal.onlive.recommend.friend')}"/></a>
    </p>
</div>

<div class="" id="room_panel">
    <div id="panel_flash">
        <div class="flash">
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="410" height="350" name="Girl" id="Girl" wmode="transparent">
                <param name="movie" value="<s:property value="flashPatch"/>" />
                <param name="quality" value="high" />
                <param name="wmode" value="transparent" />
                <param name="allowFullScreen" value="true" />
                <embed src="<s:property value="flashPatch"/>" allowFullScreen="true" width="410" height="350" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" name="Girl" id="GirlEmbed"></embed>
            </object>
        </div>
        <div class="share_to">
            <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare" data="">
                <a class="bds_tsina">新浪微博</a>
                <a class="bds_tqq">腾讯微博</a>
                <a class="bds_renren">人人网</a>
                <a class="bds_fbook">Facebook</a>
                <a class="bds_twi">Twitter</a>
                <span class="bds_more"><s:property value="%{getText('others.more')}"/></span>
            </div>
        </div>
        <div class="host_desc">
            <a class="img" href="userBlog.html?user.id=<s:property value="personalOnlive.owner.id"/>" target="_blank" >
                <img id="share_pic" src="<s:property value="personalOnlive.owner.pic"/>" title="<s:property value="personalOnlive.owner.nickName"/>" />
            </a>
            <a class="title" href="userBlog.html?user.id=<s:property value="personalOnlive.owner.id"/>" target="_blank"  >
                <s:property value="personalOnlive.owner.nickName"/>
            </a>
            <span><s:property value="personalOnlive.owner.fansNum"/><s:property value="%{getText('user.add.focus')}"/></span>
            <s:if test="personalOnlive.owner.id != #session.userID">
                <a class="submit_btn" onclick="becomeFans(this,<s:property value="personalOnlive.owner.id"/>);"><s:property value="%{getText('user.add.focus')}"/></a>
            </s:if>
            <p>
                <s:if test="personalOnlive.owner.selfDescription == null">
                    <s:property value="%{getText('user.without.self.desc')}"/>
                </s:if>
                <s:else>
                    <s:property value="personalOnlive.owner.selfDescription"/>
                </s:else>
            </p>
        </div>
        <div class="onliveList">
            <h3><s:property value="%{getText('live.term.is.on.living')}"/></h3>
            <ul>
                <s:iterator value="personalOnlives">
                <li>
                    <a href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="id"/>" target="_blank" class="img"><img src="<s:property value="owner.pic"/>"/></a>
                    <a href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="id"/>" target="_blank" class="title"><s:property value="owner.nickName"/></a>
                </li>
                </s:iterator>
            </ul>
        </div>
    </div>

    <div id="chat_music">
        <ul class="head" id="cmhead">
            <li class="emphasis" alt="1"><s:property value="%{getText('per.onlive.public.chat')}" /></li>
            <%--<li alt="2" class="l2">点歌</li>--%>
        </ul>
        <div class="chat" id="cmcont1">
            <div class="announce">
                【<s:property value="%{getText('per.onlive.announce')}" />】
                <span id="share_desc">
                    <s:if test="personalOnlive.announcement == null">
                        <s:property value="%{getText('per.onlive.no.announce')}" />
                    </s:if>
                    <s:else>
                        <s:property value="personalOnlive.announcement"/>
                    </s:else>
                </span>
            </div>
            <div class="area">
                <p  id="messageList"></p>
                <span id="btnClear"><s:property value="%{getText('clear.screen')}"/></span>
            </div>
            <div class="msg" id="msg_handle">
                <strong><s:property value="%{getText('word.to')}" /></strong>
                <span class="msg_to_all" id="msg_to_all" alt="1" style="cursor: pointer;"><s:property value="%{getText('word.all.person')}" /></span>
                <div class="audience" id="msg_audience">
                </div>
                <div class="msg_face">
                    <a class="face_good" id="face_good" style="cursor: pointer;" title="[face0]"></a>
                    <div class="defaultFacePanel" id="defaultFacePanel" style="display: none;">
                        <a class="faceIcon" facecode="[face0]" title="[face0]" href="###"></a>
                        <a class="faceIcon" facecode="[face1]" title="[face1]" href="###"></a>
                        <a class="faceIcon" facecode="[face2]" title="[face2]" href="###"></a><a class="faceIcon" facecode="[face3]" title="[face3]" href="###"></a><a class="faceIcon" facecode="[face4]" title="[face4]" href="###"></a><a class="faceIcon" facecode="[face5]" title="[face5]" href="###"></a><a class="faceIcon" facecode="[face6]" title="[face6]" href="###"></a><a class="faceIcon" facecode="[face7]" title="[face7]" href="###"></a><a class="faceIcon" facecode="[face8]" title="[face8]" href="###"></a><a class="faceIcon" facecode="[face9]" title="[face9]" href="###"></a><a class="faceIcon" facecode="[face10]" title="[face10]" href="###"></a><a class="faceIcon" facecode="[face11]" title="[face11]" href="###"></a><a class="faceIcon" facecode="[face12]" title="[face12]" href="###"></a><a class="faceIcon" facecode="[face13]" title="[face13]" href="###"></a><a class="faceIcon" facecode="[face14]" title="[face14]" href="###"></a><a class="faceIcon" facecode="[face15]" title="[face15]" href="###"></a><a class="faceIcon" facecode="[face16]" title="[face16]" href="###"></a><a class="faceIcon" facecode="[face17]" title="[face17]" href="###"></a><a class="faceIcon" facecode="[face18]" title="[face18]" href="###"></a><a class="faceIcon" facecode="[face19]" title="[face19]" href="###"></a><a class="faceIcon" facecode="[face20]" title="[face20]" href="###"></a><a class="faceIcon" facecode="[face21]" title="[face21]" href="###"></a><a class="faceIcon" facecode="[face22]" title="[face22]" href="###"></a><a class="faceIcon" facecode="[face23]" title="[face23]" href="###"></a><a class="faceIcon" facecode="[face24]" title="[face24]" href="###"></a><a class="faceIcon" facecode="[face25]" title="[face25]" href="###"></a><a class="faceIcon" facecode="[face26]" title="[face26]" href="###"></a><a class="faceIcon" facecode="[face27]" title="[face27]" href="###"></a><a class="faceIcon" facecode="[face28]" title="[face28]" href="###"></a><a class="faceIcon" facecode="[face29]" title="[face29]" href="###"></a><a class="faceIcon" facecode="[face30]" title="[face30]" href="###"></a><a class="faceIcon" facecode="[face31]" title="[face31]" href="###"></a><a class="faceIcon" facecode="[face32]" title="[face32]" href="###"></a><a class="faceIcon" facecode="[face33]" title="[face33]" href="###"></a><a class="faceIcon" facecode="[face34]" title="[face34]" href="###"></a><a class="faceIcon" facecode="[face35]" title="[face35]" href="###"></a><a class="faceIcon" facecode="[face36]" title="[face36]" href="###"></a><a class="faceIcon" facecode="[face37]" title="[face37]" href="###"></a><a class="faceIcon" facecode="[face38]" title="[face38]" href="###"></a><a class="faceIcon" facecode="[face39]" title="[face39]" href="###"></a><a class="faceIcon" facecode="[face40]" title="[face40]" href="###"></a><a class="faceIcon" facecode="[face41]" title="[face41]" href="###"></a><a class="faceIcon" facecode="[face42]" title="[face42]" href="###"></a><a class="faceIcon" facecode="[face43]" title="[face43]" href="###"></a><a class="faceIcon" facecode="[face44]" title="[face44]" href="###"></a><a class="faceIcon" facecode="[face45]" title="[face45]" href="###"></a><a class="faceIcon" facecode="[face46]" title="[face46]" href="###"></a><a class="faceIcon" facecode="[face47]" title="[face47]" href="###"></a><a class="faceIcon" facecode="[face48]" title="[face48]" href="###"></a><a class="faceIcon" facecode="[face49]" title="[face49]" href="###"></a><a class="faceIcon" facecode="[face50]" title="[face50]" href="###"></a><a class="faceIcon" facecode="[face51]" title="[face51]" href="###"></a><a class="faceIcon" facecode="[face52]" title="[face52]" href="###"></a><a class="faceIcon" facecode="[face53]" title="[face53]" href="###"></a><a class="faceIcon" facecode="[face54]" title="[face54]" href="###"></a><a class="faceIcon" facecode="[face55]" title="[face55]" href="###"></a><a class="faceIcon" facecode="[face56]" title="[face56]" href="###"></a><a class="faceIcon" facecode="[face57]" title="[face57]" href="###"></a><a class="faceIcon" facecode="[face58]" title="[face58]" href="###"></a><a class="faceIcon" facecode="[face59]" title="[face59]" href="###"></a><a class="faceIcon" facecode="[face60]" title="[face60]" href="###"></a><a class="faceIcon" facecode="[face61]" title="[face61]" href="###"></a><a class="faceIcon" facecode="[face62]" title="[face62]" href="###"></a><a class="faceIcon" facecode="[face63]" title="[face63]" href="###"></a><a class="faceIcon" facecode="[face64]" title="[face64]" href="###"></a><a class="faceIcon" facecode="[face65]" title="[face65]" href="###"></a><a class="faceIcon" facecode="[face66]" title="[face66]" href="###"></a><a class="faceIcon" facecode="[face67]" title="[face67]" href="###"></a><a class="faceIcon" facecode="[face68]" title="[face68]" href="###"></a><a class="faceIcon" facecode="[face69]" title="[face69]" href="###"></a><a class="faceIcon" facecode="[face70]" title="[face70]" href="###"></a><a class="faceIcon" facecode="[face71]" title="[face71]" href="###"></a><a class="faceIcon" facecode="[face72]" title="[face72]" href="###"></a><a class="faceIcon" facecode="[face73]" title="[face73]" href="###"></a><a class="faceIcon" facecode="[face74]" title="[face74]" href="###"></a><a class="faceIcon" facecode="[face75]" title="[face75]" href="###"></a><a class="faceIcon" facecode="[face76]" title="[face76]" href="###"></a><a class="faceIcon" facecode="[face77]" title="[face77]" href="###"></a><a class="faceIcon" facecode="[face78]" title="[face78]" href="###"></a><a class="faceIcon" facecode="[face79]" title="[face79]" href="###"></a><a class="faceIcon" facecode="[face80]" title="[face80]" href="###"></a><a class="faceIcon" facecode="[face81]" title="[face81]" href="###"></a><a class="faceIcon" facecode="[face82]" title="[face82]" href="###"></a><a class="faceIcon" facecode="[face83]" title="[face83]" href="###"></a><a class="faceIcon" facecode="[face84]" title="[face84]" href="###"></a><a class="faceIcon" facecode="[face85]" title="[face85]" href="###"></a><a class="faceIcon" facecode="[face86]" title="[face86]" href="###"></a><a class="faceIcon" facecode="[face87]" title="[face87]" href="###"></a><a class="faceIcon" facecode="[face88]" title="[face88]" href="###"></a><a class="faceIcon" facecode="[face89]" title="[face89]" href="###"></a><a class="faceIcon" facecode="[face90]" title="[face90]" href="###"></a><a class="faceIcon" facecode="[face91]" title="[face91]" href="###"></a><a class="faceIcon" facecode="[face92]" title="[face92]" href="###"></a><a class="faceIcon" facecode="[face93]" title="[face93]" href="###"></a><a class="faceIcon" facecode="[face94]" title="[face94]" href="###"></a><a class="faceIcon" facecode="[face95]" title="[face95]" href="###"></a><a class="faceIcon" facecode="[face96]" title="[face96]" href="###"></a><a class="faceIcon" facecode="[face97]" title="[face97]" href="###"></a><a class="faceIcon" facecode="[face98]" title="[face98]" href="###"></a><a class="faceIcon" facecode="[face99]" title="[face99]" href="###"></a><a class="faceIcon" facecode="[face100]" title="[face100]" href="###"></a><a class="faceIcon" facecode="[face101]" title="[face101]" href="###"></a><a class="faceIcon" facecode="[face102]" title="[face102]" href="###"></a><a class="faceIcon" facecode="[face103]" title="[face103]" href="###"></a><a class="faceIcon" facecode="[face104]" title="[face104]" href="###"></a>
                    </div>
                </div>
                <p><input type="text" name="msg" id="msgInput" value="" class="in_tx"></p>
                <button id="btnSay" class="btn_del_fav" ><s:property value="%{getText('word.send')}"/></button>
            </div>

        </div>
        <div class="music" id="cmcont2" style="display: none;">
            <h4>共3首歌曲</h4>
            <div class="songList">
                <table cellpadding="0" cellspacing="0">
                <tr>
                    <th>歌曲名</th>
                    <th>原唱</th>
                    <th>操作</th>
                </tr>
                <tr>
                    <td>我的歌声里</td>
                    <td>曲婉婷</td>
                    <td>
                        <a href="#" class="play"></a>&nbsp;&nbsp;
                        <a href="#" class="delete"></a>
                    </td>
                </tr>  <tr>
                    <td>我的歌声里</td>
                    <td>曲婉婷</td>
                    <td>
                        <a href="#" class="play"></a>&nbsp;&nbsp;
                        <a href="#" class="delete"></a>
                    </td>
                </tr>  <tr>
                    <td>我的歌声里</td>
                    <td>曲婉婷</td>
                    <td>
                        <a href="#" class="play"></a>&nbsp;&nbsp;
                        <a href="#" class="delete"></a>
                    </td>
                </tr>  <tr>
                    <td>我的歌声里</td>
                    <td>曲婉婷</td>
                    <td>
                        <a href="#" class="play"></a>&nbsp;&nbsp;
                        <a href="#" class="delete"></a>
                    </td>
                </tr>  <tr>
                    <td>我的歌声里</td>
                    <td>曲婉婷</td>
                    <td>
                        <a href="#" class="play"></a>&nbsp;&nbsp;
                        <a href="#" class="delete"></a>
                    </td>
                </tr>  <tr>
                    <td>我的歌声里</td>
                    <td>曲婉婷</td>
                    <td>
                        <a href="#" class="play"></a>&nbsp;&nbsp;
                        <a href="#" class="delete"></a>
                    </td>
                </tr>  <tr>
                    <td>我的歌声里</td>
                    <td>曲婉婷</td>
                    <td>
                        <a href="#" class="play"></a>&nbsp;&nbsp;
                        <a href="#" class="delete"></a>
                    </td>
                </tr>  <tr>
                    <td>我的歌声里</td>
                    <td>曲婉婷</td>
                    <td>
                        <a href="#" class="play"></a>&nbsp;&nbsp;
                        <a href="#" class="delete"></a>
                    </td>
                </tr>  <tr>
                    <td>我的歌声里</td>
                    <td>曲婉婷</td>
                    <td>
                        <a href="#" class="play"></a>&nbsp;&nbsp;
                        <a href="#" class="delete"></a>
                    </td>
                </tr>
            </table>
            </div>
            <div class="addWrap">
                <a class="add">添加歌曲</a>
            </div>
        </div>
    </div>

    <div id="audienceList">
        <p class="title"><s:property value="%{getText('word.audience')}"/>
            <s:if test="regAudiences.size == 0">
                (<span id="audienceNum">0</span>)
            </s:if>
            <s:else>
                (<span id="audienceNum"><s:property value="regAudiences.size"/></span>)
            </s:else>
        </p>
        <div class="listulWrap">
            <ul id="audienceListUL">
            </ul>
        </div>
    </div>
</div>


<div style="display:none;">
    <div class="invite_student_container popup_box" id="invite_student_container">
        <s:form id="emailForm_personalOnlive">
                <s:hidden name="personalOnlive.id"/>
                <p class="link_para"><span id="inviteFriendHref"><s:property value="inviteFriendHref"/></span></p>

                <p><span class="clip_link_btn submit_btn" onclick="copyToClipboard();"><s:property value="%{getText('course.invite.link.copy')}"/></span></p>

                <p class="or_pragraph"><s:property value="%{getText('course.selection.or')}"/><s:property value="%{getText('button.message')}"/>&nbsp;&nbsp;&nbsp;<span class="tip_words" id="invite_text_tip"></span></p>

                <p class="leave_msg"><textarea id="invite_comments" name="inviteMessage"></textarea></p>

                <p class="email_list" id="invite_email_list">
                    <span><s:property value="%{getText('label.email.friend')}"/><label id="invite_add_email" class="add_btn"><s:property value="%{getText('interview.add')}"/></label>&nbsp;&nbsp;<label id="invite_email_msg" class="tip_words"></label><br/>
                        <input type="text" class="emails" onblur="checkInviteEmail(this);" name="emails"></span>
                </p>

                <p class="begin_invite"><label onclick="inviteFriends();" class="submit_btn"><s:property value="%{getText('course.invite.begin')}"/></label>&nbsp;&nbsp;&nbsp;<span id="inviteMessage" style="color: green;"></span></p>
        </s:form>
    </div>

    <div id="add_live_title" class="popup_box">
        <input class="input1" type="text" placeholder="<s:property value="%{getText('gogowise.personalOnlive.title')}"/>" id="personalOnlive_name"/><br/>
        <p><s:property value="%{getText('per.onlive.title.tip')}" /></p>
        <input class="input2" type="button" onclick="addPerOnliveName(<s:property value="personalOnlive.id"/>);" value="<s:property value="%{getText('button.ok')}"/>"/>
        <div id="addPerOnliveName_Msg"></div>
    </div>

    <div id="add_live_announce" class="popup_box">
        <p><s:property value="%{getText('per.onlive.announce.here')}"/><span class="tip_words" id="annnounce_add_tip"></span></p>
        <textarea><s:property value="personalOnlive.announcement" /></textarea>
        <input type="submit" value="<s:property value="%{getText('term.info.save')}"/>" />
        <input type="button" value="<s:property value="%{getText('term.info.reset')}"/>" />
    </div>

    <%-- 提示用户输入直播地点 --%>
    <div id="addAddressTip" class="popup_box address_tip_box">
        <div class="tip1">
            <p>您上次直播的地点是“<s:property value="personalOnlive.owner.address"/>”，是否设置为本次的直播地点？ </p>
            <input type="submit" class="submit_btn" id="addressOld" value="是" />
            <input type="button" class="submit_btn" id="addressNew" value="新的地址" />
            <input type="button" class="submit_btn" id="addressInputIgnore1" value="以后再说" />
        </div>
        <div class="tip2">
            <p>填写您的直播地点，让更多人在直播地图上看到您的精彩直播。</p>
            <input type="text" id="addressInput" value="" />   <br />
            <input type="submit" class="submit_btn" id="addressStoreBtn" value="保存地点" />
            <input type="button" class="submit_btn" id="addressInputIgnore2" value="以后再说" />
        </div>
    </div>
    <span id="tip_tmp_btn" href="#addAddressTip">tip_tmp_btn</span>
    <span id="perAddress"><s:property value="personalOnlive.owner.address" /></span>
</div>

<%--百度分享js开始--%>
<script type="text/javascript" id="bdshare_js" data="type=tools" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
    var share_title = document.getElementById("share_title").innerText+"@GoGoWise"+"  <s:text name="per.onlive.wonderful"/>";
    var share_pic =  document.getElementById("share_pic").src;
    var share_comment = "<s:text name="per.onlive.wonderful"/>";
    var share_desc = document.getElementById("share_desc").innerText;

    var _data = "{'text':'"+share_title + "',"+
            "'comment':'"+share_comment + "',"+
            "'url':'"+window.location.href+"'}";

    document.getElementById("bdshare").setAttribute("data",_data);


    var bds_config = {'bdText':share_title,
        'bdDesc':share_desc, //qq，开心
        'bdComment':share_comment,
        'bdPopTitle':'GoGoWise Share',
        'bdPic':share_pic
    };
    document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
</script>
<%--百度分享js结束--%>



<script language="JavaScript" type="text/javascript">
//    $(function(){    //IE刷新和关闭窗口都有效，Firefox关闭窗口有效，Chrome均无效
//        $(window).unload(CloseBrowser);
//    });
//    window.onbeforeunload = CloseBrowser;  //IE刷新和关闭窗口都有效，Firefox关闭窗口有效，Chrome均无效
//
     function CreateRoom() {
             getGirlOjbect().CreateRoomComplete("<s:property value='initSeesionString' escape='false' />", "");
     }
     function CloseBrowser(){
//          getGirlOjbect().closeBrowser();
          var href = "closePersonalOnliveState.html";
          $.post(href,{"personalOnlive.id":"<s:property value='personalOnlive.id'/>"});
     }

    function EndOnlive(){
         var href = "closePersonalOnliveState.html";
          $.post(href,{"personalOnlive.id":"<s:property value='personalOnlive.id'/>"});
    }

      function InRoom(){
               getGirlOjbect().InRoomComplete("<s:property value='initSeesionString' escape='false' />", "");
      }

      function addPLFinishTime(onliveID){
           $.post("updatePerOnliveFlag.html",{'personalOnlive.id':onliveID});
      }

      function DistributeMessage(message){
          AddMessage(message);
      }

        function RefreshAudience(userNames,annoyNames){
            var userItems = userNames.split(",");
            var annoyItems = annoyNames.split(",");
            $("#audienceNum").text(userItems.length + annoyItems.length);
            var newLi = '';
            var newA = '<a alt="1" class="msg_nick" onclick="sayToMe(this);">'+'<s:text name="%{getText('word.all.person')}" />'+'</a>';
            for(var i=0;i<userItems.length;i++){
                var userItem = userItems[i];
                newLi += '<li><a alt="2" class="title msg_nick" onclick="sayToMe(this);">'+userItem+'</a></li>';
                newA += '<a alt="2" class="msg_nick" onclick="sayToMe(this);">'+userItem+'</a>';
            }
            for(var i=0;i<annoyItems.length;i++){
                var annoyItem = annoyItems[i];
                newLi += '<li><a alt="2" class="title msg_nick" onclick="sayToMe(this);">'+annoyItem+'</a></li>';
                newA += '<a alt="2" class="msg_nick" onclick="sayToMe(this);">'+annoyItem+'</a>';
            }
            $("#audienceListUL").html(newLi);
            $("#msg_audience").html(newA);
        }

      function RecordStart(OnliveID){
            $.post("perOnliveRecordStart.html",{'personalOnlive.id':OnliveID});
      }

      function saveChatRecord(OnliveID, UserID, lastmessage){
           $.post("saveUserComments.html",{'personalOnlive.id':OnliveID,'comment.owner.id':UserID,'comment.description':lastmessage});
      }

      function  getNumOfRegAudience(onliveID,number){
           $.post("saveNumOfRegAudience.html",{'personalOnlive.id':onliveID,'personalOnlive.numOfRegAudience':number});
      }
      function getNumOfAudience(onliveID,number){
           $.post("saveNumOfAudience.html",{'personalOnlive.id':onliveID,'personalOnlive.numOfAudience':number});
      }

</script>

<script type="text/javascript">
    var liveAddress,liveLatitude,liveLongitude;
    var myGeo;
    var cityName;

    $(document).ready(function(){
         $("#btnSay").click(function(){
            var message = document.getElementById("msgInput").value;
            if(!message || !validateLogo()) return;
            var nowDate = new Date();
            var minutes = nowDate.getMinutes();
            var timeStr = nowDate.getHours() + ":" + (minutes<10?("0"+minutes):minutes);
            var toStr = document.getElementById("msg_to_all").innerHTML;
            var toType = $("#msg_to_all").attr("alt");
            if(toType == 1){
                toStr = " <a class='msg_nick' onclick='sayToMe(this);'><s:property value="#session.nickName"/></a>: ";
            }else if(toType == 2){
                toStr = " <a class='msg_nick' onclick='sayToMe(this);'><s:property value="#session.nickName"/></a> <s:text name="%{getText('word.to')}"/> <a class='msg_nick' onclick='sayToMe(this);'>"+toStr+"</a>: ";
            }
            getGirlOjbect().DistributeMessage(timeStr+toStr+message);
            $("#msgInput").attr("value","");
            $("#msgInput")[0].focus();

            <s:if test="#session.userID != null">
                saveChatRecord(<s:property value="personalOnlive.id"/>,<s:property value="#session.userID"/>,message);
            </s:if>
        });

        $("#msgInput").keydown(function(event){
            if(!this.value) return;
            if(event.keyCode == 13){
                if(!validateLogo()) return;
                var nowDate = new Date();
                var minutes = nowDate.getMinutes();
                var timeStr = nowDate.getHours() + ":" + (minutes<10?("0"+minutes):minutes);
                var toStr = document.getElementById("msg_to_all").innerHTML;
                var toType = $("#msg_to_all").attr("alt");
                if(toType == 1){
                    toStr = " <a alt='2' class='msg_nick' onclick='sayToMe(this);'><s:property value="#session.nickName"/></a>: ";
                }else if(toType == 2){
                    toStr = " <a alt='2' class='msg_nick' onclick='sayToMe(this);'><s:property value="#session.nickName"/></a> <s:text name="%{getText('word.to')}"/> <a alt='2' class='msg_nick onclick='sayToMe(this);'>"+toStr+"</a>:";
                }
                getGirlOjbect().DistributeMessage(timeStr + toStr + this.value);

                <s:if test="#session.userID != null">
                    saveChatRecord(<s:property value="personalOnlive.id"/>,<s:property value="#session.userID"/>,this.value);
                </s:if>

                this.value = "";
            }
        });

        $("#btnClear").click(function(){
            ClearMessage();
        });

        $("#cmhead li").click(function(){
            if($(this).hasClass("emphasis")) return;
            $(this).siblings().removeClass("emphasis");
            $(this).addClass("emphasis");
            var index = $(this).attr("alt");
            $("#cmcont"+index).siblings("div").hide();
            $("#cmcont"+index).show();
        });

        $("#face_good").click(function(){
            $("#defaultFacePanel").toggle();
        });
        $(".faceIcon").click(function(){
            var faceStr = $(this).attr("facecode");
            var beforeStr =  $("#msgInput").val();
            $("#msgInput").attr("value",beforeStr+faceStr);
            $("#defaultFacePanel").hide();
        });
        $("#msg_to_all").click(function(){
            $("#msg_audience").toggle();
        });
        $("#msg_audience").mouseleave(function(){
            $(this).hide();
        });

        var docHref = window.location.href;
        if(docHref.indexOf("watchPersonalOnlive.html") == -1){
            $("#tip_tmp_btn").fancybox({
                onComplete:function(){
                    $("#addressInput").val(cityName);
                },
                onClosed:function(){
                    if(liveAddress) return;
                    var geolocation = new BMap.Geolocation();
                    geolocation.getCurrentPosition(function(r){
                        if(this.getStatus() == BMAP_STATUS_SUCCESS){
                            var latitude = r.point.lat;
                            var longitude = r.point.lng;
                            myGeo.getLocation(r.point,function(geoResult){
                                var address = geoResult.address;
                                storeOnliveLocation(address,latitude,longitude);
                            })
                        }
                    })
                }
            });
            <s:if test="personalOnlive.owner.address != null">
                $("#addAddressTip .tip2").css("display","none");
            </s:if>
            <s:else>
                $("#addAddressTip .tip1").css("display","none");
            </s:else>
            <%-- 根据IP获得用户城市位置 --%>
            var myCity = new BMap.LocalCity();
            myCity.get(function(result){
                cityName = result.name;
                <%-- 为搜索栏添加下拉提示 --%>
                var acmp = new BMap.Autocomplete({//建立一个自动完成的对象
                    "location":result.name,
                    "input":"addressInput"
                 });
                $("#tip_tmp_btn").trigger("click");

            });
        }

        myGeo = new BMap.Geocoder();
        $("#addressStoreBtn").click(function(){
            liveAddress = $("#addressInput").val();
            if(!liveAddress) return;
            //根据地址解析出经纬度
            // 将地址解析结果显示在地图上,并调整地图视野
            myGeo.getPoint(liveAddress, function(point){
              if (point) {
                  liveLatitude = point.lat;
                  liveLongitude = point.lng;
                  storeOnliveLocation(liveAddress,liveLatitude,liveLongitude);
                  $.fancybox.close();
              }
            });
        });
        $("#addressInputIgnore1").click(function(){
            $.fancybox.close();
        });
        $("#addressInputIgnore2").click(function(){
            $.fancybox.close();
        });
        $("#addressOld").click(function(){
            storeOldOnliveLocation();
            $.fancybox.close();
        });
        $("#addressNew").click(function(){
            $("#addAddressTip .tip1").css("display","none");
            $("#addressInputIgnore2").before('<input type="submit" class="submit_btn" onclick="backAddressTip1(this);" value="使用上次直播地点" />');
            $("#addressInput").val($("#perAddress").html());
            $("#addAddressTip .tip2").css("display","block");
        });
    });

    function backAddressTip1(obj){
        $(obj).remove();
        $("#addAddressTip .tip2").css("display","none");
        $("#addAddressTip .tip1").css("display","block");
    }

    function sayToMe(obj){
        var nickName = obj.innerHTML;
        $("#msg_to_all").html(nickName);
        var toType = $(obj).attr("alt");
        $("#msg_to_all").attr("alt",toType);
        $("#msg_audience").hide();
    }

    var right_div = "<span style='color:green;'><s:text name="info.add.success"/></span>";
    var currTime = 0;
    timeCount();
    function timeCount(){
            $("#personalOnlive_duration").html(currTime);
            currTime ++;
            setTimeout("timeCount();",60000);
    }

    $(function(){
        $('#addLiveTitle').fancybox();
        $('#guest_invite').fancybox();
        $("#addLiveAnnounce").fancybox();
        $("#add_live_announce input[type='submit']").click(function(){
            var announceStr = $("#add_live_announce textarea").val();
            if(!announceStr){
                return;
            }
            $.post("storePersonalOnliveAnnouncement.html",{"personalOnlive.id":<s:property value="personalOnlive.id"/>,"personalOnlive.announcement":announceStr});

            $("#share_desc").html(announceStr);
            $.fancybox.close();
        });
        $("#add_live_announce input[type='button']").click(function(){
            $.fancybox.close();
        });
        $("#add_live_announce textarea").keyup(function(){
            changeWordNumber(this,$("#annnounce_add_tip"),96);
        });
        $("#invite_comments").keyup(function(){
            changeWordNumber(this,$("#invite_text_tip"),200);
        });
    });

    function addPerOnliveName(onliveID){
        var title = $("#personalOnlive_name").val();
        $("#share_title").html(title);
        $.post("addPerOnliveTitle.html",{'personalOnlive.id':onliveID,'personalOnlive.title':title});
        $("#addPerOnliveName_Msg").html(right_div);
        setTimeout("$.fancybox.close();",1000);
    }

    /* 获取用户的位置 */
    function getUserLocation(){
        var browserSupportFlag = false;
        var userLocation = null;

         //尝试W3C方案获取用户地理位置的方法
        if(navigator.geolocation) {
            browserSupportFlag = true;
            navigator.geolocation.getCurrentPosition(function(position) {
                  userLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
                alert("geolocation");
                liveMap.setCenter(userLocation);
            }, function() {
                handleNoGeolocation(browserSupportFlag);
            });
        }
        //尝试谷歌自带的获取用户地理位置的方法
        else if (google.gears) {
            browserSupportFlag = true;
            var geo = google.gears.factory.create('beta.geolocation');
            geo.getCurrentPosition(function(position) {
                userLocation = new google.maps.LatLng(position.latitude,position.longitude);
                liveMap.setCenter(userLocation);
            }, function() {
                handleNoGeolocation(browserSupportFlag);
            });
        }
        //如果浏览器不支持获取用户地理位置，弹出警告
        else {
            browserSupportFlag = false;
            handleNoGeolocation(browserSupportFlag);
        }
    }

    function storeOnliveLocation(address,latitude,longitude){
        var onliveID = <s:property value="personalOnlive.id"/>;
        $.post("storeOnliveLocation.html",{"personalOnlive.id":onliveID,"address":address,"latitude":latitude,"longitude":longitude},function(){});
    }
    function storeOldOnliveLocation(){
        var onliveID = <s:property value="personalOnlive.id"/>;
        $.post("storeOldOnliveLocation.html",{"personalOnlive.id":onliveID},function(){});
    }
</script>
