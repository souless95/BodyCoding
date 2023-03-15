<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style type="text/css">
div{
 border: 1px solid red;
}
.check_all{
    position: relative;
    height: 50px;
    background-color: #ffffff;
    border-top: 1px solid #eaebed;
    border-radius: 16px;
}
.inner_allcheck{
	display: flex;
    min-width: 0;
    padding: 11px 18px;
    -webkit-box-align: center;
    align-items: center;
    
}
.contents{
    padding: 30px 0 44px;
    background-color: #f4f4f4;
}
.store_container{
    opacity: 1;
    transition: max-height 0.3s 0s cubic-bezier(0.33, 1, 0.68, 1);
}
.store_card{
    margin: 0 13px;
    padding: 0 15px;
    background-color: #ffffff;
    border-radius: 16px;
    box-sizing: border-box;
    box-shadow: 0px 3px 9px rgba(0,0,0,0.05);
}
.store_content{
	padding-bottom: 53px;
    transition: max-height 0.3s cubic-bezier(0.33, 1, 0.68, 1) 0s;
}
.products{
    /* margin-bottom: 10px; */
        display: flex;
    min-width: 0;
}
.products_info{
    -webkit-box-flex: 1;
    flex-grow: 1;
}
.product{
	border-color: #cacbd4;
    margin-bottom: 0;
}
.product_info{
    display: flex;
    min-width: 0;
    padding-left: 35px;
    box-sizing: border-box;
}
.cell{
	width: 300px;
    padding: 0;
    display: inline-block;
    
}
.product_show{
    padding: 20px 20px 20px 0px;
}
.checkbox{
    /* top: 50%;
    transform: translateY(-50%); */
    display: flex;
	justify-content: center;
	align-items: center;
}
.input_checkbox{
    font-size: 16px;
    line-height: 20px;
}
.checkbox_inner{
    position: relative;
    display: flex;
}
.inner_img{
	width: 100px;
    height: 100px;
}
.inner_info{
	width: 100px;
    height: 100px;
    -webkit-box-flex: 1;
    flex-grow: 1;
    min-width: 0;
}
.product_list{
	display: inline-block;
}
.product_tittle{
    max-height: 44px;
    font-size: 14px;
    line-height: 22px;
    font-weight: bold;
    letter-spacing: 0;
    color: #222222;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    word-break: break-all;
    overflow: hidden;
}
.product_content{
	max-height: 44px;
    font-size: 14px;
    line-height: 22px;
    font-weight: bold;
    letter-spacing: 0;
    color: #222222;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    word-break: break-all;
    overflow: hidden;
}
.product_price{
	margin-top: 4px;
    font-family: tahoma,"나눔고딕","Nanum Gothic","맑은고딕","Malgun Gothic","돋움",dotum,helvetica,"Apple SD Gothic Neo",sans-serif;
    font-size: 14px;
    font-weight: bold;
    line-height: 17px;
    color: #222222;
}
.items{
	margin: 0 20px;
    padding: 10px 0 12px;
    background-color: transparent;
    border-bottom: 1px solid #e9ecef;
}
.option{
    font-size: 12px;
    line-height: 19px;
}
.option_price{
    margin-top: 4px;
    -webkit-box-align: end;
    align-items: end;
    display: flex;
    min-width: 0;
}
.option_controller{
    position: relative;
    display: inline-block;
    border: 1px solid #dfe4ec;
    background-color: #ffffff;
    border-radius: 3px;
    height: 28px;
    vertical-align: top;
}
.cButton{
	width: 27px;
	height: 100%;
}
.pCount{
	width: 41px;
	font-size: 14px;
}
.product-price{
	font-size: 14px;
    line-height: 18px;
    flex-grow: 1;
    text-align: right;
}


</style>
</head>
<body>
<script type="text/javascript">
var pIdx;
var newCount;

function totalP(){
    var total = 0;
    $('input[name=selected_product]:checked').each(function() {
        total += parseInt($(this).closest('tr').find('.product-price').text().replace(',', '').trim());
    });
    $('#totalP').text(total.toLocaleString());
}

function chgCount(symbol, f) {

	var parentId = $(f).closest("td").attr('id');
	var pCount = $('#' + parentId).children('span').text();
	pIdx = $('#' + parentId).children('.pIdx').val();
	var pPrice = $('#' + parentId + '+td').children('span').text().replace(',', '').trim();
	var uPrice = eval("Number(pPrice)/Number(pCount)");

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
		$('#' + parentId + '+td').children('span').text(newPrice.toLocaleString());
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
	<div class="check_all">
		<div class="inner_allcheck">
			<input type="checkbox" id="selected_all_product" onclick="checkAll();" checked>전체선택
		</div>
	</div>
	<div class="contents">
		<div class="store_container">
			<div class="store_card">
				<div class="store_content">
					<div>
						<div class="products">
							<div class="products_info">
								<div class="product">
									<div class="product_info">
											<!-- <tr>
												<th><strong>선택</strong></th>
												<th colspan="2" width="70%"><strong>상품정보</strong></th>
												<th></th>
												<th width="10%"><strong>상품수량</strong></th>
												<th width="*"><strong>상품금액</strong></th>
												<th></th>
											</tr> -->
											<!-- 상품별 루프 시작 -->
										<c:set var="totalPrice" value="0" />
										<div class="product_list">
											<c:forEach items="${myCartList }" var="myCartList">
												<div class="cell">
													<div class="product_show">
														<div class="checkbox_inner">
															<div class="checkbox">
																<input type="checkbox" class="input_checkbox" name="selected_product" value="${myCartList.cart_idx }" checked>
															</div>
															<div class="inner_img">
																<img src="static/uploads/product/${myCartList.product_img}" style="width: 100px;">
															</div>
															<div class="inner_info">
																<div class="product_tittle">
																	<strong>${myCartList.product_name }</strong>
																</div>
																<div class="product_content">
																	${myCartList.product_description }
																</div>
																<div class="product_price">
																	${myCartList.product_price }
																</div>
															</div>
															<div style="vertical-align: middle; text-align: center;">
																<form style="float: right;" action="cartDelete.do" method="post">
																	<button type="submit" class="product_delete">x</button>	
																	<input type="hidden" id="mem_id" name="mem_id" value="${myCartList.mem_id }" />
																	<input type="hidden" name="product_idx" value="${myCartList.product_idx }" />
																</form>
															</div>
														</div>
													</div>
												</div>
												
												<!-- 상품수량 증감 부분 -->
												<div class="cell">
													<div class="items" id="product_${myCartList.product_idx }">
														<div  class="option">상품 주문 수량</div>
														<div class="option_price">
															<div class="option_controller">
																<input type="hidden" class="pIdx" value="${myCartList.product_idx }" /> 
																<input class="cButton" type="button" value="+" onclick="chgCount('+',this);"/>
																<input class="pCount" value="${myCartList.product_count }"/>
																<input class="cButton" type="button" value="-" onclick="chgCount('-',this);"/>
															</div>
														</div>
														<br />
														<span class="product-price">
															<fmt:formatNumber value="${myCartList.product_price }" pattern="###,###,###원" />
														</span>
													</div>
												</div>
												
												<c:set var="totalPrice"
													value="${totalPrice + myCartList.product_price}" />
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
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
						<strong style="font-size: 26px;"><span id="totalP">
						<fmt:formatNumber value="${totalPrice }" pattern="###,###,###" /></span>원</strong>
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