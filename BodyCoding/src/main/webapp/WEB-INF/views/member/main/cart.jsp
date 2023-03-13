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
var pIdx;
var newCount;

function totalP(){
    var total = 0;
    $('input[name=selected_product]:checked').each(function() {
        total += parseInt($(this).closest('tr').find('.product-price').text());
    });
    $('#totalP').text(total);
}

function chgCount(symbol, f) {

	var parentId = $(f).closest("td").attr('id');
	var pCount = $('#' + parentId).children('span').text();
	pIdx = $('#' + parentId).children('.pIdx').val();
	var pPrice = $('#' + parentId + '+td').children('span').text();
	var uPrice = eval("Number(pPrice)/Number(pCount)");

	console.log("단가:" + uPrice);

	if (symbol == "+") {
		newCount = eval("Number(pCount)+1");
		var newPrice = eval("Number(pPrice)+Number(uPrice)");
	} 
	else {
		newCount = eval("Number(pCount)-1");
		var newPrice = eval("Number(pPrice)-Number(uPrice)");

	}
	if (eval("Number(newCount) < 1") == false) {
		$('#' + parentId).children('span').text(newCount);
		$('#' + parentId + '+td').children('span').text(newPrice);
	}
	
	totalP();
}

function checkAll() {
	if ($("#selected_all_product").is(':checked')) {
		$("input[name=selected_product]").prop("checked", true);
	} else {
		$("input[name=selected_product]").prop("checked", false);
	}
	
	totalP();
}

$(function() {

	$('input[name=selected_product]').click(function() {
		var chks = document.getElementsByName("selected_product");
		var chksChecked = 0;

		for (var i = 0; i < chks.length; i++) {
			var cbox = chks[i];

			if (cbox.checked) {
				chksChecked++;
			}
		}

		if (chks.length == chksChecked) {
			$("#selected_all_product").prop("checked", true);
		} else {
			$("#selected_all_product").prop("checked", false);
		}
		
		totalP();
	});

	$('.cButton').click(function() {

		var count1 = {
			mem_id : $('#mem_id').val(),
			product_idx : pIdx,
			product_count : newCount
		}

		$.ajax({
			type : 'post',
			url : '/plusMinus.do',
			data : JSON.stringify(count1),
			contentType : "application/json;charset:utf-8",
			dataType : "text",
			success : sucCallBack,
			error : errCallBack
		});
	});
	
	$('#purchase').click(function(){
		
		if($('input:checkbox[name=selected_product]:checked').val()==null) {
			alert("구매할 상품을 선택해주세요");
		}
		
		else{			
			 var chkArray = new Array(); // 배열 선언
			 
	        $('input:checkbox[name=selected_product]:checked').each(function() {
	            chkArray.push(this.value);
	        });
			 location.href="puchaseExpectInfo.do?chkArray="+chkArray;
		}
	});
});

function sucCallBack(resData) {
	console.log("success");
}

function errCallBack(errData) {
	console.log(errData.status + ":" + errData.statusText);
}
</script>
<!--top -->
<%@ include file="../../../../inc/Top.jsp"%>
<!-- 장바구니 목록 보여주는 곳 -->
<div class="container">
	<div>
		<h2>장바구니 내역</h2>
	</div>
	<table style="border: 5px solid #cdd0d4;">
		<tbody>
			<input type="checkbox" id="selected_all_product"
				onclick="checkAll();" checked>전체선택
			<tr>
				<th><strong>선택</strong></th>
				<th colspan="2" width="70%"><strong>상품정보</strong></th>
				<th></th>
				<th width="10%"><strong>상품수량</strong></th>
				<th width="*"><strong>상품금액</strong></th>
				<th></th>
			</tr>
			<!-- 상품별 루프 시작 -->
			<c:set var="totalPrice" value="0" />
			<c:forEach items="${myCartList }" var="myCartList">
				<tr>
					<td style="vertical-align: middle; text-align: center;">
					<input type="checkbox" name="selected_product" value="${myCartList.cart_idx }" checked></td>
					<td width="10%"><img src="static/uploads/product/${myCartList.product_img}" style="width: 100px;"></td>
					<td style="vertical-align: top;">
						<div>
							<strong>${myCartList.product_name }</strong>
						</div>
						<div>${myCartList.product_description }</div>
					</td>
					<td>
						<!-- 상품수량 증감 부분 -->
					</td>
					<td style="vertical-align: middle; text-align: center;" id="product_${myCartList.product_idx }">
						<input type="hidden" class="pIdx" value="${myCartList.product_idx }" /> 
						<input class="cButton" type="button" value="+" onclick="chgCount('+',this);" style="width: 20px; float: right;" />
						<span class="pCount">${myCartList.product_count }</span>개 
						<input class="cButton" type="button" value="-" onclick="chgCount('-',this);" style="width: 20px; float: left;" />
					</td>
					<td style="vertical-align: middle; text-align: center;"><span class="product-price">${myCartList.product_price }</span>원
						<form style="float: right;" action="cartDelete.do" method="post">
							<button type="submit">x</button>
							<input type="hidden" id="mem_id" name="mem_id" value="${myCartList.mem_id }" />
							<input type="hidden" name="product_idx" value="${myCartList.product_idx }" />
						</form>
					</td>
				</tr>
				<c:set var="totalPrice"
					value="${totalPrice + myCartList.product_price}" />
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