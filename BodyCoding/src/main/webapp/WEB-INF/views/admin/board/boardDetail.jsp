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
					<h2>${dto.mem_id }작성글 상세보기 이지훈 작성</h2>
        		</div>
				<form name="writeFrm">
				<!-- idx숨겨놓기 -->
				<input type="hidden" name="idx" value="${dto.board_idx }" /> 
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
					        	<th>조회수</th>
					        	<td>${dto.board_visitcount }</td>
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
				            	<th>신고횟수</th>
				            	<td>0회</td>
				            	<th>비공개여부 </th>
				            	<td>N</td>
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
			            	뒤로가기
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