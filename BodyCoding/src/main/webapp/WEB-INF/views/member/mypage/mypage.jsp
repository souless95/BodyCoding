<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body{
	border: 1px;
}
</style>
</head>
<%@ include file="../../../../inc/Top.jsp" %>
<body>
	 <div class="container">
	 	<%@ include file ="../../../../inc/mypageside.jsp" %>
        <div id="layoutSidenav_content">
	        <div class="card mb-5" style="border-bottom: none;">
	        	<div class="card-header">
					<h2>등록된 지점</h2>
	        	</div>
				<div class="card-body" style="width: 80%">
					<h4>기본정보</h4>
					<table class="table" border=2>
						<tr>
							<th>지점명 :</th>
							<td>${basicListM.mem_name }</td>
						</tr>
						<tr>
							<th>평수 :</th>
							<td>${basicListG.gym_scale }</td>
							<th>지점 전화번호 :</th>
							<td>${basicListM.mem_phone }</td>
							<th>지점 주소 :</th>
							<td>${basicListM.mem_address }</td>
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
							<td>${basicListG.facility_parking }</td>
							<td>${basicListG.facility_health }</td>
							<td>${basicListG.facility_yoga }</td>
							<td>${basicListG.facility_gx }</td>
							<td>${basicListG.facility_pilates }</td>
							<td>${basicListG.facility_pt }</td>
							<td>${basicListG.facility_24hour }</td>
							<td>${basicListG.facility_shower }</td>
							<td>${basicListG.facility_wear }</td>
							<td>${basicListG.facility_locker }</td>
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
							<td align="center">${basicListG.rtime_week_start }</td>
							<td align="center">${basicListG.rtime_week_end}</td>
							<td align="center">${basicListG.rtime_sat_start }</td>
							<td align="center">${basicListG.rtime_sat_end }</td>
							<td align="center">${basicListG.rtime_holy_start }</td>
							<td align="center">${basicListG.rtime_holy_end }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../../../../inc/Bottom.jsp" %>
</html>
