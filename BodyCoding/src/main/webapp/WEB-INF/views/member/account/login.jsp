<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

<meta charset="UTF-8">
<title>로그인 페이지</title>

<style>
body {
	background: #007bff;
	background: linear-gradient(to right, #0062E6, #33AEFF);
}

.btn-login {
	font-size: 0.9rem;
	letter-spacing: 0.05rem;
	padding: 0.75rem 1rem;
}

.btn-google {
	color: white !important;
	background-color: #ea4335;
}

.find {
	display: flex;
	text-align: center;
}

.loginbtn {
	display: flex;
}

}
#btn3 {
	width: 130px;
	height: 40px;
	color: #fff;
	border-radius: 5px;
	padding: 10px 25px;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	outline: none;
}

/* 1 */
.btn-1 {
	border: none;
	width: 130px;
	height: 40px;
	border-radius: 5px;
	padding: 10px 25px;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	outline: none;
	background-color: #00AAFF;
	width: 183px;
	height: 45px;
}
.btn-1:hover {
	background: rgb(0, 3, 255);
	background: linear-gradient(0deg, rgba(0, 3, 255, 1) 0%,
		rgba(2, 126, 251, 1) 100%);
}

img:hover{
	cursor: pointer;
}
</style>
<script type="text/javascript">
function submitForm()
{
    var f = document.frm; // 폼 이름
    	if(f.name.value == "")
     	{
      		alert('aaaa');
      	return false; // 폼 전송 안함.
     	}
    return true; // 폼 전송 함.
} 
</script>
</head>
<body>
<%@ include file="../../../../inc/Top.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-md-7 col-lg-5 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h2 class="card-title text-center mb-5 fw-light fs-5">로그인</h2>
						<form method="post" action="/login.do">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="mem_id"
									name="mem_id" placeholder="email@domain.com" required>
								<label for="mem_id">아이디(이메일)</label>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control" id="mem_pass"
									name="mem_pass" placeholder="Password" required> <label
									for="mem_pass">비밀번호</label>
							</div>

							<div class="loginbtn">
								<!-- Host: kauth.kakao.com -->
								<div style="background-size: cover; background-color: white;">
									<img src="static/member/images/kakao_login.png" style="width: 200px; height: 45px;" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=a7d2784fba5cd05b34f27b173250d1b7&redirect_uri=http://localhost:8586/callback&response_type=code'">
								</div>
								<div>
									<div class="d-grid">
										<input type="image" src="static/member/images/login-button_592324-17673.jpg" 
											style="width: 200px; height: 45px; margin-left: 10px;" onsubmit="submitForm()">
									</div>
								</div>
							</div>
							<br>
							<div class="find">
								<div>
									<a href="findid" type="submit" class="btn btn-outline btn-success"> 아이디찾기</a>
									<a href="findpw" type="submit" class="btn btn-outline btn-success">비밀번호찾기</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../../../../inc/Bottom.jsp"%>
</body>
</html>