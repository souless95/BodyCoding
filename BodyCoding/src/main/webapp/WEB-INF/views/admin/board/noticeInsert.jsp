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
					<!-- <input type="hid-den" name="board_category" id="board_category" value="공지" /> -->
					<div class="card-body" style="width: 80%">
					    <table style="border: 2px solid black; border-left:0px; border-right:0px; width: 90%;">
					        <tr style="border-bottom: 3px solid black;">
					            <th width="20%">작성자</th>
					            <td width="20%">
					            	<input type="text" name="mem_id" id="mem_id" value="${mem_id }" style="width: 100px; border: none;" readonly>
					            </td>
					        </tr>
					        <tr style="border-bottom: 1px solid gray;">
					            <th>제목</th>
					            <td colspan="3" style="padding-top: 5px; padding-bottom: 5px;">
									<input type="text" name="board_title" id="board_title" style="width: 600px;" placeholder="제목을 작성하세요">
								</td>
					        </tr>
					        <tr style="border-bottom: 1px solid gray;">
					            <th>내용</th>
					            <td colspan="4" style=" vertical-align: top; padding-top: 10px; padding-bottom: 10px; ">
						            <textarea name="board_contents" id="board_contents"rows="15" cols="100" placeholder="내용을 작성하세요"></textarea>
					            </td> 
					        </tr>
					        <tr>
					        	<th colspan="2">
									<!-- multiple 속성추가 -->
								   <input type="file" id="board_file" name="board_file"/>
					        	</th>
					        </tr>
					    </table>
					    <br />
			            <button type="submit" value="uploads" class="custom-btn btn-2">작성</button>
			            <button type="reset" class="custom-btn btn-2">리셋</button>
						<button type="button" class="custom-btn btn-2" onclick="history.back()">
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