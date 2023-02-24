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
<body class="sb-nav-fixed">
<!-- top메뉴  -->
<%@ include file ="../../admin/inc/top.jsp" %>
	<div id="layoutSidenav">
	<!-- side -->
	<%@ include file ="../../admin/inc/side.jsp" %>
		<div id="layoutSidenav_content">
			<main>
			
				<div class="card-header">
					<h2>${dto.mem_id }작성글 상세보기 </h2>
        		</div>
				<form name="writeFrm">
				<!-- idx숨겨놓기 -->
				<input type="hidden" name="idx" value="${dto.board_idx }" /> 
					<div class="card-body" style="width: 80%">
					    <table border="1" width="90%">
					        <tr>
					            <th>번호</th>
					            <td>${dto.board_idx }</td>
					            <th>작성자</th>
					            <td>${dto.mem_id }</td>
					            <th>작성일</th>
					            <td>${dto.board_postdate }</td>
					        </tr>
					        <tr>
					            <th>제목</th>
					            <td colspan="3">${dto.board_title }</td>
					        </tr>
					        <tr>
					            <th>내용</th>
					            <td colspan="3" height="100">
									${dto.board_contents }
					            </td> 
					        </tr>
					        <tr>
					        	<th>조회수</th>
					        	<td>${dto.board_visitcount }</td>
					        </tr>
					        <tr>
					        	<th>Ofile</th>
					        	<td>${dto.board_ofile }</td>
					        	<th>Sfile</th>
					        	<td>${dto.board_sfile }</td>
					        </tr>
					        <tr>
					            <td colspan="4" align="center">
					            <button type="button" class="btn btn-primary" onclick="location.href='boardDelete.do?board_idx=${dto.board_idx }'">
									삭제
								</button>
					            </td>
					        </tr>
					    </table>
					</div>
				</form>
			</main>
		</div>
	</div>
</body>
</html>