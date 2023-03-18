<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>결제 예정 정보</title>
<style>
.contents{
    padding: 30px 0 44px;
    background-color: #f4f4f4;
   	width:1380px;
}
.store_card{
    margin: 0 13px;
    padding: 0 15px;
    background-color: #ffffff;
    border-radius: 16px;
    box-shadow: 0px 3px 9px rgba(0,0,0,0.05);
}
.store_content{
   padding-bottom: 53px;
}
.products{
    margin-bottom: 10px;
    display: flex;
    min-width: 0;
}
.products_info{
    flex-grow: 1;
}
.product_info{
    display: block;
    padding-left: 35px;
    box-sizing: border-box;
}
.cell{
	width: 100%;
	height: 150px;
    display: inline-block;
    border-bottom: 1px solid #f4f4f4;
}
.product_show{
    padding: 30px 20px 20px 20px;
}
.checkbox_inner{
    position: relative;
    display: flex;
}
.inner_info{
    flex-grow: 1;
    min-width: 0;
    padding: 20px 0 30px;
    border-right: 1px solid #e9ecef;
}
.product_tittle{
    max-height: 44px;
    width:800px;
    font-size: 20px;
    line-height: 22px;
    font-weight: bold;
    text-align: left;
    padding-left: 70px;
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
    width:800px;
    font-size: 14px;
    line-height: 22px;
    font-weight: bold;
    text-align: left;
    padding-left: 70px;
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
.items{
    margin: 0 20px;
    height: 100px;
    width:80px;
    padding: 30px 0 12px;
    background-color: transparent;
    border-right: 1px solid #e9ecef;
    align-items: center;
}
.Title {
	max-height: 44px;
    font-size: 15px;
    line-height: 22px;
    font-weight: bold;
    text-align: center;
    letter-spacing: 0;
    color: #222222;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    word-break: break-all;
    overflow: hidden;
    padding-right: 20px;
}
.pCount{
    width: 60px;
    font-size: 14px;
    display: inline-block;
    height: 100%;
    border: none;
    text-align: center;
    color: #111111;
    font-weight: normal;
    vertical-align: top;
}
.price{
 	margin: 0 20px;
    padding: 30px 0 12px;
    background-color: transparent;
    align-items: center;
}
.product-Title{
	max-height: 44px;
    font-size: 15px;
    line-height: 22px;
    font-weight: bold;
    text-align: center;
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
.product-price{
	width: 100%;
    font-size: 15px;
    display: inline-block;
    height: 100%;
    border: none;
    text-align: center;
    color: #1e1e23;
    font-weight: bold;
    vertical-align: top;
}
.discount{
    position: relative;
    padding-bottom: 40px;
    color: #1e1e23;
    letter-spacing: -0.5px;
    zoom: 1;
}
.discount_info{
    position: relative;
    float: left;
    padding: 30px 10px 0 160px;
    border: 1px solid #fff;
    border-top-color: #f0f0f0;
    border-right-color: #e9e9e9;
    border-bottom: 0;
    width: 800px;
    height: 100%;
    background-position: 0 -516px;
}
.list_discount{
    display: table;
    margin-top: 4px;
    width: 100%;
    table-layout: fixed;
    line-height: 25px;
}
.item_discount{
    display: table-row;
}
.label{
    display: table-cell;
    width: 103px;
    padding: 13px 0 0 36px;
    letter-spacing: -0.5px;
    vertical-align: top;
}
.item_point{
    padding-top: 13px;
}
.input_area{
   	position: relative;
    float: left;
    border-bottom: 1px solid #c8cacc;
    text-align: right;
    height: 28px;
    line-height: 25px;
    width: 269px;
    padding-right: 5px;
    font-weight: bold;
}
.list_balance{
	float: left;
	font-size:16px;
    margin-left: 8px;
}
.item_amountarea{
	display: inline-block;
    line-height: 26px;
    color: #767678;
    vertical-align: top;
    font-size: 14px;
}
.use_point{
	display: table-cell;
    padding-top: 13px;
    vertical-align: top;
}
.using_point{
	float: left;
	width: 243px;	
    height: 25px;
    background: none;
    border: 0;
    color: #09aa5c;
    line-height: 25px;
    font-family: tahoma,geneva,sans-serif;
    font-size: 16px;
    text-align: right;
}
.won{
    display: inline-block;
    vertical-align: top;
    color: #09aa5c;
}
.price_sum{
    float: right;
    padding: 38px 30px 0px 140px;
    border: 1px solid #e9e9e9;
    border-right-color: #fff;
    border-bottom: 0;
    border-left: 0;
    width: 487px;
}
.sum{
    margin-top: 23px;
    overflow: hidden;
    position: relative;
    color: #444;
}
.sum_title{
    float: left;
    font-size: 13px;
    letter-spacing: -0.5px;
    line-height: 15px;
    font-weight: bold;
    color: #222;
}
.sum_detail{
	overflow: hidden;
    font-size: 13px;
    font-weight: bold;
    letter-spacing: -0.5px;
    line-height: 15px;
    color: #222;
    text-align: center;
}
.totalprice{
    display: inline-block;
    vertical-align: top;
}
.calc_list{
    position: relative;
    margin-top: 11px;
    color: #666;
    list-style:none;
    padding-left:0px;
}
.calc_list::before{
	position: absolute;
    top: 1px;
    bottom: 2px;
    left: 0;
    width: 4px;
    height: 15px;
    background-color: #dcdee0;
    content: '';
}
.calc_list li{
	color: #888;
	font-size: 12px;
   	overflow: hidden;
    padding-left: 12px;
}
.calc_list strong{
	line-height: 15px;
    float: left;
    height: 15px;
    font-weight: normal;
    letter-spacing: -0.5px;
}
.products_price{
    display: inline-block;
    vertical-align: top;
}
.sum_side{
	overflow: hidden;
    font-size: 13px;
    font-weight: normal;
    letter-spacing: -0.5px;
    line-height: 15px;
    color: #888;
    text-align: center;
}
.buy_link{
	display: inline-block;
    width: 150px;
    max-width: none;
    border-radius: 6px;
    font-size: 16px;
    line-height: 48px;
    color:white;
    font-weight:bold;
    background-color: #ffa500;
    vertical-align: top;
    border: none;
}
</style>
<script type="text/javascript">
var uPoint;
function cal(){
	let uPoint = document.getElementById('uPoint').value;
	let price = parseInt($('#price').text().replace(',', ''));
	let tPrice = eval('Number(price)-Number(uPoint)');
	$('#totalP').text(tPrice.toLocaleString());
}

$(function(){
	$('input:checkbox').click(function(){
		if(this.checked == true){
			$('#uPoint').val($('#sPoint').text().replace(',', '').trim());
		}
		else{
			$('#uPoint').val(0);
		}
		cal();
	});
	$('#uPoint').keyup(function(){
		cal();
	});
	$('#purchase').click(function(){
		
		let sPoint = $('#sPoint').text();
		if (sPoint < uPoint){
			alert("보유포인트보다 숫자가 큽니다.");
			$('#uPoint').val(0);
			cal();
			return false;
		}
		
		else{
			const payInfo = $('#payFrm').serialize();
	       $.ajax({
	           url: 'kakaoPay.do',
	           data : payInfo,
	           dataType:"json",
	           success:function(data){
	  	            console.log("페이성공"+data);
	  				location.href = data.next_redirect_pc_url;
	           },
	           error:function(error){
	              alert(error);
	           }
	        });
		}
		
	});
	
});
</script>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
<div class="container">
	<div>
		<h2>결제 정보</h2>
	</div>
	<form id="payFrm">
		<!-- 결제 상품을 장바구니에서 삭제하기 위해 결제 시, cart_idx를 파라미터로 전달 -->
		<input type="hidden" name="cart_idx" value=${cart_arr }>
		<div class="contents">
			<div class="store_card">
				<div class="store_content">
					<div class="products">
	              		<div class="products_info">
	              			<div class="product_info">
								<!-- 상품별 루프 시작 -->
								<c:set var="totalPrice" value="0" />
								<c:forEach items="${pList }" var="pList">
									<div class="cell">
										<div class="product_show">
											<div class="checkbox_inner">
												 <div class="inner_img">
													<img src="static/uploads/product/${pList.product_img}" style="width: 100px;"/>
												</div>
												<div class="inner_info">
													<div class="product_tittle">
														<strong>${pList.product_name }</strong>
														<input type="hidden" name="product_name" value="${pList.product_name }">
														<input type="hidden" name="product_idx" value="${pList.product_idx }"> 
														<input type="hidden" name="product_count" value="${pList.product_count }"> 
													</div>
													<div class="product_content">
														${pList.product_description }
													</div>
												</div>
												<div class="items">
													<div class="Title">
														상품개수
													</div>
													<div class="pCount">
														${pList.product_count }개 
													</div>
												</div>
												<div class="price">
													<div class="product-Title">
														상품금액
													</div>
													<div class="product-price">
														<fmt:formatNumber value="${pList.product_price }" pattern="###,###,###원" />
													</div>
												</div>
											</div>
										</div>
									</div>
									<c:set var="totalPrice" value="${totalPrice + pList.product_price}" />
									<c:set var="totalPoint" value="${pList.mem_point}" />
								</c:forEach>
								
								<!-- 결제 예정 금액 : 0000원 // 계속 쇼핑하기, 구매하기 버튼 위치 -->
								<div class="discount">
									<div class="discount_info">
										<h4>포인트</h4>
										<ul class="list_discount">
											<li class="item_discount">
												<div class="label">
													보유
												</div>
												<div class="item_point">
													<div class="input_area" id="sPoint">
														<fmt:formatNumber value="${totalPoint }" pattern="###,###,###" />
													</div>
													<div class="list_balance">
															포인트 : <fmt:formatNumber value="${totalPoint }" pattern="###,###,###P" />
													</div>
												</div>
											</li>
											<li class="item_discount">
												<div class="label">
													사용
												</div>
												<div class="use_point">
													<div class="input_area">
														<input type="text" class="using_point" value="0" min="0" id="uPoint" name="use_point">
														<span class="won">P</span>
													</div>
														<input style="width: 19px; height: 18px;" type="checkbox">전액 사용
												</div>
											</li>
										</ul>
									</div>
									
									<div class="price_sum">
										<h4>결제상세</h4>
										<div class="sum">
											<strong class="sum_title">주문금액</strong>
											<p class="sum_detail">
												<em class="totalprice" id="totalP">
													<fmt:formatNumber value="${totalPrice }" pattern="###,###,###"/>
												</em>
												원
											</p>
										</div>
										<ul class="calc_list">
											<li>
												<strong>상품금액</strong>
												<p class="sum_side">
													<em class="products_price" id="price">
														<fmt:formatNumber value="${totalPrice }" pattern="###,###,###원" />
														<input type="hidden" name="product_price" value="${totalPrice }">
														<input type="hidden" name="type" value="상품">
													</em>
												</p>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div align="center">
						<button type="button" class="buy_link"  id="purchase">구매하기(결제)</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- bottom -->
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>