<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.button {
	background-color : white;
	border: 1.5px solid #37C0FB;
	width: 100px;
	border-radius: 6px;
	font-size: 16px;
}
.button:hover {
	background-color : #37C0FB;
	border: none;
	color: white;
}
</style>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
<div class="container">
	<br>
	<div align="center">
		<div>
			<h2 style="color: red;'">결제취소</h2>
			<strong>${UserName }님</strong>, 결제가 취소되었습니다.<br>
			<button class="button" onclick="location.href='main'">홈으로 이동</button>&nbsp;&nbsp;
		</div>
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>