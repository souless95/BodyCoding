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
						<h2>공지사항 관리</h2>
					</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>공지 노출여부</th>
										<th>공지 제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>업로드 파일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${noticeList }" var="row" varStatus="loop">
										<c:if test="${row.board_category eq '공지' }">
											<tr>
												<td><input type="checkbox" name="노출여부" value="노출여부"></td>
												<td>${row.mem_id }</td>
												<td>${row.board_category }</td>
												<td><a href="boardDetail.do?board_idx=${row.board_idx }">${row.board_title }</a></td>
												<td>${row.board_postdate }</td>
												<td>
													<c:if test="${not empty row.board_sfile }">
														<i class="bi bi-files"></i>
													</c:if>
												</td>
												<td>신고횟수 : 0</td>
												<td>비공개 : N</td>
												
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
							<button type="button" class="btn btn-primary" onclick="location.href='main/admin'">홈으로</button>
							<!-- 신고게시판 관리로 이동 -->
							<button type="button" class="btn btn-danger" onclick="location.href=''">신고게시판</button>
						</div>
				</div>
			</main>
			<!-- bottom -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>
	</div>
	<!-- bottom -->
	<%@ include file ="../../admin/inc/bottom.jsp" %>
</body>
</html>