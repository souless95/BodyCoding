<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../static/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<!-- top메뉴  -->
	<%@ include file ="../../admin/inc/top.jsp" %>
	
	<div id="layoutSidenav">
		<!-- side -->
        <%@ include file ="../../admin/inc/side.jsp" %>
        
        <div id="layoutSidenav_content">
            <main>
		        <div class="card mb-4">
		        	<div class="card-header">
						<h2 class="mt-4">지점상세보기</h2>
		        	</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
							<tr>
								<th>지점코드</th>
								<th>평수</th>
								<th>헬스장 상세 이미지</th>
								<th>주차여부</th>
								<th>헬스 가능여부</th>
								<th>요가 가능여부</th>
								<th>GX 가능여부</th>
								<th>필라테스 여부</th>
								<th>PT 가능여부</th>
								<th>24시간 운영 여부</th>
								<th>샤워장 제공여부</th>
								<th>운동복 제공여부</th>
								<th>라커 사용여부</th>
								<th>운영시간 : 평일_시작</th>
								<th>운영시간 : 평일_종료</th>
								<th>운영시간 : 토요일_시작</th>
								<th>운영시간 : 토요일_종료</th>
								<th>운영시간 : 공휴일_시작</th>
								<th>운영시간 : 공휴일_종료</th>
							</tr>
							</thead>
							<tbody>
								<tr>
									<td>${dto.gym_code }</td>
									<td>${dto.gym_scale }</td>
									<td>${dto.gym_dtail_img }</td>
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
									<td>${dto.rtime_week_start }</td>
									<td>${dto.rtime_week_end}</td>
									<td>${dto.rtime_sat_start }</td>
									<td>${dto.rtime_sat_end }</td>
									<td>${dto.rtime_holy_start }</td>
									<td>${dto.rtime_holy_end }</td>
									<td>
										<button type="button" class="btn btn-primary" onclick="location.href='gymedit.do?gym_code=${dto.gym_code }'">
											수정
										</button>
										<button type="button" class="btn btn-primary" onclick="location.href='gymdelete.do?gym_code=${dto.gym_code }'">
											삭제
										</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</main>
		</div>		
	</div>
</body>
</html>