<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file ="../../../../inc/Top.jsp" %>
<div class="container">
	<%@ include file ="../../../../inc/mypageside.jsp" %>
	<table>
		<tr>
			<td>주문번호</td>
			<td>주문명</td>
			<td>주문상태</td>
			<td>주문일자</td>
		</tr>		
	<c:forEach items="${oList}" var="oList">
		<tr>
			<td><a href="payLogDetail.do?order_idx=${oList.order_idx}">${oList.order_idx}</a></td>
			<td>${oList.order_name}</td>
			<td>${oList.order_status}</td>
			<td>${oList.order_date}</td>
		</tr>	
	</c:forEach>
	</table>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>