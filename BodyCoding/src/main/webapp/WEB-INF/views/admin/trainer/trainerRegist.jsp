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
			<div id="layoutAuthentication">
		            <div id="layoutAuthentication_content">
		                <main>
		                    <div class="container">
		                        <div class="row justify-content-center">
		                            <div class="col-lg-7">
		                                <div class="card shadow-lg border-0 rounded-lg mt-5">
		                                    <div class="card-header">
		                                    	<h3 class="text-center font-weight-light my-4">트레이너 등록</h3>
		                                    </div>
		                                    <div class="card-body">
		                                        <form method="post" action="/trainerRegist.do">
		                                            <div class="row mb-3">
		                                                <div class="col-md-4">
			                                                <input type="hidden" id="mem_status" name="mem_status" value="1">
							    							<input type="hidden" id="mem_type" name="mem_type" value="TRAINER">
		                                                
		                                                    <div class="form-floating">
		                                                        <input class="form-control" id="gym_code" name="gym_code" type="text" placeholder="Enter your last name" />
		                                                        <label for="gym_code">지점 코드</label>
		                                                    </div>
		                                                </div>
		                                                
		                                                <div class="col-md-4">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_name" name="mem_name" type="text" placeholder="Enter your first name" />
		                                                        <label for="mem_name">이름</label>
		                                                    </div>
		                                                </div>
		                                                <div class="col-md-4">
			                                                <div class="form-floating">
		                                                        <label for="mem_gender">성별:</label>
														        <input type="radio" id="mem_gender" name="mem_gender" value="M" required>남자
														        <input 
														        type="radio" id="mem_gender" name="mem_gender" value="F" required>여자
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="form-floating mb-3">
		                                                <input class="form-control" id="mem_id" name="mem_id" type="text" placeholder="name@example.com" />
		                                                <label for="mem_id">아이디(이메일)</label>
		                                            </div>
		                                            <div class="row mb-3">
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_pass" name="mem_pass" type="password" placeholder="Create a password" />
		                                                        <label for="mem_pass">비밀번호</label>
		                                                    </div>
		                                                </div>
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_phone" name="mem_phone" type="text" placeholder="Confirm password" />
		                                                        <label for="mem_phone">대표번호</label>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="row mb-3">
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_adress" name="em_adress" type="text" placeholder="Create a password" />
		                                                        <label for="mem_adress">지점주소</label>
		                                                    </div>
		                                                </div>
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_comment" name="mem_comment" type="text" placeholder="Confirm password" />
		                                                        <label for="mem_comment">지점소개</label>
		                                                    </div>
		                                                </div>
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_img" name="mem_img" type="file" />
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="mt-4 mb-0">
		                                                <button class="btn btn-primary" type="submit">가입하기</button>
		                                            </div>
		                                        </form>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </main>
		            </div>
	            <div id="layoutAuthentication_footer">
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
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../static/admin/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="../static/admin/js/datatables-simple-demo.js"></script>
</body>
</html>