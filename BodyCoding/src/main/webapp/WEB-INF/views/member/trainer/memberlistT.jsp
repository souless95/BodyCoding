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

</style>
<script>
</script>
<%@ include file="../../../../inc/Top.jsp" %>
</head>
<body class="sb-nav-fixed">
<div class="container">
	<div id="layoutSidenav">
		<!-- side -->
       <%@ include file ="../../../../inc/mypageside.jsp" %>
			<div id="layoutSidenav_content">
		        <main>
		        	<div class="card mb-4" style="width:80%;">
		        		<div class="card-header">
							<h2>회원 리스트</h2>
		        		</div>
		        		<div class="container-fluid" style="width:100%;">
							<table style="width:100%;">
							<thead>
								<tr>
						         	<th style="text-align:center">이메일(아이디)</th>
						         	<th style="text-align:center">이름</th>
						         	<th style="text-align:center">성별</th>
						         	<th style="text-align:center">생년월일</th>
						         	<th style="text-align:center">이용권 유형</th>
						         	<th style="text-align:center">이용권 이름</th>
						       	 	<th style="text-align:center">전화번호</th>
						       	  	<th style="text-align:center">가입일자</th>
						      	</tr>
							</thead>
							<tbody>
					     	<c:forEach items="${memberList }" var="row" varStatus="loop">
						      	<tr style="padding-top: 10px; padding-bottom: 10px;">
							        <td style="text-align:center;">
							        ${row.mem_id }</td>
							        <td style="text-align:center">${row.mem_name }</td>
							        <td style="text-align:center">${row.mem_gender }</td>
							        <td style="text-align:center">${row.mem_birth }</td>
							        <td style="text-align:center">${row.product_type }</td>
							        <td style="text-align:center">${row.product_name }</td>
							        <td style="text-align:center">${row.mem_phone }</td>
							        <td style="text-align:center">${row.mem_regidate }</td>
							        <td>
							       	<button type="button" 
										onclick="location.href='memberdetailT.do?mem_id=${row.mem_id }'">
									상세보기</button>
							        </td>
							    </tr>
						    </c:forEach>
							</tbody>
						</table>
	        		</div>
				</div>
			</main>
		</div>
	</div>
</div>
<%@ include file="../../../../inc/Bottom.jsp" %>
</body>
</html>