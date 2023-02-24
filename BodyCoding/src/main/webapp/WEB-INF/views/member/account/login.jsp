<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


.find{
	display : flex;
	text-align : center;
	}
</style>
</head>


<body>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5">
            <h2 class="card-title text-center mb-5 fw-light fs-5">Sign In</h2>
            <form method="post" action="/login.do">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="email@domain.com" required>
                <label for="mem_id">아이디(이메일)</label>
              </div>
                
              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="mem_pass" name="mem_pass" placeholder="Password" required >
                <label for="mem_pass">비밀번호</label>
              </div>

              <!-- Host: kauth.kakao.com -->
              <button type="button" class="btn btn-primary" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=a7d2784fba5cd05b34f27b173250d1b7&redirect_uri=http://localhost:8586/callback&response_type=code'";>
              <img src="static/member/images/kakao_login.png" ></button>
              <br>
              
        	  <!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=a7d2784fba5cd05b34f27b173250d1b7&redirect_uri=http://localhost:8586/callback&response_type=code">
		      <img src="static/member/images/kakao_login.png" style="width:270px; height:59px;"></a>
		       -->
              
              <div class="d-grid">
              <button class="btn btn-primary" type="submit">로그인하기</button>
              </div>
              <hr class="my-4">
              
              
              
              <div class="d-grid mb-2">
              	<button class="btn btn-google" type="submit">
                  <i class="fab fa-google me-2"></i> Sign in with Google
                </button>
              </div>
             
            <div class="find">
                <div><a href="#">아이디찾기</a></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	    <div><a href="#">비밀번호찾기</a></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	    <div><a href="main">메인으로 이동</a></div>
            </div>
                     
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<h1>로그인</h1>
    <form method="post" action="/login.do">
    	
        <label for="mem_id">아이디(이메일):</label>
        <input type="email" id="mem_id" name="mem_id" required><br>
        
        <label for="mem_pass">비밀번호:</label>
        <input type="password" id="mem_pass" name="mem_pass" required><br>
        
        <a href="#">아이디찾기</a>
        <a href="#">비밀번호찾기</a>
        
        <button type="submit">로그인하기</button>
        <!-- Host: kauth.kakao.com -->
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=a7d2784fba5cd05b34f27b173250d1b7&redirect_uri=http://localhost:8586/callback&response_type=code">
			<img src="static/member/images/kakao_login.png"></a>
	</form>
	
	<a href="main">메인으로 이동</a>
</body>
</html>