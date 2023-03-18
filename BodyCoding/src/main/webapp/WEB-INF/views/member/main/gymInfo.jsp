<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
element.style {
    height: auto !important;
}
.contain {
    width: 1080px;
    margin: 0 auto;
    font-size: 20px;
}
.rec_view_top{
	border-top: 1px solid #ececec;
	padding-top: 60px;
	border-bottom: 1px solid #ececec;
	padding-bottom: 60px;
	height: 550px;
}
.rec_view_top .rec_view_img{
    padding-bottom: 60px;
    width: 490px;
}
.rec_view_top .rec_view_img > img {
    width: 100%;
}
.fl{
	float: left;
}
.fr{
	float: right;
}
.rec_view_top .rec_view_info{
	width: 555px;
}
.rec_view_info .rec_exp{
	padding: 35px 0;
	border-bottom:  1px solid #f6f6f6;
}
.rec_exp .prod_title{
    font-size: 30px;
    color: #383838;
    font-weight: 500;
    margin-top: -8px;
}
.rec_exp .s_title {
    font-size: 16px;
    color: #888;
    margin-top: 9px;
}
.rec_exp .text_box {
    font-size: 16px;
    color: #888;
    line-height: 20px;
    margin-top: 50px;
}
.rec_info .rec_mate {
    padding-top: 37px;
}
.rec_view_top .rec_view_img .like_btn {
    margin-top: 20px;
}
.rec_content {
    padding-top: 70px;
    padding-bottom: 60px;
    border-bottom: 1px solid #ececec;
}
.xans-board-commentwrite {
    margin: 30px 0 0;
    padding: 5px 20px 20px;
    border: 1px solid #e9e9e9;
    background-color: #fbfafa;
    color: #353535;
}
.garry_wrap {
    border: 1px solid #ddd;
    padding: 20px 50px;
    margin: 50px 0 0 0;
}
</style>
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
	  img.style.width = '300px';
	  img.style.height = '250px';

	  const span = document.createElement('span');
	  span.classList.add('preview-item');
	  span.innerHTML = '<span class="preview-image" style="float:left; padding:10px">' + img.outerHTML + '</span>&nbsp;&nbsp;';
	  previewContainer.appendChild(span);
	}
}
</script>
<body>
<%@ include file="../../../../inc/Top.jsp" %>
<div class="container">
<br>
	<div class="contain" style="height: auto !important;">
		<h2 style="text-align: center;">${memList.mem_name }</h2>
		<div class="rec_view_top">
			<div class="fl rec_view_img"> <!-- 사진위치 -->
				<img src="/static/uploads/gym/${memList.mem_img }">
			</div>
			<div class="fr rec_view_info">
				<div class="rec_exp">
					<h2 class="prod_title"> ${memList.mem_name }</h2>
					<p class="s_title"><h4>지점 전화번호</h4>${memList.mem_phone }</p>
					<p class="s_title"><h4>지점 주소 </h4> ${memList.mem_address }</p>
				</div>
			</div>
		</div>
		<div class="rec_content">
			<h3>편의시설</h3>
			<table style="width:100%; border-top: 1px solid #ececec; border-bottom: 1px solid #ececec;">
				<tr style="background-color:#fff; color: black; font-weight:bolder; text-align: center;">
					<td>주차</td>
					<td>헬스</td>
					<td>요가</td>
					<td>GX</td>
					<td>필라테스</td>
					<td>PT</td>
					<td>24H</td>
					<td>샤워</td>
					<td>운동복</td>
					<td>락커</td>
				</tr>
				<tr align="center">
					<td><img src="../static/admin/images/0001.png" ></td>
					<td><img src="../static/admin/images/0004.png"></td>
					<td><img src="../static/admin/images/0005.png"></td>
					<td><img src="../static/admin/images/0007.png"></td>
					<td><img src="../static/admin/images/0010.png"></td>
					<td><img src="../static/admin/images/0011.png"></td>
					<td><img src="../static/admin/images/0014.png"></td>
					<td><img src="../static/admin/images/0017.png"></td>
					<td><img src="../static/admin/images/0018.png"></td>
					<td><img src="../static/admin/images/0020.png"></td>
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
			<table style="width:100%; border-top: 1px solid #ececec; border-bottom: 1px solid #ececec;">
				<tr style="background-color:#ececec; color: black; font-weight:bolder; text-align: center;">
					<td colspan="2">평일</td>
					<td colspan="2">토요일</td>
					<td colspan="2">일요일, 공휴일</td>
				</tr>
				<tr style="width:100%; border-bottom: 1px solid #ececec;">
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
		</div>
		<div class="garry_wrap">
			<h3>Gallery</h3>
			<table>
				<tr>
					<td>
						<span id="previewContainer"></span>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>