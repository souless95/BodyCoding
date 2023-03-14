<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../../../inc/Top.jsp"%>
</head>
<body>
	
	<div id="container">
		<!-- side -->
		<%@ include file="../../../../inc/mypageside.jsp"%>

		<div id="layoutSidenav_content">
			<div id="layoutSidenav_content">
				<div class="card mb-4">
					<div class="card-header">
						<h2>운동기록 등록</h2>
					</div>
						
					<form method="post" action="/addexrecord.do">
						<div>
							<div>
								<label for="training_date">날짜 입력</label>
								<input type="text" class="form-control" id="training_date" name="training_date" required>
							</div>
							

							<div>
								<label for="user_id">회원아이디 입력</label>
								<input type="text" class="form-control" id="user_id" name="user_id" required>
							</div>
							
							<div>
								<label for="training_comment">비고 입력</label>
								<input type="text" class="form-control" id="training_comment" name="training_comment" required>
							</div>
							
							<div>
								<label for="trainer_id">담당 트레이너 입력</label>
								<input type="text" class="form-control" id="trainer_id" name="trainer_id" required>
							</div>
							
							<input type="submit" value="운동기록 등록">
							<button type="button" onclick="location.href='exrecord.do'">리스트</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- bottom -->
		<%@ include file="../../../../inc/Bottom.jsp"%>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../static/admin/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="../static/admin/js/datatables-simple-demo.js"></script>
</body>
</html>