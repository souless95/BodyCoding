<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
	<div class="container">
	<h1>정보등록을 위해 추가정보를 입력해주세요.</h1>
	    <form method="post" action="/kakaoregist.do">
			<input type="hidden" id="mem_id" name="mem_id" value="${UserEmail }">
			
	        <label for="mem_name">이름:</label>
	        <input type="text" id="mem_name" name="mem_name" required><br>
	
	        <label for="mem_phone">전화번호:</label>
	        <input type="tel" id="mem_phone" name="mem_phone" required><br>
	
	        <label for="mem_address">주소:</label>
	        <input type="text" id="mem_address" name="mem_address" required><br>
	        
	        <button type="submit">완료</button>
		</form>
	</div>
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>