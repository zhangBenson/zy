<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<link type="text/css" href="css/map/mapBody.css" rel="stylesheet"/>

<div id="tools">
    <div class="tools_l" id="citytools">
        <div id="selCity">
            <div class="sel_container">
                <a href="javascript:void(0)" id="curCity" class="curcity-expand" title="<s:property value="%{getText('map.selCity.param1')}"/>" onclick="selectCity(this, {styleSwitch:true});return false">长沙市</a>
            </div>
            <font id="GR_Select" style="display:none">
                <a id="GR_SelectCity" class="curcity-expand" href="javascript:void(0)" onclick="Instance('TANGRAM__t').showGRPop(this, 0);return false;">选择城区</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a id="GR_SelectArea" class="curcity-expand" href="javascript:void(0)" onclick="Instance('TANGRAM__t').showGRPop(this, 1)" style="visibility:hidden">选择地段</a>
            </font>
            <font id="supBus"> </font>
        </div>
        <div id="tools_search" style="display:none;">
            <form onsubmit="toolbarSubmit();return false" name="tsform">
                <div class="tstext">
                    <input maxlength="256" id="ToolPoiSearch" autocomplete="off" class="tools_search_input" type="text">
                </div>
                <div class="tsbutton"><input value="<s:property value="%{getText('map.selCity.param3')}"/>" onmouseover="this.className='tools_search_submit tools_search_submit_over'"
                                             onmouseout="this.className='tools_search_submit'"
                                             onmousedown="this.className='tools_search_submit tools_search_submit_down'"
                                             onclick="toolbarSubmit()" class="tools_search_submit" type="button">
                </div>
            </form>
        </div>
    </div>
    <div id="tool_container" class="tools_r">
        <div class="tools_r_con" id="tool_container_con">
            <div class="span_l pano_icon" id="tool_pano_share"><span class="span_r"><b></b>实景分享</span></div>
            <div class="span_l sehinv_icon" id="tool_sehInView"><span class="span_r"><b></b>视野内搜索</span></div>
            <div class="span_l traf_icon" id="tool_tarffic"><span class="span_r"><b></b>路况信息</span></div>
            <div class="span_l tool_icon" id="tool_tollCon"><span class="span_r"><b
                    class="tool_icon2"></b><span>工具</span><b class="tool_icon1"></b></span>

                <div class="tool_box" id="tools_box" style="top:-2000px;"><span class="measure"
                                                                                id="measure"><b></b>测距</span><span
                        class="capwrap" id="capwrap"><b></b>截图</span><span class="signwrap"
                                                                           id="signwrap"><b></b>标记</span><span
                        class="link" id="link"><b></b>分享</span><a class="print" id="print" target="Print"><b></b>打印</a>
                </div>
            </div>
            <div class="span_l full_icon" id="tool_fullScr"><span class="span_r"><b></b><span
                    id="tool_fullScrF">全屏</span></span></div>
        </div>
    </div>
    <div id="MapInfoNav" class="tools_r">
        <div class="l-tools">
            <a id="btn_home" href="liveBMap2.html"><span><s:property value="%{getText('map.body.param1')}"/></span></a>
            <a id="favBtn" href="javascript:void(0)"><span><s:property value="%{getText('map.body.param2')}"/></span></a>
        </div>
    </div>
</div>

<div id="wrapper">
    <div id="MapHolder">

    </div>
    <!-- 实景图容器 begin-->
    <div id="PanoramaHolder">

    </div>
    <!-- 实景图容器 end-->

    <div id="MapInfoCon">
        <div class="infoWrap" onclick="moveCenterTo(markers,infoWindows,0,<s:property value="personalOnlive.latitude"/>,<s:property value="personalOnlive.longitude"/>)">
            <div class="infoLeft">
                <a class="bubbleA"></a>
            </div>
            <div class="infoMid">
                <h3><s:property value="personalOnlive.title"/></h3>
                <ul>
                    <li><s:property value="personalOnlive.address"/></li>
                    <li><s:property value="personalOnlive.announcement"/></li>
                </ul>
                <a href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="personalOnlive.id"/>" class="submit_btn" target="_blank"><s:property value="%{getText('click.to.watch')}"/></a>
            </div>
            <div class="infoRight">
                <a href="userBlog.html?user.id=<s:property value="personalOnlive.owner.id"/>"  target="_blank" title="<s:property value="personalOnlive.owner.nickName"/>"><img src="<s:property value="personalOnlive.owner.pic"/>" alt="<s:property value="personalOnlive.owner.nickName"/>" /></a>
            </div>
        </div>
        <p><s:property value="%{getText('map.body.param6')}"/></p>
        <s:iterator value="personalOnlives" id="perO" status="idx">
            <div class="infoWrap" onclick="moveCenterTo(markers,infoWindows,<s:property value="#idx.Index + 1"/>,<s:property value="#perO.latitude"/>,<s:property value="#perO.longitude"/>)">
                <div class="infoLeft">
                    <a class="bubbleA" style="background-position:-<s:property value="(#idx.Index+1)*24"/>px -198px;"></a>
                </div>
                <div class="infoMid">
                    <h3><s:property value="#perO.title"/></h3>
                    <ul>
                        <li><s:property value="#perO.address"/></li>
                        <li><s:property value="#perO.announcement"/></li>
                    </ul>
                    <a href="watchPersonalOnlive.html?personalOnlive.id=<s:property value="id"/>" class="submit_btn" target="_blank"><s:property value="%{getText('click.to.watch')}"/></a>
                </div>
                <div class="infoRight">
                    <a href="userBlog.html?user.id=<s:property value="#perO.owner.id"/>"  target="_blank" title="<s:property value="#perO.owner.nickName"/>"><img src="<s:property value="#perO.owner.pic"/>" alt="<s:property value="#perO.owner.nickName"/>" /></a>
                </div>
            </div>
        </s:iterator>
    </div>
</div>


<script type="text/javascript">
    var docHeight = 0.0,docWidth=0.0;
    var localSearch;
    var bMap;
    var markers = new Array();
    var infoWindows = new Array();
    $(document).ready(function(){
        <%-- 使地图始终充满整个窗口 --%>
        docHeight = $(document.body).innerHeight();
        docWidth = $(document.body).innerWidth();
        $("#MapInfoCon").height(docHeight-88);
        $("#MapHolder").height(docHeight-88);
        $("#MapHolder").width(docWidth - 351);
        $(window).resize(function(){
            docHeight = $(document.body).innerHeight();
            docWidth = $(document.body).innerWidth();
            $("#MapInfoCon").height(docHeight-88);
            $("#MapHolder").height(docHeight-88);
            $("#MapHolder").width(docWidth - 351);
        });

        bMap = new BMap.Map("MapHolder");

        <%-- 将被查看直播置于地图中间--%>
        var mapCenter = new BMap.Point(<s:property value="personalOnlive.longitude"/>,<s:property value="personalOnlive.latitude"/>);
        bMap.centerAndZoom(mapCenter, 12);                   // 初始化地图,设置城市和地图级别。

        <%-- 为搜索栏添加下拉提示 --%>
        var acmp = new BMap.Autocomplete({//建立一个自动完成的对象
                "input" : "liveSearchInput",
                "location" : bMap
         });

         acmp.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
             var str = "";
             var _value = e.fromitem.value;
             var value = "";
             if (e.fromitem.index > -1) {
                 value = _value.province + _value.city + _value.district + _value.street + _value.business;
             }
             str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

             value = "";
             if (e.toitem.index > -1) {
                 _value = e.toitem.value;
                 value = _value.province + _value.city + _value.district + _value.street + _value.business;
             }
             str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
//             $("#MapInfoCon").html(str);
         });

        <%-- 添加本地搜索 --%>
        localSearch = new BMap.LocalSearch(bMap, {
          renderOptions:{map: bMap}
        });

        <%-- 添加控件 --%>
        bMap.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
        bMap.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP],anchor: BMAP_ANCHOR_TOP_RIGHT}));    //右上角 .地图类型控件

        <%-- 在地图上标注出所有正在进行的直播 --%>
        var marker,sContent,infoWindow,perLat,perLng,livePoint,markerIcon;

            <%-- 标注被查看的直播  --%>
            perLat = <s:property value="personalOnlive.latitude"/>;
            perLng = <s:property value="personalOnlive.longitude"/>;
            livePoint = new BMap.Point(perLng,perLat);
//            if(!bMap.getBounds().contains(livePoint)) continue;

            markerIcon = new BMap.Icon("images/map/markers_new_wn5i2b.png", new BMap.Size(24,29));
            markerIcon.setImageOffset(new BMap.Size(0,-198));
            var marker<s:property value="personalOnlive.id"/> = new BMap.Marker(livePoint,{icon:markerIcon});    // 创建标注
            sContent =
                "<a href='userBlog.html?user.id=<s:property value="personalOnlive.owner.id"/>''  target='_blank'><img style='float:right;margin:14px 4px 4px 4px' src='<s:property value="personalOnlive.owner.pic"/>' width='70' height='70' title='<s:property value="%{getText('map.body.param7',{personalOnlive.owner.nickName})}"/>'/></a>" +
                "<p style='margin:0;line-height:1.5;font-size:13px;'><s:property value="personalOnlive.title"/></p>" +
                "<p style='margin:0;line-height:1.5;font-size:12px;'><s:property value="personalOnlive.announcement"/></p>" +
                "<p style='margin:0;line-height:1.5;font-size:12px;'><s:property value="%{getText('map.body.param5')}"/><s:property value="personalOnlive.address"/></p>" +
                "<a href='watchPersonalOnlive.html?personalOnlive.id=<s:property value="personalOnlive.id"/>'' class='submit_btn' style='margin-top:3px;line-height:16px;' target='_blank'><s:property value="%{getText('click.to.watch')}"/></a>" +
                "</div>";
            var infoWindow<s:property value="personalOnlive.id"/> = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
            bMap.addOverlay(marker<s:property value="personalOnlive.id"/>);
            marker<s:property value="personalOnlive.id"/>.addEventListener("click", function(){
               this.openInfoWindow(infoWindow<s:property value="personalOnlive.id"/>);
            });
            marker<s:property value="personalOnlive.id"/>.openInfoWindow(infoWindow<s:property value="personalOnlive.id"/>);
            markers.push(marker<s:property value="personalOnlive.id"/>);
            infoWindows.push(infoWindow<s:property value="personalOnlive.id"/>);
        <s:iterator value="personalOnlives"  status="idx">
            perLat = <s:property value="latitude"/>;
            perLng = <s:property value="longitude"/>;
            livePoint = new BMap.Point(perLng,perLat);
//            if(!bMap.getBounds().contains(livePoint)) continue;

            markerIcon = new BMap.Icon("images/map/markers_new_wn5i2b.png", new BMap.Size(24,29));
            markerIcon.setImageOffset(new BMap.Size(-<s:property value="(#idx.Index+1)*24"/>,-198));
            var marker<s:property value="id"/> = new BMap.Marker(livePoint,{icon:markerIcon});    // 创建标注
            sContent =
                "<a href='userBlog.html?user.id=<s:property value="owner.id"/>''  target='_blank'><img style='float:right;margin:14px 4px 4px 4px' src='<s:property value="owner.pic"/>' width='70' height='70' title='<s:property value="%{getText('map.body.param7',{owner.nickName})}"/>'/></a>" +
                "<p style='margin:0;line-height:1.5;font-size:13px;'><s:property value="title"/></p>" +
                "<p style='margin:0;line-height:1.5;font-size:12px;'><s:property value="announcement"/></p>" +
                "<p style='margin:0;line-height:1.5;font-size:12px;'><s:property value="%{getText('map.body.param5')}"/><s:property value="address"/></p>" +
                "<a href='watchPersonalOnlive.html?personalOnlive.id=<s:property value="id"/>'' class='submit_btn' style='margin-top:3px;line-height:16px;' target='_blank'><s:property value="%{getText('click.to.watch')}"/></a>" +
                "</div>";
            var infoWindow<s:property value="id"/> = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
            bMap.addOverlay(marker<s:property value="id"/>);
            marker<s:property value="id"/>.addEventListener("click", function(){
               this.openInfoWindow(infoWindow<s:property value="id"/>);
            });
            markers.push(marker<s:property value="id"/>);
            infoWindows.push(infoWindow<s:property value="id"/>);
        </s:iterator>
    });
</script>
<script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script>