
function codeAddress(address) {//解析地址
  var address = address || $("#address").val();
//  alert(address);
  if (/\s*^\-?\d+(\.\d+)?\s*\,\s*\-?\d+(\.\d+)?\s*$/.test(address)) {//如果是经纬度
    var latlng = parseLatLng(address);
    if (latlng == null) {
      $("#address").value = "";
    } else {

    }
  } else {//解析地理位置
    geocoder.geocode({ 'address': address},geo);
  }
}


function parseLatLng(value) {//格式化经纬度
	value.replace('/\s//g');
	var coords = value.split(',');
	var lat = parseFloat(coords[0]);
	var lng = parseFloat(coords[1]);
	if (isNaN(lat) || isNaN(lng)) {
	  return null;
	} else {
	  return new google.maps.LatLng(lat, lng);
	}
}


function geo(results, status) {//进行地理解析
    if (status == google.maps.GeocoderStatus.OK) {
      liveMap.setCenter(results[0].geometry.location);
      liveMap.setZoom(15);
      var marker = new google.maps.Marker({
          map: liveMap,
          title: '当前经纬度：'+results[0].geometry.location+' 可点击拖动',
          position: results[0].geometry.location,
          draggable: true
      });

      if (results[0].geometry.viewport) {

        var  boundsOverlay = new google.maps.Rectangle({
          'bounds': results[0].geometry.viewport,
          'strokeColor': '#01308d',
//          'strokeColor': '#ff0000',
          'strokeOpacity': 1.0,
          'strokeWeight': 2.0,
          'fillOpacity': 0.0
        });
        boundsOverlay.setMap(liveMap);
      }

      
      geocodePosition(results[0].geometry.location);
		  
		 
    } else {
      alert("Geocode was not successful for the following reason: " + status);
    }     
}



function enterPress(obj){//按下enter键
   $(obj).onkeyup = function(e) {
       if (!e) var e = window.event;
       if (e.keyCode != 13) return;
       $('#go').click();
   }
}
function geocodePosition(pos) {//改变经纬度时获取信息
  geocoder.geocode({
    latLng: pos
  }, function(responses) {
    if (responses && responses.length > 0) {
      updateMarkerAddress(responses[0].formatted_address);
    } else {
      updateMarkerAddress('地址不能正确解析');
    }
  });
}

//function $(id){
//  return document.getElementById(id);
//}



      