<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<h2>자유게시판 관리</h2>
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
										<th>신고여부</th>
										<th>비공개여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${boardList }" var="row" varStatus="loop">
										<c:if test="${row.board_category eq '자유' }">
											<tr>
												<td>${row.board_idx }</td>
												<td>${row.mem_id }</td>
												<td>${row.board_category }</td>
												<td><a href="boardDetail.do?board_idx=${row.board_idx }">${row.board_title }</a></td>
												<td>${row.board_postdate }</td>
												<td>
													<c:if test="${not empty row.board_sfile }">
														<i class="bi bi-files"></i>
													</c:if>
												</td>
												<td>신고횟수 : ${row.count }</td>
												<td>비공개 : ${row.closed_chk }</td>
												
											</tr>
										</c:if>
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
</body>
</html>