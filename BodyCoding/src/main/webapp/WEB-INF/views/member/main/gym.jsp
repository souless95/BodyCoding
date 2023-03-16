<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c796ac3987193df71da7fe2b18943f1&libraries=services,clusterer,drawing"></script>
<style type="text/css">

.info-title {
    display: block;
    background: #50627F;
    color: #fff;
    text-align: center;
    height: 24px;
    line-height:22px;
    border-radius:4px;
    padding:0px 10px;
}

input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 3px solid #707070;
	position: relative;
}

input[class="facility"]:checked+label::after {
	content: '✔';
	font-size: 20px;
	width: 20px;
	height: 20px;
	text-align: center;
	position: absolute;
	left: -2px;
	top: -8px;
}

#fac li {
	height: 30px;
	widows: 150px;
}
</style>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>

<script type="text/javascript">

 	function mapshow(id){
   	console.log($('#gym_code').val());
   	$.ajax({
      	type:'get',
      	url: '../gymMap.do',
      	data: {gym_code: $('#gym_code').val()},
      	contentType: " text/html;charset:utf-8",
      	dataType:"json",
      	success:sucMap,
      	error: errCallBack
   	});
} 
$(function() {
    $(".facility").click(function() {
      	let checkboxVal = $('#gymCheck').serialize();
      
      	console.log(checkboxVal);
      	$.ajax({
         	type:'get',
         	url: '../gymCheck.do',
         	data: {checkboxVal: checkboxVal},
         	contentType: "text/html;charset:utf-8",
         	dataType:"json",
         	success:sucCallBack,
         	error: errCallBack
      	});
   	}); 
   
   	//해당 버튼을 클릭하면 ajax() 함수를 선택한다.
   	$('#search').click(function() {
      	$.ajax({
         	type:'get',
         	url: '../gymSearch.do',
         	data: {searchWord: $('#searchWord').val()},
         	contentType: " text/html;charset:utf-8",
         	dataType:"json",
         	success:sucCallBack,
         	error: errCallBack
      	});
   	});
   
});
function sucCallBack(resData) {
   	//콜백데이터는 JSON형식으로 전달된다.
   	console.log(resData);
   	let tableData = "";
   	$(resData).each(function(index, data) {
      	tableData +=
      	"<li style='border-bottom: 1px solid gray; color: black;'><div>" +data.mem_name
      	+"<button style='float: right; width: 100px; height: 50px; margin: 10px;' onclick=\"location.href='gymInfo.do?gym_code="+data.gym_code +"'\">상세보기</button></div>"
      	+"<div>" +data.mem_address+ "</div>"
      	+"<div>" +data.mem_phone+ "</div></li>";
   }); 
   	//해당 엘리먼트에 새롭게 파싱된 내용으로 교체한다.
   	$('#show_data').html(tableData);
   	/* $('#searchWord').val(''); */
}
//에러발생시 호출되는 콜백 함수
function errCallBack(errData){
   	console.log(errData.status+":"+errData.statusText);
}
</script>

<!-- 지도관련 코드: 위치 고정되야 함(지도 시작) -->
<div class="container">
	<br>
	<h2 >지점 정보</h2>
	<div class="main_left" style="width: 65%; float: left;">
		<div id="map" style="width: 98%; height: 730px;"></div>
	</div>
	
<script type="text/javascript">
   	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
       	mapOption = { 
           	center: new kakao.maps.LatLng(37.5690886, 126.9846525), // 지도의 중심좌표
           	level: 3 // 지도의 확대 레벨
       	};
     
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     
    // HTML5의 geolocation으로 사용할 수 있는지 확인
    if (navigator.geolocation) {
         
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
             
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도
             
            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = ''; // 인포윈도우에 표시될 내용입니다
                
            //인포윈도우용 위치
            var infoPosition = new kakao.maps.LatLng(locPosition.getLat() + 0.0005, locPosition.getLng());
                
            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message, infoPosition);
            
        });
         
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
         
        var locPosition = new kakao.maps.LatLng(lat, lon),    
            message = 'geolocation을 사용할수 없어요..'
            
        displayMarker(locPosition, message);
    }
     
  	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message, infoPosition) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({  
            map: map, 
            position: locPosition
        }); 
         
        var iwContent = '<span class="info-title">현위치</span>', // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
 		/* var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        }); */
        
        var customOverlay = new kakao.maps.CustomOverlay({
            position: infoPosition,
            content: iwContent   
        });
        
        // 인포윈도우를 마커위에 표시합니다 
        /* infowindow.open(map, marker); */
       	customOverlay.setMap(map, marker);
         
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);      
    }    
     
     
     // 마커를 표시할 위치와 title 객체 배열입니다 
     var positions = [
        <c:forEach  items="${gymMarker }" var="row">
        {
            title: '${row.mem_name }', 
            latlng: new kakao.maps.LatLng(${row.gym_lat }, ${row.gym_lng })
        },
        </c:forEach>
    ];
     
     
     
     // 마커 이미지의 이미지 주소
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
         
    for (var i = 0; i < positions.length; i ++) {
         
        // 마커 이미지의 이미지 크기
        var imageSize = new kakao.maps.Size(24, 35); 
         
        // 마커 이미지를 생성  
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
         
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시
            image : markerImage // 마커 이미지 
        });
    }
    
</script>
<!-- 지도관련 코드: 위치 고정되야 함(지도 끝) -->

		

	<!-- 상세정보 체크박스 부분 -->
	<div class="main_right" style="width: 35%; float: left;">
		<div style="height: 300px;">
			<h5>&nbsp;상세정보</h5>
			<form name="gymCheck" id="gymCheck">
				<ul style="list-style-type: none; width: 50%; height: 50%; float: left;">
					<li><input type="checkbox" name="facility_health" value="Y"
						class="facility" id="facility_health"> <label
						for="facility_health"></label><img
						src="../static/admin/images/0004.png" width="30" height="30"
						align="absmiddle"> <span style="font-size: 15px;">헬스</span>
					</li>
					<li><input type="checkbox" name="facility_yoga" value="Y"
						class="facility" id="facility_yoga"> <label
						for="facility_yoga"></label> <img
						src="../static/admin/images/0005.png" width="30" height="30"
						align="absmiddle"> <span style="font-size: 15px;">요가</span>
					</li>
					<li><input type="checkbox" name="facility_gx" value="Y"
						class="facility" id="facility_gx"> <label
						for="facility_gx"></label> <img
						src="../static/admin/images/0007.png" width="30" height="30"
						align="absmiddle"> <span style="font-size: 15px;">G.X</span>
					</li>
					<li><input type="checkbox" name="facility_pilates" value="Y"
						class="facility" id="facility_pilates"> <label
						for="facility_pilates"></label> <img
						src="../static/admin/images/0010.png" width="30" height="30"
						align="absmiddle"> <span style="font-size: 15px;">필라테스
					</span></li>
					<li><input type="checkbox" name="facility_pt" value="Y"
						class="facility" id="facility_pt"> <label
						for="facility_pt"></label> <img
						src="../static/admin/images/0011.png" width="30" height="30"
						align="absmiddle"> <span style="font-size: 15px;">P.T</span>
					</li>
				</ul>
				<ul style="list-style-type: none; width: 50%; height: 50%; float: left; padding-left: 0;">
					<li><input type="checkbox" name="facility_parking" value="Y"
						class="facility" id="facility_parking"
						style="border: 1px solid black; width: 5px; height: 5px;">
						<label for="facility_parking"></label><img
						src="../static/admin/images/0001.png" width="30" height="30"
						align="absmiddle"> <span style="font-size: 15px;">주차</span>
					</li>
					<li><input type="checkbox" name=facility_24hour value="Y"
						class="facility" id="facility_24hour"> <label
						for="facility_24hour"></label> <img
						src="../static/admin/images/0014.png" width="30" height="30"
						align="absmiddle"> <span style="font-size: 15px;">24시간</span>
					</li>
					<li><input type="checkbox" name="facility_shower" value="Y"
						class="facility" id="facility_shower"> <label
						for="facility_shower"></label> <img
						src="../static/admin/images/0017.png" width="30" height="30"
						align="absmiddle"> <span style="font-size: 15px;">샤워시설</span>
					</li>
					<li><input type="checkbox" name="facility_wear" value="Y"
						class="facility" id="facility_wear"> <label
						for="facility_wear"></label> <img
						src="../static/admin/images/0018.png" width="30" height="30"
						align="absmiddle"> <span style="font-size: 15px;">운동복</span>
					</li>
					<li><input type="checkbox" name="facility_locker" value="Y"
						class="facility" id="facility_locker"> <label
						for="facility_locker"></label><img
						src="../static/admin/images/0020.png" width="30" height="30"
						align="absmiddle"> <span style="font-size: 15px;">락커</span>
					</li>
				</ul>
			</form>
		</div>
	</div>
	<!-- 검색 & 지점리스트 -->
	<div>
		<ul style="text-align: center;">
			<li>
				<input id="searchWord" type="text" placeholder="검색어 입력" style="width: 210px;"> 
				<input type="button" value="검색하기" id="search" style="margin-left: 35px; height: 35px;">
			</li>
		</ul>
	</div>
	<!-- 지점 리스트 나오는 부분 -->
	<div style="height: 330px; width: 420px; overflow: auto;">
		<ul style="list-style-type: none; padding-top: 10px;">
			<div id="show_data">
				<c:forEach items="${gymList }" var="row" varStatus="loop">
				<!-- <a href="#" style="color: black;"> -->
					<li style="border-bottom: 1px solid gray; color: black;">
						<div>
							${row.mem_name}
							<button style="float: right; width: 100px; height: 50px; margin: 10px;" onclick="location.href='gymInfo.do?gym_code=${row.gym_code }'">상세보기</button>
						</div>
						<div>${row.mem_address}</div>
						<div>${row.mem_phone}</div>
					</li>
				<!-- </a> -->
				</c:forEach>
			</div>
		</ul>
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>