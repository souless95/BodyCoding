<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		
	</script>
	<!-- top메뉴  -->
	<%@ include file="../inc/Top.jsp"%>
	<div id="container">
		<!-- side -->
		<%@ include file="../inc/mypageside.jsp"%>

		<div id="layoutSidenav_content">
			<div id="layoutSidenav_content">
				<div class="card mb-4">
					<div class="card-header">
						<h2>운동기록</h2>
					</div>

					<form method="post" action="/exrecord.do">
						<div>
							<div>
								<label for="TRAINING_DATE">날짜 입력</label>
								<input type="text" class="form-control" id="TRAINING_DATE" name="TRAINING_DATE" required>
							</div>
							
							<!-- <div>
								<label for="membership_name">이용권 입력</label>
								<input type="text" class="form-control" id="membership_name" name="membership_name" required>
							</div> -->

							<div>
								<label for="TRAINER_ID">트레이너입력</label>
								<input type="text" class="form-control" id="TRAINER_ID" name="TRAINER_ID" required>
							</div>
							
							<div>
								<label for="trainer_id">유저아이디 입력</label>
								<input type="text" class="form-control" id="USER_ID" name="USER_ID" required>
							</div>
							
							
							<div>
								<label for="trainer_id">비고 입력</label>
								<input type="text" class="form-control" id="TRAINING_COMMENT" name="TRAINING_COMMENT" required>
							</div>
							<input type="submit" value="운동기록 등록">

						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- bottom -->
		<%@ include file="../inc/Bottom.jsp"%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../static/admin/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="../static/admin/js/datatables-simple-demo.js"></script>
</body>
</html>