<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
<div class="container">
	<br>
	<div align="center">
		<div>
			<h2 style="color: red;'">결제실패</h2>
			<strong>${UserName }님</strong>, 결제 실패하였습니다.<br>
			결제를 다시 시도해 주세요.<br>
			<button class=".custom-btn" onclick="location.href='main'">홈으로 이동</button>&nbsp;&nbsp;
		</div>
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>