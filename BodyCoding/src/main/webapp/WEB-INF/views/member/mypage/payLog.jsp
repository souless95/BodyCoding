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
			<td><fmt:formatDate value="${oList.order_date}" pattern="yyyy-MM-dd" /></td>
		</tr>	
	</c:forEach>
	</table>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>