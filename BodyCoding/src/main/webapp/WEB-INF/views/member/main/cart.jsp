<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#plusMinus').click(function(){
		console.log($('#product_idx').val()); console.log($('#mem_id').val()); console.log($('#product_count').val());
		let count1 = {
			mem_id: $('#mem_id').val(),
			product_idx: $('#product_idx').val(),
			product_count: $('#product_count').val()
		}
		$.ajax({
			type: 'post',
			url: '/plusMinus.do',
			data: JSON.stringify(count1),
			contentType: "application/json;charset:utf-8",
			dataType: "text",
			success: sucCallBack,
			error: errCallBack
		});
	});
	$('#plusMinus').trigger('click'); 
});
function sucCallBack(resData){
	console.log(resData);
	let tableData = resData;
	$('#show_data').html(tableData);
	$('#product_count').val(0);
}
function errCallBack(errData){
	console.log(errData.status+":"+errData.statusText);
}
</script>
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
					<th colspan="2"  width="70%">
						<strong>상품정보</strong>
					</th>
					<th></th>
					<th width="10%"><strong>상품수량</strong></th>
					<th width="*"><strong>상품금액</strong></th>
					<th></th>
				</tr>
			<!-- 상품별 루프 시작 -->
			<c:set var="totalPrice" value="0"/>
			<c:set var="totalCount" value="0"/>
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
						<td> <!-- 상품수량 증감 부분 -->
							<div id="show_data"></div>
					       	 	<input type="number" id="product_count" value="1" style="width: 80px;" min="1" max="10"/>
					       	 	<input type="hid-den"  id="mem_id" value="${myCartList.mem_id }"/>
					       	 	<input type="hid-den"  id="product_idx" value="${myCartList.product_idx }"/>
					       	 	<input type="button" value="수정" id="plusMinus" />
						</td>
						<td style="vertical-align: middle; text-align: center;">${myCartList.product_count }개</td>
						<td style="vertical-align: middle; text-align: center;">${myCartList.product_price }원</td>
					</tr>
					<c:set var="totalPrice" value="${totalPrice + myCartList.product_price}"/> 
					<c:set var="totalCount" value="${totalCount + myCartList.product_count}"/>
				</c:forEach>
			</tbody>
		</table>
		<!-- 결제 예정 금액 : 0000원 // 계속 쇼핑하기, 구매하기 버튼 위치 -->
		<table style="border: 5px solid none;">
			<tbody>
				<tr>
					<td><div align="center"><strong style="font-size: 20px;">전체 주문금액</strong></div></td>
					<td><div align="center"><strong style="font-size: 20px;">총 주문 수량</strong></div></td>
				</tr>
					<tr>
						<td>
							<div align="center"><strong style="font-size: 26px;"><c:out value="${totalPrice }"/>원</strong></div>
						</td>
						<td><div align="center"><strong style="font-size: 20px;"><c:out value="${totalCount }"/>개</strong></div></td>
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