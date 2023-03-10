<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		                                    	<h3 class="text-center font-weight-light my-4">트레이너 등록</h3>
		                                    </div>
		                                    <div class="card-body">
		                                        <form method="post" action="/trainerRegist.do" enctype="multipart/form-data">
		                                            <div class="row mb-3">
		                                                <div class="col-md-4">
			                                                <input type="hidden" id="enabled" name="enabled" value="1">
							    							<input type="hidden" id="authority" name="authority" value="ROLE_TRAINER">
			                                                <!-- 로그인한 ADMIN의 지점코드가 자동으로 삽입되게 만들기 -->
		                                                    <div class="form-floating">
		                                                        <input class="form-control" id="gym_code" name="gym_code" type="number" value="${adminGym }" readonly/>
		                                                    </div>
		                                                </div>
		                                                
		                                                <div class="col-md-4">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_name" name="mem_name" type="text" placeholder="Enter your first name" required/>
		                                                        <label for="mem_name">이름</label>
		                                                    </div>
		                                                </div>
		                                                <div class="col-md-4">
		                                                        <label for="mem_gender">성별:</label>
			                                                <div class="form-floating">
														        <input type="radio" id="mem_gender" name="mem_gender" value="M" required>남자
														        <input type="radio" id="mem_gender" name="mem_gender" value="F" required>여자
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="form-floating mb-3">
		                                                <input class="form-control" id="mem_id" name="mem_id" type="text" placeholder="name@example.com" required/>
		                                                <label for="mem_id">아이디(이메일)</label>
		                                            </div>
		                                            <div class="row mb-3">
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_pass" name="mem_pass" type="text" placeholder="Create a password" required/>
		                                                        <label for="mem_pass">비밀번호</label>
		                                                    </div>
		                                                </div>
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_phone" name="mem_phone" type="text" placeholder="Confirm password" required/>
		                                                        <label for="mem_phone">전화번호</label>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="row mb-3">
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_birth" name="mem_birth" type="text" placeholder="Create a your birth" />
		                                                        <label for="mem_birth">생년월일</label>
		                                                    </div>
		                                                </div>
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_career" name="mem_career" type="text" placeholder="Confirm password" />
		                                                        <label for="mem_career">경력</label>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="row mb-3">
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_address" name="mem_address" type="text" placeholder="Create a password" required />
		                                                        <label for="mem_address">주소</label>
		                                                    </div>
		                                                </div>
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_comment" name="mem_comment" type="text" placeholder="Confirm password" />
		                                                        <label for="mem_comment">자기소개</label>
		                                                    </div>
		                                                </div>
		                                                <div class="col-md-6">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="mem_img" name="mem_img" type="file" />
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="mt-4 mb-0">
		                                                <button class="btn btn-primary" type="submit">등록하기</button>
		                                                <button class="btn btn-primary" type="reset">reset</button>        
      													<button class="btn btn-primary" type="button" onclick="location.href='/trainerList.do'">트레이너 리스트 목록</button>
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