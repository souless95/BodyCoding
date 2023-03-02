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
	<form method="post" name="form1" id="form1">
		<table border="1">
			<thead>
				<tr>
					<th colspan="3" align="left">
						<input type="checkbox" id="select_all_product" name="select_all_product" value="select_all_product" checked>체크
					</th>
					<th width="70%" class="txt_center">상품정보</th>
					<th width="10%" class="txt_center">상품수량</th>
					<th width="*" class="txt_center">상품금액</th>
				</tr>
			</thead>
			<!-- 상품별 루프 시작 -->
			<tbody>
				<c:forEach items="${productList }" var="row" varStatus="loop">
					<tr>
						<td width="20%" class="txt_center">
							<input type="checkbox" name="selected_all_product" checked>
						</td>
						<td><img src="static/uploads/product/${productInfo.product_img}" style="width:100%;height:180px;"></td>
						<td>
							<div><strong>${prodictInfo.product_name }</strong></div>
							<div></div>
						</td>
						<td>${row.product_count }</td>
						<td>${row.product_price }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<button type="button">구매하기(결제)</button>
	<button type="button" onclick="location.href='product'">목록으로</button>
</div>	
<!-- bottom -->
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>