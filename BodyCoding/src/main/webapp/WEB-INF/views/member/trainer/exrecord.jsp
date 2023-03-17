<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<<<<<<< HEAD
=======
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
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
>>>>>>> branch 'main' of https://github.com/souless95/BodyCoding.git
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
<div class="container">
	<div class="sub_container">
		<div id="container">
			<!-- side -->
			<%@ include file="../../../../inc/mypageside.jsp"%>
	
			<div id="layoutSidenav_content">
				<div id="layoutSidenav_content">
					<div class="card mb-4">
						<div class="card-header" style="height:75px; background-color:#99DFFD; vertical-align:middle;">
							<h2>운동기록 리스트</h2>
						</div>
					<br>
					<div class="container">
						<table style="width:80%;">
							<thead>
								<tr>
						         	<th>회원명</th>
						         	<th>분류</th>
						         	<th>일시</th>
						         	<th>코멘트</th>
						      	</tr>
							</thead>
							<tbody>
						     	<c:forEach items="${TlList }" var="row" varStatus="loop">
							      	<tr>
							      		
								        <td>${row.mem_name}</td>
								        <td>${row.exercise_type }</td>
								        <td>${row.training_date }</td>
								        <td>
								        	<form action="editExrecord.do">
									        	<input type="hidden" name="training_log_idx" value="${row.training_log_idx }" />
									        	<input type="text" name="training_comment" value="${row.training_comment }" />
									        	<button type="submit">저장</button>
								        	</form>
								        </td>
								    </tr>
							    </c:forEach>
							</tbody>
						</table>
	        		</div>	
				</div>
			</div>
			</div>
		</div>
		<!-- bottom -->
	</div>
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>