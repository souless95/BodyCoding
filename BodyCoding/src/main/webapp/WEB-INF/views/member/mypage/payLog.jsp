<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@ include file="../../../../inc/Top.jsp"%>
	<div class="container">
		<div class="sub_container">
		<%@ include file="../../../../inc/mypageside.jsp"%>
			<br />
	<h2>결제 내역</h2>
	<hr style="border: 1px solid #01538D;">
		<br>
		<table
			style="width: 80%; border-top: 1px solid #01538D; border-bottom: 1px solid #01538D;">
			<tbody>
				<tr style="color:white; background-color: #01538D;">
					<th width="20%" style="text-align: center;"><strong>주문번호</strong></th>
					<th width="50%"><strong>주문명</strong></th>
					<th width="20%"><strong>주문상태</strong></th>
					<th width="10%"><strong>주문일자</strong></th>
				</tr>
					<c:forEach items="${oList}" var="oList">
				<tr>
						<td style="text-align: center;">${oList.order_idx}</td>
						<td><a style="color: #01538D;" href="payLogDetail.do?order_idx=${oList.order_idx}">${oList.order_name}</a></td>
						<td>${oList.order_status}</td>
						<td><c:set value="${oList.order_date}" var="date" />
						${fn:substring(date,0,11)}</td>
				</tr>
					</c:forEach>

			</tbody>
		</table>
		</div>
	</div>
	<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>