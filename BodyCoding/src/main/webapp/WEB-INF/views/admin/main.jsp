<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>BodyCoding - Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="/static/admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
    	<!-- top -->
    	<%@ include file ="../admin/inc/top.jsp" %>
        
        <div id="layoutSidenav">
        	<!-- side -->
        	<%@ include file ="../admin/inc/side.jsp" %>
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">바디코딩 Body Coding - Admin</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">로그인된 아이디 나오는 곳</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Primary Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/gymadminlist.do">지점관리</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Warning Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/trainerList.do">트레이너관리</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Success Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/memberList.do">회원관리</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Danger Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">상품관리</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 메인에서 보여주는 멤버리스트 -->
                        <div class="card mb-4">
			        		<div class="card-header">
								<h2>전체 회원 리스트</h2>
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
								        	<button type="button" class="btn btn-primary" onclick="location.href='detail.do?mem_id=${row.mem_id }'">
													상세보기
											</button>
								        </td>
								    </tr>
							    </c:forEach>
								</tbody>
								</table>
			        		</div>
						</div>
                    </div>
                    
                    <!-- 데이터 차트 보여주는 부분 -->
                    <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../static/admin/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../static/admin/assets/demo/chart-area-demo.js"></script>
        <script src="../static/admin/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="../static/admin/js/datatables-simple-demo.js"></script>
    </body>
</html>

