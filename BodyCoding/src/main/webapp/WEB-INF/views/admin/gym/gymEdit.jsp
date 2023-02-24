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
<style type="text/css">
.table-bordered{font-family: Verdana, Geneva, Tahoma, sans-serif;}
</style>
</head>
<<<<<<< HEAD
<body>
	<script>
		let fileSubmit = function(frm, num){
			if(num==1){
				frm.action="gymedit.do"
			}
			frm.submit();
=======
<body class="sb-nav-fixed">
<script>
	let fileSubmit = function(frm, gubun){
		else if(gubun==2){
			frm.action="gymedit.do"
>>>>>>> branch 'main' of https://github.com/souless95/BodyCoding.git
		}
<<<<<<< HEAD
	</script>
	<h2>지점수정</h2>
	<form method="post" enctype="multipart/form-data">
	<!-- <form action="gymedit.do" method="post" enctype="multipart/form-data"> -->
		<table border="1">
			<tr>
				<th>지점코드(수정불가)</th>
				<td><input type="text" name="gym_code" value="${dto.gym_code}" readonly /></td>
			</tr>
			<tr>
				<th>평수</th>
				<td><input type="text" name="gym_scale" value="${dto.gym_scale}" /></td>
			</tr>
			<tr>
				<th>주차여부</th>
				<td><input type="text" name="facility_parking" value="${dto.facility_parking}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>헬스가능여부</th>
				<td><input type="text" name="facility_health" value="${dto.facility_health}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>요가가능여부</th>
				<td><input type="text" name="facility_yoga" value="${dto.facility_yoga}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>GX가능여부</th>
				<td><input type="text" name="facility_gx" value="${dto.facility_gx}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>필라테스 가능여부</th>
				<td><input type="text" name="facility_pilates" value="${dto.facility_pilates}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>PT 가능여부</th>
				<td><input type="text" name="facility_pt" value="${dto.facility_pt}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>24시 운영여부</th>
				<td><input type="text" name="facility_24hour" value="${dto.facility_24hour}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>샤워장 제공여부</th>
				<td><input type="text" name="facility_shower" value="${dto.facility_shower}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>운동복 제공여부</th>
				<td><input type="text" name="facility_wear" value="${dto.facility_wear}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>라커 사용여부</th>
				<td><input type="text" name="facility_locker" value="${dto.facility_locker}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>운영시간 : 평일_시작</th>
				<td><input type="text" name="rtime_week_start" value="${dto.rtime_week_start}" /></td>
			</tr>
			<tr>
				<th>운영시간 : 평일_종료</th>
				<td><input type="text" name="rtime_week_end" value="${dto.rtime_week_end}" /></td>
			</tr>
			<tr>
				<th>운영시간 : 토요일_시작</th>
				<td><input type="text" name="rtime_sat_start" value="${dto.rtime_sat_start}" /></td>
			</tr>
			<tr>
				<th>운영시간 : 토요일_종료</th>
				<td><input type="text" name="rtime_sat_end" value="${dto.rtime_sat_end}" /></td>
			</tr>
			<tr>
				<th>운영시간 : 공휴일_시작</th>
				<td><input type="text" name="rtime_holy_start" value="${dto.rtime_holy_start}" /></td>
			</tr>
			<tr>
				<th>운영시간 : 공휴일_종료</th>
				<td><input type="text" name="rtime_holy_end" value="${dto.rtime_holy_end}" /></td>
			</tr>
			<!-- 다중파일 업로드 해보기 -->
			<tr>
				<th>헬스장 상세 이미지</th>
				<td><input multiple="multiple" type="file" name="gym_dtail_img"/></td>
			</tr>
		</table>
		<input type="submit" value="전송하기" onclick="fileSubmit(this.form, 1);"/>
	</form>
=======
		frm.submit();
	}
</script>
<!-- top메뉴  -->
<%@ include file ="../../admin/inc/top.jsp" %>
	
	<div id="layoutSidenav">
	<!-- side -->
    <%@ include file ="../../admin/inc/side.jsp" %>
        
        <div id="layoutSidenav_content">
	        <div class="card mb-5" style="border-bottom: none;">
	        <form method="post" enctype="multipart/form-data">
	        	<div class="card-header">
					<h2>${memList.mem_name } 수정 페이지</h2>
	        	</div>
				<div class="card-body" style="width: 80%">
					<h4>메인사진</h4>
					<c:forEach items="${fileMap }" var="file" varStatus="vs">
						<tr>
							<td><img src="uploads/${file.key }" width="200" 
									height="150" /></td>
							<td>${file.key }</td>
							<td>${file.value }Kb</td>
						</tr>
					</c:forEach>
					<%-- <div>${dto.gym_dtail_img }</div> --%>	
					<h4>기본정보</h4>
					<table class="table" border=2>
						<tr>
							<th>지점명</th>
							<td>${memList.mem_name }</td>
							<th>지점코드</th>
							<td><input type="text" name="gym_code" value="${dto.gym_code}" readonly style="width: 100px; border: none;"/></td>
						</tr>
						<tr>
							<th>평수</th>
							<td><input type="text" name="gym_scale" value="${dto.gym_scale}" style="width: 100px;"/></td>
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
							<th><img src="../static/admin/images/0002.png"/><img src="../static/admin/images/0001.png"/></th>
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
							<td><input type="text" name="facility_parking" value="${dto.facility_parking}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_health" value="${dto.facility_health}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_yoga" value="${dto.facility_yoga}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_gx" value="${dto.facility_gx}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_pilates" value="${dto.facility_pilates}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_pt" value="${dto.facility_pt}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_24hour" value="${dto.facility_24hour}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_shower" value="${dto.facility_shower}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_wear" value="${dto.facility_wear}" style="width: 100px;" placeholder="Y or N" /></td>
							<td><input type="text" name="facility_locker" value="${dto.facility_locker}" style="width: 100px;" placeholder="Y or N" /></td>
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
						<tr align="center">
							<td><input type="text" name="rtime_week_start" value="${dto.rtime_week_start}" style="width: 100px;"/></td>
							<td><input type="text" name="rtime_week_end" value="${dto.rtime_week_end}" style="width: 100px;"/></td>
							<td><input type="text" name="rtime_sat_start" value="${dto.rtime_sat_start}" style="width: 100px;"/></td>
							<td><input type="text" name="rtime_sat_end" value="${dto.rtime_sat_end}" style="width: 100px;"/></td>
							<td><input type="text" name="rtime_holy_start" value="${dto.rtime_holy_start}" style="width: 100px;"/></td>
							<td><input type="text" name="rtime_holy_end" value="${dto.rtime_holy_end}" style="width: 100px;"/></td>
						</tr>
					</table>
					<input type="submit" value="전송하기" onclick="fileSubmit(this.form, 2);"/>
				</div>
			</form>
			</div>
			<!-- bottom -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>		
	</div>
>>>>>>> branch 'main' of https://github.com/souless95/BodyCoding.git
</body>
</html>