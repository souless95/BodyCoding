<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../static/admin/css/styles.css" rel="stylesheet" />
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
						<h2>지점 리스트</h2>
					</div>
<!-- 					<form method="get">
						<div>
							<input type="text" name="searchTxt" placeholder="검색어를 입력하세요." />
							<input type="submit" name="검색" />
						</div>
					</form> -->
					<button type="button" onclick="location.href='/gymRegist.do'">등록하기</button>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>지점코드</th>
									<th>지점명</th>
									<th>지점 전화번호</th>
									<th>지점 주소</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${gymList }" var="row" varStatus="loop">
									<tr>
										<td>${row.gym_code }</td>
										<td>${row.mem_name }</td>
										<td>${row.mem_phone }</td>
										<td>${row.mem_address }</td>
										<td>
											<a href="gymdetail.do?gym_code=${row.gym_code }">상세보기</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<button type="button" class="btn btn-primary" onclick="location.href='/gymRegist.do'">지점 등록</button>
						<button type="button" class="btn btn-primary" onclick="location.href='main/admin'">홈으로</button>
					</div>
				</div>
			</main>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../static/admin/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="../static/admin/js/datatables-simple-demo.js"></script>
</body>
</html>