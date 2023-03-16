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
}
.store_card{
    margin: 0 13px;
    padding: 0 15px;
    background-color: #ffffff;
    border-radius: 16px;
    box-shadow: 0px 3px 9px rgba(0,0,0,0.05);
}
.cell_all{
	width: 100%;
	text-align: center; 
	display: inline-block;
}
.cell{
	width: 100%;
	height: 150px;
    display: inline-block;
    border-bottom: 1px solid #f4f4f4;
}
.buy_link{
	display: inline-block;
    width: 150px;
    max-width: none;
    border-radius: 6px;
    font-size: 16px;
    line-height: 48px;
    background-color: #ffffff;
    vertical-align: top;
    border: 1.5px solid #37C0FB;
}
.go_product{
	border: 1.5px solid #37C0FB;
	width: 100px;
	border-radius: 6px;
	background-color: #ffffff;
	font-size: 16px;
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
				<table>
					<thead>
						<tr>
							<th scope="col"><strong>상품정보</strong></th>
							<th scope="col"><strong>상품수량</strong></th>
							<th scope="col"><strong>상품금액</strong></th>
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
										<input type="hidden" name="product_name" value="${pList.product_name }">
										<input type="hidden" name="product_idx" value="${pList.product_idx }"> 
										<input type="hidden" name="product_count" value="${pList.product_count }"> 
									</div>
									<div>${pList.product_description }</div>
								</td>
								<td></td>
								<td style="vertical-align: middle; text-align: center;">
									<span class="pCount">
										${pList.product_count }
									</span>개 
								</td>
								<td style="vertical-align: middle; text-align: center;">
									<span class="product-price">
										<fmt:formatNumber value="${pList.product_price }" pattern="###,###,###" />
									</span>원
								</td>
							</tr>
							<c:set var="totalPrice" value="${totalPrice + pList.product_price}" />
							<c:set var="totalPoint" value="${pList.mem_point}" />
						</c:forEach>
					</thead>
				</table>
				<!-- 결제 예정 금액 : 0000원 // 계속 쇼핑하기, 구매하기 버튼 위치 -->
				<table style="border: 5px solid none;">
					<tbody>
						<tr>
							<td>
								<div align="center">
									<strong style="font-size: 20px;">주문금액</strong>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="center">
									<strong style="font-size: 26px;">
										<span id="price">
										<fmt:formatNumber value="${totalPrice }" pattern="###,###,###" />
										</span>원
									</strong>
									<input type="hidden" name="product_price" value="${totalPrice }">
									<input type="hidden" name="type" value="상품">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="center">
									<strong style="font-size: 20px;">사용 포인트</strong>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="center">
									<strong style="font-size: 26px;">
										(보유포인트 :
										<span id="sPoint">
											<fmt:formatNumber value="${totalPoint }" pattern="###,###,###" />
										</span>)
										<input type="number" value="0" min="0" id="uPoint" name="use_point">
										<input type="checkbox">전체 사용
									</strong>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="center">
									<strong style="font-size: 20px;">총 주문금액</strong>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="center">
									<strong style="font-size: 26px;">
										<span id="totalP">
											<fmt:formatNumber value="${totalPrice }" pattern="###,###,###" />
										</span>원
									</strong>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	<div align="center">
		<button type="button" class="buy_link"  id="purchase">구매하기(결제)</button>
	</div>
	<div align="right">
		<button type="button" class="go_product" onclick="location.href='product'">목록으로</button>
	</div>
</div>

<!-- bottom -->
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>