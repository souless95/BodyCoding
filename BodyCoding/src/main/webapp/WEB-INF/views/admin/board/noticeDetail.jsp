<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<h2>공지사항 상세보기</h2>
        		</div>
				<form name="writeFrm">
				<!-- idx숨겨놓기 -->
				<input type="hid-en" name="idx" value="${dto.board_idx }" /> 
				<input type="hid-den" name="category" value="${dto.board_category }" /> 
				<input type="hid-den" name="category" value="${dto.mem_id }" /> 
					<div class="card-body" style="width: 80%">
					    <table style="border: 2px solid black; border-left:0px; border-right:0px; width: 90%;">
					        <tr style="border-bottom: 3px solid black;">
					            <th width="10%">번호</th>
					            <td width="10%">${dto.board_idx }</td>
					            <th width="20%">작성자</th>
					            <td width="20%">${dto.mem_id }</td>
					            <th width="20%">작성일</th>
					            <td width="*">${dto.board_postdate }</td>
					        </tr>
					        <tr style="border-bottom: 1px solid gray;">
					            <th>제목</th>
					            <td colspan="3" style="padding-top: 5px; padding-bottom: 5px;">${dto.board_title }</td>
					        </tr>
					        <tr style="border-bottom: 1px solid gray;">
					            <th>내용</th>
					            <td colspan="4" style="height: 300px; vertical-align: top; padding-top: 10px; padding-bottom: 10px; ">
						            ${fn:replace(dto.board_contents, replaceChar, "<br/>")}
					            </td> 
					        </tr>
					        <tr style="text-align: center">
					        	<th>Ofile</th>
					        	<td>${dto.board_ofile }</td>
					        	<th>Sfile</th>
					        	<td>${dto.board_sfile }</td>
					        </tr>
					    </table>
					    <br />
			            <button type="button" class="btn btn-primary" onclick="location.href='boardDelete.do?board_idx=${dto.board_idx }'">
							삭제
						</button>
			            <button type="button" class="btn btn-primary" onclick="location.href='boardEdit.do?board_idx=${dto.board_idx }'">
							수정
						</button>
						<button type="button" class="btn btn-primary" onclick="history.back()">
			            	이전 페이지
			            </button>
			            <button type="button" class="btn btn-primary" onclick="location.href='main/admin'">
			            	홈으로
			            </button>
					</div>
				</form>
			</main>
			<!-- top메뉴  -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>
	</div>

</body>
</html>