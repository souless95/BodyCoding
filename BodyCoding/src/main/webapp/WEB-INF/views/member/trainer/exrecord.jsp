<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
<div class="container">
	<div id="container">
		<!-- side -->
		<%@ include file="../../../../inc/mypageside.jsp"%>

		<div id="layoutSidenav_content">
			<div id="layoutSidenav_content">
				<div class="card mb-4">
					<div class="card-header">
						<h2>운동기록 리스트</h2>
					</div>
					<br>
					<div class="container">
						<table style="width:80%;">
							<thead>
								<tr>
						         	<th>일자</th>
						         	<th>이용권 유형</th>
						         	<th>이용권 이름</th>
						         	<th>회원이름</th>
						         	<th>특이사항</th>
						      	</tr>
							</thead>
							<tbody>
						     	<c:forEach items="${memberList }" var="row" varStatus="loop">
							      	<tr>
								        <td>${row.training_date }</td>
								        <td>${row.product_name }</td>
								        <td>${row.product_description }
								        <td>${row.mem_name}</td>
								        <td>${row.training_comment }</td>
								        <td>
								        	<button type="button" onclick="location.href='editexrecord.do?training_log_idx=${row.training_log_idx}'">수정</button>
								        </td>
								    </tr>
							    </c:forEach>
							</tbody>
						</table>
							<button type="button" onclick="location.href='addexrecord.do'">등록</button>
							
	        		</div>	
				</div>
			</div>
		</div>
		</div>
		<!-- bottom -->
		<%@ include file="../../../../inc/Bottom.jsp"%>
	</div>
</body>
</html>