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
	<div>
		<h2>장바구니 내역</h2>
	</div>
		<table style="border: 5px solid #cdd0d4;">
			<tbody>
					<input type="checkbox" id="selected_all_product" name="selected_all_product" value="selected_all_product" checked>전체선택
				<tr>
 					<th><strong>선택</strong></th>
					<th colspan="2"  width="70%"><strong>상품정보</strong></th>
					<th width="10%"><strong>상품수량</strong></th>
					<th width="*"><strong>상품금액</strong></th>
					<th></th>
				</tr>
			<!-- 상품별 루프 시작 -->
				<c:set var="total" value="0"></c:set>
				<c:forEach items="${myCartList }" var="myCartList">
					<tr>
						<td style="vertical-align: middle; text-align: center;">
							<input type="checkbox" name="selected_product" checked>
						</td>
						<td width="10%">
							<img src="static/uploads/product/${myCartList.product_img}" style="width:100px;">
						</td> 
						<td style="vertical-align: top;">
							<div>
								<strong>${myCartList.product_name }</strong>
							</div>
							<div>
								${myCartList.product_description }
							</div>
						</td>
						<td style="vertical-align: middle; text-align: center;">${myCartList.product_count }</td>
						<td style="vertical-align: middle; text-align: center;">${myCartList.product_price }</td>
						<c:set var="total" value="${total+myCartList.product_price}"></c:set>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 결제 예정 금액 : 0000원 // 계속 쇼핑하기, 구매하기 버튼 위치 -->
		<table style="border: 5px solid #ffffff;">
			<tbody>
				<tr>
					<td>
						<div align="center"><strong style="font-size: 20px;">전체 주문금액</strong></div>
					</td>
					<td><div align="center"><strong style="font-size: 20px;">총 주문 수량</strong></div></td>
				</tr>
					<tr>
						<td>
							<div align="center"><strong style="font-size: 26px;"><c:out value="${total }"></c:out></strong></div>
						</td>
						<td><div align="center"><strong style="font-size: 20px;">${product_count }</strong></div></td>
					</tr>
			</tbody>
		</table>
		<div style="text-align: center; text-decoration: ">
			<button type="button">구매하기(결제)</button>
			<button type="button" onclick="location.href='product'">목록으로</button>
		</div>
</div>	
<!-- bottom -->
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>