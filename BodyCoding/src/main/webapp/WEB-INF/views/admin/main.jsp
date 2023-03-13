<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>BodyCoding - Admin</title>
</head>
<body class="sb-nav-fixed">
	<!-- top -->
	<%@ include file="../admin/inc/top.jsp"%>

	<div id="layoutSidenav">
		<!-- side -->
		<%@ include file="../admin/inc/side.jsp"%>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Body Coding - Admin</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">
						</li>
					</ol>
					<!-- 데이터 차트 보여주는 부분 -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-area me-1"></i> 
								</div>
								<div class="card-body">
									<c:import url="../admin/chart/supMainChart.jsp" />
								</div>
							</div>
						</div>
						<s:authorize access="hasRole('ROLE_ADMIN_SUB')">
							<div class="col-xl-12">
								<div class="card mb-4">
									<div class="card-header">
										<i class="fas fa-chart-bar me-1"></i>
									</div>
									<div class="card-body">
										<c:import url="../admin/chart/subMainChart.jsp" />
									</div>
								</div>
							</div>  
						</s:authorize>
					</div>
					<s:authorize access="hasRole('ROLE_ADMIN_SUPER')">
						<div class="row">
							<div class="col-xl-4 col-md-6">
								<div class="card bg-primary text-white mb-4">
									<div class="card-body">Primary Card</div>
									<div
										class="card-footer d-flex align-items-center justify-content-between">
										<a class="small text-white stretched-link"
											href="/gymadminlist.do">GYM관리</a>
										<div class="small text-white">
											<i class="fas fa-angle-right"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-4 col-md-6">
								<div class="card bg-primary text-white mb-4">
									<div class="card-body">Warning Card</div>
									<div
										class="card-footer d-flex align-items-center justify-content-between">
										<a class="small text-white stretched-link"
											href="/trainerList.do">트레이너관리</a>
										<div class="small text-white">
											<i class="fas fa-angle-right"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-4 col-md-6">
								<div class="card bg-primary text-white mb-4">
									<div class="card-body">Success Card</div>
									<div
										class="card-footer d-flex align-items-center justify-content-between">
										<a class="small text-white stretched-link"
											href="/memberList.do">회원관리</a>
										<div class="small text-white">
											<i class="fas fa-angle-right"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-4 col-md-6">
								<div class="card bg-warning text-white mb-4">
									<div class="card-body">Success Card</div>
									<div
										class="card-footer d-flex align-items-center justify-content-between">
										<a class="small text-white stretched-link"
											href="/noticeList.do">공지사항 관리</a>
										<div class="small text-white">
											<i class="fas fa-angle-right"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-4 col-md-6">
								<div class="card bg-warning text-white mb-4">
									<div class="card-body">Success Card</div>
									<div
										class="card-footer d-flex align-items-center justify-content-between">
										<a class="small text-white stretched-link" href="#!">이벤트 관리</a>
										<div class="small text-white">
											<i class="fas fa-angle-right"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-4 col-md-6">
								<div class="card bg-warning text-white mb-4">
									<div class="card-body">Success Card</div>
									<div
										class="card-footer d-flex align-items-center justify-content-between">
										<a class="small text-white stretched-link" href="/boardList.do">게시판
											관리</a>
										<div class="small text-white">
											<i class="fas fa-angle-right"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-4 col-md-6">
								<div class="card bg-danger text-white mb-4">
									<div class="card-body">Danger Card</div>
									<div
										class="card-footer d-flex align-items-center justify-content-between">
										<a class="small text-white stretched-link"
											href="/productList.do">상품관리</a>
										<div class="small text-white">
											<i class="fas fa-angle-right"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-4 col-md-6">
								<div class="card bg-danger text-white mb-4">
									<div class="card-body">Danger Card</div>
									<div
										class="card-footer d-flex align-items-center justify-content-between">
										<a class="small text-white stretched-link"
											href="/admin/product/stockList">재고관리</a>
										<div class="small text-white">
											<i class="fas fa-angle-right"></i>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</s:authorize>
				</div>
			</main>
			<!-- bottom -->
			<%@ include file="../admin/inc/bottom.jsp"%>
		</div>
	</div>
</body>
</html>
