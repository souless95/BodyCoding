<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<h2>${trainerList.mem_name } 트레이너 상세보기</h2>
	        		</div>
	        		<div class="card-body" style="width: 80%">
	        			<h4>프로필 사진</h4>
	        			<div>
	        				<img src="static/uploads/trainer/${trainerList.mem_img }" style="width:200px; height:200px;">
	        			</div>
	        			<br />
	        			<input type="hidden" name="mem_id" id="mem_id" value="${userIdT}" />
	        			<input type="hidden" name="mem_id" id="mem_id" value="${adminGym}" />
	        			<input type="hidden" name="mem_id" id="mem_id" value="${trainerList.gym_code}" />
	        			<table class="table" border="2">
							<tr>
					         	<th>센터코드</th>
						        <td>${trainerList.gym_code }</td>
					         	<th colspan="2">이메일(아이디)</th>
						        <td>${trainerList.mem_id }</td>
					         	<th>이름</th>
						        <td>${trainerList.mem_name }</td>
					        </tr>
	        			</table>
						<table class="table" border="2">
					        <tr>
					         	<th>성별</th>
						        <td>${trainerList.mem_gender }</td>
					         	<th colspan="2">생년월일</th>
						        <td>${trainerList.mem_birth }</td>
					        </tr>
					       	<tr>
					       	 	<th>전화번호</th>
						        <td>${trainerList.mem_phone }</td>
					       	 	<th colspan="2">주소</th>
						        <td>${trainerList.mem_address }</td>
					      	</tr>
						    <tr>
					       	 	<th>계정상태</th>
						        <td>${trainerList.enabled }</td>
						    </tr>
						</table>
						
						<table class="table" border="2">	
					      	<tr>
					       	 	<th>경력</th>
						        <td>${trainerList.mem_career }</td>
					       	 	<th>키워드</th>
						        <td>${trainerList.mem_interest }</td>
					      	</tr>
					      	<tr>
					       	 	<th>자기소개</th>
						        <td>${trainerList.mem_comment }</td>
					      	</tr>
						</table>
							<c:if test="${trainerList.gym_code eq adminGym }">
								<button id="editBtn" type="button" class="custom-btn btn-7" onclick="location.href='/admin/trainer/trainerEdit?mem_id=${trainerList.mem_id }'">
									수정
								</button>
								<button id="deleteBtn" type="button" class="custom-btn btn-7" onclick="location.href='trainerdelete.do?mem_id=${trainerList.mem_id }'">
									삭제
								</button>
							</c:if>
								<button type="button" class="custom-btn btn-7" onclick="location.href='/main/admin'">홈으로</button> 
								<button type="button" class="custom-btn btn-7" onclick="history.back()">뒤로가기</button>
	        		</div>
				</div>
			</main>
		<!-- bottom -->
		<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>
	</div>
</body>
</html>