<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>지점수정</h2>
	<form action="edit.do" method="post">
		<table border="1">
			<tr>
				<th>지점코드(수정불가)</th>
				<td><input type="text" name="GYM_CODE" value="${dto.GYM_CODE}" readonly /></td>
			</tr>
			<tr>
				<th>평수</th>
				<td><input type="text" name="GYM_SCALE" value="${dto.GYM_SCALE}" /></td>
			</tr>
			<tr>
				<th>헬스장 상세 이미지</th>
				<td><input type="text" name="GYM_DTAIL_IMG" value="${dto.GYM_DTAIL_IMG}" /></td>
			</tr>
			<tr>
				<th>주차여부</th>
				<td><input type="text" name="FACILITY_PARKING" value="${dto.FACILITY_PARKING}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>헬스가능여부</th>
				<td><input type="text" name="FACILITY_HEALTH" value="${dto.FACILITY_HEALTH}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>요가가능여부</th>
				<td><input type="text" name="FACILITY_YOGA" value="${dto.FACILITY_YOGA}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>GX가능여부</th>
				<td><input type="text" name="FACILITY_GX" value="${dto.FACILITY_GX}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>필라테스 가능여부</th>
				<td><input type="text" name="FACILITY_PILATES" value="${dto.FACILITY_PILATES}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>PT 가능여부</th>
				<td><input type="text" name="FACILITY_PT" value="${dto.FACILITY_PT}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>24시 운영여부</th>
				<td><input type="text" name="FACILITY_24HOUR" value="${dto.FACILITY_24HOUR}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>샤워장 제공여부</th>
				<td><input type="text" name="FACILITY_SHOWER" value="${dto.FACILITY_SHOWER}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>운동복 제공여부</th>
				<td><input type="text" name="FACILITY_WEAR" value="${dto.FACILITY_WEAR}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>라커 사용여부</th>
				<td><input type="text" name="FACILITY_LOCKER" value="${dto.FACILITY_LOCKER}" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>운영시간 : 평일_시작</th>
				<td><input type="text" name="RTIME_WEEK_START" value="${dto.RTIME_WEEK_START}" /></td>
			</tr>
			<tr>
				<th>운영시간 : 평일_종료</th>
				<td><input type="text" name="RTIME_WEEK_END" value="${dto.RTIME_WEEK_END}" /></td>
			</tr>
			<tr>
				<th>운영시간 : 토요일_시작</th>
				<td><input type="text" name="RTIME_SAT_START" value="${dto.RTIME_SAT_START}" /></td>
			</tr>
			<tr>
				<th>운영시간 : 토요일_종료</th>
				<td><input type="text" name="RTIME_SAT_END" value="${dto.RTIME_SAT_END}" /></td>
			</tr>
			<tr>
				<th>운영시간 : 공휴일_시작</th>
				<td><input type="text" name="RTIME_HOLY_START" value="${dto.RTIME_HOLY_START}" /></td>
			</tr>
			<tr>
				<th>운영시간 : 공휴일_종료</th>
				<td><input type="text" name="RTIME_HOLY_END" value="${dto.RTIME_HOLY_END}" /></td>
			</tr>
		</table>
		<input type="submit" value="전송하기" />
	</form>
</body>
</html>