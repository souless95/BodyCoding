<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
  .rv {
	display: inline-block;
	height: 40px;
	border-radius: 6px;
	border:none;
	font-size: 16px;
	line-height: 38px;
	color:white;
	background-color: #F9BF52;
  }
</style>
<script>
function reservating(lesson_name, lesson_idx, user_id, reservation_date){
	console.log(lesson_name);
	var reservating = confirm(lesson_name+" 일정을 예약하시겠습니까?");
	if(reservating){
		$.ajax({
			url: 'reservating.do',
			contentType: "application/json; charset=utf-8",
			data: {
				lesson_idx: lesson_idx,
				user_id: user_id,
				reservation_date: reservation_date
			},
			dataType: 'text',
			success: function(){
				alert('예약이 완료되었습니다.');
				location.href='reservated.do';
			},
			error: function(){}
		})
	}
}
</script>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
<div class="container">
	<div class="sub_container">
		<%@ include file="../../../../inc/mypageside.jsp"%>
		<br />
		<h2>수업 예약</h2>
		<hr style="border: 1px solid #01538D;">		
		<table
			style="width:80%; border-top: 1px solid #01538D; border-bottom: 1px solid #01538D; text-align: center;">
			<tbody>
				<tr style="color:white; background-color: #01538D;">
					<th width="15%"><strong>예약일</strong></th>
					<th width="15%" ><strong>예약시간</strong></th>
					<th width="15%"><strong>트레이너</strong></th>
					<th width="10%"><strong>분류</strong></th>
					<th width="15%"><strong>수업명</strong></th>
					<th width="15%"><strong>정원</strong></th>
					<th width="15%"><strong></strong></th>
				</tr>
				<c:if test="${not empty Schedule}">
				<c:forEach items="${Schedule}" var="s">
				<tr>
						<td>${s.lesson_day.substring(0, 10)}</td>
						<td>${s.lesson_start_time} - ${s.lesson_end_time}</td>
						<td>${s.trainer_name}</td>
						<td>${s.lesson_category}</td>
						<td>${s.lesson_name}</td>
						<td>${s.rcount} / ${s.lesson_capacity}</td>
						<td><button class="rv" id="${s.lesson_idx}">예약</button></td>
				</tr>
					<c:choose>
						<c:when test="${s.rcount eq s.lesson_capacity}">
					    	<script>
								var btn = document.getElementById('${s.lesson_idx}');
								btn.innerText="예약불가";
								btn.style.backgroundColor="gray";
								btn.onclick = null;
								btn.style.cursor="default";
							</script>
						</c:when>
						<c:otherwise>
					    	<script>
								var btn = document.getElementById('${s.lesson_idx}');
								btn.onclick = function(){
									console.log("dd");
									reservating('${s.lesson_name}','${s.lesson_idx}', '${user_id}', '${s.lesson_day.substring(0, 10)}');
								}
							</script>
						</c:otherwise>
					</c:choose>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	<c:if test="${empty Schedule}">
		현재 이용가능한 일정이 없습니다.
	</c:if>
	</div>
</div>
<%@ include file="../../../inc/Bottom.jsp" %>
</body>
</html>