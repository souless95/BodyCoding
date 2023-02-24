<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	$('#sChk').click(function() {
		const stock = $('#pStock').val();
		
		let status ="Y";
		if($('#pStatus').prop("checked")==true){			
			status = "Y"; 			
		}
		else{
			status = "N"; 
		}
		
		const pd_idx = $('#pd_idx').val();
		
		const gCode = $('#gCode').val();
		const p_idx = $('#p_idx').val();
		
		if(pd_idx!=null){
			
			let product = {
				product_status : status,
				product_stock : stock,
				product_detail_idx : pd_idx
			}
			$.ajax({
				type:'post',
				url: '/stockUpdate.do',
				data: JSON.stringify(product),
				contentType: "application/json;charset:utf-8",
				//콜백데이터의 타입 
				dataType:"text",
				//콜백함수 정의
				success:sucCallBack,
				error: errCallBack
			});
		}
		
		else{
			let product = {
					product_status : status,
					product_stock : stock,
					gym_code : gCode,
					product_idx : p_idx
				}
				$.ajax({
					type:'post',
					url: '/stockInsert.do',
					data: JSON.stringify(product),
					contentType: "application/json;charset:utf-8",
					//콜백데이터의 타입 
					dataType:"text",
					//콜백함수 정의
					success:sucCallBack,
					error: errCallBack
				});
		}
		
		
	});
});



function sucCallBack() {
	console.log("success");
}
function errCallBack(errData){
	console.log(errData.status+":"+errData.statusText);
}
</script>
</head>
<body>
<form method="get" action="search.do">
	<div>
		<input type="text" name="searchTxt" placeholder="상품명을 입력하세요."/>
	</div>
	<input type="submit" name="검색"/>
</form>
<table border="1">
		<tr>
			<th>상품유형</th>
			<th>상품분류</th>
			<th>상품명</th>
			<th>가격</th>
			<th>판매여부</th>
			<th>재고</th>
		</tr>
		<c:forEach items="${sList}" var="sItem" varStatus="loop">
		<tr>
			<input type="hidden" id="p_idx" value="${sItem.product_idx}">
			<input type="hidden" id="pd_idx" value="${sItem.product_detail_idx}">
			<input type="hidden" id="gCode" value="${sItem.gym_code}">
			<td>${sItem.product_type}</td>
			<td>${sItem.product_category}</td>
			<td>${sItem.product_name}</td>
			<td>${sItem.product_price}</td>
			<td>
				<c:choose>				
				<c:when test="${sItem.product_status eq 'Y' }">
					<input type="checkbox" name="product_status" checked id="pStatus">
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="product_status" id="pStatus">
				</c:otherwise>
				</c:choose>
			</td>
			<td><input type="number" name="product_stock" id="pStock" value="${sItem.product_stock}"></td>
			<td><button type="button" id="sChk">전송</button></td>
		</tr>
		</c:forEach>
	</table>


</body>
</html>