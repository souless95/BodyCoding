<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		
	</script>
	<!-- top메뉴  -->
	<%@ include file="../inc/Top.jsp"%>
	<div id="container">
		<!-- side -->
		<%@ include file="../inc/mypageside.jsp"%>

		<div id="layoutSidenav_content">
			<div id="layoutSidenav_content">
				<div class="card mb-4">
					<div class="card-header">
						<h2>운동기록</h2>
					</div>

					<table id="datatablesSimple">
							<thead>
								<tr>
						         	<th>운동일자</th>
						         	<th>이용권 이름</th>
						         	<th>트레이너</th>
						         	<th>비고</th>
						      	</tr>
							</thead>
							<tbody>
					     	<c:forEach items="${exrecordlist }" var="row" varStatus="loop">
						      	<tr>
							        <td>${row.membership_name}
							        <td></td>
							        <td>${row.mem_name }</td>
							        <td></td>
							 		<td>
							        	<button type="button" class="btn btn-primary"
												onclick="location.href='memberdetailT.do?mem_id=${row.mem_id }'">
												상세보기</button>
							        </td>
							    </tr>
						    </c:forEach>
							</tbody>
							</table>
					<button type="button" onclick="location.href='trainermypage.do'">마이페이지 홈으로</button>
				</div>
			</div>
		</div>
		<!-- bottom -->
		<%@ include file="../inc/Bottom.jsp"%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../static/admin/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="../static/admin/js/datatables-simple-demo.js"></script>
</body>
</html>