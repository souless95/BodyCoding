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
			<td>주문일자</td>
			<td>주문명</td>
			<td>주문금액</td>
			<td>사용포인트</td>
			<td>최종주문금액</td>
			<td>적립포인트</td>
		</tr>	
		<tr>
			<td>${payLog.order_idx}</td>
			<td>${payLog.order_date}</td>
			<td>${payLog.order_name}</td>
			<td>${payLog.total_price}</td>
			<td>${payLog.use_point}</td>
			<td>${payLog.final_price}</td>
			<td>${payLog.save_point}</td>
		</tr>	
	</table>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>