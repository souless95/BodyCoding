<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file ="../../../../inc/Top.jsp" %>
<div class="container">
	<%@ include file ="../../../../inc/mypageside.jsp" %>
				<br />
	<h3>결제 내역 상세</h3>
	<div class="card">
		<div class="card-body">
		<div><span class="title">주문번호</span> ${paylog.order_idx}</div>
		<div><span class="title">주문일시</span> ${paylog.order_date}</div>
		<div><span class="title">주문명</span> ${paylog.order_name}</div>
		<div>
		<span class="title">주문금액</span> (${paylog.total_price}) - 
		<span class="title">사용포인트</span> ${paylog.use_point} = 
		<span class="title">최종주문금액</span> ${paylog.final_price}
		</div>
		<div><span class="title">적립포인트</span> ${paylog.save_point}</div>
		</div>
	</div>
			<table>
			<tbody>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<c:forEach items="orderlist" var="orderlist">
	 		<tr>
				<td><img src="static/uploads/product/${orderlist.product_img}"></td>
				<td>${orderlist.order_status}</td>
				<td>${orderlist.product_name}</td>
				<td>${orderlist.product_count}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>