<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>트레이너의 마이페이지</title>
<style>
body{
	border: 1px;
}
#dataTablesSimple th {
	text-align: center;
}
</style>
<script>
</script>
<%@ include file="../../../../inc/Top.jsp" %>
</head>
<body>
	<div id="layoutSidenav">
		<!-- side -->
       <%@ include file ="../../../../inc/mypageside.jsp" %>
			<div id="layoutSidenav_content">
		        <main>
		        	<div class="card mb-4">
		        		<div class="card-header">
							<h2>회원 리스트</h2>
		        		</div>
		        		
					      		
		        		<div class="card-body">
							<table id="datatablesSimple">
							<thead>
								<tr>
						         	<th>이메일(아이디)</th>
						         	<th>이름</th>
						         	<th>성별</th>
						         	<th>생년월일</th>
						         	<th>이용권 유형</th>
						         	<th>이용권 이름</th>
						       	 	<th>전화번호</th>
						       	  	<th>가입일자</th>
						       	  	<th></th>
						      	</tr>
							</thead>
							<tbody>
					     	<c:forEach items="${memberList }" var="row" varStatus="loop">
						      	<tr>
							        <td>${row.mem_id }</td>
							        <td>${row.mem_name }</td>
							        <td>${row.mem_gender }</td>
							        <td>${row.mem_birth }</td>
							        <td>${row.product_type }</td>
							        <td>${row.product_name }</td>
							        <td>${row.mem_phone }</td>
							        <td>${row.mem_regidate }</td>
							        <td>
							        	<button type="button" class="btn btn-primary"
												onclick="location.href='memberdetailT.do?mem_id=${row.mem_id }'">
												상세보기</button>
							        </td>
							    </tr>
						    </c:forEach>
							</tbody>
							</table>
							<button type="button" onclick="location.href='main'">홈으로</button> 
		        		</div>
					</div>
				</main>
			<!-- bottom -->
			</div>
		</div>

<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>