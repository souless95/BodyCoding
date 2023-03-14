<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../../../../inc/Top.jsp"%>
<body>
<div class="container">
<h2>결제완료</h2>
<strong>${mem_id }님</strong>, 결제가 완료되었습니다.<br>
(+<strong>${save_point }p</strong> 적립)<br>
<a type="button" href="main">홈으로 이동</a>&nbsp;&nbsp;
<!-- bottom -->
</div>
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>