<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무엇을 검색 화면(지도)</title>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a200ee40df01a7833da263a65fbf093"></script>

 <style>
	 .lnb_items {
		width : 560px;
		height : 40px;
		display: inline-block;
		border : 1px solid #3d3d3d;
		}
	
		.lnb_item {
			width : 24.8%;
			height : 40px;
			border-right : 1px solid #3d3d3d;
			float : left;
			text-align:center;
		}
		.lnb_item:last-child { /* lnb 중에 마지막 요소 */
			border-right: 0;
		}
		.lnb_item a {
			width : 100%;
			height : 40px;
			color : #3d3d3d;
			text-align:center;
			line-height : 40px;
			vertical-align : middle;
		}

	 .area {
	    position: absolute;
	    background: #fff;
	    border: 1px solid #888;
	    border-radius: 3px;
	    font-size: 12px;
	    top: -5px;
	    left: 15px;
	    padding:2px;
	}
	
	.info {
	    font-size: 12px;
	    padding: 5px;
	}
	.info .title {
	    font-weight: bold;
	}

</style>

</head>
<body>
	<div class="doc_wrap">
			<div class="lnb_wrap">
			<ul class="lnb_items">
				<li class="lnb_item"><a href="main">검색</a></li>
				<li class="lnb_item"><a href="mypage_login">마이페이지</a></li>
				<li class="lnb_item"><a href="typelist?type=0">게시판</a></li>
				<li class="lnb_item"><a href="typelist?type=1">고객센터</a></li>
			</ul>
			</div>
		</div>
		
	        <c:choose>
	            <c:when test="${sessionScope.loginid eq  null}">
	               <button onclick="location.href='index'">로그인</button>
	            </c:when>
	            <c:otherwise>
	               <button onclick="location.href='logout'">로그아웃</button>
	            </c:otherwise>
	       </c:choose>
	<br>
	<div id="map" style="width:80%;height:500px;"></div>

</body>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption),
	    customOverlay = new kakao.maps.CustomOverlay({}),
	    infowindow = new kakao.maps.InfoWindow({removable: true});

	$.getJSON("resources/seoul.geojson", function(geojson){		
		var data = geojson.features;
		var coordinates = []; // 좌표 저장할 배열
		var name = '';          // 행정 구 이름
		
		$.each(data, function(index, val){
			coordinates = val.geometry.coordinates;
			name = val.properties.SIG_KOR_NM;
			
			displayArea(coordinates, name);
			});		
	});
	
	
	var polygons = []; //
	
	// 행정구역 폴리곤
	function displayArea(coordinates, name){	
		console.log(name);
		//console.log(coordinates);
		//console.log(coordinates[0][0][0][0]);
		//console.log(coordinates[0][0][0][1]);
		//... 왜 안될까...? 왜 안되지?
		var path = [];
		
		$.each(coordinates[0][0], function(index, coordinate){
			path.push(new kakao.maps.LatLng(coordinate[1],coordinate[0]));
			});
		//console.log("패스요: ", path);
		// 다각형을 생성 
		var polygon = new kakao.maps.Polygon({
			map : map,
			path : path,
			strokeWeight : 2,
			strokeColor : '#004c80',
			strokeOpacity : 0.8,
			fillColor : '#fff',
			fillOpacity : 0.7			
		});
		//console.log("폴리곤이요: ", polygon);
		polygons.push(polygon);
		//console.log("폴리곤스요: ", polygons);
		// 안나오나..?
		
		//--------------이벤트 관련------------------
		// 다각형에  mouseover 이벤트 등록, 발생시 폴리곤 채움색 변경
		// 지역명 표시 커스텀 오버레이 지도위에 표시		
		kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent){
			polygon.setOptions({
				fillColor : '#09f'
			});
			customOverlay.setContent('<div class="area">'+name+'</div>');
			customOverlay.setPosition(mouseEvent.latLng);
			customOverlay.setMap(map);				
		});
		
		//다각형에  mousemove 이벤트를 등록, 발생시 커스텀 오버레이 위치 변경
		kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent){
			customOverlay.setPosition(mouseEvent.latLng);
		});
		
		//mouseout  이벤트 등록하고 이벤트 발생시 채움색 원래색으로 변경, 커스텀 오버레이 지도에서 제거		
		kakao.maps.event.addListener(polygon, 'mouseout', function(){
			polygon.setOptions({
				fillColor : '#fff'
			});
			customOverlay.setContent('<div class="area">'+name+'</div>');
			customOverlay.setMap(null);
		});
		// 클릭시!! 헣...
		
	    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
	        var content = '<div class="info">' + 
	                    '   <div class="title">' + name + '</div>' +
	                    '   <div class="size">총 면적 : 약 ' + Math.floor(polygon.getArea()) + ' m<sup>2</sup></area>' +
	                    '</div>';

	        infowindow.setContent(content); 
	        infowindow.setPosition(mouseEvent.latLng); 
	        infowindow.setMap(map);
			console.log(name);
	        location.href="whatresult?region="+name;
	        
	    });
		
	}	
	
</script>


</html>