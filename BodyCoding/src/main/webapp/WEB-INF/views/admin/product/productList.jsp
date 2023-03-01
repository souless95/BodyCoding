<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="/static/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
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
											<a href="productEdit.do?product_idx=${pItem.product_idx}">수정</a>
											<a href="productDelete.do?product_idx=${pItem.product_idx}">삭제</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<a href="/admin/product/productReigst">상품등록</a>
					</div>
			</main>
			<!-- bottom -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>	
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="/static/admin/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="/static/admin/js/datatables-simple-demo.js"></script>
</body>
</html>