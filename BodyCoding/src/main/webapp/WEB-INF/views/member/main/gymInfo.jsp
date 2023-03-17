<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="../static/assets/css/Info.css" />
<script type="text/javascript">
window.onload = function() {
	const previewContainer = document.querySelector('#previewContainer');
	
	var imageArray = '${ dto.gym_detail_img}';
	var fileNames = imageArray.split(","); 
	
	for (let i = 0; i < fileNames.length; i++) {
	  const fileName = fileNames[i];
	  const imageUrl = '/static/uploads/gym/' + fileName;

	  createImagePreview(imageUrl, fileName);
	}

	function createImagePreview(imageUrl, fileName) {
	  const img = document.createElement('img');
	  img.src = imageUrl;
	  img.alt = fileName;
	  img.style.width = '200px';

	  const span = document.createElement('span');
	  span.classList.add('preview-item');
	  span.innerHTML = '<span class="preview-image" style="float:left;">' + img.outerHTML + '</span>&nbsp;&nbsp;';
	  previewContainer.appendChild(span);
	}
}
</script>
<body>
<%@ include file="../../../../inc/Top.jsp" %>
<div class="container">
<!-- <style>
	.table td{
		border: 2px solid gray;
		width:150px;
	}
	.basic td{
		border:0;
		padding-bottom: 30px;
	}
	.Info{
		display: inline-block; 
		height: 360px; 
		position: relative;
		margin-left: 60px;
		position: relative;
		padding-top: 40px;
	}
</style> -->
<br>
	<h2>${memList.mem_name } 상세보기</h2>
	<img src="/static/uploads/gym/${memList.mem_img }" style="width: 250px; height: 300px; float: left;">
	<div class="Info">
		<table class="basic">
			<tr>
				<td><strong>지점명 : </strong> ${memList.mem_name }</td>  
			</tr>
			<tr>
				<td colspan="2"><strong>지점 전화번호 : </strong>${memList.mem_phone }</td>
			</tr>
			<tr>
				<td colspan="2"><strong>지점 주소 : </strong>${memList.mem_address }</td>
			</tr>
		</table>
	</div>
	
	<div div class="card-body" style="width: 90%">
		<h3>편의시설</h3>
		<table class="table" border=2 style="width:100%">
			<tr align="center">
				<td><img src="../static/admin/images/0001.png"/><br>주차</td>
				<td><img src="../static/admin/images/0004.png"><br>헬스</td>
				<td><img src="../static/admin/images/0005.png"><br>요가</td>
				<td><img src="../static/admin/images/0007.png"><br>GX</td>
				<td><img src="../static/admin/images/0010.png"><br>필라테스</td>
				<td><img src="../static/admin/images/0011.png"><br>PT</td>
				<td><img src="../static/admin/images/0014.png"><br>24시간</td>
				<td><img src="../static/admin/images/0017.png"><br>샤워장</td>
				<td><img src="../static/admin/images/0018.png"><br>운동복</td>
				<td><img src="../static/admin/images/0020.png"><br>락커</td>
			</tr>
			<tr align="center">
				<td>${dto.facility_parking }</td>
				<td>${dto.facility_health }</td>
				<td>${dto.facility_yoga }</td>
				<td>${dto.facility_gx }</td>
				<td>${dto.facility_pilates }</td>
				<td>${dto.facility_pt }</td>
				<td>${dto.facility_24hour }</td>
				<td>${dto.facility_shower }</td>
				<td>${dto.facility_wear }</td>
				<td>${dto.facility_locker }</td>
			</tr>
		</table>
		<h3>운영시간</h3>
		<table class="table" border=2 style="width:100%">
			<tr align="center">
				<td colspan="2">평일</td>
				<td colspan="2">토요일</td>
				<td colspan="2">일요일, 공휴일</td>
			</tr>
			<tr>
				<td width="10%" align="center">OPEN</td>
				<td width="10%" align="center">CLOSE</td>
				<td width="10%" align="center">OPEN</td>
				<td width="10%" align="center">CLOSE</td>
				<td width="10%" align="center">OPEN</td>
				<td width="10%" align="center">CLOSE</td>
			</tr>
			<tr>
				<td align="center">${dto.rtime_week_start }</td>
				<td align="center">${dto.rtime_week_end}</td>
				<td align="center">${dto.rtime_sat_start }</td>
				<td align="center">${dto.rtime_sat_end }</td>
				<td align="center">${dto.rtime_holy_start }</td>
				<td align="center">${dto.rtime_holy_end }</td>
			</tr>
		</table>
		<h3>지점 사진</h3>
		<table class="table" border=2 style="width:100%;">
			<tr>
				<td style="width: 100%; border: none;">
					<span id="previewContainer" style="padding:10px;"></span>
				</td>
			</tr>
		</table>
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>