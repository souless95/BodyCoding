<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 정보</h2>
<table id="datatablesSimple" >
	<tr>
		<td rowspan="3"><img src="static/uploads/product/${productInfo.product_img}" style="width:100%;height:180px;"></td>
		<td>상품명: ${productInfo.product_name}</td>
	</tr>
	<tr>
		<td>상품 상세 정보: ${productInfo.product_description }</td>
	</tr>
	<tr>
		<td>상품 가격: ${productInfo.product_price }</td>
	</tr>
</table>
<button type="button">구매하기(결제)</button>
<button type="button" onclick="location.href='product'">목록으로</button>

</body>
</html>