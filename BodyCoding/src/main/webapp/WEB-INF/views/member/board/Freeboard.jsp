<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../bootstrap5.2.3/css/bootstrap.css">
    <script src="../bootstrap5.2.3/js/bootstrap.bundle.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
</head>
<body>
	<!-- Header -->
	<%@ include file="../../member/inc/Top.jsp" %>
	
	<!-- body부분 -->
	<!-- 자유게시판 리스트가 나와야 하는 부분임 -->
	<div class="container">
		<table class="table table-hover table-striped">
            <thead class="table-dark text-center">
                <tr>
                    <th style="width: 8%;">번호</th>
                    <th style="width: 60%;">제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>첨부</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${boardList }" var="row" varStatus="loop">
	                <tr>
	                    <td>${row.board_idx }</td>
	                    <td><a href="#">${row.board_title }</a></td>
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
	<%@ include file="../../member/inc/Bottom.jsp" %>
</body>
</html>