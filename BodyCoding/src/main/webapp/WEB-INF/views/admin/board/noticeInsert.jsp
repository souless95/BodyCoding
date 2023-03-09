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
	<%@ include file="../../admin/inc/top.jsp"%>

	<div id="layoutSidenav">
		<!-- side -->
		<%@ include file="../../admin/inc/side.jsp"%>
		<div id="layoutSidenav_content">
			<main>
				<div class="card-header">
					<h2>공지사항 작성하기</h2>
	       		</div>
				<form action="/noticeInsert.do" method="post" enctype="multipart/form-data">
					<!-- idx숨겨놓기 -->
					<%-- <input type="hid-den" name="category" value="${dto.board_category }" />  --%>
					<input type="hidden" name="category" value="${board_category }" />
					<input type="hidden" name="board_postdate" value="${board_postdate }" />
					<input type="hidden" name="board_idx" value="${board_idx }" />
					<div class="card-body" style="width: 80%">
					    <table style="border: 2px solid black; border-left:0px; border-right:0px; width: 90%;">
					        <tr style="border-bottom: 3px solid black;">
					            <th width="20%">작성자</th>
					            <td width="20%">
					            	<input type="text" id="mem_id"value="${mem_id }" style="width: 130px; border: none;" readonly>
					            </td>
					        </tr>
					        <tr style="border-bottom: 1px solid gray;">
					            <th>제목</th>
					            <td colspan="3" style="padding-top: 5px; padding-bottom: 5px;">
									<input type="text" id="board_title" style="width: 600px;" placeholder="제목을 작성하세요">
								</td>
					        </tr>
					        <tr style="border-bottom: 1px solid gray;">
					            <th>내용</th>
					            <td colspan="4" style=" vertical-align: top; padding-top: 10px; padding-bottom: 10px; ">
						            <textarea id="board_contents"rows="15" cols="100" placeholder="내용을 작성하세요"></textarea>
					            </td> 
					        </tr>
					        <tr>
					        	<th colspan="2">
									<!-- multiple 속성추가 -->
								    <input type="file" name="board_ofile" placeholder="파일 선택"/>
					        	</th>
					        </tr>
					    </table>
					    <br />
			            <button type="submit" value="uploads" class="btn btn-primary">작성</button>
			            <button type="reset" class="btn btn-primary">리셋</button>
						<button type="button" class="btn btn-primary" onclick="history.back()">
			            	작성취소
			            </button>
					</div>
				</form>
	       	</main>
	    </div>
	</div>
	<!-- bottom -->
	<%@ include file ="../../admin/inc/bottom.jsp" %>
</body>
</html>