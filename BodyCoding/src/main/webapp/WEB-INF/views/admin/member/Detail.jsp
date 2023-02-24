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
	        	<div class="card mb-4" style="border-bottom: none;">
	        		<div class="card-header">
						<h2>${dto.mem_name } 회원 상세보기</h2>
	        		</div>
	        		<div class="card-body" style="width: 80%">
	        			<h4>기본정보</h4>
						<table class="table" border=2>
							<tr>
					         	<th>센터</th>
					         	<td>${dto.gym_code }</td>
					         	<th>이메일(아이디)</th>
					         	<td>${dto.mem_id }</td>
					       	  	<th>가입일자</th>
					       	  	<td>${dto.mem_regidate }</td>
					      	</tr>
					      	<tr>
					         	<th>이름</th>
					         	<td>${dto.mem_name }</td>
					         	<th>성별</th>
					         	<td>${dto.mem_gender }</td>
					         	<th>생년월일</th>
					         	<td>${dto.mem_birth }</td>
					      	</tr>
						</table>
					    <table class="table" border=2>
					      	<tr>
					       	 	<th>전화번호</th>
					       	 	<td>${dto.mem_phone }</td>
					       	 	<th>주소</th>
						        <td>${dto.mem_address }</td>
					      	</tr>
					      	<tr>
					       	 	<th>보유포인트</th>
					       	 	<td>${dto.mem_point }</td>
					      	</tr>
					    </table>
					    <table class="table" border=2>
					      	<tr>
					       	 	<th>키</th>
					       	 	<th>체중</th>
					       	 	<th>보유질병</th>
					       	</tr>
					       	<tr>
					       	 	<td>${dto.mem_height }</td>
					       	 	<td>${dto.mem_weight }</td>
					       	 	<td>${dto.mem_disease }</td>
					       	</tr>
					       	<tr>
					       	 	<th>운동목적</th>
					       	 	<th>관심사</th>
					       	 	<th>방문경로</th>
					       	</tr>
					       	<tr>
					       	 	<td>${dto.mem_purpose }</td>
					       	 	<td>${dto.mem_interest }</td>
					       	 	<td>${dto.mem_inflow }</td>
					       	</tr>
					       	<tr>
					       	 	<th>계정상태</th>
					       	 	<td>${dto.mem_status }</td>
					       	</tr>
					    </table>
	        			<button type="button" class="btn btn-primary" onclick="location.href='gymedit.do?gym_code=${dto.gym_code }'">
							수정
						</button>
						<button type="button" class="btn btn-primary" onclick="location.href='gymdelete.do?gym_code=${dto.gym_code }'">
							삭제
						</button>
						<button type="button" class="btn btn-primary" onclick="location.href='main/admin'">홈으로</button> 
	        		</div>
				</div>
			</main>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../static/admin/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="../static/admin/js/datatables-simple-demo.js"></script>   
</body>
</html>