<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../static/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

</head>
<body>
	<!-- top메뉴  -->
	<%@ include file="../../admin/inc/top.jsp"%>

	<div id="layoutSidenav">
		<!-- side -->
	<%@ include file="../../admin/inc/side.jsp"%>
	
		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<h2>자유게시판 게시글 리스트</h2>
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>번호</th>
									<th>작성자</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>작성일</th>
									<th>업로드 파일</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList }" var="row" varStatus="loop">
									<tr>
										<td>${row.board_idx }</td>
										<td>${row.mem_id }</td>
										<td>${row.board_category }</td>
										<td><a href="boardDetail.do?board_idx=${row.board_idx }">${row.board_title }</a></td>
										<td>${row.board_postdate }</td>
										<td>${row.board_sfile }</td>
										<td></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<button type="button" class="btn btn-primary" onclick="location.href='main/admin'">홈으로</button>
					</div>
				</div>
			</main>
			<!-- bottom -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../static/admin/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="../static/admin/js/datatables-simple-demo.js"></script>
</body>
</html>