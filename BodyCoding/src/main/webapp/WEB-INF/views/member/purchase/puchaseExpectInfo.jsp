<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>결제 예정 정보</title>
<script type="text/javascript">
$(function(){
	
	
});
</script>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
<!-- 장바구니 목록 보여주는 곳 -->
<div class="container">
	<div>
		<h2>결제 정보</h2>
	</div>
	<table style="border: 5px solid #cdd0d4;">
		<tbody>
			<tr>
				<th width="10%"></th>
				<th colspan="2" width="70%"><strong>상품정보</strong></th>
				<th></th>
				<th width="10%"><strong>상품수량</strong></th>
				<th width="*"><strong>상품금액</strong></th>
				<th></th>
			</tr>
			<!-- 상품별 루프 시작 -->
			<c:set var="totalPrice" value="0" />
			<c:forEach items="${pList }" var="pList">
				<tr>
					<td width="10%"><img src="static/uploads/product/${pList.product_img}" style="width: 100px;"></td>
					<td></td>
					<td style="vertical-align: top;">
						<div>
							<strong>${pList.product_name }</strong>
						</div>
						<div>${pList.product_description }</div>
					</td>
					<td>
						<!-- 상품수량 증감 부분 -->
					</td>
					<td style="vertical-align: middle; text-align: center;">
						<input type="hidden" class="pIdx" value="${pList.product_idx }" /> 
						<span class="pCount">${pList.product_count }</span>개 
					</td>
					<td style="vertical-align: middle; text-align: center;"><span class="product-price">${pList.product_price }</span>원
					</td>
				</tr>
				<c:set var="totalPrice"
					value="${totalPrice + pList.product_price}" />
				<c:set var="totalPoint" value="${pList.mem_point}" />
			</c:forEach>
		</tbody>
	</table>
	<!-- 결제 예정 금액 : 0000원 // 계속 쇼핑하기, 구매하기 버튼 위치 -->
	<table style="border: 5px solid none;">
		<tbody>
			<tr>
				<td><div align="center">
						<strong style="font-size: 20px;">전체 주문금액</strong>
					</div></td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<strong style="font-size: 26px;"><span id="totalP"><c:out
								value="${totalPrice }" /></span>원</strong>
					</div>
				</td>
			</tr>
			<tr>
				<td><div align="center">
						<strong style="font-size: 20px;">사용 포인트</strong>
					</div></td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<strong style="font-size: 26px;">
						<span id="tPoint">(보유포인트 :<c:out value="${totalPoint}" />)</span>
						<input type="number" min="0">
						<input type="checkbox">전체 사용
						</strong>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<div style="text-align: center; text-decoration:">
		<button id="purchase">구매하기(결제)</button>
		<button type="button" onclick="location.href='product'">목록으로</button>
	</div>
</div>

<!-- bottom -->
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>