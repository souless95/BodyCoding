<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
	<link rel="stylesheet" href="../bootstrap5.2.3/css/bootstrap.css">
    <script src="../bootstrap5.2.3/js/bootstrap.bundle.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<%@ include file="../inc/Top.jsp"%>
</head>
<body>
	
	<div id="container">
		<!-- side -->
		<div id="layoutSidenav_content">
			<div id="layoutSidenav_content">
				<div class="card mb-4">
					<div class="card-header">
						<h2>게시글 등록</h2>
					</div>
						
					<form method="post" action="/updateboard.do">
						<div>
						<input type="hid-den" name="board_idx" value=${Freeboard.board_idx }>
							<div>
								<label for="board_title">제목입력</label>
								<input type="text" class="form-control" id="board_title" name="board_title" value="${Freeboard.board_title }" required>
							</div>
							
							<div>
								<label for="board_contents">내용 입력</label>
								<input type="text" class="form-control" id="board_contents" name="board_contents" value="${Freeboard.board_contents }" required>
							</div>
							
							<input type="submit" value="수정">
							<input type="reset" value="취소">
							<button type="button" onclick="location.href='Freeboard.do'">리스트</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- bottom -->
		<%@ include file="../inc/Bottom.jsp"%>
	</div>
</body>
</html>