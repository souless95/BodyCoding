<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.table-header {
  text-align: center;
  font-weight: bold;
  background-color: #F7F7F7;
  border-bottom: 1px solid #DDD;
  vertical-align:middle;
}
.custom-btn:after {
	clear: both;
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
			<div id="container">
				<!-- side -->
				<%@ include file="../../../../inc/mypageside.jsp"%>
				<div id="layoutSidenav_content">
					<div class="card mb-4">
						<div class="card-header"
							style="height: 75px; background-color: #01538D; color: white; vertical-align: middle;">
							<h2>운동기록 리스트</h2>
						</div>
						<div class="container" style="width: 100%;">
							<table
								style="width: 100%; height: 50px; border: 1px solid #D7D7D7; margin-top: 15px; border-collapse: separate; border-radius: 7px;">
								<tr style="height: 55px;">
									<th class="table-header">회원명</th>
									<th class="table-header">분류</th>
									<th class="table-header">일시</th>
									<th class="table-header">코멘트</th>
								</tr>
								<c:forEach items="${TlList }" var="row" varStatus="loop">
									<tr
										style="padding-top: 20px; padding-bottom: 20px; height: 50px;">
										<td style="text-align: center;">${row.mem_name}</td>
										<td style="text-align: center">${row.exercise_type }</td>
										<td style="text-align: center">${row.training_date }</td>
										<td style="text-align: center">
											<form action="editExrecord.do">
												<input type="hidden" name="training_log_idx" value="${row.training_log_idx }" /> 
												<input type="text" name="training_comment" class="cInput" value="${row.training_comment }" />
												<button type="submit" class="custom-btn btn-1" style="width:110px; height:40px; align-items: center; justify-content: center; margin-top: 5px; line-height: 10px;">저장</button>
											</form></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>