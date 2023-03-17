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


.table-header {
  text-align: center;
  font-weight: bold;
  background-color: #F7F7F7;
  border-bottom: 1px solid #DDD;
  vertical-align:middle;
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
		        	<div class="card mb-4" style="width:83%;">
		        		<div class="card-header"
		        			 style="height:75px; background-color:#99DFFD; vertical-align:middle;">
							<h2>회원 리스트</h2>
		        		</div>
		        		<div class="container-fluid" style="width:100%;">
							<table style="width:100%; height:50px; border:1px solid #D7D7D7; margin-top:15px; border-radius:7px;">
								<tr style="height:55px;">
								  <th class="table-header">이메일(아이디)</th>
								  <th class="table-header">이름</th>
								  <th class="table-header">성별</th>
								  <th class="table-header">생년월일</th>
								  <th class="table-header">이용권 유형</th>
								  <th class="table-header">이용권 이름</th>
								  <th class="table-header">전화번호</th>
								  <th class="table-header">가입일자</th>
								  <th class="table-header"></th>
								</tr>
					     	<c:forEach items="${memberList }" var="row" varStatus="loop">
						      	<tr style="padding-top:20px; padding-bottom:20px; height:50px;" >
							        <td style="text-align:center;">${row.mem_id }</td>
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