<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ include file="/js/virtualClass/personalVirtualRoom_js.jsp" %>
<link href="css/onlive/multi_video_room_private.css" rel="stylesheet" type="text/css" />

<div id="flash_cont">
    <div class="room_tip1">
        <p class="p1">
            <a id="securityQuit" class="submit_btn_large"><s:property value="%{getText('control.room.security.quit')}"/></a>
            <s:if test="userPrivateChannel.user.id != #session.userID">
                <a class="whose" href="userBlog.html?user.id=<s:property value="userPrivateChannel.user.id"/>" target="_blank"><s:property value="%{getText('monitor.whose',{userPrivateChannel.user.nickName})}"/></a>
            </s:if>
            <s:else>
                <span class="whose"><s:property value="%{getText('index.function.MySupervising')}" /></span>
            </s:else>
        </p>
        <p class="p2">
            <%--<s:property value="%{getText('control.room.valid.left')}"/> <span id="leftDays"><s:property value="validDays"/> </span><s:property value="%{getText('course.time.day')}"/>&nbsp;&nbsp;&nbsp;--%>
            <%--<a href="privateLiveCharge.html" target="_blank" class="submit_btn"><s:property value="%{getText('control.room.charge')}"/></a> &nbsp;&nbsp;&nbsp;--%>
            <a href="multiVideoSolution.html" target="_blank" class="submit_btn"><s:property value="%{getText('control.room.more.solution')}"/></a>
        </p>
    </div>
    <div class="flashWrap">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="410" height="350" name="Girl0" id="Girl0" wmode="transparent">
            <param name="movie" value="<s:property value="flashPatch"/>?id=0" />
            <param name="quality" value="high" />
            <param name="wmode" value="transparent" />
            <param name="allowFullScreen" value="true" />
            <embed src="<s:property value="flashPatch"/>?id=0" allowFullScreen="true" width="410" height="350" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" name="Girl0" id="GirlEmbed0"></embed>
        </object>
    </div>
    <div class="flashWrap">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="410" height="350" name="Girl1" id="Girl1" wmode="transparent">
            <param name="movie" value="<s:property value="flashPatch"/>?id=1" />
            <param name="quality" value="high" />
            <param name="wmode" value="transparent" />
            <param name="allowFullScreen" value="true" />
            <embed src="<s:property value="flashPatch"/>?id=1" allowFullScreen="true" width="410" height="350" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" name="Girl1" id="GirlEmbed1"></embed>
        </object>
    </div>
    <div class="flashWrap">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="410" height="350" name="Girl2" id="Girl2" wmode="transparent">
            <param name="movie" value="<s:property value="flashPatch"/>?id=2" />
            <param name="quality" value="high" />
            <param name="wmode" value="transparent" />
            <param name="allowFullScreen" value="true" />
            <embed src="<s:property value="flashPatch"/>?id=2" allowFullScreen="true" width="410" height="350" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" name="Girl2" id="GirlEmbed2"></embed>
        </object>
    </div>
    <div class="room_other">
        <div class="term-list">
            <h3 class="h3_title"><s:property value="%{getText('index.onlive.hottest')}"/></h3>
            <a href="hotOnLiveList.html" target="_blank" class="other_more"><s:property value="%{getText('others.more')}"/></a>
            <ul>
                <s:iterator value="hotOnlives">
                <li>
                    <a href="userBlog.html?user.id=<s:property value="owner.id"/>" target="_blank" class="a_img" title="<s:property value="owner.nickName"/>"><img src="<s:property value="owner.pic"/>"/></a>
                    <a href="userBlog.html?user.id=<s:property value="owner.id"/>" target="_blank" class="a_title" title="<s:property value="owner.nickName"/>"><s:property value="owner.nickName"/></a>
                    <span><s:property value="title"/></span>
                    <span><s:date name="startTime" format="%{getText('dateformat')}"/></span>
                </li>
                </s:iterator>
            </ul>
        </div>
        <div class="highlight">
            <h3 class="h3_title">
                <s:property value="%{getText('gogowise.announce')}"/>
            </h3>
            <a href="announceRead.html?goGoWiseAnnounce.id=1" target="_blank" class="other_more"><s:property value="%{getText('others.more')}"/></a>
            <ul>
                <s:iterator value="goGoWiseAnnounces">
                <li><div class="dot"></div><a href="announceRead.html?goGoWiseAnnounce.id=<s:property value="id"/>" target="_blank" title="<s:property value="title"/>" class="goGoWiseAnnounce_newEvents"><s:property value="title"/></a></li>
                </s:iterator>
            </ul>
        </div>
    </div>
    <div class="room_tip2">
        <h3><span class="warm_tip"><s:property value="%{getText('org.warmtip')}"/>：</span><s:property value="%{getText('control.room.click.plus')}"/> <a href="downloadRemoteEye.html" target="_blank" class="submit_btn"> <s:property value="%{getText('control.room.ggw.remote.eye')}"/></a>
            <s:property value="%{getText('control.room.download.app')}"/></h3>
    </div>
</div>

<script language="JavaScript" type="text/javascript">
    var localSubStreams = [0,0,0];

    $(function(){
        $("#securityQuit").click(function(){
            for(var subID=0;subID<3;subID++){
                var state = localSubStreams[subID];
                if(state == 1){
                    getGirlOjbectById(subID).changeScreen();
                }
            }
            goUrl("myfirstPage.html");
        });
    });

     var initString = "<s:property value='initSeesionString' escape='false' />";
     function CreateRoom(id) {
         initString = initString.replace(/<SubID>\d<\/SubID>/,"<SubID>"+id+"</SubID>");
         getGirlOjbectById(id).CreateRoomComplete(initString,"");
     }

     <%-- 获得对应子频道的Flash，位置，子频道号分别为0、1、2 --%>
     function getGirlOjbectById(id){
        if ($.browser.msie) {
            return  document.getElementById("Girl"+id);
        } else {
            return  document.getElementById("GirlEmbed"+id);
        }
     }

     <%-- web service层更新子频道的状态，供Flash调用 --%>
     function SetMaster(UserID,SubID,state){
         if(state==1){
             localSubStreams[SubID] = 1;
             state=true;
         }else{
             localSubStreams[SubID] = 0;
             state=false;
         }
         $.post("updateSubChannelState.html",{'user.id':UserID,'subChannelNum':SubID,'subPrivateChannel.using':state});
     }

    function updateSubChannlSignal(userID,subChannelID){
           $.post("updateSubChannelSignal.html",{'user.id':userID,'subChannelNum':subChannelID});
     }

    <%-- 调用Flash的closeBrowser方法 --%>
    function CloseBrowser(SubID){
        getGirlOjbectById(SubID).closeBrowser();
        var userID = <s:property value="userPrivateChannel.user.id"/>;
        $.post("updateSubChannelState.html",{'user.id':userID,'subChannelNum':SubID,'subPrivateChannel.using':false});
    }

    <%-- 方法作废 --%>
    function InRoom(){
        getGirlOjbect().InRoomComplete("<s:property value='initSeesionString' escape='false' />", "");
    }
    <%-- 方法作废 --%>
    function addPLFinishTime(UserID,SubID){
        $.post("addPLFinishTime.html",{'user.id':UserID,'subChannelNum':SubID});
    }

    <%-- 方法作废 --%>
    function RecordStart(OnliveID){
        $.post("perOnliveRecordStart.html",{'personalOnlive.id':OnliveID});
    }

    <%-- 方法作废 --%>
    function  getNumOfRegAudience(onliveID,number){
       $.post("saveNumOfRegAudience.html",{'personalOnlive.id':onliveID,'personalOnlive.numOfRegAudience':number});
    }
    <%-- 方法作废 --%>
    function getNumOfAudience(onliveID,number){
       $.post("saveNumOfAudience.html",{'personalOnlive.id':onliveID,'personalOnlive.numOfAudience':number});
    }
</script>