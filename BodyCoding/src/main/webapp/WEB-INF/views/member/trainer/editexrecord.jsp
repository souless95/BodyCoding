<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<%@ include file="../../../../inc/Top.jsp"%>
<script type="text/javascript">
function editRecord(training_log_idx) {
	  if (confirm("게시글을 수정하시겠습니까?")) {
	    location.href = "editexrecord.do?training_log_idx=" + training_log_idx;
	  }
	}

	function deleteRecord(training_log_idx) {
	  if (confirm("게시글을 삭제하시겠습니까?")) {
	    location.href = "deleteexrecord.do?training_log_idx=" + training_log_idx;
	  }
	}
</script>
</head>
<body>
	<div id="container">
		<!-- side -->
		<%@ include file="../../../../inc/mypageside.jsp"%>

		<div id="layoutSidenav_content">
			<div id="layoutSidenav_content">
				<div class="card mb-4">
					<div class="card-header">
						<h2>운동기록 수정</h2>
					</div>

					<div class="container">
						<table style="width:70%;">
							<thead>
								<tr>
									<th>일자</th>
									<th>이용권 유형</th>
									<th>이름</th>
									<th>회원이름</th>
									<th>특이사항</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${memberList.training_date }</td>
									<td>${memberList.product_name }</td>
									<td>${memberList.product_description }
									<td>${memberList.mem_name}</td>
									<td>${memberList.training_comment }</td>
								</tr>
							</tbody>
						</table>
					</div>


					<form method="post" action="/editexrecord.do" id="edit-form">
						<input type="hidden" name="training_log_idx"
							value="${memberList.training_log_idx }">
						<div>
							<div>
								<label for="training_comment">특이사항</label> <input type="text"
									class="form-control" id="training_comment"
									name="training_comment" value="${memberList.training_comment }"
									required>
							</div>
							
							<button type="submit" onclick="return confirm('게시글을 수정하시겠습니까?')">수정</button>
							
							<%-- <button type="button"
								onclick="deleteRecord(${memberList.training_log_idx})">삭제</button>--%>
							<button type="button" onclick="location.href='exrecord.do'">리스트</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- bottom -->
		<%@ include file="../../../../inc/Bottom.jsp"%>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../static/admin/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="../static/admin/js/datatables-simple-demo.js"></script>
</body>
</html>