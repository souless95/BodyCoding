<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	$(document).ready(function() {
		$('button[type="button"]').on('click', function() {
			var lessonIdx = $(this).data('lessonidx');
			console.log(lessonIdx);
			var deletetion = confirm(" 일정을 취소하시겠습니까?");
			if (deletetion) {
				$.ajax({
					url : "reservatedDeletion.do",
					contentType : "application/json; charset=utf-8",
					data : {
						lesson_idx : lessonIdx,
						user_id : '${user_id}'
					},
					dataType : 'text',
					success : function() {
						$('#'+lessonIdx).remove();
						alert('예약이 취소되었습니다.');
					},
					error : function() {
						alert('예약 취소에 실패했습니다.');
					}
				})
				
			}
		});
	});
</script>
<style type="text/css">
  .cancelO {
	display: inline-block;
	height: 40px;
	border-radius: 6px;
	border:none;
	font-size: 16px;
	line-height: 38px;
	color:white;
	background-color: #E83838;
  }
  .cancelX {
	display: inline-block;
	height: 40px;
	border-radius: 6px;
	border:none;
	font-size: 16px;
	line-height: 38px;
	color:black;
	background-color: gray;
  }
</style>
</head>
<body>
	<%@ include file="../../../../inc/Top.jsp"%>
	<div class="container">
		<div class="sub_container">
			<%@ include file="../../../../inc/mypageside.jsp"%>
			<br />
			<h2>예약된 일정</h2>
			<hr style="border: 1px solid #01538D;">
			<table
				style="width: 80%; border-top: 1px solid #01538D; border-bottom: 1px solid #01538D; text-align: center;">
				<tbody>
					<tr style="color: white; background-color: #01538D;">
						<th width="15%"><strong>예약일</strong></th>
						<th width="15%"><strong>예약시간</strong></th>
						<th width="15%"><strong>트레이너</strong></th>
						<th width="10%"><strong>분류</strong></th>
						<th width="15%"><strong>수업명</strong></th>
						<th width="15%"><strong>정원</strong></th>
						<th width="15%"><strong></strong></th>
					</tr>
					<c:if test="${not empty myR}">
						<c:forEach items="${myR}" var="s">
							<tr id="${s.lesson_idx}">
								<td>${s.lesson_day.substring(0, 10)}</td>
								<td>${s.lesson_start_time}-${s.lesson_end_time}</td>
								<td>${s.trainer_name}</td>
								<td>${s.lesson_category}</td>
								<td>${s.lesson_name}</td>
								<td>${s.rcount}/${s.lesson_capacity}</td>
								<td><c:set var="now" value="<%=new java.util.Date()%>" />
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"
										var="formattedNow" /> <c:if
										test="${s.lesson_day.substring(0, 10) ne formattedNow}">
										<!-- 예약 당일이 아닌 경우에 출력할 내용 -->
										<button type="button" class="cancelO"
											data-lessonidx='${s.lesson_idx}'
											>예약 취소</button>
									</c:if> <c:if test="${s.lesson_day.substring(0, 10) eq formattedNow}">
										<button type="button" class="cancelX"
											data-lessonidx='${s.lesson_idx}'
											>취소 불가</button>
									</c:if></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty myR}">
						현재 예약된 일정이 없습니다.
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="../../../inc/Bottom.jsp"%>
</body>
</html>