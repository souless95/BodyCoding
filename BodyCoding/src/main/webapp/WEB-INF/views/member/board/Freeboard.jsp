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
</head>
<body>
	<!-- Header -->
	<%@ include file="../../../../inc/Top.jsp" %>
	<div class="container">
		<button type="button" onclick="location.href='main'">홈으로</button> 
		<button type="button" onclick="location.href='insertboard.do'">글쓰기</button>
		<table class="table table-hover table-striped">
            <thead class="table-dark text-center">
                <tr>
                    <td>번호</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>작성일</td>
                    <td>조회수</td>
                    <td>첨부</td>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${Freeboard }" var="row" varStatus="loop">
	                <tr style="width:100%;">
	                    <td>${row.board_idx }</td>
	                    
	                    <td><a href="detailmemberboard.do?board_idx=${row.board_idx }">${row.board_title }</a></td>
	                    <td class="text-center">${row.mem_id }</td>
	                    <td class="text-center">${row.board_postdate }</td>
	                    <td class="text-center">${row.board_visitcount }</td>
	                    <td class="text-center"><i class="bi bi-pin-angle-fill"></i></td>
	                </tr>
	            </c:forEach>
            </tbody>
        </table>
	</div>
	<!-- footer -->
	<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>