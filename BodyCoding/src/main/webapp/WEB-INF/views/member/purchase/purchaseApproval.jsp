<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../../../../inc/Top.jsp"%>
<body>
<div class="container">
	<br>
	<div align="center">
		<div>
			<h2>결제완료</h2>
			<strong>${UserName }님</strong>, 결제가 완료되었습니다.<br>
			(+
			<strong style="color: #99DAEA;">
				<fmt:formatNumber value="${save_point }" pattern="###,###,###p" />
			</strong>
			적립)<br>
			<button class=".custom-btn" onclick="location.href='main'">홈으로 이동</button>&nbsp;&nbsp;
		</div>
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>