<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<link type="text/css" href="css/googlemap/LiveMap.css" rel="stylesheet"/>
<script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script>
<%--<script src="js/map/InitialAndSearch.js" type="text/javascript"></script>--%>


<script  type="text/javascript">
     function initial() {
         var map = new BMap.Map("map_canvas");
         map.centerAndZoom("北京", 12);                   // 初始化地图,设置城市和地图级别。

         var ac = new BMap.Autocomplete(//建立一个自动完成的对象
                 {"input" : "suggestId"
                     ,"location" : map
                 });

         ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
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
             G("searchResultPanel").innerHTML = str;
         });

         var myValue;


         ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
             var _value = e.item.value;
             myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
             G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

             setPlace();
         });

         function setPlace() {
             map.clearOverlays();    //清除地图上所有覆盖物
             function myFun() {
                 var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                 map.centerAndZoom(pp, 18);
                 map.addOverlay(new BMap.Marker(pp));    //添加标注
             }

             var local = new BMap.LocalSearch(map, { //智能搜索
                 onSearchComplete: myFun
             });
             local.search(myValue);
         }
     }

     window.onload = initial;

 </script>
<div id="mapArea">
    <div class='searchDiv'>
        请输入要查询的地点名称<input id="address" type="text" value=""/>
        <input type="button" class="input" value=" 查 询 " id="go" onclick=""/>
    </div>
    <div id="map_canvas" style="width: 650px; height: 600px;"></div>
</div>


<div id="info_right">
    <p>相关直播信息</p>

    <div id="info_search">
        <input type="text" style="width:260px;height:25px;"/>
        <a href="" style="width:45px;;margin-left:10px;">查询</a>
    </div>
</div>

<!DOCTYPE html>
<html></html>