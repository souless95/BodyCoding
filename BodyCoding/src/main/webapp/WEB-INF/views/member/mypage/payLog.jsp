<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../../../../inc/Top.jsp"%>
	<div class="container">
		<%@ include file="../../../../inc/mypageside.jsp"%>
			<br />
	<h3>결제 내역</h3>
		<div>
		<table
			style="width: 80%; border-top: 1px solid #99DAEA; border-bottom: 1px solid #99DAEA;">
			<tbody>
				<tr style="background-color: #99DAEA;">
					<th width="20%"><strong>주문번호</strong></th>
					<th width="50%"><strong>주문명</strong></th>
					<th width="20%"><strong>주문상태</strong></th>
					<th width="10%"><strong>주문일자</strong></th>
				</tr>
					<c:forEach items="${oList}" var="oList">
				<tr>
						<td>${oList.order_idx}</td>
						<td><a style="color: #36BDF7;" href="payLogDetail.do?order_idx=${oList.order_idx}">${oList.order_name}</a></td>
						<td>${oList.order_status}</td>
						<td>2023-03-17</td>
				</tr>
					</c:forEach>

			</tbody>
		</table>
		</div>
	</div>
	<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>