<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" href="css/googlemap/LiveMap.css" rel="stylesheet"/>

<div id="mapArea">
    <div class='searchDiv'>
        请输入要查询的地点名称<input id="address" type="text" value=""/>
        <input type="button" class="input" value=" 查 询 " id="go" onclick="codeAddress('');"/>
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

<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false&libraries=places"></script>
<%--<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false&language=ja"> </script>--%>
<%--<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false&region=GB"> </script>--%>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false&libraries=geometry"></script>
<script type="text/javascript" src="js/map/toLatLng.js"></script>

<script type="text/javascript">
    var initialLocation;
    var newyork;
    var beijingLoc;
    var liveMap;
    var geocoder;

    $(function () {
        newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
        beijingLoc = new google.maps.LatLng(39.90403, 116.40752599999996);
        initialLocation = beijingLoc;
        geocoder = new google.maps.Geocoder();
        initialize();

        //标记正在进行的直播
        <s:iterator value="personalOnlives">
        var location = new google.maps.LatLng(<s:property value="personalOnlive.latitude"/>, <s:property value="longitude"/>);
        var title = <s:property value="personalOnlive.title"/>;
        alert(location, title);
        placeMarker(location, title);
        </s:iterator>
    });

    function initialize() {
        var myOptions = { //设置map的相关属性
            zoom: 12,        //设置地图的缩放级别
            center: initialLocation,
            mapTypeId: google.maps.MapTypeId.ROADMAP                  /*设置地图类型*/
        };

        //初始化map，传入两个参数，第一个是放置map的容器，第二个是其属性对象
        liveMap = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

//        getUserLocation();

//          google.maps.event.addListener(liveMap, 'click', function(event) {
//            placeMarker(event.latLng);
//          });

        new google.maps.places.Autocomplete($("#address"));
        enterPress($("#address"));
    }

    <%-- 在地图上放置标记 --%>
    function placeMarker(location, title) {
        var marker = new google.maps.Marker({ //通过Maker对象放置小气球
            position: location,             //小气球的坐标
            map: liveMap,
            title: title                   //小气球的提示信息
        });

//        liveMap.setCenter(location);
    }

    /* 获取用户的位置 */
    function getUserLocation() {
        var browserSupportFlag = false;
        var userLocation = null;

        //尝试W3C方案获取用户地理位置的方法
        if (navigator.geolocation) {
            browserSupportFlag = true;
            navigator.geolocation.getCurrentPosition(function (position) {
                userLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                alert(postion.address);
                liveMap.setCenter(userLocation);
            }, function () {
                handleNoGeolocation(browserSupportFlag);
            });
        }
        //尝试谷歌自带的获取用户地理位置的方法
        else if (google.gears) {
            browserSupportFlag = true;
            var geo = google.gears.factory.create('beta.geolocation');
            geo.getCurrentPosition(function (position) {
                userLocation = new google.maps.LatLng(position.latitude, position.longitude);
                liveMap.setCenter(userLocation);
            }, function () {
                handleNoGeolocation(browserSupportFlag);
            });
        }
        //如果浏览器不支持获取用户地理位置，弹出警告
        else {
            browserSupportFlag = false;
            handleNoGeolocation(browserSupportFlag);
        }
    }

    <%-- 无法自动获取用户位置时的处理 --%>
    function handleNoGeolocation(errorFlag) {
        if (errorFlag == true) {
            alert("获取用户位置失败！");
        } else {
            alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
        }
    }
</script>