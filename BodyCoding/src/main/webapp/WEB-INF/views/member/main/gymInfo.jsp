<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp" %>
<h2>${memList.mem_name } 상세보기</h2>
<div><img id="img" src="static/uploads/gym/${memList.mem_img }" style="width:200px; height:200px;"></div>
<h4>기본정보</h4>
<table class="table" border=2>
	<tr>
		<th>지점명</th>
		<td>${memList.mem_name }</td>
		<th>지점코드</th>
		<td>${dto.gym_code }</td>
	</tr>
	<tr>
		<th>평수</th>
		<td>${dto.gym_scale }</td>
		<th>지점 전화번호</th>
		<td>${memList.mem_phone }</td>
	</tr>
	<tr>
		<th>지점 주소</th>
		<td>${memList.mem_address }</td>
	</tr>
</table>

<h4>편의시설</h4>
<table class="table" border=2>
	<tr align="center">
		<th><img src="../static/admin/images/0001.png"/></th>
		<th><img src="../static/admin/images/0004.png"></th>
		<th><img src="../static/admin/images/0005.png"></th>
		<th><img src="../static/admin/images/0007.png"></th>
		<th><img src="../static/admin/images/0010.png"></th>
		<th><img src="../static/admin/images/0011.png"></th>
		<th><img src="../static/admin/images/0014.png"></th>
		<th><img src="../static/admin/images/0017.png"></th>
		<th><img src="../static/admin/images/0018.png"></th>
		<th><img src="../static/admin/images/0020.png"></th>
	</tr>
	<tr align="center">
		<th>주차</th>
		<th>헬스</th>
		<th>요가</th>
		<th>GX</th>
		<th>필라테스</th>
		<th>PT</th>
		<th>24시간</th>
		<th>샤워장</th>
		<th>운동복</th>
		<th>락커</th>
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
<h4>운영시간</h4>
<table class="table" border=2>
	<tr align="center">
		<th colspan="2">평일</th>
		<th colspan="2">토요일</th>
		<th colspan="2">일요일, 공휴일</th>
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
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>