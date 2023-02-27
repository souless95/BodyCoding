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
<%@ include file = "../inc/Top.jsp" %>
<body>
	 <div class="container">
	 	<%@ include file ="../../member/inc/mypageside.jsp" %>
        <div id="layoutSidenav_content">
	        <div class="card mb-5" style="border-bottom: none;">
	        	<div class="card-header">
					<h1>회원 탈퇴</h1>
					<hr>
					<h5>회원 정보 및 구매 내역 삭제</h5>
					<p>
					회원 탈퇴 즉시, 회원 정보는 모두 삭제되고 재가입시에도 복원되지 않습니다.
					이점 꼭 양지해 주시기 바랍니다.
					</p>
					<form method="post" action="/delete">
					<input type="hidden" name="mem_id" id="mem_id" value="${UserEmail }">
					<input type="submit" value="탈퇴하기">
					</form>
					
	        	</div>
			</div>
		</div>
	</div>
</body>
<%@ include file = "../inc/Bottom.jsp" %>	
</html>
