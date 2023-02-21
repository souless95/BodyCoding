<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h2 class="mt-4">지점리스트</h2>
		        	</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<form method="get">
								<div>
									<input type="text" name="searchTxt" placeholder="검색어를 입력하세요." />
									<input type="submit" name="검색" />
								</div>
							</form>
							<thead>
							<tr>
								<th>지점코드</th>
								<th>평수</th>
								<th>운영시간 : 평일_시작</th>
								<th>운영시간 : 평일_종료</th>
								<th>운영시간 : 토요일_시작</th>
								<th>운영시간 : 토요일_종료</th>
								<th>운영시간 : 공휴일_시작</th>
								<th>운영시간 : 공휴일_종료</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${gymList }" var="row" varStatus="loop">
								<tr>
									<td>${row.GYM_CODE }</td>
									<td>${row.GYM_SCALE }</td>
									<td>${row.GYM_DTAIL_IMG }</td>
									<td>${row.RTIME_WEEK_START }</td>
									<td>${row.RTIME_WEEK_END }</td>
									<td>${row.RTIME_SAT_START }</td>
									<td>${row.RTIME_SAT_END }</td>
									<td>${row.RTIME_HOLY_START }</td>
									<td>${row.RTIME_HOLY_END }</td>
									<td>
										<button type="button" class="btn btn-primary" onclick="location.href='view.do?GYM_CODE=${row.GYM_CODE }'">
											상세보기
										</button>
									</td>
								</tr>
							</c:forEach>
							<button type="button" class="btn btn-success" onclick="location.href='regist.do'">
								지점등록
							</button>
							<button type="button" class="btn btn-danger" onclick="location.href='trainerList.do'">
								트레이너 관리
							</button>
							
							</tbody>
						</table>
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