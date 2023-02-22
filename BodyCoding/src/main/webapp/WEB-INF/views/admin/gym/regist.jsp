<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>지점등록</h2>
	<form action="regist.do" method="post">
		<table border="1">
			<tr>
				<th>지점코드</th>
				<td><input type="text" name="gym_code" value="" /></td>
			</tr>
			<tr>
				<th>평수</th>
				<td><input type="text" name="gym_scale" value="" /></td>
			</tr>
			<tr>
				<th>헬스장 상세 이미지</th>
				<td><input type="text" name="gym_dtail_img" value="" /></td>
			</tr>
			<tr>
				<th>주차여부</th>
				<td><input type="text" name="facility_parking" value="" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>헬스가능여부</th>
				<td><input type="text" name="facility_health" value="" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>요가가능여부</th>
				<td><input type="text" name="facility_yoga" value="" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>GX가능여부</th>
				<td><input type="text" name="facility_gx" value="" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>필라테스 가능여부</th>
				<td><input type="text" name="facility_pilates" value="" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>PT 가능여부</th>
				<td><input type="text" name="facility_pt" value="" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>24시 운영여부</th>
				<td><input type="text" name="facility_24hour" value="" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>샤워장 제공여부</th>
				<td><input type="text" name="facility_shower" value="" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>운동복 제공여부</th>
				<td><input type="text" name="facility_wear" value="" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>라커 사용여부</th>
				<td><input type="text" name="facility_locker" value="" placeholder="Y 또는 N만 입력하세요" /></td>
			</tr>
			<tr>
				<th>운영시간 : 평일_시작</th>
				<td><input type="text" name="rtime_week_start" value="" /></td>
			</tr>
			<tr>
				<th>운영시간 : 평일_종료</th>
				<td><input type="text" name="rtime_week_end" value="" /></td>
			</tr>
			<tr>
				<th>운영시간 : 토요일_시작</th>
				<td><input type="text" name="rtime_sat_start" value="" /></td>
			</tr>
			<tr>
				<th>운영시간 : 토요일_종료</th>
				<td><input type="text" name="rtime_sat_end" value="" /></td>
			</tr>
			<tr>
				<th>운영시간 : 공휴일_시작</th>
				<td><input type="text" name="rtime_holy_start" value="" /></td>
			</tr>
			<tr>
				<th>운영시간 : 공휴일_종료</th>
				<td><input type="text" name="rtime_holy_end" value="" /></td>
			</tr>
		</table>
		<input type="submit" value="전송하기" />
	</form>
</body>
</html>