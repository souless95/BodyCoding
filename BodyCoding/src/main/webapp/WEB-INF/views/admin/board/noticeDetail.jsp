<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				<!-- idx숨겨놓기 -->
				<input type="hidden" name="idx" value="${dto.board_idx }" /> 
				<input type="hidden" name="category" value="${dto.board_category }" /> 
				<input type="hidden" name="category" value="${dto.mem_id }" /> 
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
							    <c:set var="board_file" value="${not empty dto.board_file}" />
							    <c:if test="${board_file}">
							    	<div>
							        	<img src="../static/uploads/board/${dto.board_file}" style="width: 100%"/>
							    	</div>
							    </c:if>
							</td>
				        </tr>
				        <tr style="text-align: center">
				        	<th>첨부된 파일명</th>
				        	<td>${dto.board_file }</td>
				        </tr>
				    </table>
				    <br />
		            <button type="button" class="custom-btn btn-1" 
		            	onclick="if(confirm('정말로 삭제하시겠습니까?')) location.href='noticeDelete.do?board_idx=${dto.board_idx }'">
						삭제
					</button>
		            <button type="button" class="custom-btn btn-1" onclick="location.href='admin/board/noticeEdit?board_idx=${dto.board_idx }'">
						수정
					</button>
					<button type="button" class="custom-btn btn-1" onclick="history.back()">
		            	이전으로
		            </button>
		            <button type="button" class="custom-btn btn-1" onclick="location.href='main/admin'">
		            	홈으로
		            </button>
				</div>
			</main>
			<!-- top메뉴  -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>
	</div>

</body>
</html>