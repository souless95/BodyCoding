<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
	<h2>지점리스트</h2>
	<table class="table" border="3">
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
			<th>주차여부</th>
		</tr>

		<c:forEach items="${gymList }" var="row" varStatus="loop">
		<tr>
			<td>${row.GYM_CODE }</td>
			<td>${row.GYM_SCALE }</td>
			<td>${row.GYM_DTAIL_IMG }</td>
			<td>${row.FACILITY_PARKING }</td>
			<td>${row.FACILITY_HEALTH }</td>
			<td>${row.FACILITY_YOGA }</td>
			<td>${row.FACILITY_YOGA }</td>
			<td>${row.FACILITY_GX }</td>
			<td>${row.FACILITY_PILATES }</td>
			<td>${row.FACILITY_PT }</td>
			<td>${row.FACILITY_24HOUR }</td>
			<td>${row.FACILITY_SHOWER }</td>
			<td>${row.FACILITY_WEAR }</td>
			<td>${row.FACILITY_LOCKER }</td>
			<td>${row.RTIME_WEEK_START }</td>
			<td>${row.RTIME_WEEK_END }</td>
			<td>${row.RTIME_SAT_START }</td>
			<td>${row.RTIME_SAT_END }</td>
			<td>${row.RTIME_HOLY_START }</td>
			<td>${row.RTIME_HOLY_END }</td>
			ㄴㅇㄴㅇ
		</tr>
		</c:forEach>
	</table>
	<button type="button" class="btn btn-success" 
 		onclick="location.href='regist.do'">
 			지점등록
 	</button>
	<button type="button" class="btn btn-danger" 
		onclick="location.href='trainerList.do'">
			트레이너 관리
	</button>
	<button type="button" class="btn btn-primary" 
		onclick="location.href='edit.do?idx=${row.idx }'">
			수정
	</button>
	<button type="button" class="btn btn-primary" 
		onclick="location.href='delete.do?idx=${row.idx }'">
			삭제
	</button>
</div>
</body>
</html>