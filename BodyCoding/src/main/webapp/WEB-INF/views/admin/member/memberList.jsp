<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../static/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<!-- top메뉴  -->
	<%@ include file ="../../admin/inc/top.jsp" %>
	
		<div id="layoutSidenav">
		<!-- side -->
        <%@ include file ="../../admin/inc/side.jsp" %>
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
						         	<th>센터</th>
						         	<th>이메일(아이디)</th>
						         	<th>이름</th>
						         	<th>성별</th>
						         	<th>생년월일</th>
						       	 	<th>전화번호</th>
						       	  	<th>가입일자</th>
						       	  	<th></th>
						      	</tr>
							</thead>
							<tbody>
					     	<c:forEach items="${memberList }" var="row" varStatus="loop">
						      	<tr>
							        <td>${row.gym_code }</td>
							        <td>${row.mem_id }</td>
							        <td>${row.mem_name }</td>
							        <td>${row.mem_gender }</td>
							        <td>${row.mem_birth }</td>
							        <td>${row.mem_phone }</td>
							        <td>${row.mem_regidate }</td>
							        <td>
							        	<button type="button" class="btn btn-primary"
												onclick="location.href='detail.do?mem_id=${row.mem_id }'">
												상세보기</button>
							        	<%-- <a href="detail.do?mem_id=${row.mem_id }">상세보기</a> --%>
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
	<button type="button" onclick="location.href='main/admin'">홈으로</button> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../static/admin/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="../static/admin/js/datatables-simple-demo.js"></script>   
	
</body>
</html>