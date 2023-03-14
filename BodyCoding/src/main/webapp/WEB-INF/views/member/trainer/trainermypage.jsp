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
<%@ include file="../../../../inc/Top.jsp" %>
<body>
	 <div class="container">
	 	<%@ include file ="../../../../inc/mypageside.jsp" %>
        <div id="layoutSidenav_content">
	        <div class="card mb-5" style="border-bottom: none;">
	        	<div class="card-header">
					<h2> ${UserName}님의 마이페이지 입니다.</h2>
	        	</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../../../../inc/Bottom.jsp" %>
</html>
