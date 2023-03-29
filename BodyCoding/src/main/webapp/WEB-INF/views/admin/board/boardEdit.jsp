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
					<h2>${dto.mem_id }작성글 상세보기</h2>
        		</div>
				<form action="/boardEdit.do" method="post" enctype="multipart/form-data">
					<!-- idx숨겨놓기 -->
					<!-- <input type="hid-den" name="board_category" id="board_category" value="공지" /> -->
					<input type="hid-den" name="board_idx" id="board_idx" value="${board.board_idx }" />
					<div class="card-body" style="width: 80%">
					    <table style="border: 2px solid black; border-left:0px; border-right:0px; width: 90%;">
					        <tr style="border-bottom: 3px solid black;">
					            <th width="20%">작성자</th>
					            <td width="20%">
					            	<input type="text" name="mem_id" id="mem_id" value="${board.mem_id }" style="width: 200px; border: none;" readonly>
					            </td>
					        </tr>
					        <tr style="border-bottom: 1px solid gray;">
					            <th>제목</th>
					            <td colspan="3" style="padding-top: 5px; padding-bottom: 5px;">
									<input type="text" name="board_title" id="board_title" style="width: 600px;" value="${board.board_title }">
								</td>
					        </tr>
					        <tr style="border-bottom: 1px solid gray;">
					            <th>내용</th>
								<td colspan="4" style=" vertical-align: top; padding-top: 10px; padding-bottom: 10px; ">
								    <textarea name="board_contents" id="board_contents" rows="15" cols="100">${board.board_contents}</textarea>
								</td>
					        </tr>
					        <tr>
					        	<th colspan="2">
									<!-- multiple 속성추가 -->
							   		<input type="file" id="board_file" name="board_file" value="${board.board_file }"/>
								    <c:set var="board_file" value="${not empty board.board_file}" />
								    첨부된 파일
								    <c:if test="${board_file}">
								        <img src="../static/uploads/board/${board.board_file}" />
								    	<input type="hid-den" id="board_file" name="board_file" value="${board.board_file }">
								    </c:if>
					        	</th>
					        </tr>
					    </table>
					    <br />
			            <button type="submit" value="uploads" class="custom-btn btn-1">작성</button>
			            <button type="reset" class="custom-btn btn-1">리셋</button>
						<button type="button" class="custom-btn btn-1" onclick="history.back()">
			            	작성취소
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