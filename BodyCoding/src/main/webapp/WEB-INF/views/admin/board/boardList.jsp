<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
//noticeList.js
$(document).ready(function(){
    $('input[name="closed_chk"]').click(function() {
        var checkbox = $(this);
        var boardIdx = checkbox.data('board-idx');
        var isChecked = checkbox.is(':checked') ? 'Y' : 'N'; // 체크 여부에 따라 값 설정
        console.log(boardIdx);
        console.log(isChecked);
        
        $.ajax({
            url: 'updateNoticeStatus.do',
            contentType: "application/json; charset=utf-8",
            data: {
            	board_idx: boardIdx,
            	closed_chk: isChecked
            },
            dataType:'text',
            success: function(result) {
            	
            },
            error: function(request, status, error) {
                console.log(error)
            }
        });
    });
});
</script>
</head>
<body>
	<!-- top메뉴  -->
	<%@ include file="../../admin/inc/top.jsp"%>

	<div id="layoutSidenav">
		<!-- side -->
	<%@ include file="../../admin/inc/side.jsp"%>
	
		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<h2>자유게시판 관리</h2>
					</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>비공개여부</th>
										<th>번호</th>
										<th>작성자</th>
										<th>카테고리</th>
										<th>제목</th>
										<th>작성일</th>
										<th>업로드 파일</th>
										<th>신고횟수</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${boardList }" var="row" varStatus="loop">
										<c:if test="${row.board_category eq '자유' }">
											<tr>
												<td>
													<input type="checkbox" name="closed_chk" value="closed_chk" data-board-idx="${row.board_idx}" ${row.closed_chk == 'Y' ? 'checked' : ''}>
												</td>
												<td>${row.board_idx }</td>
												<td>${row.mem_id }</td>
												<td>${row.board_category }</td>
												<td><a href="boardDetail.do?board_idx=${row.board_idx }">${row.board_title }</a></td>
												<td>${row.board_postdate }</td>
												<td>
													<c:if test="${not empty row.board_file }">
														<i class="bi bi-files"></i>
													</c:if>
												</td>
												<td>
													<c:if test="${row.count >= 5 }">
														<span style="color: red;">신고횟수 : ${row.count }</span>
													</c:if>
													<c:if test="${row.count < 5 }">
													  	<span style="color: black;">신고횟수 : ${row.count}</span>
													</c:if>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
							<button type="button" class="custom-btn btn-2" onclick="location.href='main/admin'">홈으로</button>
						</div>
				</div>
			</main>
			<!-- bottom -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>
	</div>
</body>
</html>