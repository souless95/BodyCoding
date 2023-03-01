<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<!--top -->
<%@ include file="../../../../inc/Top.jsp" %>
	<!-- 장바구니 목록 보여주는 곳 -->
<div class="container">
	<h2>장바구니 내역</h2>
	<table id="datatablesSimple">
		<thead>
			<tr>
				<th>상품 이미지</th>
				<th>번호</th>
				<th>상품명</th>
				<th>갯수</th>
				<th>가격</th>
				<th>수정/삭제버튼</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productList }" var="row" varStatus="loop">
				<tr>
					<td>${상품이미지 }</td>
					<td>${row.product_idx }</td>
					<td>${row.product_name }</td>
					<td>${row.상품갯수?? }</td>
					<td>${row.product_price }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type="button">구매하기(결제)</button>
	<button type="button" onclick="location.href='product'">목록으로</button>
</div>	
<!-- bottom -->
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>