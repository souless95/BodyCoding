<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
<div class="container">
	<div class="col-md-9 col-md-7 col-lg-5 mx-auto">
		<div class="card border-0 shadow rounded-3 my-5">
			<div class="card-body p-4 p-sm-5">
				<h2 class="card-title text-center mb-5 fw-light fs-5">추가정보 입력</h2>
				<form method="post" action="/kakaoregist.do">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="mem_name" name="mem_name" required>
						<label for="mem_name">이름</label>
					</div>
					<div class="form-floating mb-3">
					<input type="tel" class="form-control" id="mem_phone" name="mem_phone" required>
						<label for="mem_phone">전화번호</label>
					</div>
					<div class="form-floating mb-3">
					<input type="text" class="form-control" id="mem_address" name="mem_address" required>
						<label for="mem_phone">주소</label>
					</div>
	        		<button type="submit">완료</button>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>