<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('input[name=product_status]').click(function(){
			
			let hasStock = $(this).closest("td").next("td").children();
			
			if($(this).prop("checked")==true){
				hasStock.attr('readonly',false);
			}
			else{
				hasStock.attr('readonly',true);
			}
			
		});
		$('.sChk').click(function() {
			
			
			let p = $(this).parent().parent();
			
			const stock = p.find('#pStock').val();
			
			
			let status = "";
			if (p.find('#pStatus').prop('checked') == true) {
				status = "Y";
			} else {
				status = "N";
			}

			let pd_idx = p.find('.pd_idx').val();
			let gCode = p.find('.gCode').val();
			let p_idx = p.find('.p_idx').val();
			
			
			if (pd_idx != null) {

				let product = {
					product_status : status,
					product_stock : stock,
					product_detail_idx : pd_idx
				}
				
				console.log(product);
				
				$.ajax({
					type : 'post',
					url : '/stockUpdate.do',
					data : JSON.stringify(product),
					contentType : "application/json;charset:utf-8",
					//콜백데이터의 타입 
					dataType : "text",
					//콜백함수 정의
					success : sucCallBack,
					error : errCallBack
				});
			}

			else {
				let product = {
					product_status : status,
					product_stock : stock,
					gym_code : gCode,
					product_idx : p_idx
				}
				
				console.log(product);
				
				$.ajax({
					type : 'post',
					url : '/stockInsert.do',
					data : JSON.stringify(product),
					contentType : "application/json;charset:utf-8",
					//콜백데이터의 타입 
					dataType : "text",
					//콜백함수 정의
					success : sucCallBack,
					error : errCallBack
				});
			}

		});
	});

	function sucCallBack() {
		console.log("success");
	}
	function errCallBack(errData) {
		console.log(errData.status + ":" + errData.statusText);
	}
</script>
</head>
<body class="sb-nav-fixed">
	<!-- top메뉴  -->
	<%@ include file="../../admin/inc/top.jsp"%>
	<div id="layoutSidenav">
		<!-- side -->
		<%@ include file="../../admin/inc/side.jsp"%>

		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<h2>재고관리</h2>
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>상품유형</th>
									<th>상품분류</th>
									<th>상품명</th>
									<th>가격</th>
									<th>판매여부</th>
									<th>재고</th>

									<s:authorize access="hasRole('ROLE_ADMIN_SUB')">
										<th></th>
									</s:authorize>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sList}" var="sItem" varStatus="loop">
									<tr>
										<td>
										<input type="hidden" class="gCode" value="${sItem.gym_code}">
										<input type="hidden" class="p_idx" value="${sItem.product_idx}">
										<input type="hidden" class="pd_idx" value="${sItem.product_detail_idx}">
										${sItem.product_type}
										</td>
										<td>${sItem.product_category}</td>
										<td>${sItem.product_name}</td>
										<td>${sItem.product_price}</td>
										<c:choose>
											<c:when test="${sItem.product_status eq 'Y' }">
												<td><input type="checkbox" name="product_status"
													checked id="pStatus">
												</td>
												<td><input type="number" name="product_stock"
													id="pStock" min="0" value="${sItem.product_stock}">
												</td>
											</c:when>
											<c:otherwise>
												<td><input type="checkbox" name="product_status"
													id="pStatus"></td>
												<td><input type="number" name="product_stock"
													id="pStock" min="0" value="${sItem.product_stock}" readonly></td>
											</c:otherwise>
										</c:choose>
										<s:authorize access="hasRole('ROLE_ADMIN_SUB')">
											<td>
												<button type="button" class="sChk custom-btn btn-2">수정</button>
											</td>
										</s:authorize>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</main>
			<!-- bottom -->
			<%@ include file="../../admin/inc/bottom.jsp"%>
		</div>
	</div>
</body>
</html>