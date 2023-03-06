<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="sb-nav-fixed">
	<!-- top메뉴  -->
	<%@ include file="../../admin/inc/top.jsp"%>

	<div id="layoutSidenav">
		<!-- side -->
	<%@ include file="../../admin/inc/side.jsp"%>
	
		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<h2>지점 리스트</h2>
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>지점코드</th>
									<th>지점명</th>
									<th>지점 전화번호</th>
									<th>지점 주소</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${gymList }" var="row" varStatus="loop">
									<tr>
										<td>${row.gym_code }</td>
										<td>${row.mem_name }</td>
										<td>${row.mem_phone }</td>
										<td>${row.mem_address }</td>
										<td>
												<a href="gymdetail.do?gym_code=${row.gym_code }">상세보기</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<s:authorize access="hasRole('ROLE_ADMIN_SUPER')">
							<button type="button" class="btn btn-primary" onclick="location.href='/admin/gym/gymRegist'">지점 등록</button>
						</s:authorize>
							<button type="button" class="btn btn-primary" onclick="location.href='main/admin'">홈으로</button>
					</div>
				</div>
			</main>
			<!-- bottom -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>
	</div>
</body>
</html>