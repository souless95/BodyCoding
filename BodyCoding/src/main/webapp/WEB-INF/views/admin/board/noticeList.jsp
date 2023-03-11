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
<style type="text/css">
input[type=checkbox]{
	height: 0;
	width: 0;
	visibility: hidden;
}

label {
  cursor: pointer;
  text-indent: -9999px;
  width: 40px;
  height: 25px;
  background: grey;
  display: block;
  border-radius: 100px;
  position: relative;
}

label:after {
  content: '';
  position: absolute;
  top: 5px;
  left: 5px;
  width: 15px;
  height: 15px;
  background: #fff;
  border-radius: 90px;
  transition: 0.3s;
}

input:checked + label {
  background: #bada55;
}

input:checked + label:after {
  left: calc(100% - 5px);
  transform: translateX(-100%);
}

label:active:after {
  width: 10px;
}


// centering
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}
</style>
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
						<h2>공지사항 관리</h2>
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th width="10%">공지게시여부</th>
									<th width="10%">카테고리</th>
									<th width="30%">공지 제목</th>
									<th width="20%">작성자</th>
									<th width="10%">작성일</th>
									<th width="*">업로드 파일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noticeList }" var="row" varStatus="loop">
									<c:if test="${row.board_category eq '공지' }">
										<tr>
											<td class="switches">
												<input type="checkbox" id="switch" name="closed_chk" value="closed_chk" data-board-idx="${row.board_idx}" ${row.closed_chk == 'Y' ? 'checked' : ''}>
												<label for="switch">Toggle</label>
											</td>
											<td>${row.board_category }</td>
											<td><a href="noticeDetail.do?board_idx=${row.board_idx }">${row.board_title }</a></td>
											<td>${row.mem_id }</td>
											<td>${row.board_postdate }</td>
											<td>
												<c:if test="${not empty row.board_file }">
													<i class="bi bi-files"></i>
												</c:if>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
						<button type="button" class="btn btn-primary" onclick="location.href='/noticeInsert.do'">공지 작성</button>
						<button type="button" class="btn btn-primary" onclick="location.href='main/admin'">홈으로</button>
					</div>
				</div>
			</main>
		</div>
	</div>
	<!-- bottom -->
	<%@ include file ="../../admin/inc/bottom.jsp" %>
	
</body>
</html>