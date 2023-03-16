<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<h2>상품리스트</h2>
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>상품유형</th>
									<th>상품분류</th>
									<th>상품명</th>
									<th>가격</th>
									<th>등록일</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pList}" var="pItem" varStatus="loop">
									<tr>
										<td>${pItem.product_type}</td>
										<td>${pItem.product_category}</td>
										<td>${pItem.product_name}</td>
										<td>${pItem.product_price}</td>
										<td>${pItem.product_regidate}</td>
										<td>
										<s:authorize access="hasRole('ROLE_ADMIN_SUPER')">
											<a href="productEdit.do?product_idx=${pItem.product_idx}">수정</a>
											<a href="productDelete.do?product_idx=${pItem.product_idx}">삭제</a>
										</s:authorize>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<s:authorize access="hasRole('ROLE_ADMIN_SUPER')">
							<button type="button" class="custom-btn btn-2" onclick="location.href='/admin/product/productReigst'">상품등록</button>
						</s:authorize>
						<button type="button" class="custom-btn btn-2" onclick="location.href='productList.do'">목록</button>
					</div>
				</div>
			</main>
			<!-- bottom -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>	
	</div>
</body>
</html>