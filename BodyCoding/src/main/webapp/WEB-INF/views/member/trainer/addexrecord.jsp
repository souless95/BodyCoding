<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
<script>
	function submitForm(frm) {
		comsole.log(frm);
		var comment = frm.elements["training_comment"].value;
		;
		console.log(comment);
		if (comment.trim() == "") {
			alert("코멘트를 작성해주세요.")
			return false;
		}
		frm.submit();
	}
</script>
<style>
body {
	border: 1px;
}

.table-header {
	text-align: center;
	font-weight: bold;
	background-color: #F7F7F7;
	border-bottom: 1px solid #DDD;
	vertical-align: middle;
}
.custom-btn:after {
	clear: both;
}
.btn_custom { 
	align-items: center; 
	justify-content: center; 
	margin-top: 5px; 
	margin-right:5px; 
	line-height: 10px; 
}
.cInput {
	float: left; 
	width: 70%; 
	height:40px;
	margin-top: 5px; 
	margin-right: 5px; 
	border-radius: 10px; 
	border: 1px solid gray; 
	font-size: 16px;
}
</style>
</head>
<body>
	<%@ include file="../../../../inc/Top.jsp"%>
	<div class="container">
		<div class="sub_container">
			<!-- side -->
			<%@ include file="../../../../inc/mypageside.jsp"%>
			<br />
			<div id="layoutSidenav_content">
				<div class="card mb-4" style="width: 83%;">
					<div class="card-header"
						style="color: white; height: 75px; background-color: #01538D; vertical-align: middle;">
						<c:choose>
							<c:when test="${empty lists}">
									작성할 수 있는 기록이 없습니다.
								</c:when>
							<c:otherwise>
								<h3>
									<c:if test="${not empty user_name}">${user_name} </c:if>
									회원 운동기록 작성
								</h3>
					</div>
					<div class="container" style="width: 100%;">
						<table
							style="width: 100%; height: 50px; border: 1px solid #D7D7D7; margin-top: 15px; border-collapse: separate; border-radius: 7px;">
							<tr style="height: 55px;">
								<th class="table-header" style="width: 10%;">성명</th>
								<th class="table-header" style="width: 10%;">분류</th>
								<th class="table-header" style="width: 20%;">일시</th>
								<th class="table-header" style="width: 40%;">코멘트</th>
								<th class="table-header" style="width: 20%;"></th>
							</tr>
							<c:forEach items="${lists}" var="l">
								<tr
									style="padding-top: 20px; padding-bottom: 20px; height: 50px;">
									<c:if test="${not empty user_name}">
										<td style="text-align: center;">${l.mem_name }</td>
									</c:if>
									<td style="text-align: center">${l.exercise_type }</td>
									<td style="text-align: center">${l.training_date.substring(0,10) }
										${l.lesson_start_time }</td>
									<td style="text-align: center"><input type="text" style="width: 100%;"
										name="training_comment" value="" class="cInput" /></td>
									<td style="text-align: center">
										<form action="addexrecord.do?mem_id=${l.user_id}"
											method="POST">
											<input type="hidden" name="trainer_id"
												value="${l.trainer_id }" /> <input type="hidden"
												name="exercise_type" value="${l.exercise_type }" /> <input
												type="hidden" name="user_id" value="${l.user_id }" /> <input
												type="hidden" name="training_date"
												value="${l.training_date.substring(0,10) } ${l.lesson_start_time }" />
											<input type="hidden" name="reservation_idx"
												value="${l.reservation_idx}" />
											<button type="button" onclick="submitForm(this.form)" class="custom-btn btn_custom" style="width:80px; 	height:40px;">저장</button>
											<button type="reset" class="custom-btn btn_custom" style="width:80px; height:40px;">취소</button>
										</form>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>