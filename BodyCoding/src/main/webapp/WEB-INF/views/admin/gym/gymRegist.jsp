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
			<div id="layoutAuthentication">
	            <div id="layoutAuthentication_content">
	                <main>
	                    <div class="container">
	                        <div class="row justify-content-center">
	                            <div class="col-lg-7">
	                                <div class="card shadow-lg border-0 rounded-lg mt-5">
	                                    <div class="card-header">
	                                    	<h3 class="text-center font-weight-light my-4">지점등록</h3>
	                                    </div>
	                                    <div class="card-body">
	                                        <form method="post" action="/gymRegist.do" enctype="multipart/form-data">
	                                            <div class="row mb-3">
	                                                <div class="col-md-6">
	                                                <input type="hidden" id="enabled" name="enabled" value="1">
					    							<input type="hidden" id="authority" name="authority" value="ROLE_ADMIN_SUB">
	                                                
	                                                    <div class="form-floating">
	                                                        <input class="form-control" id="gym_code" name="gym_code" type="text" placeholder="Enter your last name" />
	                                                        <label for="gym_code">지점 코드</label>
	                                                    </div>
	                                                </div>
	                                                <div class="col-md-6">
	                                                    <div class="form-floating mb-3 mb-md-0">
	                                                        <input class="form-control" id="mem_name" name="mem_name" type="text" placeholder="Enter your first name" />
	                                                        <label for="mem_name">지점명</label>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="form-floating mb-3">
	                                                <input class="form-control" id="mem_id" name="mem_id" type="text" placeholder="name@example.com" />
	                                                <label for="mem_id">지점장 아이디(이메일)</label>
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
	                                                        <input class="form-control" id="mem_address" name="mem_address" type="text" placeholder="Create a password" />
	                                                        <label for="mem_address">지점주소</label>
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
	                                                <button class="custom-btn btn-7" type="submit">가입하기</button>
	                                                <button type="button" class="custom-btn btn-7" onclick="history.back()">
										            	뒤로가기
										            </button>
	                                            </div>
	                                        </form>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </main>
	            </div>
	        </div>
	        <!-- bottom -->
			<%@ include file ="../../admin/inc/bottom.jsp" %>
		</div>
	</div>
</body>
</html>