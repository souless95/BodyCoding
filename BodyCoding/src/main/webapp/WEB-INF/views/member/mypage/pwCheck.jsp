<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
</head>
<%@ include file="../../../../inc/Top.jsp"%>
<div class="container">
	<div class="sub_container">
		<%@ include file="../../../../inc/mypageside.jsp"%>
		<br />
		<h2>비밀번호 확인</h2>
		<hr style="border: 1px solid #01538D;">
		본인 확인을 위해 비밀번호를 입력해 주세요.
		<form method="post" action="pwcheck">
			<input type="hidden" name="mem_id" value=${UserEmail }>
			<input type="password" name="mem_pass">
			<input type="submit" value="확인">
		</form>
    </div>
</div>
</body>
<%@ include file="../../../../inc/Bottom.jsp" %>
</html>
